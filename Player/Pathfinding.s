	.file	1 "Pathfinding.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg

 # -G value = 0, Arch = vr4300, ISA = 3
 # GNU C17 (GCC) version 10.1.0 (mips64-elf)
 #	compiled by GNU C version Apple LLVM 14.0.0 (clang-1400.0.29.202), GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.27-GMP

 # warning: GMP header version 6.2.1 differs from library version 6.3.0.
 # warning: MPFR header version 4.2.0 differs from library version 4.2.1.
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed:  Library/Player/Pathfinding.c -G 0 -mtune=vr4300
 # -march=vr4300 -mabi=32 -mips3
 # -auxbase-strip Library/Player/Pathfinding.s -O1 -Wall
 # -fomit-frame-pointer -fverbose-asm
 # options enabled:  -faggressive-loop-optimizations -fallocation-dce
 # -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjustments
 # -fcompare-elim -fcprop-registers -fdefer-pop -fdelayed-branch
 # -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
 # -feliminate-unused-debug-symbols -feliminate-unused-debug-types
 # -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse-lm
 # -fgnu-unique -fguess-branch-probability -fident -fif-conversion
 # -fif-conversion2 -finline -finline-atomics
 # -finline-functions-called-once -fipa-profile -fipa-pure-const
 # -fipa-reference -fipa-reference-addressable -fipa-stack-alignment
 # -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
 # -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
 # -fmath-errno -fmerge-constants -fmerge-debug-strings
 # -fmove-loop-invariants -fomit-frame-pointer -fpcc-struct-return
 # -fpeephole -fplt -fprefetch-loop-arrays -freorder-blocks
 # -fsched-critical-path-heuristic -fsched-dep-count-heuristic
 # -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
 # -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
 # -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
 # -fshow-column -fshrink-wrap -fshrink-wrap-separate -fsigned-zeros
 # -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-backprop -fssa-phiopt
 # -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls
 # -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
 # -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
 # -ftree-copy-prop -ftree-cselim -ftree-dce -ftree-dominator-opts
 # -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
 # -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
 # -ftree-parallelize-loops= -ftree-phiprop -ftree-pta -ftree-reassoc
 # -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra -ftree-ter
 # -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -mbranch-likely
 # -mcheck-zero-division -mdivide-traps -mdouble-float -meb
 # -mexplicit-relocs -mextern-sdata -mfp-exceptions -mfp32 -mgp32 -mgpopt
 # -mhard-float -mload-store-pairs -mlocal-sdata -mlong32 -mlra -mlxc1-sxc1
 # -mmadd4 -mno-mdmx -mno-mips16 -mno-mips3d -mshared

	.text
	.align	2
	.globl	GetItemBoxIndexes
	.set	nomips16
	.set	nomicromips
	.ent	GetItemBoxIndexes
	.type	GetItemBoxIndexes, @function
GetItemBoxIndexes:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:19:     ItemBoxCount = 0;
	lui	$2,%hi(ItemBoxCount)	 # tmp204,
	sh	$0,%lo(ItemBoxCount)($2)	 #, ItemBoxCount
	lui	$3,%hi(g_SimpleObjectArray)	 # tmp205,
	addiu	$3,$3,%lo(g_SimpleObjectArray)	 # ivtmp.107, tmp205,
	move	$9,$0	 # ItemBoxCount_lsm_flag.101,
	move	$5,$0	 # ItemBoxCount_lsm.100,
 # Library/Player/Pathfinding.c:20:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	move	$2,$0	 # ThisObject,
 # Library/Player/Pathfinding.c:22:         if (g_SimpleObjectArray[ThisObject].category == IBOX)
	li	$7,12			# 0xc	 # tmp207,
 # Library/Player/Pathfinding.c:24:             ItemBoxIndex[ItemBoxCount] = ThisObject;
	lui	$8,%hi(ItemBoxIndex)	 # tmp217,
	addiu	$8,$8,%lo(ItemBoxIndex)	 # tmp218, tmp217,
 # Library/Player/Pathfinding.c:25:             ItemBoxCount++;
	li	$10,1			# 0x1	 # ItemBoxCount_lsm_flag.101,
 # Library/Player/Pathfinding.c:20:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	b	$L3	 #
	li	$6,100			# 0x64	 # tmp214,

$L2:
 # Library/Player/Pathfinding.c:20:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	addiu	$2,$2,1	 # ThisObject, ThisObject,
$L7:
 # Library/Player/Pathfinding.c:20:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	beq	$2,$6,$L6	 #, ThisObject, tmp214,
	addiu	$3,$3,112	 # ivtmp.107, ivtmp.107,

$L3:
 # Library/Player/Pathfinding.c:22:         if (g_SimpleObjectArray[ThisObject].category == IBOX)
	lh	$4,0($3)		 # MEM[base: _24, offset: 0B], MEM[base: _24, offset: 0B]
	bnel	$4,$7,$L7	 #, MEM[base: _24, offset: 0B], tmp207,
	addiu	$2,$2,1	 # ThisObject, ThisObject,

 # Library/Player/Pathfinding.c:24:             ItemBoxIndex[ItemBoxCount] = ThisObject;
	sll	$4,$5,1	 # tmp209, ItemBoxCount_lsm.100,
	addu	$4,$4,$8	 # tmp210, tmp209, tmp218
	sh	$2,0($4)	 # ThisObject, ItemBoxIndex
 # Library/Player/Pathfinding.c:25:             ItemBoxCount++;
	addiu	$5,$5,1	 # tmp213, ItemBoxCount_lsm.100,
	sll	$5,$5,16	 # ItemBoxCount_lsm.100, tmp213,
	sra	$5,$5,16	 # ItemBoxCount_lsm.100, ItemBoxCount_lsm.100,
	b	$L2	 #
	move	$9,$10	 # ItemBoxCount_lsm_flag.101, ItemBoxCount_lsm_flag.101

$L6:
	beq	$9,$0,$L8	 #, ItemBoxCount_lsm_flag.101,,
	lui	$2,%hi(ItemBoxCount)	 # tmp215,

	sh	$5,%lo(ItemBoxCount)($2)	 # ItemBoxCount_lsm.100, ItemBoxCount
$L8:
 # Library/Player/Pathfinding.c:28: }
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	GetItemBoxIndexes
	.size	GetItemBoxIndexes, .-GetItemBoxIndexes
	.align	2
	.globl	PathfinderComplete
	.set	nomips16
	.set	nomicromips
	.ent	PathfinderComplete
	.type	PathfinderComplete, @function
PathfinderComplete:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:40:     switch (Pathfinder->PathType)
	lb	$3,37($4)		 # _1, Pathfinder_34(D)->PathType
 # Library/Player/Pathfinding.c:40:     switch (Pathfinder->PathType)
	li	$2,1			# 0x1	 # tmp245,
	beql	$3,$2,$L10	 #, _1, tmp245,
	lh	$3,32($4)		 # Pathfinder_34(D)->ProgressTimer, Pathfinder_34(D)->ProgressTimer

	li	$2,2			# 0x2	 # tmp246,
	beql	$3,$2,$L11	 #, _1, tmp246,
	lh	$3,32($4)		 # Pathfinder_34(D)->ProgressTimer, Pathfinder_34(D)->ProgressTimer

	bne	$3,$0,$L65	 #, _1,,
	move	$2,$0	 # <retval>,

 # Library/Player/Pathfinding.c:51:                 || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
	lh	$3,32($4)		 # Pathfinder_34(D)->ProgressTimer, Pathfinder_34(D)->ProgressTimer
	slt	$3,$3,90	 # tmp248, Pathfinder_34(D)->ProgressTimer,
	beq	$3,$0,$L65	 #, tmp248,,
	li	$2,1			# 0x1	 # iftmp.4_30,

 # Library/Player/Pathfinding.c:47:                 || (Pathfinder->TargetPath == -1) 
	lh	$2,0($4)		 # _3, Pathfinder_34(D)->TargetPath
 # Library/Player/Pathfinding.c:47:                 || (Pathfinder->TargetPath == -1) 
	li	$3,-1			# 0xffffffffffffffff	 # tmp249,
	beq	$2,$3,$L33
	nop
	 #, _3, tmp249,
 # Library/Player/Pathfinding.c:48:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lh	$3,26($4)		 # _4, Pathfinder_34(D)->NearestMarker
 # Library/Player/Pathfinding.c:48:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	bnel	$3,$0,$L14	 #, _4,,
	sll	$2,$2,1	 # tmp252, _3,

 # Library/Player/Pathfinding.c:48:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lb	$7,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction
	li	$6,-1			# 0xffffffffffffffff	 # tmp251,
	beq	$7,$6,$L55
	nop
	 #, Pathfinder_34(D)->Direction, tmp251,
 # Library/Player/Pathfinding.c:49:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	sll	$2,$2,1	 # tmp287, _3,
	addu	$5,$5,$2	 # tmp288, PathLengths, tmp287
	lh	$5,0($5)		 # _50, *_49
 # Library/Player/Pathfinding.c:49:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$5,$0,$L56	 #, _50,,
	lb	$4,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L26:
	jr	$31	 #
	slt	$2,$5,$3	 # iftmp.4_30, _50, _4

$L14:
 # Library/Player/Pathfinding.c:49:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	addu	$5,$5,$2	 # tmp253, PathLengths, tmp252
	lh	$5,0($5)		 # _50, *_8
 # Library/Player/Pathfinding.c:49:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$3,$5,$L57	 #, _4, _50,
	lb	$4,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L16:
 # Library/Player/Pathfinding.c:50:                 || (Pathfinder->NearestMarker < 0) 
	bltz	$3,$L65	 #, _4,
	li	$2,1			# 0x1	 # iftmp.4_30,

	b	$L26
	nop
	 #
$L57:
 # Library/Player/Pathfinding.c:49:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp255,
	bne	$4,$2,$L16
	nop
	 #, Pathfinder_34(D)->Direction, tmp255,
$L65:
	jr	$31
	nop
	 #
$L33:
 # Library/Player/Pathfinding.c:51:                 || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.4_30,

$L55:
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.4_30,

$L10:
 # Library/Player/Pathfinding.c:65:                 || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
	slt	$3,$3,120	 # tmp261, Pathfinder_34(D)->ProgressTimer,
	beq	$3,$0,$L65	 #, tmp261,,
	li	$2,1			# 0x1	 # iftmp.5_31,

 # Library/Player/Pathfinding.c:61:                 || (Pathfinder->TargetPath == -1) 
	lh	$2,0($4)		 # _12, Pathfinder_34(D)->TargetPath
 # Library/Player/Pathfinding.c:61:                 || (Pathfinder->TargetPath == -1) 
	li	$3,-1			# 0xffffffffffffffff	 # tmp262,
	beq	$2,$3,$L38
	nop
	 #, _12, tmp262,
 # Library/Player/Pathfinding.c:62:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lh	$3,26($4)		 # _13, Pathfinder_34(D)->NearestMarker
 # Library/Player/Pathfinding.c:62:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	bnel	$3,$0,$L18	 #, _13,,
	sll	$2,$2,1	 # tmp265, _12,

 # Library/Player/Pathfinding.c:62:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lb	$7,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction
	li	$5,-1			# 0xffffffffffffffff	 # tmp264,
	beq	$7,$5,$L58
	nop
	 #, Pathfinder_34(D)->Direction, tmp264,
 # Library/Player/Pathfinding.c:63:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	sll	$2,$2,1	 # tmp289, _12,
	addu	$6,$6,$2	 # tmp290, RampLengths, tmp289
	lh	$5,0($6)		 # _54, *_53
 # Library/Player/Pathfinding.c:63:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$5,$0,$L59	 #, _54,,
	lb	$4,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L28:
	jr	$31	 #
	slt	$2,$5,$3	 # iftmp.5_31, _54, _13

$L18:
 # Library/Player/Pathfinding.c:63:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	addu	$6,$6,$2	 # tmp266, RampLengths, tmp265
	lh	$5,0($6)		 # _54, *_17
 # Library/Player/Pathfinding.c:63:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$3,$5,$L60	 #, _13, _54,
	lb	$4,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L20:
 # Library/Player/Pathfinding.c:64:                 || (Pathfinder->NearestMarker < 0) 
	bltz	$3,$L65	 #, _13,
	li	$2,1			# 0x1	 # iftmp.5_31,

	b	$L28
	nop
	 #
$L60:
 # Library/Player/Pathfinding.c:63:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp268,
	bne	$4,$2,$L20
	nop
	 #, Pathfinder_34(D)->Direction, tmp268,
	jr	$31
	nop
	 #
$L38:
 # Library/Player/Pathfinding.c:65:                 || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.5_31,

$L58:
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.5_31,

$L11:
 # Library/Player/Pathfinding.c:79:                 || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
	slt	$3,$3,120	 # tmp274, Pathfinder_34(D)->ProgressTimer,
	beq	$3,$0,$L65	 #, tmp274,,
	li	$2,1			# 0x1	 # iftmp.6_32,

 # Library/Player/Pathfinding.c:75:                 || (Pathfinder->TargetPath == -1) 
	lh	$2,0($4)		 # _21, Pathfinder_34(D)->TargetPath
 # Library/Player/Pathfinding.c:75:                 || (Pathfinder->TargetPath == -1) 
	li	$3,-1			# 0xffffffffffffffff	 # tmp275,
	beq	$2,$3,$L43
	nop
	 #, _21, tmp275,
 # Library/Player/Pathfinding.c:76:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lh	$3,26($4)		 # _22, Pathfinder_34(D)->NearestMarker
 # Library/Player/Pathfinding.c:76:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	bnel	$3,$0,$L22	 #, _22,,
	sll	$2,$2,1	 # tmp278, _21,

 # Library/Player/Pathfinding.c:76:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lb	$6,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction
	li	$5,-1			# 0xffffffffffffffff	 # tmp277,
	beq	$6,$5,$L61
	nop
	 #, Pathfinder_34(D)->Direction, tmp277,
 # Library/Player/Pathfinding.c:77:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	sll	$2,$2,1	 # tmp291, _21,
	addu	$7,$7,$2	 # tmp292, DropLengths, tmp291
	lh	$5,0($7)		 # _58, *_57
 # Library/Player/Pathfinding.c:77:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$5,$0,$L62	 #, _58,,
	lb	$4,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L30:
	jr	$31	 #
	slt	$2,$5,$3	 # iftmp.6_32, _58, _22

$L22:
 # Library/Player/Pathfinding.c:77:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	addu	$7,$7,$2	 # tmp279, DropLengths, tmp278
	lh	$5,0($7)		 # _58, *_26
 # Library/Player/Pathfinding.c:77:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$3,$5,$L63	 #, _22, _58,
	lb	$4,36($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L24:
 # Library/Player/Pathfinding.c:78:                 || (Pathfinder->NearestMarker < 0) 
	bltz	$3,$L65	 #, _22,
	li	$2,1			# 0x1	 # iftmp.6_32,

	b	$L30
	nop
	 #
$L63:
 # Library/Player/Pathfinding.c:77:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp281,
	bne	$4,$2,$L24
	nop
	 #, Pathfinder_34(D)->Direction, tmp281,
	jr	$31
	nop
	 #
$L43:
 # Library/Player/Pathfinding.c:79:                 || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.6_32,

$L61:
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.6_32,

$L56:
 # Library/Player/Pathfinding.c:49:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp294,
	bne	$4,$2,$L26
	nop
	 #, Pathfinder_34(D)->Direction, tmp294,
 # Library/Player/Pathfinding.c:51:                 || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
	jr	$31
	nop
	 #
$L62:
 # Library/Player/Pathfinding.c:77:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp296,
	bne	$4,$2,$L30
	nop
	 #, Pathfinder_34(D)->Direction, tmp296,
 # Library/Player/Pathfinding.c:79:                 || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
	jr	$31
	nop
	 #
$L59:
 # Library/Player/Pathfinding.c:63:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp298,
	bne	$4,$2,$L28
	nop
	 #, Pathfinder_34(D)->Direction, tmp298,
 # Library/Player/Pathfinding.c:65:                 || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	PathfinderComplete
	.size	PathfinderComplete, .-PathfinderComplete
	.align	2
	.globl	FindNearestRampNode
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestRampNode
	.type	FindNearestRampNode, @function
FindNearestRampNode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	mtc1	$6,$f4	 # TargetY, tmp337
 # Library/Player/Pathfinding.c:94:     float TargetHeightDifference = pow(CurrentPosition[1] - TargetY, 2);//Square to get absolute distance. 
	lwc1	$f10,4($4)	 # _1, MEM[(float *)CurrentPosition_104(D) + 4B]
 # Library/Player/Pathfinding.c:94:     float TargetHeightDifference = pow(CurrentPosition[1] - TargetY, 2);//Square to get absolute distance. 
	sub.s	$f12,$f10,$f4	 # _2, _1, TargetY
 # Library/Player/Pathfinding.c:96:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	lh	$11,22($sp)		 # _139, PathCount
 # Library/Player/Pathfinding.c:96:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	blez	$11,$L77	 #, _139,
	mul.s	$f12,$f12,$f12	 # _17, _2, _2

	move	$9,$7	 # ivtmp.115, PathArray
	lw	$8,16($sp)		 # ivtmp.116, MarkerCounts
 # Library/Player/Pathfinding.c:96:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	move	$6,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:93:     short use_this_marker=0;
	move	$12,$0	 # use_this_marker,
 # Library/Player/Pathfinding.c:92:     short use_this_path= -1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
 # Library/Player/Pathfinding.c:89:     float Distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp283,
	lwc1	$f6,%lo($LC0)($3)	 # Distance,
 # Library/Player/Pathfinding.c:103:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	lwc1	$f8,24($sp)	 # HeightCheckSquared, HeightCheckSquared
	cvt.d.s	$f8,$f8	 # _21, HeightCheckSquared
 # Library/Player/Pathfinding.c:113:                     use_this_marker = 0;
	b	$L76	 #
	move	$13,$0	 # use_this_marker,

$L68:
 # Library/Player/Pathfinding.c:118:         if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
	sub.s	$f0,$f10,$f0	 # tmp303, _1, path_height_end_node
$L87:
 # Library/Player/Pathfinding.c:118:         if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
	cvt.d.s	$f0,$f0	 # _43, tmp303
	mul.d	$f0,$f0,$f0	 # tmp304, _43, _43
 # Library/Player/Pathfinding.c:118:         if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
	c.lt.d	$f0,$f8	 #, tmp304, _21
	nop	
	bc1tl	$L85	 #,,
	sub.s	$f0,$f14,$f4	 # tmp305, path_height_start_node, TargetY

$L72:
 # Library/Player/Pathfinding.c:96:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$6,$6,1	 # ThisPath, ThisPath,
$L88:
 # Library/Player/Pathfinding.c:96:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$9,$9,4	 # ivtmp.115, ivtmp.115,
	beq	$6,$11,$L86	 #, ThisPath, _139,
	addiu	$8,$8,2	 # ivtmp.116, ivtmp.116,

$L76:
 # Library/Player/Pathfinding.c:98:         path_height_start_node = (float)PathArray[ThisPath][0].Position[1];
	lw	$14,0($9)		 # _8, MEM[base: _47, offset: 0B]
 # Library/Player/Pathfinding.c:98:         path_height_start_node = (float)PathArray[ThisPath][0].Position[1];
	lh	$3,2($14)		 # _8->Position, _8->Position
	mtc1	$3,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f14,$f0	 # path_height_start_node, _8->Position
 # Library/Player/Pathfinding.c:99:         path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
	lh	$10,0($8)		 # _12, MEM[base: _127, offset: 0B]
 # Library/Player/Pathfinding.c:99:         path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
	sll	$3,$10,3	 # tmp285, _12,
	addu	$3,$14,$3	 # _15, _8, tmp285
 # Library/Player/Pathfinding.c:99:         path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
	lh	$15,2($3)		 # _15->Position, _15->Position
	mtc1	$15,$f0	 # _15->Position, _15->Position
 # Library/Player/Pathfinding.c:103:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	sub.s	$f2,$f10,$f14	 # tmp287, _1, path_height_start_node
 # Library/Player/Pathfinding.c:103:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	cvt.d.s	$f2,$f2	 # _19, tmp287
	mul.d	$f2,$f2,$f2	 # tmp288, _19, _19
 # Library/Player/Pathfinding.c:103:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	c.lt.d	$f2,$f8	 #, tmp288, _21
	nop	
	bc1f	$L68	 #,,
	cvt.s.w	$f0,$f0	 # path_height_end_node, _15->Position

 # Library/Player/Pathfinding.c:105:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	sub.s	$f2,$f0,$f4	 # tmp289, path_height_end_node, TargetY
 # Library/Player/Pathfinding.c:105:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f2,$f2	 # _23, tmp289
 # Library/Player/Pathfinding.c:105:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f16,$f12	 # tmp290, _17
 # Library/Player/Pathfinding.c:105:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	mul.d	$f2,$f2,$f2	 # tmp291, _23, _23
 # Library/Player/Pathfinding.c:105:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	c.lt.d	$f2,$f16	 #, tmp291, tmp290
	nop	
	bc1fl	$L87	 #,,
	sub.s	$f0,$f10,$f0	 # tmp303, _1, path_height_end_node

 # Library/Player/Pathfinding.c:107:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
	lh	$15,0($14)		 # _8->Position, _8->Position
	mtc1	$15,$f2	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f18,$f2	 # tmp292, _8->Position
	lwc1	$f16,0($4)	 # *CurrentPosition_104(D), *CurrentPosition_104(D)
	sub.s	$f18,$f16,$f18	 # tmp294, *CurrentPosition_104(D), tmp292
	cvt.d.s	$f18,$f18	 # _31, tmp294
	lh	$14,4($14)		 # _8->Position, _8->Position
	mtc1	$14,$f2	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp296, _8->Position
	lwc1	$f16,8($4)	 # MEM[(float *)CurrentPosition_104(D) + 8B], MEM[(float *)CurrentPosition_104(D) + 8B]
	sub.s	$f2,$f16,$f2	 # tmp298, MEM[(float *)CurrentPosition_104(D) + 8B], tmp296
	cvt.d.s	$f2,$f2	 # _38, tmp298
	mul.d	$f2,$f2,$f2	 # tmp300, _38, _38
	mul.d	$f18,$f18,$f18	 # tmp301, _31, _31
	add.d	$f2,$f2,$f18	 # tmp302, tmp300, tmp301
 # Library/Player/Pathfinding.c:107:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
	cvt.s.d	$f2,$f2	 # CheckDistance, tmp302
 # Library/Player/Pathfinding.c:109:                 if (CheckDistance < Distance)
	c.lt.s	$f2,$f6	 #, CheckDistance, Distance
	nop	
	bc1fl	$L87	 #,,
	sub.s	$f0,$f10,$f0	 # tmp303, _1, path_height_end_node

 # Library/Player/Pathfinding.c:112:                     use_this_path = ThisPath;
	sll	$2,$6,16	 # use_this_path, ThisPath,
	sra	$2,$2,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:111:                     Distance = CheckDistance;
	mov.s	$f6,$f2	 # Distance, CheckDistance
 # Library/Player/Pathfinding.c:113:                     use_this_marker = 0;
	b	$L68	 #
	move	$12,$13	 # use_this_marker, use_this_marker

$L85:
 # Library/Player/Pathfinding.c:120:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f0,$f0	 # _46, tmp305
 # Library/Player/Pathfinding.c:120:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f2,$f12	 # tmp306, _17
 # Library/Player/Pathfinding.c:120:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	mul.d	$f0,$f0,$f0	 # tmp307, _46, _46
 # Library/Player/Pathfinding.c:120:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	c.lt.d	$f0,$f2	 #, tmp307, tmp306
	nop	
	bc1fl	$L88	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:122:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[0], 
	lh	$14,0($3)		 # _15->Position, _15->Position
	mtc1	$14,$f0	 # _15->Position, _15->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp308, _15->Position
	lwc1	$f2,0($4)	 # *CurrentPosition_104(D), *CurrentPosition_104(D)
	sub.s	$f0,$f2,$f0	 # tmp310, *CurrentPosition_104(D), tmp308
	cvt.d.s	$f0,$f0	 # _58, tmp310
	lh	$3,4($3)		 # _15->Position, _15->Position
	mtc1	$3,$f2	 # _15->Position, _15->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp312, _15->Position
	lwc1	$f14,8($4)	 # MEM[(float *)CurrentPosition_104(D) + 8B], MEM[(float *)CurrentPosition_104(D) + 8B]
	sub.s	$f2,$f14,$f2	 # tmp314, MEM[(float *)CurrentPosition_104(D) + 8B], tmp312
	cvt.d.s	$f2,$f2	 # _69, tmp314
	mul.d	$f0,$f0,$f0	 # tmp316, _58, _58
	mul.d	$f2,$f2,$f2	 # tmp317, _69, _69
	add.d	$f0,$f0,$f2	 # tmp318, tmp316, tmp317
 # Library/Player/Pathfinding.c:122:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp318
 # Library/Player/Pathfinding.c:124:                 if (CheckDistance < Distance)
	c.lt.s	$f0,$f6	 #, CheckDistance, Distance
	nop	
	bc1fl	$L88	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:127:                     use_this_path = ThisPath;
	sll	$2,$6,16	 # use_this_path, ThisPath,
	sra	$2,$2,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:128:                     use_this_marker = MarkerCounts[ThisPath];
	move	$12,$10	 # use_this_marker, _12
 # Library/Player/Pathfinding.c:126:                     Distance = CheckDistance;
	b	$L72	 #
	mov.s	$f6,$f0	 # Distance, CheckDistance

$L86:
 # Library/Player/Pathfinding.c:133:     if (use_this_path != -1)
	li	$3,-1			# 0xffffffffffffffff	 # tmp319,
	beq	$2,$3,$L89	 #, use_this_path, tmp319,
	sll	$3,$2,2	 # tmp320, use_this_path,

 # Library/Player/Pathfinding.c:135:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	addu	$7,$7,$3	 # _75, PathArray, tmp320
 # Library/Player/Pathfinding.c:135:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	sll	$12,$12,3	 # _78, use_this_marker,
 # Library/Player/Pathfinding.c:135:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	lw	$3,0($7)		 # *_75, *_75
	addu	$3,$3,$12	 # tmp322, *_75, _78
 # Library/Player/Pathfinding.c:135:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	lh	$3,0($3)		 # _79->Position, _79->Position
	mtc1	$3,$f0	 # _79->Position, _79->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp324, _79->Position
	swc1	$f0,0($5)	 # tmp324, *FoundNodePosition_111(D)
 # Library/Player/Pathfinding.c:136:             FoundNodePosition[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
	lw	$3,0($7)		 # *_75, *_75
	addu	$3,$3,$12	 # tmp326, *_75, _78
 # Library/Player/Pathfinding.c:136:             FoundNodePosition[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
	lh	$3,2($3)		 # _83->Position, _83->Position
	mtc1	$3,$f0	 # _83->Position, _83->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp328, _83->Position
	swc1	$f0,4($5)	 # tmp328, MEM[(float *)FoundNodePosition_111(D) + 4B]
 # Library/Player/Pathfinding.c:137:             FoundNodePosition[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
	lw	$3,0($7)		 # *_75, *_75
	addu	$12,$3,$12	 # tmp330, *_75, _78
 # Library/Player/Pathfinding.c:137:             FoundNodePosition[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
	lh	$3,4($12)		 # _87->Position, _87->Position
	mtc1	$3,$f0	 # _87->Position, _87->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp332, _87->Position
	jr	$31	 #
	swc1	$f0,8($5)	 # tmp332, MEM[(float *)FoundNodePosition_111(D) + 8B]

$L77:
 # Library/Player/Pathfinding.c:92:     short use_this_path= -1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
$L89:
 # Library/Player/Pathfinding.c:141: }
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	FindNearestRampNode
	.size	FindNearestRampNode, .-FindNearestRampNode
	.align	2
	.globl	FindNearestItemBox
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestItemBox
	.type	FindNearestItemBox, @function
FindNearestItemBox:
	.frame	$sp,8,$31		# vars= 0, regs= 0/2, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00300000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:149:     float player_x = CurrentPosition[0];
	lwc1	$f10,0($4)	 # player_x, *CurrentPosition_23(D)
 # Library/Player/Pathfinding.c:150:     float player_y = CurrentPosition[1];
	lwc1	$f14,4($4)	 # player_y, MEM[(float *)CurrentPosition_23(D) + 4B]
 # Library/Player/Pathfinding.c:157:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lui	$2,%hi(ItemBoxCount)	 # tmp228,
 # Library/Player/Pathfinding.c:157:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lh	$2,%lo(ItemBoxCount)($2)		 # ItemBoxCount, ItemBoxCount
	blez	$2,$L97	 #, ItemBoxCount,
	lwc1	$f12,8($4)	 # player_z, MEM[(float *)CurrentPosition_23(D) + 8B]

 # Library/Player/Pathfinding.c:147: {   
	addiu	$sp,$sp,-8	 #,,
	sdc1	$f20,0($sp)	 #,
	mtc1	$6,$f6	 # HeightCheckSquared, tmp269
	lui	$6,%hi(ItemBoxIndex)	 # tmp230,
	addiu	$6,$6,%lo(ItemBoxIndex)	 # ivtmp.122, tmp230,
 # Library/Player/Pathfinding.c:157:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	move	$8,$0	 # ThisItemBox,
 # Library/Player/Pathfinding.c:154:     int found_item_box = -1;
	li	$2,-1			# 0xffffffffffffffff	 # <retval>,
 # Library/Player/Pathfinding.c:152:     float distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp227,
	lwc1	$f4,%lo($LC0)($3)	 # distance,
 # Library/Player/Pathfinding.c:160:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	lui	$9,%hi(g_SimpleObjectArray)	 # tmp231,
	addiu	$9,$9,%lo(g_SimpleObjectArray)	 # tmp237, tmp231,
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	mtc1	$0,$f8	 #, tmp265
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	lh	$11,26($sp)		 # courseType, courseType
	slt	$11,$11,4	 # tmp266, courseType,
 # Library/Player/Pathfinding.c:157:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	b	$L96	 #
	lui	$10,%hi(ItemBoxCount)	 # tmp261,

$L92:
 # Library/Player/Pathfinding.c:164:             float item_box_position_x = g_SimpleObjectArray[i].position[0];
	sll	$3,$4,3	 # tmp245, _1,
$L106:
	subu	$3,$3,$4	 # tmp246, tmp245, _1
$L108:
	sll	$3,$3,4	 # tmp247, tmp246,
	addu	$3,$3,$9	 # tmp243, tmp247, tmp237
	lwc1	$f20,24($3)	 # item_box_position_x, g_SimpleObjectArray[_1].position
 # Library/Player/Pathfinding.c:165:             float item_box_position_z = g_SimpleObjectArray[i].position[2];
	lwc1	$f18,32($3)	 # item_box_position_z, g_SimpleObjectArray[_1].position
 # Library/Player/Pathfinding.c:166:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	sub.s	$f2,$f20,$f10	 # tmp256, item_box_position_x, player_x
 # Library/Player/Pathfinding.c:166:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	cvt.d.s	$f2,$f2	 # _6, tmp256
 # Library/Player/Pathfinding.c:167:                             pow(item_box_position_z - player_z, 2);
	sub.s	$f0,$f18,$f12	 # tmp257, item_box_position_z, player_z
 # Library/Player/Pathfinding.c:167:                             pow(item_box_position_z - player_z, 2);
	cvt.d.s	$f0,$f0	 # _9, tmp257
	mul.d	$f0,$f0,$f0	 # tmp258, _9, _9
 # Library/Player/Pathfinding.c:166:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	mul.d	$f2,$f2,$f2	 # tmp259, _6, _6
 # Library/Player/Pathfinding.c:166:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	add.d	$f0,$f0,$f2	 # tmp260, tmp258, tmp259
 # Library/Player/Pathfinding.c:166:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp260
 # Library/Player/Pathfinding.c:168:             if (CheckDistance < distance)
	c.lt.s	$f0,$f4	 #, CheckDistance, distance
	nop	
	bc1f	$L107	 #,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

 # Library/Player/Pathfinding.c:172:                 FoundItemBoxPosition[0] = item_box_position_x;
	swc1	$f20,0($5)	 # item_box_position_x, *FoundItemBoxPosition_39(D)
 # Library/Player/Pathfinding.c:173:                 FoundItemBoxPosition[1] = item_box_position_y;
	swc1	$f16,4($5)	 # item_box_position_y, MEM[(float *)FoundItemBoxPosition_39(D) + 4B]
 # Library/Player/Pathfinding.c:174:                 FoundItemBoxPosition[2] = item_box_position_z;
	swc1	$f18,8($5)	 # item_box_position_z, MEM[(float *)FoundItemBoxPosition_39(D) + 8B]
 # Library/Player/Pathfinding.c:175:                 found_item_box = i;
	move	$2,$4	 # <retval>, _1
 # Library/Player/Pathfinding.c:170:                 distance = CheckDistance;
	mov.s	$f4,$f0	 # distance, CheckDistance
$L107:
 # Library/Player/Pathfinding.c:157:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lh	$3,%lo(ItemBoxCount)($10)		 # ItemBoxCount, ItemBoxCount
 # Library/Player/Pathfinding.c:157:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	slt	$3,$8,$3	 # tmp263, ThisItemBox, ItemBoxCount
	beq	$3,$0,$L105	 #, tmp263,,
	addiu	$6,$6,2	 # ivtmp.122, ivtmp.122,

$L96:
 # Library/Player/Pathfinding.c:160:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	lh	$4,0($6)		 # _1, MEM[base: _19, offset: 0B]
 # Library/Player/Pathfinding.c:160:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	sll	$3,$4,3	 # tmp234, _1,
	subu	$3,$3,$4	 # tmp235, tmp234, _1
	sll	$3,$3,4	 # tmp236, tmp235,
	addu	$3,$3,$9	 # tmp232, tmp236, tmp237
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	bne	$7,$0,$L92	 #, ignoreHeightCheck,,
	lwc1	$f16,28($3)	 # item_box_position_y, g_SimpleObjectArray[_1].position

 # Library/Player/Pathfinding.c:161:         float diff_y = item_box_position_y - player_y;
	sub.s	$f2,$f16,$f14	 # diff_y, item_box_position_y, player_y
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	cvt.d.s	$f0,$f2	 # _2, diff_y
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	cvt.d.s	$f18,$f6	 # tmp238, HeightCheckSquared
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	mul.d	$f0,$f0,$f0	 # tmp239, _2, _2
 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	c.lt.d	$f0,$f18	 #, tmp239, tmp238
	nop	
	bc1fl	$L107	 #,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	c.le.s	$f8,$f2	 #, tmp265, diff_y
	nop	
	bc1t	$L106	 #,,
	sll	$3,$4,3	 # tmp245, _1,

 # Library/Player/Pathfinding.c:162:         if (ignoreHeightCheck || (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3))) //Height check
	bnel	$11,$0,$L107	 #, tmp266,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

	b	$L108	 #
	subu	$3,$3,$4	 # tmp246, tmp245, _1

$L97:
 # Library/Player/Pathfinding.c:187: }
	jr	$31	 #
	li	$2,-1			# 0xffffffffffffffff	 # <retval>,

$L105:
	ldc1	$f20,0($sp)	 #,
	jr	$31	 #
	addiu	$sp,$sp,8	 #,,

	.set	macro
	.set	reorder
	.end	FindNearestItemBox
	.size	FindNearestItemBox, .-FindNearestItemBox
	.align	2
	.globl	FindNearestDropNode
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestDropNode
	.type	FindNearestDropNode, @function
FindNearestDropNode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:200:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	lh	$9,22($sp)		 # _68, PathCount
 # Library/Player/Pathfinding.c:200:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	blez	$9,$L115	 #, _68,
	move	$8,$7	 # ivtmp.127, PathArray

 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lwc1	$f10,4($4)	 # _1, MEM[(float *)CurrentPosition_56(D) + 4B]
 # Library/Player/Pathfinding.c:200:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	move	$6,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:197:     short use_this_path=-1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
 # Library/Player/Pathfinding.c:195:     float Distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp242,
	lwc1	$f4,%lo($LC0)($3)	 # Distance,
 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lwc1	$f8,24($sp)	 # HeightCheckSquared, HeightCheckSquared
	b	$L114	 #
	cvt.d.s	$f8,$f8	 # tmp246, HeightCheckSquared

$L111:
 # Library/Player/Pathfinding.c:200:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$6,$6,1	 # ThisPath, ThisPath,
$L120:
 # Library/Player/Pathfinding.c:200:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	beq	$6,$9,$L119	 #, ThisPath, _68,
	addiu	$8,$8,4	 # ivtmp.127, ivtmp.127,

$L114:
 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lw	$10,0($8)		 # _5, MEM[base: _60, offset: 0B]
 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lh	$3,2($10)		 # _5->Position, _5->Position
	mtc1	$3,$f0	 # _5->Position, _5->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp243, _5->Position
 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	sub.s	$f0,$f10,$f0	 # tmp245, _1, tmp243
 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	cvt.d.s	$f0,$f0	 # _9, tmp245
	mul.d	$f0,$f0,$f0	 # tmp247, _9, _9
 # Library/Player/Pathfinding.c:204:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	c.lt.d	$f0,$f8	 #, tmp247, tmp246
	nop	
	bc1fl	$L120	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:208:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
	lh	$3,0($10)		 # _5->Position, _5->Position
	mtc1	$3,$f0	 # _5->Position, _5->Position
	nop	
	cvt.s.w	$f6,$f0	 # tmp248, _5->Position
	lwc1	$f2,0($4)	 # *CurrentPosition_56(D), *CurrentPosition_56(D)
	sub.s	$f6,$f2,$f6	 # tmp250, *CurrentPosition_56(D), tmp248
	cvt.d.s	$f6,$f6	 # _17, tmp250
	lh	$3,4($10)		 # _5->Position, _5->Position
	mtc1	$3,$f0	 # _5->Position, _5->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp252, _5->Position
	lwc1	$f2,8($4)	 # MEM[(float *)CurrentPosition_56(D) + 8B], MEM[(float *)CurrentPosition_56(D) + 8B]
	sub.s	$f0,$f2,$f0	 # tmp254, MEM[(float *)CurrentPosition_56(D) + 8B], tmp252
	cvt.d.s	$f0,$f0	 # _24, tmp254
	mul.d	$f0,$f0,$f0	 # tmp256, _24, _24
	mul.d	$f6,$f6,$f6	 # tmp257, _17, _17
	add.d	$f0,$f0,$f6	 # tmp258, tmp256, tmp257
 # Library/Player/Pathfinding.c:208:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp258
 # Library/Player/Pathfinding.c:210:                 if (CheckDistance < Distance)
	c.lt.s	$f0,$f4	 #, CheckDistance, Distance
	nop	
	bc1fl	$L120	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:213:                     use_this_path = ThisPath;
	sll	$2,$6,16	 # use_this_path, ThisPath,
	sra	$2,$2,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:212:                     Distance = CheckDistance;
	b	$L111	 #
	mov.s	$f4,$f0	 # Distance, CheckDistance

$L119:
 # Library/Player/Pathfinding.c:221:     if (use_this_path != -1) //If a drop was actually found
	li	$3,-1			# 0xffffffffffffffff	 # tmp259,
	beq	$2,$3,$L121	 #, use_this_path, tmp259,
	sll	$3,$2,2	 # tmp260, use_this_path,

 # Library/Player/Pathfinding.c:224:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	addu	$7,$7,$3	 # _30, PathArray, tmp260
 # Library/Player/Pathfinding.c:224:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lw	$3,0($7)		 # *_30, *_30
 # Library/Player/Pathfinding.c:224:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lh	$3,0($3)		 # _31->Position, _31->Position
	mtc1	$3,$f0	 # _31->Position, _31->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp263, _31->Position
	swc1	$f0,0($5)	 # tmp263, *FoundNodePosition_51(D)
 # Library/Player/Pathfinding.c:225:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lw	$3,0($7)		 # *_30, *_30
 # Library/Player/Pathfinding.c:225:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lh	$3,2($3)		 # _34->Position, _34->Position
	mtc1	$3,$f0	 # _34->Position, _34->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp266, _34->Position
	swc1	$f0,4($5)	 # tmp266, MEM[(float *)FoundNodePosition_51(D) + 4B]
 # Library/Player/Pathfinding.c:226:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lw	$3,0($7)		 # *_30, *_30
 # Library/Player/Pathfinding.c:226:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lh	$3,4($3)		 # _37->Position, _37->Position
	mtc1	$3,$f0	 # _37->Position, _37->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp269, _37->Position
	jr	$31	 #
	swc1	$f0,8($5)	 # tmp269, MEM[(float *)FoundNodePosition_51(D) + 8B]

$L115:
 # Library/Player/Pathfinding.c:197:     short use_this_path=-1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
$L121:
 # Library/Player/Pathfinding.c:231: }
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	FindNearestDropNode
	.size	FindNearestDropNode, .-FindNearestDropNode
	.align	2
	.globl	FindFurthestNode
	.set	nomips16
	.set	nomicromips
	.ent	FindFurthestNode
	.type	FindFurthestNode, @function
FindFurthestNode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:242:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	lh	$7,18($sp)		 # _65, PathCount
 # Library/Player/Pathfinding.c:242:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	blez	$7,$L131	 #, _65,
	move	$3,$0	 # ThisPath,

 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	lwc1	$f12,0($4)	 # _7, *CurrentPosition_54(D)
 # Library/Player/Pathfinding.c:247:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	lwc1	$f10,4($4)	 # _14, MEM[(float *)CurrentPosition_54(D) + 4B]
 # Library/Player/Pathfinding.c:248:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	lwc1	$f8,8($4)	 # _22, MEM[(float *)CurrentPosition_54(D) + 8B]
	move	$4,$6	 # ivtmp.133, PathArray
 # Library/Player/Pathfinding.c:240:     short use_this_path=-1;
	li	$8,-1			# 0xffffffffffffffff	 # use_this_path,
 # Library/Player/Pathfinding.c:238:     float Distance = -99999999.0;
	lui	$2,%hi($LC1)	 # tmp239,
	b	$L126	 #
	lwc1	$f4,%lo($LC1)($2)	 # Distance,

$L124:
 # Library/Player/Pathfinding.c:242:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$3,$3,1	 # ThisPath, ThisPath,
$L130:
 # Library/Player/Pathfinding.c:242:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	beq	$3,$7,$L129	 #, ThisPath, _65,
	addiu	$4,$4,4	 # ivtmp.133, ivtmp.133,

$L126:
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	lw	$9,0($4)		 # _4, MEM[base: _56, offset: 0B]
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	lh	$2,0($9)		 # _4->Position, _4->Position
	mtc1	$2,$f0	 # _4->Position, _4->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp240, _4->Position
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	sub.s	$f0,$f0,$f12	 # tmp242, tmp240, _7
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	cvt.d.s	$f0,$f0	 # _9, tmp242
 # Library/Player/Pathfinding.c:247:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	lh	$2,2($9)		 # _4->Position, _4->Position
	mtc1	$2,$f2	 # _4->Position, _4->Position
	nop	
	cvt.s.w	$f6,$f2	 # tmp243, _4->Position
 # Library/Player/Pathfinding.c:247:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	sub.s	$f6,$f6,$f10	 # tmp245, tmp243, _14
 # Library/Player/Pathfinding.c:247:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	cvt.d.s	$f6,$f6	 # _16, tmp245
 # Library/Player/Pathfinding.c:248:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	lh	$2,4($9)		 # _4->Position, _4->Position
	mtc1	$2,$f2	 # _4->Position, _4->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp246, _4->Position
 # Library/Player/Pathfinding.c:248:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	sub.s	$f2,$f2,$f8	 # tmp248, tmp246, _22
 # Library/Player/Pathfinding.c:248:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	cvt.d.s	$f2,$f2	 # _24, tmp248
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	mul.d	$f0,$f0,$f0	 # tmp249, _9, _9
 # Library/Player/Pathfinding.c:247:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	mul.d	$f6,$f6,$f6	 # tmp250, _16, _16
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	add.d	$f0,$f0,$f6	 # tmp251, tmp249, tmp250
 # Library/Player/Pathfinding.c:248:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	mul.d	$f2,$f2,$f2	 # tmp252, _24, _24
 # Library/Player/Pathfinding.c:247:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	add.d	$f0,$f0,$f2	 # tmp253, tmp251, tmp252
 # Library/Player/Pathfinding.c:246:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp253
 # Library/Player/Pathfinding.c:249:         if (CheckDistance > Distance)
	c.lt.s	$f4,$f0	 #, Distance, CheckDistance
	nop	
	bc1fl	$L130	 #,,
	addiu	$3,$3,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:252:             use_this_path = ThisPath;
	sll	$8,$3,16	 # use_this_path, ThisPath,
	sra	$8,$8,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:251:             Distance = CheckDistance;
	b	$L124	 #
	mov.s	$f4,$f0	 # Distance, CheckDistance

$L129:
 # Library/Player/Pathfinding.c:256:     if (use_this_path != -1) //If a drop was actually found
	li	$2,-1			# 0xffffffffffffffff	 # tmp254,
	beq	$8,$2,$L131	 #, use_this_path, tmp254,
	sll	$8,$8,2	 # tmp255, use_this_path,

 # Library/Player/Pathfinding.c:259:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	addu	$8,$6,$8	 # _30, PathArray, tmp255
 # Library/Player/Pathfinding.c:259:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lw	$2,0($8)		 # *_30, *_30
 # Library/Player/Pathfinding.c:259:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lh	$2,0($2)		 # _31->Position, _31->Position
	mtc1	$2,$f0	 # _31->Position, _31->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp258, _31->Position
	swc1	$f0,0($5)	 # tmp258, *FoundNodePosition_50(D)
 # Library/Player/Pathfinding.c:260:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lw	$2,0($8)		 # *_30, *_30
 # Library/Player/Pathfinding.c:260:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lh	$2,2($2)		 # _34->Position, _34->Position
	mtc1	$2,$f0	 # _34->Position, _34->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp261, _34->Position
	swc1	$f0,4($5)	 # tmp261, MEM[(float *)FoundNodePosition_50(D) + 4B]
 # Library/Player/Pathfinding.c:261:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lw	$2,0($8)		 # *_30, *_30
 # Library/Player/Pathfinding.c:261:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lh	$2,4($2)		 # _37->Position, _37->Position
	mtc1	$2,$f0	 # _37->Position, _37->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp264, _37->Position
	swc1	$f0,8($5)	 # tmp264, MEM[(float *)FoundNodePosition_50(D) + 8B]
$L131:
 # Library/Player/Pathfinding.c:263: }
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	FindFurthestNode
	.size	FindFurthestNode, .-FindFurthestNode
	.align	2
	.globl	FindNearestMarker
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestMarker
	.type	FindNearestMarker, @function
FindNearestMarker:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:279:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	bltz	$6,$L140	 #, Markercount,
	lh	$2,18($sp)		 # defaultMarker, defaultMarker

 # Library/Player/Pathfinding.c:281:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
	sll	$7,$7,2	 # tmp229, ThisPath,
	addu	$5,$5,$7	 # tmp230, PathArray, tmp229
	lw	$5,0($5)		 # _4, *_3
	lwc1	$f8,0($4)	 # _10, *CurrentPosition_36(D)
	lwc1	$f6,8($4)	 # _18, MEM[(float *)CurrentPosition_36(D) + 8B]
	move	$7,$5	 # ivtmp.139, _4
	addiu	$5,$5,4	 # ivtmp.140, _4,
	addiu	$6,$6,1	 # _55, Markercount,
 # Library/Player/Pathfinding.c:279:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	move	$4,$0	 # ThisMarker,
 # Library/Player/Pathfinding.c:276:     float Distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp228,
	b	$L136	 #
	lwc1	$f4,%lo($LC0)($3)	 # Distance,

$L134:
 # Library/Player/Pathfinding.c:279:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	addiu	$4,$4,1	 # ThisMarker, ThisMarker,
$L139:
 # Library/Player/Pathfinding.c:279:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	addiu	$7,$7,8	 # ivtmp.139, ivtmp.139,
	beq	$4,$6,$L140	 #, ThisMarker, _55,
	addiu	$5,$5,8	 # ivtmp.140, ivtmp.140,

$L136:
 # Library/Player/Pathfinding.c:281:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
	lh	$3,0($7)		 # MEM[base: _42, offset: 0B], MEM[base: _42, offset: 0B]
	mtc1	$3,$f0	 # MEM[base: _42, offset: 0B], MEM[base: _42, offset: 0B]
	nop	
	cvt.s.w	$f0,$f0	 # tmp231, MEM[base: _42, offset: 0B]
	sub.s	$f0,$f0,$f8	 # tmp233, tmp231, _10
	cvt.d.s	$f0,$f0	 # _12, tmp233
	lh	$3,0($5)		 # MEM[base: _43, offset: 0B], MEM[base: _43, offset: 0B]
	mtc1	$3,$f2	 # MEM[base: _43, offset: 0B], MEM[base: _43, offset: 0B]
	nop	
	cvt.s.w	$f2,$f2	 # tmp234, MEM[base: _43, offset: 0B]
	sub.s	$f2,$f2,$f6	 # tmp236, tmp234, _18
	cvt.d.s	$f2,$f2	 # _20, tmp236
	mul.d	$f0,$f0,$f0	 # tmp237, _12, _12
	mul.d	$f2,$f2,$f2	 # tmp238, _20, _20
	add.d	$f0,$f0,$f2	 # tmp239, tmp237, tmp238
 # Library/Player/Pathfinding.c:281:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp239
 # Library/Player/Pathfinding.c:283:         if (CheckDistance < Distance)
	c.lt.s	$f0,$f4	 #, CheckDistance, Distance
	nop	
	bc1fl	$L139	 #,,
	addiu	$4,$4,1	 # ThisMarker, ThisMarker,

 # Library/Player/Pathfinding.c:286:             use_this_marker = ThisMarker;
	sll	$2,$4,16	 # defaultMarker, ThisMarker,
	sra	$2,$2,16	 # defaultMarker, defaultMarker,
 # Library/Player/Pathfinding.c:285:             Distance = CheckDistance;
	b	$L134	 #
	mov.s	$f4,$f0	 # Distance, CheckDistance

$L140:
 # Library/Player/Pathfinding.c:291: }
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	FindNearestMarker
	.size	FindNearestMarker, .-FindNearestMarker
	.align	2
	.globl	UpdateRacePath
	.set	nomips16
	.set	nomicromips
	.ent	UpdateRacePath
	.type	UpdateRacePath, @function
UpdateRacePath:
	.frame	$sp,64,$31		# vars= 0, regs= 5/4, args= 24, gp= 0
	.mask	0x800f0000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64	 #,,
	sw	$31,44($sp)	 #,
	sw	$19,40($sp)	 #,
	sw	$18,36($sp)	 #,
	sw	$17,32($sp)	 #,
	sw	$16,28($sp)	 #,
	sdc1	$f22,56($sp)	 #,
	sdc1	$f20,48($sp)	 #,
	move	$17,$4	 # Pathfinder, tmp409
	move	$18,$6	 # PathArray, tmp410
	lh	$6,82($sp)		 # PathCount, PathCount
 # Library/Player/Pathfinding.c:305:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	blez	$6,$L154	 #, PathCount,
	lh	$8,86($sp)		 # PlayerID, PlayerID

 # Library/Player/Pathfinding.c:309:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	lwc1	$f18,12($4)	 # _12, Pathfinder_125(D)->Target
	lwc1	$f16,20($4)	 # _20, Pathfinder_125(D)->Target
 # Library/Player/Pathfinding.c:324:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
	lui	$4,%hi(GlobalPlayer)	 # tmp294,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp295, tmp294,
	sll	$2,$8,3	 # tmp298, PlayerID,
	subu	$3,$2,$8	 # tmp299, tmp298, PlayerID
	sll	$3,$3,4	 # tmp300, tmp299,
	subu	$3,$3,$8	 # tmp301, tmp300, PlayerID
	sll	$3,$3,2	 # tmp302, tmp301,
	subu	$3,$3,$8	 # tmp303, tmp302, PlayerID
	sll	$3,$3,3	 # tmp304, tmp303,
	addu	$3,$4,$3	 # tmp296, tmp295, tmp304
	lwc1	$f14,20($3)	 # _45, GlobalPlayer[_44].position
	lwc1	$f12,28($3)	 # _53, GlobalPlayer[_44].position
	move	$4,$7	 # ivtmp.149, MarkerCounts
	move	$3,$18	 # ivtmp.150, PathArray
 # Library/Player/Pathfinding.c:305:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	move	$2,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:304:     float DistanceToBot = 99999999.0f;
	lui	$5,%hi($LC0)	 # tmp291,
	lwc1	$f2,%lo($LC0)($5)	 # DistanceToBot,
 # Library/Player/Pathfinding.c:303:     float DistanceToTarget = 99999999.0f;
	mov.s	$f4,$f2	 # DistanceToTarget, DistanceToBot
 # Library/Player/Pathfinding.c:299:     short nearestToBotPath = -1;
	li	$16,-1			# 0xffffffffffffffff	 # ThisPath,
 # Library/Player/Pathfinding.c:298:     short nearestToTargetPath = -1;
	b	$L151	 #
	li	$5,-1			# 0xffffffffffffffff	 # nearestToTargetPath,

$L149:
	addiu	$2,$2,1	 # tmp343, ThisPath,
$L168:
	sll	$2,$2,16	 # ThisPath, tmp343,
	sra	$2,$2,16	 # ThisPath, ThisPath,
 # Library/Player/Pathfinding.c:305:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	addiu	$4,$4,2	 # ivtmp.149, ivtmp.149,
	beq	$6,$2,$L163	 #, PathCount, ThisPath,
	addiu	$3,$3,4	 # ivtmp.150, ivtmp.150,

$L151:
 # Library/Player/Pathfinding.c:309:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	lw	$10,0($3)		 # _6, MEM[base: _71, offset: 0B]
	lh	$9,0($4)		 # MEM[base: _64, offset: 0B], MEM[base: _64, offset: 0B]
	sll	$9,$9,3	 # tmp317, MEM[base: _64, offset: 0B],
	addu	$9,$10,$9	 # _9, _6, tmp317
	lh	$11,0($9)		 # _9->Position, _9->Position
	mtc1	$11,$f0	 # _9->Position, _9->Position
	nop	
	cvt.s.w	$f0,$f0	 # _11, _9->Position
	sub.s	$f8,$f0,$f18	 # tmp319, _11, _12
	cvt.d.s	$f8,$f8	 # _14, tmp319
	lh	$9,4($9)		 # _9->Position, _9->Position
	mtc1	$9,$f6	 # _9->Position, _9->Position
	nop	
	cvt.s.w	$f10,$f6	 # _19, _9->Position
	sub.s	$f6,$f10,$f16	 # tmp321, _19, _20
	cvt.d.s	$f6,$f6	 # _22, tmp321
	mul.d	$f8,$f8,$f8	 # tmp322, _14, _14
	mul.d	$f6,$f6,$f6	 # tmp323, _22, _22
	add.d	$f6,$f8,$f6	 # tmp324, tmp322, tmp323
 # Library/Player/Pathfinding.c:309:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f6,$f6	 # CheckDistance, tmp324
 # Library/Player/Pathfinding.c:311:         if (CheckDistance < DistanceToTarget)
	c.lt.s	$f6,$f4	 #, CheckDistance, DistanceToTarget
	nop	
	bc1f	$L165	 #,,
	lh	$9,0($10)		 # _6->Position, _6->Position

 # Library/Player/Pathfinding.c:313:             DistanceToTarget = CheckDistance;
	mov.s	$f4,$f6	 # DistanceToTarget, CheckDistance
 # Library/Player/Pathfinding.c:311:         if (CheckDistance < DistanceToTarget)
	move	$5,$2	 # nearestToTargetPath, ThisPath
$L165:
 # Library/Player/Pathfinding.c:316:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	mtc1	$9,$f6	 # _6->Position, _6->Position
	nop	
	cvt.s.w	$f6,$f6	 # _27, _6->Position
	sub.s	$f22,$f6,$f18	 # tmp326, _27, _12
	cvt.d.s	$f22,$f22	 # _30, tmp326
	lh	$9,4($10)		 # _6->Position, _6->Position
	mtc1	$9,$f8	 # _6->Position, _6->Position
	nop	
	cvt.s.w	$f8,$f8	 # _34, _6->Position
	sub.s	$f20,$f8,$f16	 # tmp328, _34, _20
	cvt.d.s	$f20,$f20	 # _37, tmp328
	mul.d	$f20,$f20,$f20	 # tmp329, _37, _37
	mul.d	$f22,$f22,$f22	 # tmp330, _30, _30
	add.d	$f20,$f20,$f22	 # tmp331, tmp329, tmp330
 # Library/Player/Pathfinding.c:316:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f20,$f20	 # CheckDistance, tmp331
 # Library/Player/Pathfinding.c:318:         if (CheckDistance < DistanceToTarget)
	c.lt.s	$f20,$f4	 #, CheckDistance, DistanceToTarget
	nop	
	bc1f	$L166	 #,,
	sub.s	$f0,$f0,$f14	 # tmp332, _11, _45

 # Library/Player/Pathfinding.c:320:             DistanceToTarget = CheckDistance;
	mov.s	$f4,$f20	 # DistanceToTarget, CheckDistance
 # Library/Player/Pathfinding.c:318:         if (CheckDistance < DistanceToTarget)
	move	$5,$2	 # nearestToTargetPath, ThisPath
$L166:
 # Library/Player/Pathfinding.c:324:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
	cvt.d.s	$f0,$f0	 # _47, tmp332
	sub.s	$f10,$f10,$f12	 # tmp333, _19, _53
	cvt.d.s	$f10,$f10	 # _55, tmp333
	mul.d	$f0,$f0,$f0	 # tmp334, _47, _47
	mul.d	$f10,$f10,$f10	 # tmp335, _55, _55
	add.d	$f0,$f0,$f10	 # tmp336, tmp334, tmp335
 # Library/Player/Pathfinding.c:324:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp336
 # Library/Player/Pathfinding.c:326:         if (CheckDistance < DistanceToBot)
	c.lt.s	$f0,$f2	 #, CheckDistance, DistanceToBot
	nop	
	bc1fl	$L167	 #,,
	sub.s	$f0,$f6,$f14	 # tmp337, _27, _45

 # Library/Player/Pathfinding.c:328:             DistanceToBot = CheckDistance;
	mov.s	$f2,$f0	 # DistanceToBot, CheckDistance
 # Library/Player/Pathfinding.c:326:         if (CheckDistance < DistanceToBot)
	move	$16,$2	 # ThisPath, ThisPath
 # Library/Player/Pathfinding.c:331:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
	sub.s	$f0,$f6,$f14	 # tmp337, _27, _45
$L167:
	cvt.d.s	$f0,$f0	 # _63, tmp337
	sub.s	$f6,$f8,$f12	 # tmp338, _34, _53
	cvt.d.s	$f6,$f6	 # _70, tmp338
	mul.d	$f0,$f0,$f0	 # tmp339, _63, _63
	mul.d	$f6,$f6,$f6	 # tmp340, _70, _70
	add.d	$f0,$f0,$f6	 # tmp341, tmp339, tmp340
 # Library/Player/Pathfinding.c:331:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
	cvt.s.d	$f20,$f0	 # CheckDistance, tmp341
 # Library/Player/Pathfinding.c:333:         if (CheckDistance < DistanceToBot)
	c.lt.s	$f20,$f2	 #, CheckDistance, DistanceToBot
	nop	
	bc1fl	$L168	 #,,
	addiu	$2,$2,1	 # tmp343, ThisPath,

 # Library/Player/Pathfinding.c:331:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
	mov.s	$f2,$f20	 # DistanceToBot, CheckDistance
 # Library/Player/Pathfinding.c:333:         if (CheckDistance < DistanceToBot)
	b	$L149	 #
	move	$16,$2	 # ThisPath, ThisPath

$L163:
 # Library/Player/Pathfinding.c:344:     if (nearestToTargetPath > nearestToBotPath)
	slt	$2,$16,$5	 # tmp344, ThisPath, nearestToTargetPath
	beq	$2,$0,$L142	 #, tmp344,,
	srl	$2,$6,31	 # tmp346, PathCount,

 # Library/Player/Pathfinding.c:347:         if (diff < PathCount/2)
	addu	$2,$2,$6	 # tmp347, tmp346, PathCount
 # Library/Player/Pathfinding.c:346:         diff = nearestToTargetPath - nearestToBotPath;
	subu	$5,$5,$16	 # tmp351, nearestToTargetPath, ThisPath
 # Library/Player/Pathfinding.c:347:         if (diff < PathCount/2)
	sra	$2,$2,1	 # tmp352, tmp347,
	sll	$5,$5,16	 # tmp353, tmp351,
	sra	$5,$5,16	 # tmp353, tmp353,
	slt	$2,$5,$2	 # tmp354, tmp353, tmp352
	bne	$2,$0,$L152	 #, tmp354,,
	li	$19,1			# 0x1	 # Direction,

 # Library/Player/Pathfinding.c:354:             Direction = -1;           
	li	$19,-1			# 0xffffffffffffffff	 # Direction,
$L152:
 # Library/Player/Pathfinding.c:371:     if (ThisPath == PathCount) //error catch in case we went completeyl around the circle
	beql	$16,$6,$L153	 #, ThisPath, PathCount,
	move	$16,$0	 # ThisPath,

$L153:
 # Library/Player/Pathfinding.c:385:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$2,$16,1	 # tmp365, ThisPath,
	addu	$2,$7,$2	 # tmp366, MarkerCounts, tmp365
 # Library/Player/Pathfinding.c:385:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$4,$8,3	 # tmp369, PlayerID,
	subu	$4,$4,$8	 # tmp370, tmp369, PlayerID
	sll	$4,$4,4	 # tmp371, tmp370,
	subu	$4,$4,$8	 # tmp372, tmp371, PlayerID
	sll	$4,$4,2	 # tmp373, tmp372,
	subu	$8,$4,$8	 # tmp374, tmp373, PlayerID
	sll	$8,$8,3	 # tmp375, tmp374,
	addiu	$8,$8,20	 # tmp376, tmp375,
 # Library/Player/Pathfinding.c:385:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sw	$0,16($sp)	 #,
	move	$7,$16	 #, ThisPath
	lh	$6,0($2)		 #, *_87
	move	$5,$18	 #, PathArray
	lui	$4,%hi(GlobalPlayer)	 # tmp378,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp377, tmp378,
	jal	FindNearestMarker	 #
	addu	$4,$4,$8	 #, tmp377, tmp376

 # Library/Player/Pathfinding.c:385:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$2,$2,16	 # nearestMarker, tmp412,
	sra	$2,$2,16	 # nearestMarker, nearestMarker,
 # Library/Player/Pathfinding.c:386:     Pathfinder->Distance = CheckDistance;
	swc1	$f20,4($17)	 # CheckDistance, Pathfinder_125(D)->Distance
 # Library/Player/Pathfinding.c:387:     Pathfinder->TargetPath = ThisPath;
	sh	$16,0($17)	 # ThisPath, Pathfinder_125(D)->TargetPath
 # Library/Player/Pathfinding.c:388:     Pathfinder->Progression = nearestMarker;
	sh	$2,24($17)	 # nearestMarker, Pathfinder_125(D)->Progression
 # Library/Player/Pathfinding.c:389:     Pathfinder->Direction = Direction;
	sb	$19,36($17)	 # Direction, Pathfinder_125(D)->Direction
 # Library/Player/Pathfinding.c:390:     Pathfinder->PathType = 0;
	sb	$0,37($17)	 #, Pathfinder_125(D)->PathType
 # Library/Player/Pathfinding.c:391:     Pathfinder->NearestMarker = nearestMarker;
	sh	$2,26($17)	 # nearestMarker, Pathfinder_125(D)->NearestMarker
 # Library/Player/Pathfinding.c:392:     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	sll	$16,$16,2	 # tmp380, ThisPath,
	addu	$16,$18,$16	 # tmp381, PathArray, tmp380
 # Library/Player/Pathfinding.c:392:     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lw	$3,0($16)		 # *_92, *_92
	sll	$2,$2,3	 # tmp383, nearestMarker,
	addu	$2,$3,$2	 # tmp384, *_92, tmp383
 # Library/Player/Pathfinding.c:392:     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lh	$2,2($2)		 # _96->Position, _96->Position
	mtc1	$2,$f0	 # _96->Position, _96->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp386, _96->Position
	swc1	$f0,28($17)	 # tmp386, Pathfinder_125(D)->NearestMarkerHeight
 # Library/Player/Pathfinding.c:393:     Pathfinder->ProgressTimer = 0;
	sh	$0,32($17)	 #, Pathfinder_125(D)->ProgressTimer
 # Library/Player/Pathfinding.c:402: }
	lw	$31,44($sp)		 #,
	lw	$19,40($sp)		 #,
	lw	$18,36($sp)		 #,
	lw	$17,32($sp)		 #,
	lw	$16,28($sp)		 #,
	ldc1	$f22,56($sp)	 #,
	ldc1	$f20,48($sp)	 #,
	jr	$31	 #
	addiu	$sp,$sp,64	 #,,

$L154:
 # Library/Player/Pathfinding.c:302:     float CheckDistance  = 99999999.0f;
	lui	$2,%hi($LC0)	 # tmp293,
	lwc1	$f20,%lo($LC0)($2)	 # CheckDistance,
 # Library/Player/Pathfinding.c:299:     short nearestToBotPath = -1;
	li	$16,-1			# 0xffffffffffffffff	 # ThisPath,
 # Library/Player/Pathfinding.c:298:     short nearestToTargetPath = -1;
	li	$5,-1			# 0xffffffffffffffff	 # nearestToTargetPath,
$L142:
 # Library/Player/Pathfinding.c:360:         if (diff < PathCount/2)
	srl	$2,$6,31	 # tmp356, PathCount,
	addu	$2,$2,$6	 # tmp357, tmp356, PathCount
 # Library/Player/Pathfinding.c:359:         diff = nearestToBotPath - nearestToTargetPath;
	subu	$5,$16,$5	 # tmp361, ThisPath, nearestToTargetPath
 # Library/Player/Pathfinding.c:360:         if (diff < PathCount/2)
	sra	$2,$2,1	 # tmp362, tmp357,
	sll	$5,$5,16	 # tmp363, tmp361,
	sra	$5,$5,16	 # tmp363, tmp363,
	slt	$5,$5,$2	 # tmp364, tmp363, tmp362
	bne	$5,$0,$L152	 #, tmp364,,
	li	$19,-1			# 0xffffffffffffffff	 # Direction,

 # Library/Player/Pathfinding.c:366:             Direction = 1;
	b	$L152	 #
	li	$19,1			# 0x1	 # Direction,

	.set	macro
	.set	reorder
	.end	UpdateRacePath
	.size	UpdateRacePath, .-UpdateRacePath
	.align	2
	.globl	UpdateBKPath
	.set	nomips16
	.set	nomicromips
	.ent	UpdateBKPath
	.type	UpdateBKPath, @function
UpdateBKPath:
	.frame	$sp,112,$31		# vars= 24, regs= 10/6, args= 24, gp= 0
	.mask	0xc0ff0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-112	 #,,
	sw	$31,84($sp)	 #,
	sw	$fp,80($sp)	 #,
	sw	$23,76($sp)	 #,
	sw	$22,72($sp)	 #,
	sw	$21,68($sp)	 #,
	sw	$20,64($sp)	 #,
	sw	$19,60($sp)	 #,
	sw	$18,56($sp)	 #,
	sw	$17,52($sp)	 #,
	sw	$16,48($sp)	 #,
	sdc1	$f24,104($sp)	 #,
	sdc1	$f22,96($sp)	 #,
	sdc1	$f20,88($sp)	 #,
	move	$21,$4	 # Pathfinder, tmp486
	sw	$5,116($sp)	 # tmp487, FirstMarkerDistance
	sw	$6,120($sp)	 # tmp488, PathArray
	sw	$7,124($sp)	 # tmp489, MarkerCounts
	lh	$23,130($sp)		 # PathCount, PathCount
	lh	$4,134($sp)		 # PlayerID, PlayerID
	lb	$2,139($sp)		 # TypeOfPath, TypeOfPath
	sw	$2,40($sp)	 # TypeOfPath, %sfp
 # Library/Player/Pathfinding.c:411:     float player_height = GlobalPlayer[PlayerID].position[1];
	lui	$2,%hi(GlobalPlayer)	 # tmp335,
	sll	$3,$4,3	 # tmp339, PlayerID,
	subu	$3,$3,$4	 # tmp340, tmp339, PlayerID
	sll	$3,$3,4	 # tmp341, tmp340,
	subu	$3,$3,$4	 # tmp342, tmp341, PlayerID
	sll	$3,$3,2	 # tmp343, tmp342,
	subu	$3,$3,$4	 # tmp344, tmp343, PlayerID
	sll	$3,$3,3	 # tmp345, tmp344,
	addiu	$2,$2,%lo(GlobalPlayer)	 # tmp336, tmp335,
	addu	$3,$2,$3	 # tmp337, tmp336, tmp345
	lwc1	$f20,24($3)	 # player_height, GlobalPlayer[_1].position
 # Library/Player/Pathfinding.c:415:     Pathfinder->Distance = 99999999.0f; // Set an impossible value to ensure the first return is true. 
	lui	$2,%hi($LC0)	 # tmp346,
	lwc1	$f0,%lo($LC0)($2)	 # tmp347,
	swc1	$f0,4($21)	 # tmp347, Pathfinder_136(D)->Distance
 # Library/Player/Pathfinding.c:420:     if (Pathfinder->TargetPath != -1)
	lh	$2,0($21)		 # _2, Pathfinder_136(D)->TargetPath
 # Library/Player/Pathfinding.c:420:     if (Pathfinder->TargetPath != -1)
	li	$3,-1			# 0xffffffffffffffff	 # tmp348,
	bnel	$2,$3,$L170	 #, _2, tmp348,
	sh	$2,2($21)	 # _2, Pathfinder_136(D)->LastPath

$L170:
 # Library/Player/Pathfinding.c:424:     Pathfinder->TargetPath = -1;     
	li	$2,-1			# 0xffffffffffffffff	 # tmp349,
 # Library/Player/Pathfinding.c:425:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	blez	$23,$L171	 #, PathCount,
	sh	$2,0($21)	 # tmp349, Pathfinder_136(D)->TargetPath

 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	lwc1	$f0,140($sp)	 # tmp497, HeightCheckSquared
	cvt.d.s	$f22,$f0	 # tmp350, tmp497
	lui	$2,%hi($LC2)	 # tmp352,
	ldc1	$f0,%lo($LC2)($2)	 # tmp351,
	mul.d	$f22,$f22,$f0	 # _15, tmp350, tmp351
 # Library/Player/Pathfinding.c:435:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	sll	$2,$4,3	 # tmp354, PlayerID,
	subu	$2,$2,$4	 # tmp355, tmp354, PlayerID
	sll	$2,$2,4	 # tmp356, tmp355,
	subu	$2,$2,$4	 # tmp357, tmp356, PlayerID
	sll	$2,$2,2	 # tmp358, tmp357,
	subu	$2,$2,$4	 # tmp359, tmp358, PlayerID
	sll	$2,$2,3	 # tmp360, tmp359,
	addiu	$2,$2,20	 # tmp361, tmp360,
	lui	$3,%hi(GlobalPlayer)	 # tmp363,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp362, tmp363,
	addu	$2,$3,$2	 # _26, tmp362, tmp361
	sw	$2,28($sp)	 # _26, %sfp
	lw	$18,124($sp)		 # ivtmp.157, MarkerCounts
	lw	$17,120($sp)		 # ivtmp.158, PathArray
 # Library/Player/Pathfinding.c:425:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	move	$16,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:474:             objectPosition[0] = (float)PathArray[ThisPath][EndMarker].Position[0];
	lui	$fp,%hi(objectPosition)	 # tmp481,
 # Library/Player/Pathfinding.c:475:             objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
	addiu	$22,$fp,%lo(objectPosition)	 # tmp482, tmp481,
 # Library/Player/Pathfinding.c:478:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
	lui	$2,%hi($LC3)	 # tmp483,
	lwc1	$f0,%lo($LC3)($2)	 # tmp484,
	swc1	$f0,32($sp)	 # tmp484, %sfp
 # Library/Player/Pathfinding.c:435:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	b	$L179	 #
	swc1	$f0,36($sp)	 # tmp485, %sfp

$L193:
 # Library/Player/Pathfinding.c:431:             objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
	lh	$2,0($3)		 # _8->Position, _8->Position
	mtc1	$2,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp372, _8->Position
	swc1	$f0,%lo(objectPosition)($fp)	 # tmp372, objectPosition
 # Library/Player/Pathfinding.c:432:             objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
	lw	$2,0($17)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
 # Library/Player/Pathfinding.c:432:             objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
	lh	$2,2($2)		 # _20->Position, _20->Position
	mtc1	$2,$f0	 # _20->Position, _20->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp377, _20->Position
	swc1	$f0,4($22)	 # tmp377, objectPosition
 # Library/Player/Pathfinding.c:433:             objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];
	lw	$2,0($17)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
 # Library/Player/Pathfinding.c:433:             objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];
	lh	$2,4($2)		 # _23->Position, _23->Position
	mtc1	$2,$f0	 # _23->Position, _23->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp382, _23->Position
	swc1	$f0,8($22)	 # tmp382, objectPosition
 # Library/Player/Pathfinding.c:435:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	lw	$7,36($sp)		 #, %sfp
	move	$6,$22	 #, tmp482
	lwc1	$f0,116($sp)	 # tmp506, FirstMarkerDistance
	cvt.s.w	$f0,$f0	 # tmp505, tmp506
	mfc1	$5,$f0	 #, tmp505
	jal	TestCollideSphere	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:435:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	bne	$2,$0,$L191	 #, tmp490,,
	sll	$3,$20,3	 # tmp388, EndMarker,

$L172:
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	lw	$5,0($19)		 # _57, MEM[base: _198, offset: 0B]
$L197:
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	sll	$4,$20,3	 # _215, EndMarker,
	addu	$3,$5,$4	 # _216, _57, _215
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	lh	$2,2($3)		 # _60->Position, _60->Position
	mtc1	$2,$f0	 # _60->Position, _60->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp409, _60->Position
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	sub.s	$f0,$f20,$f0	 # tmp411, player_height, tmp409
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	cvt.d.s	$f0,$f0	 # _64, tmp411
	mul.d	$f0,$f0,$f0	 # tmp412, _64, _64
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	c.lt.d	$f0,$f22	 #, tmp412, _15
	nop	
	bc1fl	$L195	 #,,
	addiu	$16,$16,1	 # tmp455, ThisPath,

 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	lh	$5,6($5)		 # _57->Group, _57->Group
	li	$2,10			# 0xa	 # tmp414,
	bnel	$5,$2,$L196	 #, _57->Group, tmp414,
	lh	$2,0($3)		 # _223->Position, _223->Position

$L176:
	addiu	$16,$16,1	 # tmp455, ThisPath,
$L195:
	sll	$16,$16,16	 # ThisPath, tmp455,
	sra	$16,$16,16	 # ThisPath, ThisPath,
 # Library/Player/Pathfinding.c:425:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	addiu	$18,$18,2	 # ivtmp.157, ivtmp.157,
	beq	$23,$16,$L192	 #, PathCount, ThisPath,
	addiu	$17,$17,4	 # ivtmp.158, ivtmp.158,

$L179:
	sw	$18,24($sp)	 # ivtmp.157, %sfp
 # Library/Player/Pathfinding.c:427:         EndMarker = MarkerCounts[ThisPath];
	lh	$20,0($18)		 # EndMarker, MEM[base: _119, offset: 0B]
 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	lw	$3,0($17)		 # _8, MEM[base: _198, offset: 0B]
 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	lh	$2,2($3)		 # _8->Position, _8->Position
	mtc1	$2,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp364, _8->Position
 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	sub.s	$f0,$f20,$f0	 # tmp366, player_height, tmp364
 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	cvt.d.s	$f0,$f0	 # _12, tmp366
	mul.d	$f0,$f0,$f0	 # tmp367, _12, _12
 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	c.lt.d	$f0,$f22	 #, tmp367, _15
	nop	
	bc1f	$L172	 #,,
	move	$19,$17	 # _198, ivtmp.158

 # Library/Player/Pathfinding.c:428:         if ((pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared*0.5)  && (PathArray[ThisPath][0].Group != 11)) //If on same level and can go in this direction  (PathArray[ThisPath][0].Group != 11)
	lh	$4,6($3)		 # _8->Group, _8->Group
	li	$2,11			# 0xb	 # tmp369,
	bne	$4,$2,$L193	 #, _8->Group, tmp369,
	sll	$4,$20,3	 # _215, EndMarker,

 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	lw	$3,0($17)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
	addu	$3,$3,$4	 # _216, MEM[base: _198, offset: 0B], _215
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	lh	$2,2($3)		 # _216->Position, _216->Position
	mtc1	$2,$f0	 # _216->Position, _216->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp476, _216->Position
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	sub.s	$f0,$f20,$f0	 # tmp478, player_height, tmp476
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	cvt.d.s	$f0,$f0	 # _220, tmp478
	mul.d	$f0,$f0,$f0	 # tmp479, _220, _220
 # Library/Player/Pathfinding.c:471:         if ((pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared*0.5) && (PathArray[ThisPath][0].Group != 10)) //If on same level and can use path in reverse (PathArray[ThisPath][0].Group != 10)
	c.lt.d	$f0,$f22	 #, tmp479, _15
	nop	
	bc1fl	$L195	 #,,
	addiu	$16,$16,1	 # tmp455, ThisPath,

 # Library/Player/Pathfinding.c:474:             objectPosition[0] = (float)PathArray[ThisPath][EndMarker].Position[0];
	lh	$2,0($3)		 # _223->Position, _223->Position
$L196:
	mtc1	$2,$f0	 # _223->Position, _223->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp417, _223->Position
	swc1	$f0,%lo(objectPosition)($fp)	 # tmp417, objectPosition
 # Library/Player/Pathfinding.c:475:             objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
	lw	$2,0($19)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
	addu	$2,$2,$4	 # tmp421, MEM[base: _198, offset: 0B], _215
 # Library/Player/Pathfinding.c:475:             objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
	lh	$2,2($2)		 # _72->Position, _72->Position
	mtc1	$2,$f0	 # _72->Position, _72->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp423, _72->Position
	swc1	$f0,4($22)	 # tmp423, objectPosition
 # Library/Player/Pathfinding.c:476:             objectPosition[2] = (float)PathArray[ThisPath][EndMarker].Position[2];
	lw	$2,0($19)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
	addu	$4,$2,$4	 # tmp427, MEM[base: _198, offset: 0B], _215
 # Library/Player/Pathfinding.c:476:             objectPosition[2] = (float)PathArray[ThisPath][EndMarker].Position[2];
	lh	$2,4($4)		 # _76->Position, _76->Position
	mtc1	$2,$f0	 # _76->Position, _76->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp429, _76->Position
	swc1	$f0,8($22)	 # tmp429, objectPosition
 # Library/Player/Pathfinding.c:478:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
	lw	$7,32($sp)		 #, %sfp
	move	$6,$22	 #, tmp482
	lwc1	$f0,116($sp)	 # tmp517, FirstMarkerDistance
	cvt.s.w	$f0,$f0	 # tmp516, tmp517
	mfc1	$5,$f0	 #, tmp516
	jal	TestCollideSphere	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:478:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
	beql	$2,$0,$L195	 #, tmp492,,
	addiu	$16,$16,1	 # tmp455, ThisPath,

 # Library/Player/Pathfinding.c:481:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	lw	$3,0($19)		 # _82, MEM[base: _198, offset: 0B]
	lh	$2,0($3)		 # _82->Position, _82->Position
	mtc1	$2,$f0	 # _82->Position, _82->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp435, _82->Position
	lwc1	$f2,12($21)	 # Pathfinder_136(D)->Target, Pathfinder_136(D)->Target
	sub.s	$f0,$f0,$f2	 # tmp437, tmp435, Pathfinder_136(D)->Target
	cvt.d.s	$f0,$f0	 # _87, tmp437
	lh	$2,4($3)		 # _82->Position, _82->Position
	mtc1	$2,$f2	 # _82->Position, _82->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp439, _82->Position
	lwc1	$f4,20($21)	 # Pathfinder_136(D)->Target, Pathfinder_136(D)->Target
	sub.s	$f2,$f2,$f4	 # tmp441, tmp439, Pathfinder_136(D)->Target
	cvt.d.s	$f2,$f2	 # _94, tmp441
	mul.d	$f0,$f0,$f0	 # tmp443, _87, _87
	mul.d	$f2,$f2,$f2	 # tmp444, _94, _94
	add.d	$f0,$f0,$f2	 # tmp445, tmp443, tmp444
 # Library/Player/Pathfinding.c:481:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f24,$f0	 # CheckDistance, tmp445
 # Library/Player/Pathfinding.c:486:                 if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
	lwc1	$f0,4($21)	 # Pathfinder_136(D)->Distance, Pathfinder_136(D)->Distance
	c.lt.s	$f24,$f0	 #, CheckDistance, Pathfinder_136(D)->Distance
	nop	
	bc1fl	$L195	 #,,
	addiu	$16,$16,1	 # tmp455, ThisPath,

 # Library/Player/Pathfinding.c:489:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, EndMarker);
	sw	$20,16($sp)	 # EndMarker,
	move	$7,$16	 #, ThisPath
	lw	$2,24($sp)		 # _119, %sfp
	lh	$6,0($2)		 #, MEM[base: _119, offset: 0B]
	lw	$5,120($sp)		 #, PathArray
	jal	FindNearestMarker	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:489:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, EndMarker);
	sll	$2,$2,16	 # nearestMarker, tmp493,
	sra	$2,$2,16	 # nearestMarker, nearestMarker,
 # Library/Player/Pathfinding.c:491:                     Pathfinder->Distance = CheckDistance;
	swc1	$f24,4($21)	 # CheckDistance, Pathfinder_136(D)->Distance
 # Library/Player/Pathfinding.c:492:                     Pathfinder->TargetPath = ThisPath;
	sh	$16,0($21)	 # ThisPath, Pathfinder_136(D)->TargetPath
 # Library/Player/Pathfinding.c:494:                     Pathfinder->Progression = nearestMarker;
	sh	$2,24($21)	 # nearestMarker, Pathfinder_136(D)->Progression
 # Library/Player/Pathfinding.c:495:                     Pathfinder->Direction = -1;
	li	$3,-1			# 0xffffffffffffffff	 # tmp448,
	sb	$3,36($21)	 # tmp448, Pathfinder_136(D)->Direction
 # Library/Player/Pathfinding.c:496:                     Pathfinder->PathType = TypeOfPath;
	lw	$3,40($sp)		 # TypeOfPath, %sfp
	sb	$3,37($21)	 # TypeOfPath, Pathfinder_136(D)->PathType
 # Library/Player/Pathfinding.c:498:                     Pathfinder->NearestMarker = nearestMarker;
	sh	$2,26($21)	 # nearestMarker, Pathfinder_136(D)->NearestMarker
 # Library/Player/Pathfinding.c:500:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lw	$3,0($19)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
	sll	$2,$2,3	 # tmp450, nearestMarker,
	addu	$2,$3,$2	 # tmp451, MEM[base: _198, offset: 0B], tmp450
 # Library/Player/Pathfinding.c:500:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lh	$2,2($2)		 # _103->Position, _103->Position
	mtc1	$2,$f0	 # _103->Position, _103->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp453, _103->Position
	swc1	$f0,28($21)	 # tmp453, Pathfinder_136(D)->NearestMarkerHeight
 # Library/Player/Pathfinding.c:501:                     Pathfinder->ProgressTimer = 0;
	b	$L176	 #
	sh	$0,32($21)	 #, Pathfinder_136(D)->ProgressTimer

$L191:
 # Library/Player/Pathfinding.c:437:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	lw	$2,0($17)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
	addu	$3,$2,$3	 # _32, MEM[base: _198, offset: 0B], tmp388
	lh	$2,0($3)		 # _32->Position, _32->Position
	mtc1	$2,$f0	 # _32->Position, _32->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp390, _32->Position
	lwc1	$f2,12($21)	 # Pathfinder_136(D)->Target, Pathfinder_136(D)->Target
	sub.s	$f0,$f0,$f2	 # tmp392, tmp390, Pathfinder_136(D)->Target
	cvt.d.s	$f0,$f0	 # _37, tmp392
	lh	$2,4($3)		 # _32->Position, _32->Position
	mtc1	$2,$f2	 # _32->Position, _32->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp394, _32->Position
	lwc1	$f4,20($21)	 # Pathfinder_136(D)->Target, Pathfinder_136(D)->Target
	sub.s	$f2,$f2,$f4	 # tmp396, tmp394, Pathfinder_136(D)->Target
	cvt.d.s	$f2,$f2	 # _45, tmp396
	mul.d	$f0,$f0,$f0	 # tmp398, _37, _37
	mul.d	$f2,$f2,$f2	 # tmp399, _45, _45
	add.d	$f0,$f0,$f2	 # tmp400, tmp398, tmp399
 # Library/Player/Pathfinding.c:437:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f24,$f0	 # CheckDistance, tmp400
 # Library/Player/Pathfinding.c:443:                 if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
	lwc1	$f0,4($21)	 # Pathfinder_136(D)->Distance, Pathfinder_136(D)->Distance
	c.lt.s	$f24,$f0	 #, CheckDistance, Pathfinder_136(D)->Distance
	nop	
	bc1fl	$L197	 #,,
	lw	$5,0($19)		 # _57, MEM[base: _198, offset: 0B]

 # Library/Player/Pathfinding.c:446:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sw	$0,16($sp)	 #,
	move	$7,$16	 #, ThisPath
	lw	$2,24($sp)		 # _119, %sfp
	lh	$6,0($2)		 #, MEM[base: _119, offset: 0B]
	lw	$5,120($sp)		 #, PathArray
	jal	FindNearestMarker	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:446:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$2,$2,16	 # nearestMarker, tmp491,
	sra	$2,$2,16	 # nearestMarker, nearestMarker,
 # Library/Player/Pathfinding.c:448:                     Pathfinder->Distance = CheckDistance;
	swc1	$f24,4($21)	 # CheckDistance, Pathfinder_136(D)->Distance
 # Library/Player/Pathfinding.c:449:                     Pathfinder->TargetPath = ThisPath;
	sh	$16,0($21)	 # ThisPath, Pathfinder_136(D)->TargetPath
 # Library/Player/Pathfinding.c:451:                     Pathfinder->Progression = nearestMarker;
	sh	$2,24($21)	 # nearestMarker, Pathfinder_136(D)->Progression
 # Library/Player/Pathfinding.c:452:                     Pathfinder->Direction = 1;
	li	$3,1			# 0x1	 # tmp403,
	sb	$3,36($21)	 # tmp403, Pathfinder_136(D)->Direction
 # Library/Player/Pathfinding.c:453:                     Pathfinder->PathType = TypeOfPath;
	lw	$3,40($sp)		 # TypeOfPath, %sfp
	sb	$3,37($21)	 # TypeOfPath, Pathfinder_136(D)->PathType
 # Library/Player/Pathfinding.c:455:                     Pathfinder->NearestMarker = nearestMarker;
	sh	$2,26($21)	 # nearestMarker, Pathfinder_136(D)->NearestMarker
 # Library/Player/Pathfinding.c:457:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lw	$3,0($17)		 # MEM[base: _198, offset: 0B], MEM[base: _198, offset: 0B]
	sll	$2,$2,3	 # tmp405, nearestMarker,
	addu	$2,$3,$2	 # tmp406, MEM[base: _198, offset: 0B], tmp405
 # Library/Player/Pathfinding.c:457:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lh	$2,2($2)		 # _54->Position, _54->Position
	mtc1	$2,$f0	 # _54->Position, _54->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp408, _54->Position
	swc1	$f0,28($21)	 # tmp408, Pathfinder_136(D)->NearestMarkerHeight
 # Library/Player/Pathfinding.c:458:                     Pathfinder->ProgressTimer = 0;
	b	$L172	 #
	sh	$0,32($21)	 #, Pathfinder_136(D)->ProgressTimer

$L192:
 # Library/Player/Pathfinding.c:517:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	lh	$3,0($21)		 # Pathfinder_136(D)->TargetPath, Pathfinder_136(D)->TargetPath
	li	$2,-1			# 0xffffffffffffffff	 # tmp457,
	beql	$3,$2,$L198	 #, Pathfinder_136(D)->TargetPath, tmp457,
	lh	$3,2($21)		 # _109, Pathfinder_136(D)->LastPath

$L169:
 # Library/Player/Pathfinding.c:537: }
	lw	$31,84($sp)		 #,
$L199:
	lw	$fp,80($sp)		 #,
$L200:
	lw	$23,76($sp)		 #,
$L201:
	lw	$22,72($sp)		 #,
	lw	$21,68($sp)		 #,
	lw	$20,64($sp)		 #,
	lw	$19,60($sp)		 #,
	lw	$18,56($sp)		 #,
	lw	$17,52($sp)		 #,
	lw	$16,48($sp)		 #,
	ldc1	$f24,104($sp)	 #,
	ldc1	$f22,96($sp)	 #,
	ldc1	$f20,88($sp)	 #,
	jr	$31	 #
	addiu	$sp,$sp,112	 #,,

$L171:
 # Library/Player/Pathfinding.c:517:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	lh	$3,2($21)		 # _109, Pathfinder_136(D)->LastPath
 # Library/Player/Pathfinding.c:517:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	li	$2,-1			# 0xffffffffffffffff	 # tmp458,
$L198:
	beq	$3,$2,$L169	 #, _109, tmp458,
	slt	$23,$3,$23	 # tmp459, _109, PathCount

 # Library/Player/Pathfinding.c:517:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	beq	$23,$0,$L199	 #, tmp459,,
	lw	$31,84($sp)		 #,

 # Library/Player/Pathfinding.c:517:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	lb	$2,37($21)		 # Pathfinder_136(D)->PathType, Pathfinder_136(D)->PathType
	bne	$2,$0,$L200	 #, Pathfinder_136(D)->PathType,,
	lw	$fp,80($sp)		 #,

 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	sll	$2,$3,2	 # tmp461, _109,
	lw	$4,120($sp)		 # tmp523, PathArray
	addu	$2,$4,$2	 # tmp462, tmp523, tmp461
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lw	$2,0($2)		 # *_113, *_113
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lh	$2,2($2)		 # _114->Position, _114->Position
	mtc1	$2,$f0	 # _114->Position, _114->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp464, _114->Position
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	sub.s	$f20,$f20,$f0	 # tmp466, player_height, tmp464
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	cvt.d.s	$f20,$f20	 # _118, tmp466
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lwc1	$f0,140($sp)	 # tmp525, HeightCheckSquared
	cvt.d.s	$f0,$f0	 # tmp467, tmp525
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	mul.d	$f20,$f20,$f20	 # tmp468, _118, _118
 # Library/Player/Pathfinding.c:519:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	c.lt.d	$f20,$f0	 #, tmp468, tmp467
	nop	
	bc1f	$L201	 #,,
	lw	$23,76($sp)		 #,

 # Library/Player/Pathfinding.c:521:             Pathfinder->TargetPath = Pathfinder->LastPath;
	sh	$3,0($21)	 # _109, Pathfinder_136(D)->TargetPath
 # Library/Player/Pathfinding.c:522:             Pathfinder->ProgressTimer = 0.0;
	sh	$0,32($21)	 #, Pathfinder_136(D)->ProgressTimer
 # Library/Player/Pathfinding.c:523:             if (Pathfinder->Direction == 1)
	lb	$4,36($21)		 # Pathfinder_136(D)->Direction, Pathfinder_136(D)->Direction
	li	$2,1			# 0x1	 # tmp470,
	beq	$4,$2,$L194	 #, Pathfinder_136(D)->Direction, tmp470,
	li	$2,1			# 0x1	 # tmp474,

 # Library/Player/Pathfinding.c:531:                 Pathfinder->Progression = 0;
	sh	$0,24($21)	 #, Pathfinder_136(D)->Progression
 # Library/Player/Pathfinding.c:537: }
	b	$L169	 #
	sb	$2,36($21)	 # tmp474, Pathfinder_136(D)->Direction

$L194:
 # Library/Player/Pathfinding.c:525:                 Pathfinder->Progression = MarkerCounts[Pathfinder->TargetPath];
	sll	$2,$3,1	 # tmp471, _109,
	lw	$3,124($sp)		 # tmp526, MarkerCounts
	addu	$2,$3,$2	 # tmp472, tmp526, tmp471
	lh	$2,0($2)		 # _126, *_125
 # Library/Player/Pathfinding.c:525:                 Pathfinder->Progression = MarkerCounts[Pathfinder->TargetPath];
	sh	$2,24($21)	 # _126, Pathfinder_136(D)->Progression
 # Library/Player/Pathfinding.c:526:                 Pathfinder->Direction = -1;
	li	$2,-1			# 0xffffffffffffffff	 # tmp473,
	b	$L169	 #
	sb	$2,36($21)	 # tmp473, Pathfinder_136(D)->Direction

	.set	macro
	.set	reorder
	.end	UpdateBKPath
	.size	UpdateBKPath, .-UpdateBKPath
	.align	2
	.globl	ResetLaneDefaultOffset
	.set	nomips16
	.set	nomicromips
	.ent	ResetLaneDefaultOffset
	.type	ResetLaneDefaultOffset, @function
ResetLaneDefaultOffset:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24	 #,,
	sw	$31,20($sp)	 #,
	sw	$16,16($sp)	 #,
	move	$16,$4	 # playerID, tmp234
 # Library/Player/Pathfinding.c:545:     switch (MakeRandomLimmit(3))
	jal	MakeRandomLimmit	 #
	li	$4,3			# 0x3	 #,

 # Library/Player/Pathfinding.c:545:     switch (MakeRandomLimmit(3))
	li	$3,1			# 0x1	 # tmp202,
	beq	$2,$3,$L203	 #, _1, tmp202,
	li	$3,2			# 0x2	 # tmp203,

	beql	$2,$3,$L204	 #, _1, tmp203,
	lui	$2,%hi(LaneData)	 # tmp219,

	beq	$2,$0,$L207	 #, _1,,
	lui	$2,%hi(LaneData)	 # tmp204,

$L205:
 # Library/Player/Pathfinding.c:559:     LaneData[playerID].speed = 10.0f;
	sll	$16,$16,4	 # tmp230, playerID,
	lui	$4,%hi(LaneData)	 # tmp228,
	addiu	$4,$4,%lo(LaneData)	 # tmp231, tmp228,
	addu	$16,$16,$4	 # tmp229, tmp230, tmp231
	lui	$2,%hi($LC5)	 # tmp232,
	lwc1	$f0,%lo($LC5)($2)	 # tmp233,
	swc1	$f0,8($16)	 # tmp233, LaneData[playerID_10(D)].speed
 # Library/Player/Pathfinding.c:560: }
	lw	$31,20($sp)		 #,
	lw	$16,16($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,24	 #,,

$L207:
 # Library/Player/Pathfinding.c:548:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	sll	$3,$16,4	 # tmp207, playerID,
	addiu	$2,$2,%lo(LaneData)	 # tmp205, tmp204,
	addu	$2,$2,$3	 # tmp206, tmp205, tmp207
 # Library/Player/Pathfinding.c:548:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	lui	$3,%hi(g_RoadWidth)	 # tmp208,
 # Library/Player/Pathfinding.c:548:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	lwc1	$f0,%lo(g_RoadWidth)($3)	 # g_RoadWidth, g_RoadWidth
	lui	$3,%hi($LC4)	 # tmp212,
	lwc1	$f2,%lo($LC4)($3)	 # tmp211,
	mul.s	$f0,$f0,$f2	 # tmp209, g_RoadWidth, tmp211
	mfc1	$3,$f0	 # tmp209, tmp209
 # Library/Player/Pathfinding.c:548:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	li	$4,-2147483648			# 0xffffffff80000000	 # tmp214,
	xor	$3,$3,$4	 # tmp213, tmp209, tmp214
 # Library/Player/Pathfinding.c:549:         break;
	b	$L205	 #
	sw	$3,12($2)	 # tmp213, LaneData[playerID_10(D)].lane_free_drive

$L203:
 # Library/Player/Pathfinding.c:551:         LaneData[playerID].lane_free_drive = 0;
	lui	$2,%hi(LaneData)	 # tmp215,
	sll	$3,$16,4	 # tmp218, playerID,
	addiu	$2,$2,%lo(LaneData)	 # tmp216, tmp215,
	addu	$2,$2,$3	 # tmp217, tmp216, tmp218
 # Library/Player/Pathfinding.c:552:         break;
	b	$L205	 #
	sw	$0,12($2)	 #, LaneData[playerID_10(D)].lane_free_drive

$L204:
 # Library/Player/Pathfinding.c:554:         LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
	sll	$3,$16,4	 # tmp222, playerID,
	addiu	$2,$2,%lo(LaneData)	 # tmp220, tmp219,
	addu	$2,$2,$3	 # tmp221, tmp220, tmp222
 # Library/Player/Pathfinding.c:554:         LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
	lui	$3,%hi(g_RoadWidth)	 # tmp223,
 # Library/Player/Pathfinding.c:554:         LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
	lwc1	$f0,%lo(g_RoadWidth)($3)	 # g_RoadWidth, g_RoadWidth
	lui	$3,%hi($LC4)	 # tmp227,
	lwc1	$f2,%lo($LC4)($3)	 # tmp226,
	mul.s	$f0,$f0,$f2	 # tmp224, g_RoadWidth, tmp226
 # Library/Player/Pathfinding.c:555:         break;        
	b	$L205	 #
	swc1	$f0,12($2)	 # tmp224, LaneData[playerID_10(D)].lane_free_drive

	.set	macro
	.set	reorder
	.end	ResetLaneDefaultOffset
	.size	ResetLaneDefaultOffset, .-ResetLaneDefaultOffset
	.align	2
	.globl	ChooseAlternativePathRandm
	.set	nomips16
	.set	nomicromips
	.ent	ChooseAlternativePathRandm
	.type	ChooseAlternativePathRandm, @function
ChooseAlternativePathRandm:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:564:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	sll	$2,$4,1	 # tmp201, playerID,
	lui	$3,%hi(g_playerPathPointTable)	 # tmp200,
	addiu	$3,$3,%lo(g_playerPathPointTable)	 # tmp203, tmp200,
	addu	$2,$2,$3	 # tmp202, tmp201, tmp203
	lh	$2,0($2)		 # _1, g_playerPathPointTable
 # Library/Player/Pathfinding.c:564:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	slt	$5,$2,$5	 # tmp204, _1, tmp212
	bne	$5,$0,$L216
	nop
	 #, tmp204,,
 # Library/Player/Pathfinding.c:563: {
	addiu	$sp,$sp,-24	 #,,
	sw	$31,20($sp)	 #,
	sw	$16,16($sp)	 #,
 # Library/Player/Pathfinding.c:564:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	slt	$2,$6,$2	 # tmp205, pointCheckMax, _1
	beq	$2,$0,$L214	 #, tmp205,,
	move	$16,$4	 # playerID, tmp211

 # Library/Player/Pathfinding.c:569: }
	lw	$31,20($sp)		 #,
$L215:
	lw	$16,16($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,24	 #,,

$L214:
 # Library/Player/Pathfinding.c:566:         CurrentPathID[playerID] = MakeRandomLimmit(maxPathIDs);
	jal	MakeRandomLimmit	 #
	move	$4,$7	 #, maxPathIDs

 # Library/Player/Pathfinding.c:566:         CurrentPathID[playerID] = MakeRandomLimmit(maxPathIDs);
	sll	$3,$16,1	 # tmp208, playerID,
	lui	$4,%hi(CurrentPathID)	 # tmp207,
	addiu	$4,$4,%lo(CurrentPathID)	 # tmp210, tmp207,
	addu	$3,$3,$4	 # tmp209, tmp208, tmp210
	sh	$2,0($3)	 # tmp215, CurrentPathID
 # Library/Player/Pathfinding.c:567:         ResetLaneDefaultOffset(playerID);
	jal	ResetLaneDefaultOffset	 #
	move	$4,$16	 #, playerID

 # Library/Player/Pathfinding.c:569: }
	b	$L215	 #
	lw	$31,20($sp)		 #,

$L216:
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	ChooseAlternativePathRandm
	.size	ChooseAlternativePathRandm, .-ChooseAlternativePathRandm
	.align	2
	.globl	ChangePathAndPoint
	.set	nomips16
	.set	nomicromips
	.ent	ChangePathAndPoint
	.type	ChangePathAndPoint, @function
ChangePathAndPoint:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
 # Library/Player/Pathfinding.c:573:     if (CurrentPathID[playerID] != currentpathID)
	sll	$2,$4,1	 # tmp202, playerID,
	lui	$3,%hi(CurrentPathID)	 # tmp201,
	addiu	$3,$3,%lo(CurrentPathID)	 # tmp204, tmp201,
	addu	$2,$2,$3	 # tmp203, tmp202, tmp204
 # Library/Player/Pathfinding.c:573:     if (CurrentPathID[playerID] != currentpathID)
	lhu	$2,0($2)	 # tmp205, CurrentPathID
	bne	$2,$7,$L224	 #, tmp205, tmp223,
	sll	$2,$4,1	 # tmp207, playerID,

 # Library/Player/Pathfinding.c:578:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	lui	$3,%hi(g_playerPathPointTable)	 # tmp206,
	addiu	$3,$3,%lo(g_playerPathPointTable)	 # tmp209, tmp206,
	addu	$2,$2,$3	 # tmp208, tmp207, tmp209
	lh	$2,0($2)		 # _2, g_playerPathPointTable
 # Library/Player/Pathfinding.c:578:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	slt	$5,$2,$5	 # tmp210, _2, pointCheckMin
	bne	$5,$0,$L224	 #, tmp210,,
	slt	$2,$6,$2	 # tmp211, pointCheckMax, _2

 # Library/Player/Pathfinding.c:578:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	beq	$2,$0,$L223	 #, tmp211,,
	sll	$3,$4,1	 # tmp213, playerID,

$L224:
	jr	$31
	nop
	 #
$L223:
 # Library/Player/Pathfinding.c:572: {
	addiu	$sp,$sp,-24	 #,,
	sw	$31,20($sp)	 #,
 # Library/Player/Pathfinding.c:580:         CurrentPathID[playerID] = newpathID;
	lui	$2,%hi(CurrentPathID)	 # tmp212,
	addiu	$2,$2,%lo(CurrentPathID)	 # tmp215, tmp212,
	addu	$2,$3,$2	 # tmp214, tmp213, tmp215
	lhu	$5,42($sp)	 # newpathID, newpathID
	sh	$5,0($2)	 # newpathID, CurrentPathID
 # Library/Player/Pathfinding.c:581:         g_playerPathPointTable[playerID] = pointCheckMax;
	lui	$2,%hi(g_playerPathPointTable)	 # tmp216,
	addiu	$2,$2,%lo(g_playerPathPointTable)	 # tmp219, tmp216,
	addu	$3,$3,$2	 # tmp218, tmp213, tmp219
 # Library/Player/Pathfinding.c:582:         ResetLaneDefaultOffset(playerID);
	jal	ResetLaneDefaultOffset	 #
	sh	$6,0($3)	 # pointCheckMax, g_playerPathPointTable

 # Library/Player/Pathfinding.c:584: }
	lw	$31,20($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,24	 #,,

	.set	macro
	.set	reorder
	.end	ChangePathAndPoint
	.size	ChangePathAndPoint, .-ChangePathAndPoint
	.align	2
	.globl	MakeAlternativePath
	.set	nomips16
	.set	nomicromips
	.ent	MakeAlternativePath
	.type	MakeAlternativePath, @function
MakeAlternativePath:
	.frame	$sp,32,$31		# vars= 0, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32	 #,,
	sw	$31,28($sp)	 #,
	sw	$18,24($sp)	 #,
	sw	$17,20($sp)	 #,
	sw	$16,16($sp)	 #,
	move	$16,$6	 # pathID, tmp320
 # Library/Player/Pathfinding.c:590:     CenterPathBP[(int)pathID] = (Marker*)altPath;
	sll	$3,$6,2	 # tmp237, pathID,
	lui	$2,%hi(CenterPathBP)	 # tmp236,
	addiu	$2,$2,%lo(CenterPathBP)	 # tmp239, tmp236,
	addu	$2,$3,$2	 # tmp238, tmp237, tmp239
	sw	$4,0($2)	 # tmp318, CenterPathBP
 # Library/Player/Pathfinding.c:591:     g_courseTotalPathPoints[(int)pathID] = length;
	sll	$2,$6,1	 # tmp241, pathID,
	lui	$4,%hi(g_courseTotalPathPoints)	 # tmp240,
	addiu	$4,$4,%lo(g_courseTotalPathPoints)	 # tmp243, tmp240,
	addu	$2,$2,$4	 # tmp242, tmp241, tmp243
	sh	$5,0($2)	 # length, g_courseTotalPathPoints
 # Library/Player/Pathfinding.c:592:     MaxPathPoints[(int)pathID] = length;
	lui	$2,%hi(MaxPathPoints)	 # tmp244,
	addiu	$2,$2,%lo(MaxPathPoints)	 # tmp247, tmp244,
	addu	$3,$3,$2	 # tmp246, tmp237, tmp247
 # Library/Player/Pathfinding.c:594:     for (int i = 0; i < length; i++)
	blez	$5,$L226	 #, _67,
	sw	$5,0($3)	 # length, MaxPathPoints

	move	$7,$5	 # length, tmp319
 # Library/Player/Pathfinding.c:594:     for (int i = 0; i < length; i++)
	move	$5,$0	 # i,
 # Library/Player/Pathfinding.c:596:         CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
	lui	$8,%hi(CenterPathBP)	 # tmp248,
	sll	$6,$6,2	 # tmp249, pathID,
	addiu	$2,$8,%lo(CenterPathBP)	 # tmp251, tmp248,
	addu	$6,$6,$2	 # tmp250, tmp249, tmp251
 # Library/Player/Pathfinding.c:596:         CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
	lui	$9,%hi(g_mirrorValue)	 # tmp255,
$L227:
	sll	$4,$5,3	 # _40, i,
 # Library/Player/Pathfinding.c:596:         CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
	lw	$3,0($6)		 # tmp252, CenterPathBP
	addu	$3,$3,$4	 # _7, tmp252, _40
	lh	$2,0($3)		 # _7->Position, _7->Position
	mtc1	$2,$f0	 # _7->Position, _7->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp253, _7->Position
	lwc1	$f2,%lo(g_mirrorValue)($9)	 # g_mirrorValue, g_mirrorValue
	mul.s	$f0,$f0,$f2	 # tmp256, tmp253, g_mirrorValue
	trunc.w.s $f0,$f0	 # tmp258, tmp256
	mfc1	$2,$f0	 # tmp258, tmp258
	nop	
	sh	$2,0($3)	 # tmp258, _7->Position
 # Library/Player/Pathfinding.c:597:         CenterPathBP[(int)pathID][i].Group = CenterPathBP[0][i].Group;
	lw	$2,%lo(CenterPathBP)($8)		 # CenterPathBP, CenterPathBP
	addu	$2,$2,$4	 # tmp261, CenterPathBP, _40
	lh	$3,6($2)		 # _17, _14->Group
 # Library/Player/Pathfinding.c:597:         CenterPathBP[(int)pathID][i].Group = CenterPathBP[0][i].Group;
	lw	$2,0($6)		 # tmp266, CenterPathBP
	addu	$2,$2,$4	 # tmp267, tmp266, _40
 # Library/Player/Pathfinding.c:594:     for (int i = 0; i < length; i++)
	addiu	$5,$5,1	 # i, i,
 # Library/Player/Pathfinding.c:594:     for (int i = 0; i < length; i++)
	bne	$5,$7,$L227	 #, i, _67,
	sh	$3,6($2)	 # _17, _16->Group

$L226:
 # Library/Player/Pathfinding.c:600:     SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	sll	$18,$16,2	 # tmp269, pathID,
	lui	$17,%hi(MaxPathPoints)	 # tmp268,
	addiu	$17,$17,%lo(MaxPathPoints)	 # tmp271, tmp268,
	addu	$17,$18,$17	 # tmp270, tmp269, tmp271
 # Library/Player/Pathfinding.c:600:     SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lw	$4,0($17)		 # tmp273, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,3	 #, tmp273,

 # Library/Player/Pathfinding.c:600:     SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lui	$3,%hi(SideLPathBP)	 # tmp274,
	addiu	$3,$3,%lo(SideLPathBP)	 # tmp277, tmp274,
	addu	$3,$18,$3	 # tmp276, tmp269, tmp277
	sw	$2,0($3)	 # tmp321, SideLPathBP
 # Library/Player/Pathfinding.c:601:     SideRPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lw	$4,0($17)		 # tmp283, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,3	 #, tmp283,

 # Library/Player/Pathfinding.c:601:     SideRPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lui	$3,%hi(SideRPathBP)	 # tmp284,
	addiu	$3,$3,%lo(SideRPathBP)	 # tmp287, tmp284,
	addu	$3,$18,$3	 # tmp286, tmp269, tmp287
	sw	$2,0($3)	 # tmp322, SideRPathBP
 # Library/Player/Pathfinding.c:602:     CurvePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lw	$4,0($17)		 # tmp293, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,1	 #, tmp293,

 # Library/Player/Pathfinding.c:602:     CurvePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lui	$3,%hi(CurvePathDataBP)	 # tmp294,
	addiu	$3,$3,%lo(CurvePathDataBP)	 # tmp297, tmp294,
	addu	$3,$18,$3	 # tmp296, tmp269, tmp297
	sw	$2,0($3)	 # tmp323, CurvePathDataBP
 # Library/Player/Pathfinding.c:603:     AnglePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lw	$4,0($17)		 # tmp303, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,1	 #, tmp303,

 # Library/Player/Pathfinding.c:603:     AnglePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lui	$3,%hi(AnglePathDataBP)	 # tmp304,
	addiu	$3,$3,%lo(AnglePathDataBP)	 # tmp307, tmp304,
	addu	$3,$18,$3	 # tmp306, tmp269, tmp307
	sw	$2,0($3)	 # tmp324, AnglePathDataBP
 # Library/Player/Pathfinding.c:604:     ShortCutPathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lw	$4,0($17)		 # tmp313, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,1	 #, tmp313,

 # Library/Player/Pathfinding.c:604:     ShortCutPathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lui	$3,%hi(ShortCutPathDataBP)	 # tmp314,
	addiu	$3,$3,%lo(ShortCutPathDataBP)	 # tmp317, tmp314,
	addu	$18,$18,$3	 # tmp316, tmp269, tmp317
	sw	$2,0($18)	 # tmp325, ShortCutPathDataBP
 # Library/Player/Pathfinding.c:606:     SidePointCalcBP((int)pathID);
	jal	SidePointCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:607:     CurveDataCalcBP((int)pathID);
	jal	CurveDataCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:608:     AngleDataCalcBP((int)pathID);
	jal	AngleDataCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:609:     ShortcutDataCalcBP((int)pathID);
	jal	ShortcutDataCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:610: }
	lw	$31,28($sp)		 #,
	lw	$18,24($sp)		 #,
	lw	$17,20($sp)		 #,
	lw	$16,16($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,32	 #,,

	.set	macro
	.set	reorder
	.end	MakeAlternativePath
	.size	MakeAlternativePath, .-MakeAlternativePath
	.align	2
	.globl	ProSteeringPlusPlus
	.set	nomips16
	.set	nomicromips
	.ent	ProSteeringPlusPlus
	.type	ProSteeringPlusPlus, @function
ProSteeringPlusPlus:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32	 #,,
	sw	$31,28($sp)	 #,
	sw	$17,24($sp)	 #,
	sw	$16,20($sp)	 #,
	move	$16,$4	 # i, tmp608
 # Library/Player/Pathfinding.c:618:     short TargetPath = AIPathfinder[i].TargetPath;
	sll	$2,$4,1	 # tmp288, i,
	addu	$2,$2,$4	 # tmp289, tmp288, i
	sll	$2,$2,2	 # tmp290, tmp289,
	subu	$2,$2,$4	 # tmp291, tmp290, i
	sll	$2,$2,2	 # tmp292, tmp291,
	lui	$3,%hi(AIPathfinder)	 # tmp286,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp294, tmp286,
	addu	$2,$2,$3	 # tmp293, tmp292, tmp294
	lh	$4,0($2)		 # TargetPath, AIPathfinder[i_92(D)].TargetPath
 # Library/Player/Pathfinding.c:619:     short Progression = AIPathfinder[i].Progression; //(int)AIPathfinder[i].Progression;
	lh	$3,24($2)		 # Progression, AIPathfinder[i_92(D)].Progression
 # Library/Player/Pathfinding.c:620:     switch (AIPathfinder[i].PathType) //Get position of current marker to drive towards
	lb	$2,37($2)		 # _1, AIPathfinder[i_92(D)].PathType
 # Library/Player/Pathfinding.c:620:     switch (AIPathfinder[i].PathType) //Get position of current marker to drive towards
	li	$8,1			# 0x1	 # tmp313,
	beq	$2,$8,$L231	 #, _1, tmp313,
	sll	$4,$4,2	 # tmp333, TargetPath,

	li	$6,2			# 0x2	 # tmp314,
	beq	$2,$6,$L232
	nop
	 #, _1, tmp314,
	beq	$2,$0,$L262	 #, _1,,
	addu	$5,$5,$4	 # _4, PathArray, tmp315

$L233:
 # Library/Player/Pathfinding.c:643:     GlobalShortA = (short)(MakeDirection(GlobalPlayer[i].position[0],GlobalPlayer[i].position[2], objectPosition[0], objectPosition[2]) * -1);
	lui	$3,%hi(objectPosition)	 # tmp369,
	addiu	$4,$3,%lo(objectPosition)	 # tmp370, tmp369,
	lui	$17,%hi(GlobalPlayer)	 # tmp374,
	sll	$2,$16,3	 # tmp378, i,
	subu	$2,$2,$16	 # tmp379, tmp378, i
	sll	$2,$2,4	 # tmp380, tmp379,
	subu	$2,$2,$16	 # tmp381, tmp380, i
	sll	$2,$2,2	 # tmp382, tmp381,
	subu	$2,$2,$16	 # tmp383, tmp382, i
	sll	$2,$2,3	 # tmp384, tmp383,
	addiu	$17,$17,%lo(GlobalPlayer)	 # tmp375, tmp374,
	addu	$17,$17,$2	 # tmp376, tmp375, tmp384
	lw	$7,8($4)		 #, objectPosition
	lw	$6,%lo(objectPosition)($3)		 #, objectPosition
	lwc1	$f14,28($17)	 #, GlobalPlayer[i_92(D)].position
	jal	MakeDirection	 #
	lwc1	$f12,20($17)	 #, GlobalPlayer[i_92(D)].position

 # Library/Player/Pathfinding.c:644:     GlobalShortA -= GlobalPlayer[i].direction[1];
	lhu	$3,46($17)	 #, GlobalPlayer[i_92(D)].direction
	addu	$3,$2,$3	 # tmp412, tmp612, GlobalPlayer[i_92(D)].direction
	subu	$3,$0,$3	 # tmp414, tmp412
	sll	$3,$3,16	 # _63, tmp414,
	sra	$3,$3,16	 # _63, _63,
	lui	$2,%hi(GlobalShortA)	 # tmp415,
	sh	$3,%lo(GlobalShortA)($2)	 # _63, GlobalShortA
 # Library/Player/Pathfinding.c:645:     GlobalUInt64 = GlobalShortA * GlobalShortA;
	mult	$3,$3	 # _63, _63
	mflo	$6		 # _66
	sra	$5,$6,31	 # _66, _66,
 # Library/Player/Pathfinding.c:645:     GlobalUInt64 = GlobalShortA * GlobalShortA;
	lui	$2,%hi(GlobalUInt64)	 # tmp418,
	sw	$5,%lo(GlobalUInt64)($2)	 # _66, GlobalUInt64
	sw	$6,%lo(GlobalUInt64+4)($2)	 # _66, GlobalUInt64
 # Library/Player/Pathfinding.c:647:     BotButtons[i] = BTN_A;
	sll	$2,$16,1	 # tmp420, i,
	lui	$4,%hi(BotButtons)	 # tmp419,
	addiu	$4,$4,%lo(BotButtons)	 # tmp422, tmp419,
	addu	$4,$2,$4	 # tmp421, tmp420, tmp422
	li	$7,-32768			# 0xffffffffffff8000	 # tmp423,
	sh	$7,0($4)	 # tmp423, BotButtons
 # Library/Player/Pathfinding.c:648:     BotPressed[i] = 0;
	lui	$4,%hi(BotPressed)	 # tmp424,
	addiu	$4,$4,%lo(BotPressed)	 # tmp427, tmp424,
	addu	$4,$2,$4	 # tmp426, tmp420, tmp427
	sh	$0,0($4)	 #, BotPressed
 # Library/Player/Pathfinding.c:649:     GlobalPlayer[i].acc_maxcount = AIPathfinder[i].MaxSpeed; //Default top speed
	addu	$2,$2,$16	 # tmp432, tmp420, i
	sll	$2,$2,2	 # tmp433, tmp432,
	subu	$2,$2,$16	 # tmp434, tmp433, i
	sll	$2,$2,2	 # tmp435, tmp434,
	lui	$4,%hi(AIPathfinder)	 # tmp428,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp436, tmp428,
	addu	$2,$2,$4	 # tmp429, tmp435, tmp436
	lwc1	$f0,8($2)	 # _67, AIPathfinder[i_92(D)].MaxSpeed
 # Library/Player/Pathfinding.c:652:     if ((GlobalUInt64 > STOPTURN)) //| (PathGroup < 0) | (AIPathfinder[i].SlowDown))
	bne	$5,$0,$L255	 #, _66,,
	swc1	$f0,532($17)	 # _67, GlobalPlayer[i_92(D)].acc_maxcount

	bne	$5,$0,$L234	 #, _66,,
	li	$2,119209984			# 0x71b0000	 # tmp452,

	ori	$2,$2,0x8e41	 # tmp451, tmp452,
	sltu	$2,$6,$2	 # tmp450, _66, tmp451
	bne	$2,$0,$L234
	nop
	 #, tmp450,,
$L255:
 # Library/Player/Pathfinding.c:654:         GlobalPlayer[i].acc_maxcount = 0.5 * AIPathfinder[i].MaxSpeed; //Slow the bot way down hwen encountering a rival or item box 
	lui	$4,%hi(GlobalPlayer)	 # tmp453,
	sll	$2,$16,3	 # tmp457, i,
	subu	$2,$2,$16	 # tmp458, tmp457, i
	sll	$2,$2,4	 # tmp459, tmp458,
	subu	$2,$2,$16	 # tmp460, tmp459, i
	sll	$2,$2,2	 # tmp461, tmp460,
	subu	$2,$2,$16	 # tmp462, tmp461, i
	sll	$2,$2,3	 # tmp463, tmp462,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp454, tmp453,
	addu	$2,$4,$2	 # tmp455, tmp454, tmp463
 # Library/Player/Pathfinding.c:654:         GlobalPlayer[i].acc_maxcount = 0.5 * AIPathfinder[i].MaxSpeed; //Slow the bot way down hwen encountering a rival or item box 
	lui	$4,%hi($LC6)	 # tmp466,
	lwc1	$f2,%lo($LC6)($4)	 # tmp465,
	mul.s	$f0,$f0,$f2	 # tmp464, _67, tmp465
 # Library/Player/Pathfinding.c:654:         GlobalPlayer[i].acc_maxcount = 0.5 * AIPathfinder[i].MaxSpeed; //Slow the bot way down hwen encountering a rival or item box 
	swc1	$f0,532($2)	 # tmp464, GlobalPlayer[i_92(D)].acc_maxcount
 # Library/Player/Pathfinding.c:655:         BotButtons[i] |= BTN_B;  //continue braking
	sll	$2,$16,1	 # tmp468, i,
	lui	$4,%hi(BotButtons)	 # tmp467,
	addiu	$4,$4,%lo(BotButtons)	 # tmp470, tmp467,
	addu	$2,$2,$4	 # tmp469, tmp468, tmp470
	li	$4,-16384			# 0xffffffffffffc000	 # tmp471,
 # Library/Player/Pathfinding.c:656:         if (GlobalShortA > 0)
	blez	$3,$L236	 #, _63,
	sh	$4,0($2)	 # tmp471, BotButtons

 # Library/Player/Pathfinding.c:658:             if ((GlobalController[i]->AnalogX > 0) || (GlobalController[i]->AnalogX < 0))
	sll	$2,$16,2	 # tmp473, i,
	lui	$3,%hi(GlobalController)	 # tmp472,
	addiu	$3,$3,%lo(GlobalController)	 # tmp475, tmp472,
	addu	$2,$2,$3	 # tmp474, tmp473, tmp475
	lw	$2,0($2)		 # _69, GlobalController
 # Library/Player/Pathfinding.c:658:             if ((GlobalController[i]->AnalogX > 0) || (GlobalController[i]->AnalogX < 0))
	lh	$3,0($2)		 # _69->AnalogX, _69->AnalogX
	beq	$3,$0,$L263	 #, _69->AnalogX,,
	li	$3,127			# 0x7f	 # tmp482,

 # Library/Player/Pathfinding.c:660:                 BotButtons[i] |= BTN_R;  //continue drifting, otherwise stop.    
	sll	$16,$16,1	 # tmp478, i,
	lui	$3,%hi(BotButtons)	 # tmp477,
	addiu	$3,$3,%lo(BotButtons)	 # tmp480, tmp477,
	addu	$16,$16,$3	 # tmp479, tmp478, tmp480
	li	$3,-16368			# 0xffffffffffffc010	 # tmp481,
	sh	$3,0($16)	 # tmp481, BotButtons
 # Library/Player/Pathfinding.c:663:             GlobalController[i]->AnalogX = 127;  
	li	$3,127			# 0x7f	 # tmp482,
$L263:
	sh	$3,0($2)	 # tmp482, _69->AnalogX
$L230:
 # Library/Player/Pathfinding.c:743: }
	lw	$31,28($sp)		 #,
	lw	$17,24($sp)		 #,
	lw	$16,20($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,32	 #,,

$L262:
 # Library/Player/Pathfinding.c:623:             objectPosition[0] = (float)PathArray[TargetPath][Progression].Position[0];
	sll	$3,$3,3	 # _7, Progression,
 # Library/Player/Pathfinding.c:623:             objectPosition[0] = (float)PathArray[TargetPath][Progression].Position[0];
	lui	$2,%hi(objectPosition)	 # tmp316,
 # Library/Player/Pathfinding.c:623:             objectPosition[0] = (float)PathArray[TargetPath][Progression].Position[0];
	lw	$4,0($5)		 # *_4, *_4
	addu	$4,$4,$3	 # tmp318, *_4, _7
 # Library/Player/Pathfinding.c:623:             objectPosition[0] = (float)PathArray[TargetPath][Progression].Position[0];
	lh	$4,0($4)		 # _8->Position, _8->Position
	mtc1	$4,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp320, _8->Position
	swc1	$f0,%lo(objectPosition)($2)	 # tmp320, objectPosition
 # Library/Player/Pathfinding.c:624:             objectPosition[1] = (float)PathArray[TargetPath][Progression].Position[1];
	addiu	$2,$2,%lo(objectPosition)	 # tmp322, tmp316,
 # Library/Player/Pathfinding.c:624:             objectPosition[1] = (float)PathArray[TargetPath][Progression].Position[1];
	lw	$4,0($5)		 # *_4, *_4
	addu	$4,$4,$3	 # tmp324, *_4, _7
 # Library/Player/Pathfinding.c:624:             objectPosition[1] = (float)PathArray[TargetPath][Progression].Position[1];
	lh	$4,2($4)		 # _12->Position, _12->Position
	mtc1	$4,$f0	 # _12->Position, _12->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp326, _12->Position
	swc1	$f0,4($2)	 # tmp326, objectPosition
 # Library/Player/Pathfinding.c:625:             objectPosition[2] = (float)PathArray[TargetPath][Progression].Position[2]; 
	lw	$4,0($5)		 # *_4, *_4
	addu	$3,$4,$3	 # tmp330, *_4, _7
 # Library/Player/Pathfinding.c:625:             objectPosition[2] = (float)PathArray[TargetPath][Progression].Position[2]; 
	lh	$3,4($3)		 # _16->Position, _16->Position
	mtc1	$3,$f0	 # _16->Position, _16->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp332, _16->Position
 # Library/Player/Pathfinding.c:627:             break;
	b	$L233	 #
	swc1	$f0,8($2)	 # tmp332, objectPosition

$L231:
 # Library/Player/Pathfinding.c:629:             objectPosition[0] = (float)RampArray[TargetPath][Progression].Position[0];
	addu	$6,$6,$4	 # _21, RampArray, tmp333
 # Library/Player/Pathfinding.c:629:             objectPosition[0] = (float)RampArray[TargetPath][Progression].Position[0];
	sll	$3,$3,3	 # _24, Progression,
 # Library/Player/Pathfinding.c:629:             objectPosition[0] = (float)RampArray[TargetPath][Progression].Position[0];
	lui	$2,%hi(objectPosition)	 # tmp334,
 # Library/Player/Pathfinding.c:629:             objectPosition[0] = (float)RampArray[TargetPath][Progression].Position[0];
	lw	$4,0($6)		 # *_21, *_21
	addu	$4,$4,$3	 # tmp336, *_21, _24
 # Library/Player/Pathfinding.c:629:             objectPosition[0] = (float)RampArray[TargetPath][Progression].Position[0];
	lh	$4,0($4)		 # _25->Position, _25->Position
	mtc1	$4,$f0	 # _25->Position, _25->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp338, _25->Position
	swc1	$f0,%lo(objectPosition)($2)	 # tmp338, objectPosition
 # Library/Player/Pathfinding.c:630:             objectPosition[1] = (float)RampArray[TargetPath][Progression].Position[1];
	addiu	$2,$2,%lo(objectPosition)	 # tmp340, tmp334,
 # Library/Player/Pathfinding.c:630:             objectPosition[1] = (float)RampArray[TargetPath][Progression].Position[1];
	lw	$4,0($6)		 # *_21, *_21
	addu	$4,$4,$3	 # tmp342, *_21, _24
 # Library/Player/Pathfinding.c:630:             objectPosition[1] = (float)RampArray[TargetPath][Progression].Position[1];
	lh	$4,2($4)		 # _29->Position, _29->Position
	mtc1	$4,$f0	 # _29->Position, _29->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp344, _29->Position
	swc1	$f0,4($2)	 # tmp344, objectPosition
 # Library/Player/Pathfinding.c:631:             objectPosition[2] = (float)RampArray[TargetPath][Progression].Position[2]; 
	lw	$4,0($6)		 # *_21, *_21
	addu	$3,$4,$3	 # tmp348, *_21, _24
 # Library/Player/Pathfinding.c:631:             objectPosition[2] = (float)RampArray[TargetPath][Progression].Position[2]; 
	lh	$3,4($3)		 # _33->Position, _33->Position
	mtc1	$3,$f0	 # _33->Position, _33->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp350, _33->Position
 # Library/Player/Pathfinding.c:633:             break;
	b	$L233	 #
	swc1	$f0,8($2)	 # tmp350, objectPosition

$L232:
 # Library/Player/Pathfinding.c:635:             objectPosition[0] = (float)DropArray[TargetPath][Progression].Position[0];
	addu	$7,$7,$4	 # _38, DropArray, tmp351
 # Library/Player/Pathfinding.c:635:             objectPosition[0] = (float)DropArray[TargetPath][Progression].Position[0];
	sll	$3,$3,3	 # _41, Progression,
 # Library/Player/Pathfinding.c:635:             objectPosition[0] = (float)DropArray[TargetPath][Progression].Position[0];
	lui	$2,%hi(objectPosition)	 # tmp352,
 # Library/Player/Pathfinding.c:635:             objectPosition[0] = (float)DropArray[TargetPath][Progression].Position[0];
	lw	$4,0($7)		 # *_38, *_38
	addu	$4,$4,$3	 # tmp354, *_38, _41
 # Library/Player/Pathfinding.c:635:             objectPosition[0] = (float)DropArray[TargetPath][Progression].Position[0];
	lh	$4,0($4)		 # _42->Position, _42->Position
	mtc1	$4,$f0	 # _42->Position, _42->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp356, _42->Position
	swc1	$f0,%lo(objectPosition)($2)	 # tmp356, objectPosition
 # Library/Player/Pathfinding.c:636:             objectPosition[1] = (float)DropArray[TargetPath][Progression].Position[1];
	addiu	$2,$2,%lo(objectPosition)	 # tmp358, tmp352,
 # Library/Player/Pathfinding.c:636:             objectPosition[1] = (float)DropArray[TargetPath][Progression].Position[1];
	lw	$4,0($7)		 # *_38, *_38
	addu	$4,$4,$3	 # tmp360, *_38, _41
 # Library/Player/Pathfinding.c:636:             objectPosition[1] = (float)DropArray[TargetPath][Progression].Position[1];
	lh	$4,2($4)		 # _46->Position, _46->Position
	mtc1	$4,$f0	 # _46->Position, _46->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp362, _46->Position
	swc1	$f0,4($2)	 # tmp362, objectPosition
 # Library/Player/Pathfinding.c:637:             objectPosition[2] = (float)DropArray[TargetPath][Progression].Position[2]; 
	lw	$4,0($7)		 # *_38, *_38
	addu	$3,$4,$3	 # tmp366, *_38, _41
 # Library/Player/Pathfinding.c:637:             objectPosition[2] = (float)DropArray[TargetPath][Progression].Position[2]; 
	lh	$3,4($3)		 # _50->Position, _50->Position
	mtc1	$3,$f0	 # _50->Position, _50->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp368, _50->Position
 # Library/Player/Pathfinding.c:639:             break;
	b	$L233	 #
	swc1	$f0,8($2)	 # tmp368, objectPosition

$L236:
 # Library/Player/Pathfinding.c:667:             if ((GlobalController[i]->AnalogX > 0) || (GlobalController[i]->AnalogX < 0))
	sll	$2,$16,2	 # tmp484, i,
	lui	$3,%hi(GlobalController)	 # tmp483,
	addiu	$3,$3,%lo(GlobalController)	 # tmp486, tmp483,
	addu	$2,$2,$3	 # tmp485, tmp484, tmp486
	lw	$2,0($2)		 # _71, GlobalController
 # Library/Player/Pathfinding.c:667:             if ((GlobalController[i]->AnalogX > 0) || (GlobalController[i]->AnalogX < 0))
	lh	$3,0($2)		 # _71->AnalogX, _71->AnalogX
	beq	$3,$0,$L264	 #, _71->AnalogX,,
	li	$3,-127			# 0xffffffffffffff81	 # tmp493,

 # Library/Player/Pathfinding.c:669:                 BotButtons[i] |= BTN_R;  //continue drifting, otherwise stop.    
	sll	$16,$16,1	 # tmp489, i,
	lui	$3,%hi(BotButtons)	 # tmp488,
	addiu	$3,$3,%lo(BotButtons)	 # tmp491, tmp488,
	addu	$16,$16,$3	 # tmp490, tmp489, tmp491
	li	$3,-16368			# 0xffffffffffffc010	 # tmp492,
	sh	$3,0($16)	 # tmp492, BotButtons
 # Library/Player/Pathfinding.c:672:             GlobalController[i]->AnalogX = -127;  
	li	$3,-127			# 0xffffffffffffff81	 # tmp493,
$L264:
	b	$L230	 #
	sh	$3,0($2)	 # tmp493, _71->AnalogX

$L234:
 # Library/Player/Pathfinding.c:675:     else if ((GlobalUInt64 > DRIFTTURN) )
	bne	$5,$0,$L265	 #, _66,,
	lui	$4,%hi(GlobalPlayer)	 # tmp499,

	bne	$5,$0,$L240	 #, _66,,
	li	$2,52953088			# 0x3280000	 # tmp498,

	ori	$2,$2,0xb101	 # tmp497, tmp498,
	sltu	$2,$6,$2	 # tmp496, _66, tmp497
	bne	$2,$0,$L240
	nop
	 #, tmp496,,
$L265:
 # Library/Player/Pathfinding.c:677:         GlobalPlayer[i].acc_maxcount = 0.8 * AIPathfinder[i].MaxSpeed; //Slow the bot way down when encountering a rival or item box 
	sll	$2,$16,3	 # tmp503, i,
	subu	$2,$2,$16	 # tmp504, tmp503, i
	sll	$2,$2,4	 # tmp505, tmp504,
	subu	$2,$2,$16	 # tmp506, tmp505, i
	sll	$2,$2,2	 # tmp507, tmp506,
	subu	$2,$2,$16	 # tmp508, tmp507, i
	sll	$2,$2,3	 # tmp509, tmp508,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp500, tmp499,
	addu	$2,$4,$2	 # tmp501, tmp500, tmp509
 # Library/Player/Pathfinding.c:677:         GlobalPlayer[i].acc_maxcount = 0.8 * AIPathfinder[i].MaxSpeed; //Slow the bot way down when encountering a rival or item box 
	cvt.d.s	$f0,$f0	 # tmp510, _67
 # Library/Player/Pathfinding.c:677:         GlobalPlayer[i].acc_maxcount = 0.8 * AIPathfinder[i].MaxSpeed; //Slow the bot way down when encountering a rival or item box 
	lui	$4,%hi($LC7)	 # tmp513,
	ldc1	$f2,%lo($LC7)($4)	 # tmp512,
	mul.d	$f0,$f0,$f2	 # tmp511, tmp510, tmp512
	cvt.s.d	$f0,$f0	 # tmp514, tmp511
	swc1	$f0,532($2)	 # tmp514, GlobalPlayer[i_92(D)].acc_maxcount
 # Library/Player/Pathfinding.c:678:         BotPressed[i] = BTN_R | BTN_B;   //tap brake and jump
	sll	$2,$16,1	 # tmp516, i,
	lui	$4,%hi(BotPressed)	 # tmp515,
	addiu	$4,$4,%lo(BotPressed)	 # tmp518, tmp515,
	addu	$4,$2,$4	 # tmp517, tmp516, tmp518
	li	$5,16400			# 0x4010	 # tmp519,
	sh	$5,0($4)	 # tmp519, BotPressed
 # Library/Player/Pathfinding.c:679:         BotButtons[i] |= BTN_B;
	lui	$4,%hi(BotButtons)	 # tmp520,
	addiu	$4,$4,%lo(BotButtons)	 # tmp523, tmp520,
	addu	$2,$2,$4	 # tmp522, tmp516, tmp523
	li	$4,-16384			# 0xffffffffffffc000	 # tmp524,
 # Library/Player/Pathfinding.c:681:         if (GlobalShortA > 0)
	blez	$3,$L242	 #, _63,
	sh	$4,0($2)	 # tmp524, BotButtons

 # Library/Player/Pathfinding.c:683:             GlobalController[i]->AnalogX = 75;
	sll	$16,$16,2	 # tmp526, i,
	lui	$2,%hi(GlobalController)	 # tmp525,
	addiu	$2,$2,%lo(GlobalController)	 # tmp528, tmp525,
	addu	$16,$16,$2	 # tmp527, tmp526, tmp528
	lw	$2,0($16)		 # _76, GlobalController
 # Library/Player/Pathfinding.c:683:             GlobalController[i]->AnalogX = 75;
	li	$3,75			# 0x4b	 # tmp529,
	b	$L230	 #
	sh	$3,0($2)	 # tmp529, _76->AnalogX

$L242:
 # Library/Player/Pathfinding.c:687:             GlobalController[i]->AnalogX = -75;
	sll	$16,$16,2	 # tmp531, i,
	lui	$2,%hi(GlobalController)	 # tmp530,
	addiu	$2,$2,%lo(GlobalController)	 # tmp533, tmp530,
	addu	$16,$16,$2	 # tmp532, tmp531, tmp533
	lw	$2,0($16)		 # _77, GlobalController
 # Library/Player/Pathfinding.c:687:             GlobalController[i]->AnalogX = -75;
	li	$3,-75			# 0xffffffffffffffb5	 # tmp534,
	b	$L230	 #
	sh	$3,0($2)	 # tmp534, _77->AnalogX

$L240:
 # Library/Player/Pathfinding.c:690:     else if (GlobalUInt64 > WIDETURN)
	bne	$5,$0,$L266	 #, _66,,
	sll	$2,$16,1	 # tmp541, i,

	bne	$5,$0,$L243	 #, _66,,
	li	$2,20643840			# 0x13b0000	 # tmp539,

	ori	$2,$2,0xe525	 # tmp538, tmp539,
	sltu	$2,$6,$2	 # tmp537, _66, tmp538
	bne	$2,$0,$L243	 #, tmp537,,
	sll	$2,$16,1	 # tmp541, i,

$L266:
 # Library/Player/Pathfinding.c:692:         BotButtons[i] |= BTN_B; //Slow down bot for testing path finding
	lui	$4,%hi(BotButtons)	 # tmp540,
	addiu	$4,$4,%lo(BotButtons)	 # tmp543, tmp540,
	addu	$2,$2,$4	 # tmp542, tmp541, tmp543
	li	$4,-16384			# 0xffffffffffffc000	 # tmp544,
 # Library/Player/Pathfinding.c:693:         if (GlobalShortA > 0)
	blez	$3,$L245	 #, _63,
	sh	$4,0($2)	 # tmp544, BotButtons

 # Library/Player/Pathfinding.c:695:             GlobalController[i]->AnalogX = 70;
	sll	$16,$16,2	 # tmp546, i,
	lui	$2,%hi(GlobalController)	 # tmp545,
	addiu	$2,$2,%lo(GlobalController)	 # tmp548, tmp545,
	addu	$16,$16,$2	 # tmp547, tmp546, tmp548
	lw	$2,0($16)		 # _78, GlobalController
 # Library/Player/Pathfinding.c:695:             GlobalController[i]->AnalogX = 70;
	li	$3,70			# 0x46	 # tmp549,
	b	$L230	 #
	sh	$3,0($2)	 # tmp549, _78->AnalogX

$L245:
 # Library/Player/Pathfinding.c:699:             GlobalController[i]->AnalogX = -70;
	sll	$16,$16,2	 # tmp551, i,
	lui	$2,%hi(GlobalController)	 # tmp550,
	addiu	$2,$2,%lo(GlobalController)	 # tmp553, tmp550,
	addu	$16,$16,$2	 # tmp552, tmp551, tmp553
	lw	$2,0($16)		 # _79, GlobalController
 # Library/Player/Pathfinding.c:699:             GlobalController[i]->AnalogX = -70;
	li	$3,-70			# 0xffffffffffffffba	 # tmp554,
	b	$L230	 #
	sh	$3,0($2)	 # tmp554, _79->AnalogX

$L243:
 # Library/Player/Pathfinding.c:702:     else if (GlobalUInt64 > MIDTURN)
	bne	$5,$0,$L258
	nop
	 #, _66,,
	bne	$5,$0,$L246	 #, _66,,
	li	$2,4718592			# 0x480000	 # tmp559,

	ori	$2,$2,0xc841	 # tmp558, tmp559,
	sltu	$2,$6,$2	 # tmp557, _66, tmp558
	bne	$2,$0,$L246
	nop
	 #, tmp557,,
$L258:
 # Library/Player/Pathfinding.c:704:         if (GlobalShortA > 0)
	blez	$3,$L248	 #, _63,
	lui	$2,%hi(GlobalController)	 # tmp560,

 # Library/Player/Pathfinding.c:706:             GlobalController[i]->AnalogX = 55;
	sll	$16,$16,2	 # tmp561, i,
	addiu	$2,$2,%lo(GlobalController)	 # tmp563, tmp560,
	addu	$16,$16,$2	 # tmp562, tmp561, tmp563
	lw	$2,0($16)		 # _80, GlobalController
 # Library/Player/Pathfinding.c:706:             GlobalController[i]->AnalogX = 55;
	li	$3,55			# 0x37	 # tmp564,
	b	$L230	 #
	sh	$3,0($2)	 # tmp564, _80->AnalogX

$L248:
 # Library/Player/Pathfinding.c:710:             GlobalController[i]->AnalogX = -55;
	sll	$16,$16,2	 # tmp566, i,
	addiu	$2,$2,%lo(GlobalController)	 # tmp568, tmp565,
	addu	$16,$16,$2	 # tmp567, tmp566, tmp568
	lw	$2,0($16)		 # _81, GlobalController
 # Library/Player/Pathfinding.c:710:             GlobalController[i]->AnalogX = -55;
	li	$3,-55			# 0xffffffffffffffc9	 # tmp569,
	b	$L230	 #
	sh	$3,0($2)	 # tmp569, _81->AnalogX

$L246:
 # Library/Player/Pathfinding.c:713:     else if (GlobalUInt64 > SHORTTURN)
	bne	$5,$0,$L259
	nop
	 #, _66,,
	bne	$5,$0,$L249	 #, _66,,
	li	$2,786432			# 0xc0000	 # tmp574,

	ori	$2,$2,0xa2c5	 # tmp573, tmp574,
	sltu	$2,$6,$2	 # tmp572, _66, tmp573
	bne	$2,$0,$L249
	nop
	 #, tmp572,,
$L259:
 # Library/Player/Pathfinding.c:715:         if (GlobalShortA > 0)
	blez	$3,$L251	 #, _63,
	lui	$2,%hi(GlobalController)	 # tmp575,

 # Library/Player/Pathfinding.c:717:             GlobalController[i]->AnalogX = 45;
	sll	$16,$16,2	 # tmp576, i,
	addiu	$2,$2,%lo(GlobalController)	 # tmp578, tmp575,
	addu	$16,$16,$2	 # tmp577, tmp576, tmp578
	lw	$2,0($16)		 # _82, GlobalController
 # Library/Player/Pathfinding.c:717:             GlobalController[i]->AnalogX = 45;
	li	$3,45			# 0x2d	 # tmp579,
	b	$L230	 #
	sh	$3,0($2)	 # tmp579, _82->AnalogX

$L251:
 # Library/Player/Pathfinding.c:721:             GlobalController[i]->AnalogX = -45;
	sll	$2,$16,2	 # tmp581, i,
	lui	$3,%hi(GlobalController)	 # tmp580,
	addiu	$3,$3,%lo(GlobalController)	 # tmp583, tmp580,
	addu	$2,$2,$3	 # tmp582, tmp581, tmp583
	lw	$2,0($2)		 # _83, GlobalController
 # Library/Player/Pathfinding.c:721:             GlobalController[i]->AnalogX = -45;
	li	$3,-45			# 0xffffffffffffffd3	 # tmp584,
	b	$L230	 #
	sh	$3,0($2)	 # tmp584, _83->AnalogX

$L249:
 # Library/Player/Pathfinding.c:724:     else if (GlobalUInt64 > NOTURN)
	bne	$5,$0,$L260
	nop
	 #, _66,,
	bne	$5,$0,$L267	 #, _66,,
	sll	$2,$16,2	 # tmp601, i,

	li	$2,131072			# 0x20000	 # tmp589,
	addiu	$2,$2,1425	 # tmp588, tmp589,
	sltu	$6,$6,$2	 # tmp587, _66, tmp588
	bne	$6,$0,$L252	 #, tmp587,,
	sll	$2,$16,2	 # tmp601, i,

$L260:
 # Library/Player/Pathfinding.c:726:         if (GlobalShortA > 0)
	blez	$3,$L254	 #, _63,
	sll	$2,$16,2	 # tmp591, i,

 # Library/Player/Pathfinding.c:728:             GlobalController[i]->AnalogX = 29;
	lui	$3,%hi(GlobalController)	 # tmp590,
	addiu	$3,$3,%lo(GlobalController)	 # tmp593, tmp590,
	addu	$2,$2,$3	 # tmp592, tmp591, tmp593
	lw	$2,0($2)		 # _84, GlobalController
 # Library/Player/Pathfinding.c:728:             GlobalController[i]->AnalogX = 29;
	li	$3,29			# 0x1d	 # tmp594,
	b	$L230	 #
	sh	$3,0($2)	 # tmp594, _84->AnalogX

$L254:
 # Library/Player/Pathfinding.c:732:             GlobalController[i]->AnalogX = -29;
	lui	$3,%hi(GlobalController)	 # tmp595,
	addiu	$3,$3,%lo(GlobalController)	 # tmp598, tmp595,
	addu	$2,$2,$3	 # tmp597, tmp596, tmp598
	lw	$2,0($2)		 # _85, GlobalController
 # Library/Player/Pathfinding.c:732:             GlobalController[i]->AnalogX = -29;
	li	$3,-29			# 0xffffffffffffffe3	 # tmp599,
	b	$L230	 #
	sh	$3,0($2)	 # tmp599, _85->AnalogX

$L252:
$L267:
 # Library/Player/Pathfinding.c:738:         GlobalController[i]->AnalogX = 0x00;
	lui	$3,%hi(GlobalController)	 # tmp600,
	addiu	$3,$3,%lo(GlobalController)	 # tmp603, tmp600,
	addu	$2,$2,$3	 # tmp602, tmp601, tmp603
	lw	$2,0($2)		 # _86, GlobalController
 # Library/Player/Pathfinding.c:743: }
	b	$L230	 #
	sh	$0,0($2)	 #, _86->AnalogX

	.set	macro
	.set	reorder
	.end	ProSteeringPlusPlus
	.size	ProSteeringPlusPlus, .-ProSteeringPlusPlus
	.align	2
	.globl	StandardBattleBotBot
	.set	nomips16
	.set	nomicromips
	.ent	StandardBattleBotBot
	.type	StandardBattleBotBot, @function
StandardBattleBotBot:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32	 #,,
	sw	$31,28($sp)	 #,
	sw	$17,24($sp)	 #,
	sw	$16,20($sp)	 #,
	move	$16,$4	 # i, tmp336
 # Library/Player/Pathfinding.c:749:     switch( ObjectSubBehaviorTurnTarget(GlobalPlayer[i].position, GlobalPlayer[i].direction[1], AIPathfinder[i].Target, 0x7) ) //Returns -1 or 1, to give direction to turn
	sll	$2,$4,3	 # tmp218, i,
	subu	$17,$2,$4	 # tmp219, tmp218, i
	sll	$17,$17,4	 # tmp220, tmp219,
	subu	$17,$17,$4	 # tmp221, tmp220, i
	sll	$17,$17,2	 # tmp222, tmp221,
	subu	$17,$17,$4	 # tmp223, tmp222, i
	sll	$17,$17,3	 # tmp224, tmp223,
	addiu	$17,$17,20	 # tmp225, tmp224,
	lui	$4,%hi(GlobalPlayer)	 # tmp227,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp226, tmp227,
	addu	$17,$4,$17	 # _1, tmp226, tmp225
 # Library/Player/Pathfinding.c:749:     switch( ObjectSubBehaviorTurnTarget(GlobalPlayer[i].position, GlobalPlayer[i].direction[1], AIPathfinder[i].Target, 0x7) ) //Returns -1 or 1, to give direction to turn
	sll	$3,$16,1	 # tmp229, i,
	addu	$3,$3,$16	 # tmp230, tmp229, i
	sll	$3,$3,2	 # tmp231, tmp230,
	subu	$3,$3,$16	 # tmp232, tmp231, i
	sll	$3,$3,2	 # tmp233, tmp232,
	addiu	$3,$3,12	 # tmp234, tmp233,
 # Library/Player/Pathfinding.c:749:     switch( ObjectSubBehaviorTurnTarget(GlobalPlayer[i].position, GlobalPlayer[i].direction[1], AIPathfinder[i].Target, 0x7) ) //Returns -1 or 1, to give direction to turn
	subu	$2,$2,$16	 # tmp243, tmp218, i
	sll	$2,$2,4	 # tmp244, tmp243,
	subu	$2,$2,$16	 # tmp245, tmp244, i
	sll	$2,$2,2	 # tmp246, tmp245,
	subu	$2,$2,$16	 # tmp247, tmp246, i
	sll	$2,$2,3	 # tmp248, tmp247,
	addu	$2,$4,$2	 # tmp240, tmp226, tmp248
	li	$7,7			# 0x7	 #,
	lui	$6,%hi(AIPathfinder)	 # tmp236,
	addiu	$6,$6,%lo(AIPathfinder)	 # tmp235, tmp236,
	addu	$6,$6,$3	 #, tmp235, tmp234
	lh	$5,46($2)		 #, GlobalPlayer[i_16(D)].direction
	jal	ObjectSubBehaviorTurnTarget	 #
	move	$4,$17	 #, _1

 # Library/Player/Pathfinding.c:749:     switch( ObjectSubBehaviorTurnTarget(GlobalPlayer[i].position, GlobalPlayer[i].direction[1], AIPathfinder[i].Target, 0x7) ) //Returns -1 or 1, to give direction to turn
	beq	$2,$0,$L274	 #, tmp337,,
	sll	$2,$16,1	 # tmp328, i,

 # Library/Player/Pathfinding.c:774:             BotButtons[i] = BTN_A + BTN_B + BTN_R;
	lui	$3,%hi(BotButtons)	 # tmp327,
	addiu	$3,$3,%lo(BotButtons)	 # tmp330, tmp327,
	addu	$2,$2,$3	 # tmp329, tmp328, tmp330
	li	$3,-16368			# 0xffffffffffffc010	 # tmp331,
	sh	$3,0($2)	 # tmp331, BotButtons
 # Library/Player/Pathfinding.c:775:             BotAnalog[i] = 0x50;
	lui	$4,%hi(BotAnalog)	 # tmp332,
	addiu	$4,$4,%lo(BotAnalog)	 # tmp334, tmp332,
	addu	$16,$16,$4	 # tmp333, i, tmp334
	li	$2,80			# 0x50	 # tmp335,
	sb	$2,0($16)	 # tmp335, BotAnalog
$L268:
 # Library/Player/Pathfinding.c:781: }
	lw	$31,28($sp)		 #,
	lw	$17,24($sp)		 #,
	lw	$16,20($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,32	 #,,

$L274:
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	lui	$2,%hi($LC8)	 # tmp252,
	lw	$5,%lo($LC8)($2)		 # tmp251,
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	lui	$3,%hi(AIPathfinder)	 # tmp255,
	sll	$2,$16,1	 # tmp259, i,
	addu	$2,$2,$16	 # tmp260, tmp259, i
	sll	$2,$2,2	 # tmp261, tmp260,
	subu	$2,$2,$16	 # tmp262, tmp261, i
	sll	$2,$2,2	 # tmp263, tmp262,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp256, tmp255,
	addu	$2,$3,$2	 # tmp257, tmp256, tmp263
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	lb	$4,39($2)		 # AIPathfinder[i_16(D)].RivalPlayer, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$4,3	 # tmp266, AIPathfinder[i_16(D)].RivalPlayer,
	subu	$2,$2,$4	 # tmp267, tmp266, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$2,4	 # tmp268, tmp267,
	subu	$2,$2,$4	 # tmp269, tmp268, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$2,2	 # tmp270, tmp269,
	subu	$2,$2,$4	 # tmp271, tmp270, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$2,3	 # tmp272, tmp271,
	addiu	$2,$2,20	 # tmp273, tmp272,
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	move	$7,$5	 #, tmp251
	move	$6,$17	 #, _1
	lui	$4,%hi(GlobalPlayer)	 # tmp275,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp274, tmp275,
	jal	TestCollideSphere	 #
	addu	$4,$4,$2	 #, tmp274, tmp273

 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	bne	$2,$0,$L275	 #, tmp338,,
	lui	$2,%hi($LC9)	 # tmp279,

 # Library/Player/Pathfinding.c:762:                 BotPressed[i] = 0;
	sll	$2,$16,1	 # tmp316, i,
$L276:
	lui	$3,%hi(BotPressed)	 # tmp315,
	addiu	$3,$3,%lo(BotPressed)	 # tmp318, tmp315,
	addu	$3,$2,$3	 # tmp317, tmp316, tmp318
	sh	$0,0($3)	 #, BotPressed
 # Library/Player/Pathfinding.c:763:                 BotButtons[i] = BTN_A;
	lui	$3,%hi(BotButtons)	 # tmp319,
	addiu	$3,$3,%lo(BotButtons)	 # tmp322, tmp319,
	addu	$2,$2,$3	 # tmp321, tmp316, tmp322
	li	$3,-32768			# 0xffffffffffff8000	 # tmp323,
	sh	$3,0($2)	 # tmp323, BotButtons
$L271:
 # Library/Player/Pathfinding.c:766:             BotAnalog[i] = 0x00;
	lui	$4,%hi(BotAnalog)	 # tmp324,
	addiu	$4,$4,%lo(BotAnalog)	 # tmp326, tmp324,
	addu	$16,$16,$4	 # tmp325, i, tmp326
 # Library/Player/Pathfinding.c:768:             break;
	b	$L268	 #
	sb	$0,0($16)	 #, BotAnalog

$L275:
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	lw	$5,%lo($LC9)($2)		 # tmp278,
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	lui	$3,%hi(AIPathfinder)	 # tmp282,
	sll	$2,$16,1	 # tmp286, i,
	addu	$2,$2,$16	 # tmp287, tmp286, i
	sll	$2,$2,2	 # tmp288, tmp287,
	subu	$2,$2,$16	 # tmp289, tmp288, i
	sll	$2,$2,2	 # tmp290, tmp289,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp283, tmp282,
	addu	$2,$3,$2	 # tmp284, tmp283, tmp290
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	lb	$4,39($2)		 # AIPathfinder[i_16(D)].RivalPlayer, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$4,3	 # tmp293, AIPathfinder[i_16(D)].RivalPlayer,
	subu	$2,$2,$4	 # tmp294, tmp293, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$2,4	 # tmp295, tmp294,
	subu	$2,$2,$4	 # tmp296, tmp295, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$2,2	 # tmp297, tmp296,
	subu	$2,$2,$4	 # tmp298, tmp297, AIPathfinder[i_16(D)].RivalPlayer
	sll	$2,$2,3	 # tmp299, tmp298,
	addiu	$2,$2,20	 # tmp300, tmp299,
 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	move	$7,$5	 #, tmp278
	move	$6,$17	 #, _1
	lui	$4,%hi(GlobalPlayer)	 # tmp302,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp301, tmp302,
	jal	TestCollideSphere	 #
	addu	$4,$4,$2	 #, tmp301, tmp300

 # Library/Player/Pathfinding.c:753:             if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
	bne	$2,$0,$L276	 #, tmp339,,
	sll	$2,$16,1	 # tmp316, i,

 # Library/Player/Pathfinding.c:756:                 BotPressed[i] = BTN_Z;
	lui	$3,%hi(BotPressed)	 # tmp305,
	addiu	$3,$3,%lo(BotPressed)	 # tmp308, tmp305,
	addu	$3,$2,$3	 # tmp307, tmp306, tmp308
	li	$4,8192			# 0x2000	 # tmp309,
	sh	$4,0($3)	 # tmp309, BotPressed
 # Library/Player/Pathfinding.c:757:                 BotButtons[i] = BTN_A + BTN_Z;
	lui	$3,%hi(BotButtons)	 # tmp310,
	addiu	$3,$3,%lo(BotButtons)	 # tmp313, tmp310,
	addu	$2,$2,$3	 # tmp312, tmp306, tmp313
	li	$3,-24576			# 0xffffffffffffa000	 # tmp314,
	b	$L271	 #
	sh	$3,0($2)	 # tmp314, BotButtons

	.set	macro
	.set	reorder
	.end	StandardBattleBotBot
	.size	StandardBattleBotBot, .-StandardBattleBotBot
	.align	2
	.globl	OKBattleBot
	.set	nomips16
	.set	nomicromips
	.ent	OKBattleBot
	.type	OKBattleBot, @function
OKBattleBot:
	.frame	$sp,160,$31		# vars= 40, regs= 10/12, args= 32, gp= 0
	.mask	0xc0ff0000,-52
	.fmask	0xfff00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160	 #,,
	sw	$31,108($sp)	 #,
	sw	$fp,104($sp)	 #,
	sw	$23,100($sp)	 #,
	sw	$22,96($sp)	 #,
	sw	$21,92($sp)	 #,
	sw	$20,88($sp)	 #,
	sw	$19,84($sp)	 #,
	sw	$18,80($sp)	 #,
	sw	$17,76($sp)	 #,
	sw	$16,72($sp)	 #,
	sdc1	$f30,152($sp)	 #,
	sdc1	$f28,144($sp)	 #,
	sdc1	$f26,136($sp)	 #,
	sdc1	$f24,128($sp)	 #,
	sdc1	$f22,120($sp)	 #,
	sdc1	$f20,112($sp)	 #,
	move	$16,$4	 # BotIndex, tmp2190
	move	$17,$6	 # AIHeader, tmp2191
 # Library/Player/Pathfinding.c:787:     Marker** CoursePaths = (Marker**)(GetRealAddress(AIHeader->CoursePaths));
	jal	GetRealAddress	 #
	lw	$4,0($6)		 #, AIHeader_413(D)->CoursePaths

	move	$19,$2	 # CoursePaths, tmp2192
 # Library/Player/Pathfinding.c:788:     Marker** CourseDrops = (Marker**)(GetRealAddress(AIHeader->CourseDrops));
	jal	GetRealAddress	 #
	lw	$4,8($17)		 #, AIHeader_413(D)->CourseDrops

	move	$21,$2	 # CourseDrops, tmp2193
 # Library/Player/Pathfinding.c:789:     Marker** CourseRamps = (Marker**)(GetRealAddress(AIHeader->CourseRamps));
	jal	GetRealAddress	 #
	lw	$4,4($17)		 #, AIHeader_413(D)->CourseRamps

	move	$fp,$2	 # CourseRamps, tmp2194
 # Library/Player/Pathfinding.c:791:     short* PathLengths = (short*)(GetRealAddress(AIHeader->PathLengths));
	jal	GetRealAddress	 #
	lw	$4,12($17)		 #, AIHeader_413(D)->PathLengths

	move	$18,$2	 # PathLengths, tmp2195
 # Library/Player/Pathfinding.c:792:     short* DropLengths = (short*)(GetRealAddress(AIHeader->DropLengths));
	jal	GetRealAddress	 #
	lw	$4,20($17)		 #, AIHeader_413(D)->DropLengths

	move	$22,$2	 # DropLengths, tmp2196
 # Library/Player/Pathfinding.c:793:     short* RampLengths = (short*)(GetRealAddress(AIHeader->RampLengths));
	jal	GetRealAddress	 #
	lw	$4,16($17)		 #, AIHeader_413(D)->RampLengths

	move	$23,$2	 # RampLengths, tmp2197
 # Library/Player/Pathfinding.c:795:     float bot_x = GlobalPlayer[BotIndex].position[0]; //x,y,z coordinates of current bot
	lui	$3,%hi(GlobalPlayer)	 # tmp615,
	sll	$2,$16,3	 # tmp619, BotIndex,
	subu	$2,$2,$16	 # tmp620, tmp619, BotIndex
	sll	$2,$2,4	 # tmp621, tmp620,
	subu	$2,$2,$16	 # tmp622, tmp621, BotIndex
	sll	$2,$2,2	 # tmp623, tmp622,
	subu	$2,$2,$16	 # tmp624, tmp623, BotIndex
	sll	$2,$2,3	 # tmp625, tmp624,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp616, tmp615,
	addu	$2,$3,$2	 # tmp617, tmp616, tmp625
	lwc1	$f24,20($2)	 # bot_x, GlobalPlayer[BotIndex_426(D)].position
 # Library/Player/Pathfinding.c:796:     float bot_y = GlobalPlayer[BotIndex].position[1];
	lwc1	$f20,24($2)	 # bot_y, GlobalPlayer[BotIndex_426(D)].position
 # Library/Player/Pathfinding.c:797:     float bot_z = GlobalPlayer[BotIndex].position[2];
	lwc1	$f26,28($2)	 # bot_z, GlobalPlayer[BotIndex_426(D)].position
 # Library/Player/Pathfinding.c:799:     float rival_x = AIPathfinder[BotIndex].Target[0]; //x,y,z coordinates of current bot
	lui	$3,%hi(AIPathfinder)	 # tmp648,
	sll	$2,$16,1	 # tmp652, BotIndex,
	addu	$2,$2,$16	 # tmp653, tmp652, BotIndex
	sll	$2,$2,2	 # tmp654, tmp653,
	subu	$2,$2,$16	 # tmp655, tmp654, BotIndex
	sll	$2,$2,2	 # tmp656, tmp655,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp649, tmp648,
	addu	$2,$3,$2	 # tmp650, tmp649, tmp656
	lwc1	$f28,12($2)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:800:     float rival_y = AIPathfinder[BotIndex].Target[1];
	lwc1	$f22,16($2)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:801:     float rival_z = AIPathfinder[BotIndex].Target[2];
	lwc1	$f30,20($2)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:846:     if (AIPathfinder[BotIndex].Status != 35)
	lb	$3,38($2)		 # AIPathfinder[BotIndex_426(D)].Status, AIPathfinder[BotIndex_426(D)].Status
	li	$2,35			# 0x23	 # tmp685,
	bne	$3,$2,$L367	 #, AIPathfinder[BotIndex_426(D)].Status, tmp685,
	lui	$20,%hi(AIPathfinder)	 # tmp686,

$L278:
 # Library/Player/Pathfinding.c:887:     short TargetPath = AIPathfinder[BotIndex].TargetPath;
	sll	$2,$16,1	 # tmp816, BotIndex,
	addu	$2,$2,$16	 # tmp817, tmp816, BotIndex
	sll	$2,$2,2	 # tmp818, tmp817,
	subu	$2,$2,$16	 # tmp819, tmp818, BotIndex
	sll	$2,$2,2	 # tmp820, tmp819,
	lui	$3,%hi(AIPathfinder)	 # tmp814,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp822, tmp814,
	addu	$2,$2,$3	 # tmp821, tmp820, tmp822
	lh	$20,0($2)		 # TargetPath, AIPathfinder[BotIndex_426(D)].TargetPath
 # Library/Player/Pathfinding.c:891:     if ((TargetPath != -1)  &&  (AIPathfinder[BotIndex].PathType == FLATPATH))
	li	$2,-1			# 0xffffffffffffffff	 # tmp823,
	bne	$20,$2,$L377	 #, TargetPath, tmp823,
	lui	$3,%hi(AIPathfinder)	 # tmp824,

$L306:
	li	$20,-1			# 0xffffffffffffffff	 # TargetPath,
$L314:
 # Library/Player/Pathfinding.c:1075:     switch (AIPathfinder[BotIndex].PathType)
	lui	$3,%hi(AIPathfinder)	 # tmp1264,
$L386:
	sll	$2,$16,1	 # tmp1268, BotIndex,
	addu	$2,$2,$16	 # tmp1269, tmp1268, BotIndex
	sll	$2,$2,2	 # tmp1270, tmp1269,
	subu	$2,$2,$16	 # tmp1271, tmp1270, BotIndex
	sll	$2,$2,2	 # tmp1272, tmp1271,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1265, tmp1264,
	addu	$2,$3,$2	 # tmp1266, tmp1265, tmp1272
	lb	$2,37($2)		 # _260, AIPathfinder[BotIndex_426(D)].PathType
 # Library/Player/Pathfinding.c:1075:     switch (AIPathfinder[BotIndex].PathType)
	li	$3,1			# 0x1	 # tmp1273,
	beq	$2,$3,$L315	 #, _260, tmp1273,
	li	$3,2			# 0x2	 # tmp1274,

	beql	$2,$3,$L316	 #, _260, tmp1274,
	sll	$20,$16,1	 # tmp1856, BotIndex,

	beq	$2,$0,$L368	 #, _260,,
	sll	$2,$16,1	 # tmp1276, BotIndex,

$L317:
 # Library/Player/Pathfinding.c:1212:     if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
	sll	$2,$16,1	 # tmp1897, BotIndex,
$L374:
	addu	$2,$2,$16	 # tmp1898, tmp1897, BotIndex
	sll	$2,$2,2	 # tmp1899, tmp1898,
	subu	$2,$2,$16	 # tmp1900, tmp1899, BotIndex
	sll	$2,$2,2	 # tmp1901, tmp1900,
	lui	$3,%hi(AIPathfinder)	 # tmp1895,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1903, tmp1895,
	addu	$2,$2,$3	 # tmp1902, tmp1901, tmp1903
 # Library/Player/Pathfinding.c:1212:     if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
	lh	$3,0($2)		 # AIPathfinder[BotIndex_426(D)].TargetPath, AIPathfinder[BotIndex_426(D)].TargetPath
	li	$2,-1			# 0xffffffffffffffff	 # tmp1905,
	beq	$3,$2,$L369	 #, AIPathfinder[BotIndex_426(D)].TargetPath, tmp1905,
	sll	$3,$16,1	 # tmp1933, BotIndex,

 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	lui	$2,%hi($LC18)	 # tmp1917,
	lw	$5,%lo($LC18)($2)		 # tmp1916,
 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	sll	$2,$16,3	 # tmp1919, BotIndex,
	subu	$2,$2,$16	 # tmp1920, tmp1919, BotIndex
	sll	$2,$2,4	 # tmp1921, tmp1920,
	subu	$2,$2,$16	 # tmp1922, tmp1921, BotIndex
	sll	$2,$2,2	 # tmp1923, tmp1922,
	subu	$2,$2,$16	 # tmp1924, tmp1923, BotIndex
	sll	$2,$2,3	 # tmp1925, tmp1924,
	addiu	$2,$2,20	 # tmp1926, tmp1925,
 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	addu	$3,$3,$16	 # tmp1934, tmp1933, BotIndex
	sll	$3,$3,2	 # tmp1935, tmp1934,
	subu	$3,$3,$16	 # tmp1936, tmp1935, BotIndex
	sll	$3,$3,2	 # tmp1937, tmp1936,
	addiu	$3,$3,12	 # tmp1938, tmp1937,
 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	move	$7,$5	 #, tmp1916
	lui	$6,%hi(GlobalPlayer)	 # tmp1928,
	addiu	$6,$6,%lo(GlobalPlayer)	 # tmp1927, tmp1928,
	addu	$6,$6,$2	 #, tmp1927, tmp1926
	lui	$4,%hi(AIPathfinder)	 # tmp1940,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp1939, tmp1940,
	jal	TestCollideSphere	 #
	addu	$4,$4,$3	 #, tmp1939, tmp1938

 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	beq	$2,$0,$L378	 #, tmp2205,,
	move	$7,$21	 #, CourseDrops

 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	sub.s	$f20,$f20,$f22	 # tmp1943, bot_y, rival_y
 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	cvt.d.s	$f20,$f20	 # _370, tmp1943
	mul.d	$f20,$f20,$f20	 # tmp1944, _370, _370
 # Library/Player/Pathfinding.c:1221:     if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
	lui	$2,%hi($LC19)	 # tmp1946,
	ldc1	$f0,%lo($LC19)($2)	 # tmp1945,
	c.lt.d	$f20,$f0	 #, tmp1944, tmp1945
	nop	
	bc1t	$L370	 #,,
	lui	$3,%hi(GlobalPlayer)	 # tmp1947,

$L378:
 # Library/Player/Pathfinding.c:1236:     ProSteeringPlusPlus(BotIndex, CoursePaths, CourseRamps, CourseDrops);
	move	$6,$fp	 #, CourseRamps
	move	$5,$19	 #, CoursePaths
	jal	ProSteeringPlusPlus	 #
	move	$4,$16	 #, BotIndex

 # Library/Player/Pathfinding.c:1239:     AIPathfinder[BotIndex].ShootingTimer -= 1;
	lui	$3,%hi(AIPathfinder)	 # tmp1981,
	sll	$2,$16,1	 # tmp1985, BotIndex,
	addu	$2,$2,$16	 # tmp1986, tmp1985, BotIndex
	sll	$2,$2,2	 # tmp1987, tmp1986,
	subu	$2,$2,$16	 # tmp1988, tmp1987, BotIndex
	sll	$2,$2,2	 # tmp1989, tmp1988,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1982, tmp1981,
	addu	$2,$3,$2	 # tmp1983, tmp1982, tmp1989
	lhu	$3,34($2)	 #, AIPathfinder[BotIndex_426(D)].ShootingTimer
	addiu	$3,$3,-1	 # tmp1991, AIPathfinder[BotIndex_426(D)].ShootingTimer,
	sll	$3,$3,16	 # _379, tmp1991,
	sra	$3,$3,16	 # _379, _379,
 # Library/Player/Pathfinding.c:1240:     if (AIPathfinder[BotIndex].ShootingTimer <= 0)
	blez	$3,$L371	 #, _379,
	sh	$3,34($2)	 # _379, AIPathfinder[BotIndex_426(D)].ShootingTimer

$L277:
 # Library/Player/Pathfinding.c:1248: }
	lw	$31,108($sp)		 #,
$L376:
	lw	$fp,104($sp)		 #,
	lw	$23,100($sp)		 #,
	lw	$22,96($sp)		 #,
	lw	$21,92($sp)		 #,
	lw	$20,88($sp)		 #,
	lw	$19,84($sp)		 #,
	lw	$18,80($sp)		 #,
	lw	$17,76($sp)		 #,
	lw	$16,72($sp)		 #,
	ldc1	$f30,152($sp)	 #,
	ldc1	$f28,144($sp)	 #,
	ldc1	$f26,136($sp)	 #,
	ldc1	$f24,128($sp)	 #,
	ldc1	$f22,120($sp)	 #,
	ldc1	$f20,112($sp)	 #,
	jr	$31	 #
	addiu	$sp,$sp,160	 #,,

$L367:
 # Library/Player/Pathfinding.c:849:         AIPathfinder[BotIndex].Status = 35;
	sll	$2,$16,1	 # tmp690, BotIndex,
	addu	$2,$2,$16	 # tmp691, tmp690, BotIndex
	sll	$2,$2,2	 # tmp692, tmp691,
	subu	$2,$2,$16	 # tmp693, tmp692, BotIndex
	sll	$2,$2,2	 # tmp694, tmp693,
	addiu	$20,$20,%lo(AIPathfinder)	 # tmp687, tmp686,
	addu	$20,$20,$2	 # tmp688, tmp687, tmp694
	li	$2,35			# 0x23	 # tmp695,
	sb	$2,38($20)	 # tmp695, AIPathfinder[BotIndex_426(D)].Status
 # Library/Player/Pathfinding.c:851:         UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 300, CoursePaths, PathLengths, (short)(AIHeader->TotalPaths), BotIndex, 0, 225.0f);       
	lui	$2,%hi($LC12)	 # tmp705,
	lwc1	$f0,%lo($LC12)($2)	 # tmp706,
	swc1	$f0,28($sp)	 # tmp706,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,300			# 0x12c	 #,
	jal	UpdateBKPath	 #
	move	$4,$20	 #, tmp688

 # Library/Player/Pathfinding.c:855:         if (AIPathfinder[BotIndex].TargetPath == -1)
	lh	$20,0($20)		 # TargetPath, AIPathfinder[BotIndex_426(D)].TargetPath
 # Library/Player/Pathfinding.c:855:         if (AIPathfinder[BotIndex].TargetPath == -1)
	li	$2,-1			# 0xffffffffffffffff	 # tmp718,
	beq	$20,$2,$L372	 #, TargetPath, tmp718,
	lui	$3,%hi(AIPathfinder)	 # tmp824,

$L377:
 # Library/Player/Pathfinding.c:891:     if ((TargetPath != -1)  &&  (AIPathfinder[BotIndex].PathType == FLATPATH))
	sll	$2,$16,1	 # tmp828, BotIndex,
	addu	$2,$2,$16	 # tmp829, tmp828, BotIndex
	sll	$2,$2,2	 # tmp830, tmp829,
	subu	$2,$2,$16	 # tmp831, tmp830, BotIndex
	sll	$2,$2,2	 # tmp832, tmp831,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp825, tmp824,
	addu	$2,$3,$2	 # tmp826, tmp825, tmp832
	lb	$2,37($2)		 # _35, AIPathfinder[BotIndex_426(D)].PathType
 # Library/Player/Pathfinding.c:891:     if ((TargetPath != -1)  &&  (AIPathfinder[BotIndex].PathType == FLATPATH))
	bne	$2,$0,$L282	 #, _35,,
	li	$3,1			# 0x1	 # tmp856,

 # Library/Player/Pathfinding.c:893:         if (AIPathfinder[BotIndex].NearestMarkerHeight - bot_y > 225.0f)
	lui	$3,%hi(AIPathfinder)	 # tmp833,
	sll	$2,$16,1	 # tmp837, BotIndex,
	addu	$2,$2,$16	 # tmp838, tmp837, BotIndex
	sll	$2,$2,2	 # tmp839, tmp838,
	subu	$2,$2,$16	 # tmp840, tmp839, BotIndex
	sll	$2,$2,2	 # tmp841, tmp840,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp834, tmp833,
	addu	$2,$3,$2	 # tmp835, tmp834, tmp841
 # Library/Player/Pathfinding.c:893:         if (AIPathfinder[BotIndex].NearestMarkerHeight - bot_y > 225.0f)
	lwc1	$f0,28($2)	 # AIPathfinder[BotIndex_426(D)].NearestMarkerHeight, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
	sub.s	$f0,$f0,$f20	 # tmp842, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight, bot_y
 # Library/Player/Pathfinding.c:893:         if (AIPathfinder[BotIndex].NearestMarkerHeight - bot_y > 225.0f)
	lui	$2,%hi($LC12)	 # tmp845,
	lwc1	$f2,%lo($LC12)($2)	 # tmp844,
	c.lt.s	$f2,$f0	 #, tmp844, tmp842
	nop	
	bc1f	$L379	 #,,
	sll	$6,$20,1	 # tmp862, TargetPath,

 # Library/Player/Pathfinding.c:896:             AIPathfinder[BotIndex].TargetPath = -1;  
	sll	$2,$16,1	 # tmp848, BotIndex,
	addu	$2,$2,$16	 # tmp849, tmp848, BotIndex
	sll	$2,$2,2	 # tmp850, tmp849,
	subu	$2,$2,$16	 # tmp851, tmp850, BotIndex
	sll	$2,$2,2	 # tmp852, tmp851,
	lui	$3,%hi(AIPathfinder)	 # tmp846,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp854, tmp846,
	addu	$2,$2,$3	 # tmp853, tmp852, tmp854
	li	$3,-1			# 0xffffffffffffffff	 # tmp855,
	b	$L306	 #
	sh	$3,0($2)	 # tmp855, AIPathfinder[BotIndex_426(D)].TargetPath

$L372:
 # Library/Player/Pathfinding.c:858:             float dropNodePosition[] = {0.,0.,0.};
	sw	$0,32($sp)	 #, MEM[(float[3] *)_130]
	sw	$0,36($sp)	 #, MEM[(float[3] *)_130]
	sw	$0,40($sp)	 #, MEM[(float[3] *)_130]
 # Library/Player/Pathfinding.c:859:             int drop_path_index = FindNearestDropNode(GlobalPlayer[BotIndex].position, dropNodePosition, rival_y, CourseDrops, DropLengths, (short)(AIHeader->TotalDrops), 225.0f);
	sll	$2,$16,3	 # tmp720, BotIndex,
	subu	$2,$2,$16	 # tmp721, tmp720, BotIndex
	sll	$2,$2,4	 # tmp722, tmp721,
	subu	$2,$2,$16	 # tmp723, tmp722, BotIndex
	sll	$2,$2,2	 # tmp724, tmp723,
	subu	$2,$2,$16	 # tmp725, tmp724, BotIndex
	sll	$2,$2,3	 # tmp726, tmp725,
	addiu	$2,$2,20	 # tmp727, tmp726,
 # Library/Player/Pathfinding.c:859:             int drop_path_index = FindNearestDropNode(GlobalPlayer[BotIndex].position, dropNodePosition, rival_y, CourseDrops, DropLengths, (short)(AIHeader->TotalDrops), 225.0f);
	lui	$3,%hi($LC12)	 # tmp731,
	lwc1	$f0,%lo($LC12)($3)	 # tmp732,
	swc1	$f0,24($sp)	 # tmp732,
	lh	$3,28($17)		 # AIHeader_413(D)->TotalDrops, AIHeader_413(D)->TotalDrops
	sw	$3,20($sp)	 # AIHeader_413(D)->TotalDrops,
	sw	$22,16($sp)	 # DropLengths,
	move	$7,$21	 #, CourseDrops
	mfc1	$6,$f22	 #, rival_y
	addiu	$5,$sp,32	 #,,
	lui	$4,%hi(GlobalPlayer)	 # tmp729,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp728, tmp729,
	jal	FindNearestDropNode	 #
	addu	$4,$4,$2	 #, tmp728, tmp727

 # Library/Player/Pathfinding.c:860:             if (drop_path_index != -1) //crash catch
	li	$3,-1			# 0xffffffffffffffff	 # tmp734,
	beq	$2,$3,$L278	 #, drop_path_index, tmp734,
	lui	$3,%hi(AIPathfinder)	 # tmp735,

 # Library/Player/Pathfinding.c:862:                 AIPathfinder[BotIndex].LastPath = 0;
	sll	$4,$16,1	 # tmp739, BotIndex,
	addu	$4,$4,$16	 # tmp740, tmp739, BotIndex
	sll	$4,$4,2	 # tmp741, tmp740,
	subu	$4,$4,$16	 # tmp742, tmp741, BotIndex
	sll	$4,$4,2	 # tmp743, tmp742,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp736, tmp735,
	addu	$3,$3,$4	 # tmp737, tmp736, tmp743
	sh	$0,2($3)	 #, AIPathfinder[BotIndex_426(D)].LastPath
 # Library/Player/Pathfinding.c:863:                 AIPathfinder[BotIndex].TargetPath = drop_path_index;
	sh	$2,0($3)	 # drop_path_index, AIPathfinder[BotIndex_426(D)].TargetPath
 # Library/Player/Pathfinding.c:864:                 AIPathfinder[BotIndex].Progression = 0;
	sh	$0,24($3)	 #, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:865:                 AIPathfinder[BotIndex].Direction = 1;
	li	$4,1			# 0x1	 # tmp771,
	sb	$4,36($3)	 # tmp771, AIPathfinder[BotIndex_426(D)].Direction
 # Library/Player/Pathfinding.c:866:                 AIPathfinder[BotIndex].PathType = 2;
	li	$4,2			# 0x2	 # tmp781,
	sb	$4,37($3)	 # tmp781, AIPathfinder[BotIndex_426(D)].PathType
 # Library/Player/Pathfinding.c:867:                 AIPathfinder[BotIndex].NearestMarker = 0;
	sh	$0,26($3)	 #, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:868:                 AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
	sll	$2,$2,2	 # tmp800, drop_path_index,
	addu	$2,$21,$2	 # tmp801, CourseDrops, tmp800
 # Library/Player/Pathfinding.c:868:                 AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
	lw	$2,0($2)		 # *_31, *_31
 # Library/Player/Pathfinding.c:868:                 AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
	lh	$2,2($2)		 # _32->Position, _32->Position
	mtc1	$2,$f0	 # _32->Position, _32->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp804, _32->Position
	swc1	$f0,28($3)	 # tmp804, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
 # Library/Player/Pathfinding.c:869:                 AIPathfinder[BotIndex].ProgressTimer = 0;                
	b	$L278	 #
	sh	$0,32($3)	 #, AIPathfinder[BotIndex_426(D)].ProgressTimer

$L282:
 # Library/Player/Pathfinding.c:907:         switch(AIPathfinder[BotIndex].PathType)
	beq	$2,$3,$L285	 #, _35, tmp856,
	li	$3,2			# 0x2	 # tmp857,

	beq	$2,$3,$L286	 #, _35, tmp857,
	sll	$6,$20,1	 # tmp858, TargetPath,

	beq	$2,$0,$L379	 #, _35,,
	li	$2,-1			# 0xffffffffffffffff	 # tmp1095,

 # Library/Player/Pathfinding.c:979:     if (TargetPath != -1) //If bot has a valid path
	beq	$20,$2,$L306	 #, TargetPath, tmp1095,
	sll	$2,$16,1	 # tmp2027, BotIndex,

 # Library/Player/Pathfinding.c:981:         short Progression = AIPathfinder[BotIndex].Progression;
	addu	$2,$2,$16	 # tmp2028, tmp2027, BotIndex
	sll	$2,$2,2	 # tmp2029, tmp2028,
	subu	$2,$2,$16	 # tmp2030, tmp2029, BotIndex
	sll	$2,$2,2	 # tmp2031, tmp2030,
	lui	$3,%hi(AIPathfinder)	 # tmp2024,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp2032, tmp2024,
	addu	$2,$2,$3	 # tmp2025, tmp2031, tmp2032
	lh	$2,24($2)		 # Progression, AIPathfinder[BotIndex_426(D)].Progression
$L340:
 # Library/Player/Pathfinding.c:1008:         if (Progression <= 0 || Progression >= GlobalIntA) //If first or last node (start/end of path)
	blez	$2,$L341	 #, Progression,
	lui	$3,%hi(GlobalIntA)	 # tmp1096,

 # Library/Player/Pathfinding.c:1008:         if (Progression <= 0 || Progression >= GlobalIntA) //If first or last node (start/end of path)
	lw	$3,%lo(GlobalIntA)($3)		 # GlobalIntA, GlobalIntA
	slt	$3,$2,$3	 # tmp1098, Progression, GlobalIntA
	beq	$3,$0,$L342	 #, tmp1098,,
	lui	$3,%hi($LC10)	 # tmp606,

 # Library/Player/Pathfinding.c:1014:             GlobalFloatA = 3500.0;  
	lui	$3,%hi($LC11)	 # tmp608,
	b	$L307	 #
	lwc1	$f6,%lo($LC11)($3)	 # cstore_325,

$L286:
 # Library/Player/Pathfinding.c:952:                 for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
	addu	$6,$22,$6	 # _616, DropLengths, tmp858
 # Library/Player/Pathfinding.c:952:                 for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
	lh	$2,0($6)		 # *_616, *_616
	bltz	$2,$L289	 #, *_616,
	lui	$3,%hi(GlobalPlayer)	 # tmp1018,

 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	sll	$2,$16,3	 # tmp1022, BotIndex,
	subu	$2,$2,$16	 # tmp1023, tmp1022, BotIndex
	sll	$2,$2,4	 # tmp1024, tmp1023,
	subu	$2,$2,$16	 # tmp1025, tmp1024, BotIndex
	sll	$2,$2,2	 # tmp1026, tmp1025,
	subu	$2,$2,$16	 # tmp1027, tmp1026, BotIndex
	sll	$2,$2,3	 # tmp1028, tmp1027,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp1019, tmp1018,
	addu	$2,$3,$2	 # tmp1020, tmp1019, tmp1028
	lwc1	$f6,24($2)	 # _119, GlobalPlayer[BotIndex_426(D)].position
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	sll	$5,$20,2	 # tmp1029, TargetPath,
	addu	$5,$21,$5	 # _121, CourseDrops, tmp1029
 # Library/Player/Pathfinding.c:952:                 for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
	move	$3,$0	 # ThisMarker,
 # Library/Player/Pathfinding.c:886:     float CheckMarkerDistance = 99999999;
	lui	$2,%hi($LC0)	 # tmp605,
	lwc1	$f2,%lo($LC0)($2)	 # CheckMarkerDistance,
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	lui	$2,%hi($LC14)	 # tmp1036,
	ldc1	$f4,%lo($LC14)($2)	 # tmp1035,
 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	lui	$7,%hi(GlobalPlayer)	 # tmp2152,
	addiu	$7,$7,%lo(GlobalPlayer)	 # tmp2153, tmp2152,
	sll	$2,$16,3	 # tmp2154, BotIndex,
	subu	$2,$2,$16	 # tmp2155, tmp2154, BotIndex
	sll	$2,$2,4	 # tmp2156, tmp2155,
	subu	$2,$2,$16	 # tmp2157, tmp2156, BotIndex
	sll	$2,$2,2	 # tmp2158, tmp2157,
	subu	$2,$2,$16	 # tmp2159, tmp2158, BotIndex
	sll	$2,$2,3	 # tmp2160, tmp2159,
	addu	$7,$7,$2	 # tmp2161, tmp2153, tmp2160
 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	lui	$9,%hi(GlobalFloatA)	 # tmp2162,
 # Library/Player/Pathfinding.c:961:                             AIPathfinder[BotIndex].NearestMarker = ThisMarker;
	lui	$8,%hi(AIPathfinder)	 # tmp2163,
	addiu	$8,$8,%lo(AIPathfinder)	 # tmp2164, tmp2163,
	sll	$2,$16,1	 # tmp2165, BotIndex,
	addu	$2,$2,$16	 # tmp2166, tmp2165, BotIndex
	sll	$2,$2,2	 # tmp2167, tmp2166,
	subu	$2,$2,$16	 # tmp2168, tmp2167, BotIndex
	sll	$2,$2,2	 # tmp2169, tmp2168,
	b	$L304	 #
	addu	$8,$8,$2	 # tmp2170, tmp2164, tmp2169

$L285:
 # Library/Player/Pathfinding.c:932:                 for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
	sll	$6,$20,1	 # tmp860, TargetPath,
	addu	$6,$23,$6	 # _608, RampLengths, tmp860
 # Library/Player/Pathfinding.c:932:                 for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
	lh	$2,0($6)		 # *_608, *_608
	bltz	$2,$L291	 #, *_608,
	lui	$3,%hi(GlobalPlayer)	 # tmp941,

 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	sll	$2,$16,3	 # tmp945, BotIndex,
	subu	$2,$2,$16	 # tmp946, tmp945, BotIndex
	sll	$2,$2,4	 # tmp947, tmp946,
	subu	$2,$2,$16	 # tmp948, tmp947, BotIndex
	sll	$2,$2,2	 # tmp949, tmp948,
	subu	$2,$2,$16	 # tmp950, tmp949, BotIndex
	sll	$2,$2,3	 # tmp951, tmp950,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp942, tmp941,
	addu	$2,$3,$2	 # tmp943, tmp942, tmp951
	lwc1	$f6,24($2)	 # _79, GlobalPlayer[BotIndex_426(D)].position
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	sll	$5,$20,2	 # tmp952, TargetPath,
	addu	$5,$fp,$5	 # _81, CourseRamps, tmp952
 # Library/Player/Pathfinding.c:932:                 for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
	move	$3,$0	 # ThisMarker,
 # Library/Player/Pathfinding.c:886:     float CheckMarkerDistance = 99999999;
	lui	$2,%hi($LC0)	 # tmp604,
	lwc1	$f2,%lo($LC0)($2)	 # CheckMarkerDistance,
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	lui	$2,%hi($LC14)	 # tmp959,
	ldc1	$f4,%lo($LC14)($2)	 # tmp958,
 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	lui	$7,%hi(GlobalPlayer)	 # tmp2171,
	addiu	$7,$7,%lo(GlobalPlayer)	 # tmp2172, tmp2171,
	sll	$2,$16,3	 # tmp2173, BotIndex,
	subu	$2,$2,$16	 # tmp2174, tmp2173, BotIndex
	sll	$2,$2,4	 # tmp2175, tmp2174,
	subu	$2,$2,$16	 # tmp2176, tmp2175, BotIndex
	sll	$2,$2,2	 # tmp2177, tmp2176,
	subu	$2,$2,$16	 # tmp2178, tmp2177, BotIndex
	sll	$2,$2,3	 # tmp2179, tmp2178,
	addu	$7,$7,$2	 # tmp2180, tmp2172, tmp2179
 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	lui	$9,%hi(GlobalFloatA)	 # tmp2181,
 # Library/Player/Pathfinding.c:941:                             AIPathfinder[BotIndex].NearestMarker = ThisMarker;
	lui	$8,%hi(AIPathfinder)	 # tmp2182,
	addiu	$8,$8,%lo(AIPathfinder)	 # tmp2183, tmp2182,
	sll	$2,$16,1	 # tmp2184, BotIndex,
	addu	$2,$2,$16	 # tmp2185, tmp2184, BotIndex
	sll	$2,$2,2	 # tmp2186, tmp2185,
	subu	$2,$2,$16	 # tmp2187, tmp2186, BotIndex
	sll	$2,$2,2	 # tmp2188, tmp2187,
	b	$L300	 #
	addu	$8,$8,$2	 # tmp2189, tmp2183, tmp2188

$L379:
 # Library/Player/Pathfinding.c:913:                 for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
	addu	$6,$18,$6	 # _600, PathLengths, tmp862
 # Library/Player/Pathfinding.c:913:                 for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
	lh	$2,0($6)		 # *_600, *_600
	bltz	$2,$L292	 #, *_600,
	lui	$3,%hi(GlobalPlayer)	 # tmp864,

 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	sll	$2,$16,3	 # tmp868, BotIndex,
	subu	$2,$2,$16	 # tmp869, tmp868, BotIndex
	sll	$2,$2,4	 # tmp870, tmp869,
	subu	$2,$2,$16	 # tmp871, tmp870, BotIndex
	sll	$2,$2,2	 # tmp872, tmp871,
	subu	$2,$2,$16	 # tmp873, tmp872, BotIndex
	sll	$2,$2,3	 # tmp874, tmp873,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp865, tmp864,
	addu	$2,$3,$2	 # tmp866, tmp865, tmp874
	lwc1	$f6,24($2)	 # _39, GlobalPlayer[BotIndex_426(D)].position
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	sll	$5,$20,2	 # tmp875, TargetPath,
	addu	$5,$19,$5	 # _41, CoursePaths, tmp875
 # Library/Player/Pathfinding.c:913:                 for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
	move	$3,$0	 # ThisMarker,
 # Library/Player/Pathfinding.c:886:     float CheckMarkerDistance = 99999999;
	lui	$2,%hi($LC0)	 # tmp603,
	lwc1	$f2,%lo($LC0)($2)	 # CheckMarkerDistance,
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	lui	$2,%hi($LC13)	 # tmp882,
	ldc1	$f4,%lo($LC13)($2)	 # tmp881,
 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	lui	$7,%hi(GlobalPlayer)	 # tmp2133,
	addiu	$7,$7,%lo(GlobalPlayer)	 # tmp2134, tmp2133,
	sll	$2,$16,3	 # tmp2135, BotIndex,
	subu	$2,$2,$16	 # tmp2136, tmp2135, BotIndex
	sll	$2,$2,4	 # tmp2137, tmp2136,
	subu	$2,$2,$16	 # tmp2138, tmp2137, BotIndex
	sll	$2,$2,2	 # tmp2139, tmp2138,
	subu	$2,$2,$16	 # tmp2140, tmp2139, BotIndex
	sll	$2,$2,3	 # tmp2141, tmp2140,
	addu	$7,$7,$2	 # tmp2142, tmp2134, tmp2141
 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	lui	$9,%hi(GlobalFloatA)	 # tmp2143,
 # Library/Player/Pathfinding.c:922:                             AIPathfinder[BotIndex].NearestMarker = ThisMarker;
	lui	$8,%hi(AIPathfinder)	 # tmp2144,
	addiu	$8,$8,%lo(AIPathfinder)	 # tmp2145, tmp2144,
	sll	$2,$16,1	 # tmp2146, BotIndex,
	addu	$2,$2,$16	 # tmp2147, tmp2146, BotIndex
	sll	$2,$2,2	 # tmp2148, tmp2147,
	subu	$2,$2,$16	 # tmp2149, tmp2148, BotIndex
	sll	$2,$2,2	 # tmp2150, tmp2149,
	b	$L296	 #
	addu	$8,$8,$2	 # tmp2151, tmp2145, tmp2150

$L293:
 # Library/Player/Pathfinding.c:913:                 for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
	addiu	$3,$3,1	 # ThisMarker, ThisMarker,
$L381:
 # Library/Player/Pathfinding.c:913:                 for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
	lh	$2,0($6)		 # *_600, *_600
 # Library/Player/Pathfinding.c:913:                 for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
	slt	$2,$2,$3	 # tmp940, *_600, ThisMarker
	bne	$2,$0,$L380	 #, tmp940,,
	sll	$2,$16,1	 # tmp2036, BotIndex,

$L296:
	sll	$4,$3,3	 # _628, ThisMarker,
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	lw	$2,0($5)		 # *_41, *_41
	addu	$2,$2,$4	 # _45, *_41, _628
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	lh	$10,2($2)		 # _45->Position, _45->Position
	mtc1	$10,$f0	 # _45->Position, _45->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp877, _45->Position
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	sub.s	$f0,$f6,$f0	 # tmp879, _39, tmp877
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	cvt.d.s	$f0,$f0	 # _49, tmp879
	mul.d	$f0,$f0,$f0	 # tmp880, _49, _49
 # Library/Player/Pathfinding.c:915:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
	c.lt.d	$f0,$f4	 #, tmp880, tmp881
	nop	
	bc1fl	$L381	 #,,
	addiu	$3,$3,1	 # ThisMarker, ThisMarker,

 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	lh	$10,0($2)		 # _45->Position, _45->Position
	mtc1	$10,$f0	 # _45->Position, _45->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp894, _45->Position
 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	lwc1	$f8,20($7)	 # GlobalPlayer[BotIndex_426(D)].position, GlobalPlayer[BotIndex_426(D)].position
	sub.s	$f0,$f8,$f0	 # tmp896, GlobalPlayer[BotIndex_426(D)].position, tmp894
 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	cvt.d.s	$f0,$f0	 # _57, tmp896
 # Library/Player/Pathfinding.c:918:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CoursePaths[TargetPath][ThisMarker].Position[2], 2)   ;
	lh	$2,4($2)		 # _45->Position, _45->Position
	mtc1	$2,$f8	 # _45->Position, _45->Position
	nop	
	cvt.s.w	$f8,$f8	 # tmp909, _45->Position
 # Library/Player/Pathfinding.c:918:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CoursePaths[TargetPath][ThisMarker].Position[2], 2)   ;
	lwc1	$f10,28($7)	 # GlobalPlayer[BotIndex_426(D)].position, GlobalPlayer[BotIndex_426(D)].position
	sub.s	$f8,$f10,$f8	 # tmp911, GlobalPlayer[BotIndex_426(D)].position, tmp909
 # Library/Player/Pathfinding.c:918:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CoursePaths[TargetPath][ThisMarker].Position[2], 2)   ;
	cvt.d.s	$f8,$f8	 # _65, tmp911
 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	mul.d	$f0,$f0,$f0	 # tmp913, _57, _57
 # Library/Player/Pathfinding.c:918:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CoursePaths[TargetPath][ThisMarker].Position[2], 2)   ;
	mul.d	$f8,$f8,$f8	 # tmp914, _65, _65
 # Library/Player/Pathfinding.c:917:                         GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
	add.d	$f0,$f0,$f8	 # tmp915, tmp913, tmp914
	cvt.s.d	$f0,$f0	 # _68, tmp915
 # Library/Player/Pathfinding.c:919:                         if (GlobalFloatA < CheckMarkerDistance)
	c.lt.s	$f0,$f2	 #, _68, CheckMarkerDistance
	nop	
	bc1f	$L293	 #,,
	swc1	$f0,%lo(GlobalFloatA)($9)	 # _68, GlobalFloatA

 # Library/Player/Pathfinding.c:922:                             AIPathfinder[BotIndex].NearestMarker = ThisMarker;
	sh	$3,26($8)	 # ThisMarker, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:923:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CoursePaths[TargetPath][ThisMarker].Position[1];
	lw	$2,0($5)		 # *_41, *_41
	addu	$4,$2,$4	 # tmp936, *_41, _628
 # Library/Player/Pathfinding.c:923:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CoursePaths[TargetPath][ThisMarker].Position[1];
	lh	$2,2($4)		 # _71->Position, _71->Position
	mtc1	$2,$f2	 # _71->Position, _71->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp938, _71->Position
	swc1	$f2,28($8)	 # tmp938, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
 # Library/Player/Pathfinding.c:921:                             CheckMarkerDistance = GlobalFloatA;
	b	$L293	 #
	mov.s	$f2,$f0	 # CheckMarkerDistance, _68

$L297:
 # Library/Player/Pathfinding.c:932:                 for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
	addiu	$3,$3,1	 # ThisMarker, ThisMarker,
$L383:
 # Library/Player/Pathfinding.c:932:                 for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
	lh	$2,0($6)		 # *_608, *_608
 # Library/Player/Pathfinding.c:932:                 for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
	slt	$2,$2,$3	 # tmp1017, *_608, ThisMarker
	bne	$2,$0,$L382	 #, tmp1017,,
	sll	$2,$16,1	 # tmp2067, BotIndex,

$L300:
	sll	$4,$3,3	 # _138, ThisMarker,
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	lw	$2,0($5)		 # *_81, *_81
	addu	$2,$2,$4	 # _85, *_81, _138
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	lh	$10,2($2)		 # _85->Position, _85->Position
	mtc1	$10,$f0	 # _85->Position, _85->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp954, _85->Position
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	sub.s	$f0,$f6,$f0	 # tmp956, _79, tmp954
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	cvt.d.s	$f0,$f0	 # _89, tmp956
	mul.d	$f0,$f0,$f0	 # tmp957, _89, _89
 # Library/Player/Pathfinding.c:934:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	c.lt.d	$f0,$f4	 #, tmp957, tmp958
	nop	
	bc1fl	$L383	 #,,
	addiu	$3,$3,1	 # ThisMarker, ThisMarker,

 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	lh	$10,0($2)		 # _85->Position, _85->Position
	mtc1	$10,$f0	 # _85->Position, _85->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp971, _85->Position
 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	lwc1	$f8,20($7)	 # GlobalPlayer[BotIndex_426(D)].position, GlobalPlayer[BotIndex_426(D)].position
	sub.s	$f0,$f8,$f0	 # tmp973, GlobalPlayer[BotIndex_426(D)].position, tmp971
 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	cvt.d.s	$f0,$f0	 # _97, tmp973
 # Library/Player/Pathfinding.c:937:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseRamps[TargetPath][ThisMarker].Position[2], 2)   ;
	lh	$2,4($2)		 # _85->Position, _85->Position
	mtc1	$2,$f8	 # _85->Position, _85->Position
	nop	
	cvt.s.w	$f8,$f8	 # tmp986, _85->Position
 # Library/Player/Pathfinding.c:937:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseRamps[TargetPath][ThisMarker].Position[2], 2)   ;
	lwc1	$f10,28($7)	 # GlobalPlayer[BotIndex_426(D)].position, GlobalPlayer[BotIndex_426(D)].position
	sub.s	$f8,$f10,$f8	 # tmp988, GlobalPlayer[BotIndex_426(D)].position, tmp986
 # Library/Player/Pathfinding.c:937:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseRamps[TargetPath][ThisMarker].Position[2], 2)   ;
	cvt.d.s	$f8,$f8	 # _105, tmp988
 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	mul.d	$f0,$f0,$f0	 # tmp990, _97, _97
 # Library/Player/Pathfinding.c:937:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseRamps[TargetPath][ThisMarker].Position[2], 2)   ;
	mul.d	$f8,$f8,$f8	 # tmp991, _105, _105
 # Library/Player/Pathfinding.c:936:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
	add.d	$f0,$f0,$f8	 # tmp992, tmp990, tmp991
	cvt.s.d	$f0,$f0	 # _108, tmp992
 # Library/Player/Pathfinding.c:938:                         if (GlobalFloatA < CheckMarkerDistance)
	c.lt.s	$f0,$f2	 #, _108, CheckMarkerDistance
	nop	
	bc1f	$L297	 #,,
	swc1	$f0,%lo(GlobalFloatA)($9)	 # _108, GlobalFloatA

 # Library/Player/Pathfinding.c:941:                             AIPathfinder[BotIndex].NearestMarker = ThisMarker;
	sh	$3,26($8)	 # ThisMarker, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:942:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[TargetPath][ThisMarker].Position[1];
	lw	$2,0($5)		 # *_81, *_81
	addu	$4,$2,$4	 # tmp1013, *_81, _138
 # Library/Player/Pathfinding.c:942:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[TargetPath][ThisMarker].Position[1];
	lh	$2,2($4)		 # _111->Position, _111->Position
	mtc1	$2,$f2	 # _111->Position, _111->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp1015, _111->Position
	swc1	$f2,28($8)	 # tmp1015, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
 # Library/Player/Pathfinding.c:940:                             CheckMarkerDistance = GlobalFloatA;
	b	$L297	 #
	mov.s	$f2,$f0	 # CheckMarkerDistance, _108

$L301:
 # Library/Player/Pathfinding.c:952:                 for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
	addiu	$3,$3,1	 # ThisMarker, ThisMarker,
$L385:
 # Library/Player/Pathfinding.c:952:                 for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
	lh	$2,0($6)		 # *_616, *_616
 # Library/Player/Pathfinding.c:952:                 for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
	slt	$2,$2,$3	 # tmp1094, *_616, ThisMarker
	bne	$2,$0,$L384	 #, tmp1094,,
	sll	$2,$16,1	 # tmp2098, BotIndex,

$L304:
	sll	$4,$3,3	 # _228, ThisMarker,
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	lw	$2,0($5)		 # *_121, *_121
	addu	$2,$2,$4	 # _125, *_121, _228
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	lh	$10,2($2)		 # _125->Position, _125->Position
	mtc1	$10,$f0	 # _125->Position, _125->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp1031, _125->Position
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	sub.s	$f0,$f6,$f0	 # tmp1033, _119, tmp1031
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	cvt.d.s	$f0,$f0	 # _129, tmp1033
	mul.d	$f0,$f0,$f0	 # tmp1034, _129, _129
 # Library/Player/Pathfinding.c:954:                     if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
	c.lt.d	$f0,$f4	 #, tmp1034, tmp1035
	nop	
	bc1fl	$L385	 #,,
	addiu	$3,$3,1	 # ThisMarker, ThisMarker,

 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	lh	$10,0($2)		 # _125->Position, _125->Position
	mtc1	$10,$f0	 # _125->Position, _125->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp1048, _125->Position
 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	lwc1	$f8,20($7)	 # GlobalPlayer[BotIndex_426(D)].position, GlobalPlayer[BotIndex_426(D)].position
	sub.s	$f0,$f8,$f0	 # tmp1050, GlobalPlayer[BotIndex_426(D)].position, tmp1048
 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	cvt.d.s	$f0,$f0	 # _137, tmp1050
 # Library/Player/Pathfinding.c:957:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseDrops[TargetPath][ThisMarker].Position[2], 2);
	lh	$2,4($2)		 # _125->Position, _125->Position
	mtc1	$2,$f8	 # _125->Position, _125->Position
	nop	
	cvt.s.w	$f8,$f8	 # tmp1063, _125->Position
 # Library/Player/Pathfinding.c:957:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseDrops[TargetPath][ThisMarker].Position[2], 2);
	lwc1	$f10,28($7)	 # GlobalPlayer[BotIndex_426(D)].position, GlobalPlayer[BotIndex_426(D)].position
	sub.s	$f8,$f10,$f8	 # tmp1065, GlobalPlayer[BotIndex_426(D)].position, tmp1063
 # Library/Player/Pathfinding.c:957:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseDrops[TargetPath][ThisMarker].Position[2], 2);
	cvt.d.s	$f8,$f8	 # _145, tmp1065
 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	mul.d	$f0,$f0,$f0	 # tmp1067, _137, _137
 # Library/Player/Pathfinding.c:957:                                         pow(GlobalPlayer[BotIndex].position[2] - (float)CourseDrops[TargetPath][ThisMarker].Position[2], 2);
	mul.d	$f8,$f8,$f8	 # tmp1068, _145, _145
 # Library/Player/Pathfinding.c:956:                         GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
	add.d	$f0,$f0,$f8	 # tmp1069, tmp1067, tmp1068
	cvt.s.d	$f0,$f0	 # _148, tmp1069
 # Library/Player/Pathfinding.c:958:                         if (GlobalFloatA < CheckMarkerDistance)
	c.lt.s	$f0,$f2	 #, _148, CheckMarkerDistance
	nop	
	bc1f	$L301	 #,,
	swc1	$f0,%lo(GlobalFloatA)($9)	 # _148, GlobalFloatA

 # Library/Player/Pathfinding.c:961:                             AIPathfinder[BotIndex].NearestMarker = ThisMarker;
	sh	$3,26($8)	 # ThisMarker, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:962:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[TargetPath][ThisMarker].Position[1];
	lw	$2,0($5)		 # *_121, *_121
	addu	$4,$2,$4	 # tmp1090, *_121, _228
 # Library/Player/Pathfinding.c:962:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[TargetPath][ThisMarker].Position[1];
	lh	$2,2($4)		 # _151->Position, _151->Position
	mtc1	$2,$f2	 # _151->Position, _151->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp1092, _151->Position
	swc1	$f2,28($8)	 # tmp1092, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
 # Library/Player/Pathfinding.c:960:                             CheckMarkerDistance = GlobalFloatA;
	b	$L301	 #
	mov.s	$f2,$f0	 # CheckMarkerDistance, _148

$L341:
 # Library/Player/Pathfinding.c:1010:             GlobalFloatA = 5000.0;  
	lui	$3,%hi($LC10)	 # tmp607,
	lwc1	$f6,%lo($LC10)($3)	 # cstore_325,
$L307:
	lui	$3,%hi(GlobalFloatA)	 # tmp1099,
	swc1	$f6,%lo(GlobalFloatA)($3)	 # cstore_325, GlobalFloatA
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	lui	$3,%hi(objectPosition)	 # tmp1100,
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	lwc1	$f0,%lo(objectPosition)($3)	 # objectPosition, objectPosition
	sub.s	$f0,$f24,$f0	 # tmp1101, bot_x, objectPosition
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	cvt.d.s	$f0,$f0	 # _227, tmp1101
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	addiu	$3,$3,%lo(objectPosition)	 # tmp1104, tmp1100,
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	lwc1	$f4,4($3)	 # objectPosition, objectPosition
	sub.s	$f4,$f20,$f4	 # tmp1105, bot_y, objectPosition
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	cvt.d.s	$f4,$f4	 # _231, tmp1105
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	lwc1	$f2,8($3)	 # objectPosition, objectPosition
	sub.s	$f2,$f26,$f2	 # tmp1109, bot_z, objectPosition
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	cvt.d.s	$f2,$f2	 # _236, tmp1109
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	mul.d	$f0,$f0,$f0	 # tmp1111, _227, _227
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	mul.d	$f4,$f4,$f4	 # tmp1112, _231, _231
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	add.d	$f0,$f0,$f4	 # tmp1113, tmp1111, tmp1112
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	mul.d	$f2,$f2,$f2	 # tmp1114, _236, _236
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	add.d	$f0,$f0,$f2	 # tmp1115, tmp1113, tmp1114
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	cvt.d.s	$f6,$f6	 # tmp1116, cstore_325
 # Library/Player/Pathfinding.c:1020:         if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
	c.lt.d	$f0,$f6	 #, tmp1115, tmp1116
	nop	
	bc1fl	$L361	 #,,
	sll	$2,$16,1	 # tmp1150, BotIndex,

 # Library/Player/Pathfinding.c:1022:             AIPathfinder[BotIndex].Progression += AIPathfinder[BotIndex].Direction;
	sll	$3,$16,1	 # tmp1120, BotIndex,
	addu	$3,$3,$16	 # tmp1121, tmp1120, BotIndex
	sll	$3,$3,2	 # tmp1122, tmp1121,
	subu	$3,$3,$16	 # tmp1123, tmp1122, BotIndex
	sll	$3,$3,2	 # tmp1124, tmp1123,
	lui	$4,%hi(AIPathfinder)	 # tmp1117,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp1125, tmp1117,
	addu	$3,$3,$4	 # tmp1118, tmp1124, tmp1125
 # Library/Player/Pathfinding.c:1022:             AIPathfinder[BotIndex].Progression += AIPathfinder[BotIndex].Direction;
	lb	$4,36($3)		 # AIPathfinder[BotIndex_426(D)].Direction, AIPathfinder[BotIndex_426(D)].Direction
 # Library/Player/Pathfinding.c:1022:             AIPathfinder[BotIndex].Progression += AIPathfinder[BotIndex].Direction;
	addu	$2,$2,$4	 # tmp1137, Progression, AIPathfinder[BotIndex_426(D)].Direction
	sh	$2,24($3)	 # tmp1137, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:1023:             AIPathfinder[BotIndex].ProgressTimer = 0;
	sh	$0,32($3)	 #, AIPathfinder[BotIndex_426(D)].ProgressTimer
$L310:
 # Library/Player/Pathfinding.c:1031:         if (AIPathfinder[BotIndex].Progression > GlobalIntA)
	sll	$2,$16,1	 # tmp1170, BotIndex,
	addu	$2,$2,$16	 # tmp1171, tmp1170, BotIndex
	sll	$2,$2,2	 # tmp1172, tmp1171,
	subu	$2,$2,$16	 # tmp1173, tmp1172, BotIndex
	sll	$2,$2,2	 # tmp1174, tmp1173,
	lui	$3,%hi(AIPathfinder)	 # tmp1167,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1175, tmp1167,
	addu	$2,$2,$3	 # tmp1168, tmp1174, tmp1175
	lh	$2,24($2)		 # _251, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:1031:         if (AIPathfinder[BotIndex].Progression > GlobalIntA)
	lui	$3,%hi(GlobalIntA)	 # tmp1176,
	lw	$3,%lo(GlobalIntA)($3)		 # GlobalIntA.74_253, GlobalIntA
 # Library/Player/Pathfinding.c:1031:         if (AIPathfinder[BotIndex].Progression > GlobalIntA)
	slt	$4,$3,$2	 # tmp1177, GlobalIntA.74_253, _251
	beq	$4,$0,$L311	 #, tmp1177,,
	lui	$4,%hi(AIPathfinder)	 # tmp1178,

 # Library/Player/Pathfinding.c:1033:             AIPathfinder[BotIndex].Progression = GlobalIntA;
	sll	$2,$16,1	 # tmp1181, BotIndex,
	addu	$2,$2,$16	 # tmp1182, tmp1181, BotIndex
	sll	$2,$2,2	 # tmp1183, tmp1182,
	subu	$2,$2,$16	 # tmp1184, tmp1183, BotIndex
	sll	$2,$2,2	 # tmp1185, tmp1184,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp1186, tmp1178,
	addu	$2,$2,$4	 # tmp1179, tmp1185, tmp1186
	sh	$3,24($2)	 # GlobalIntA.74_253, AIPathfinder[BotIndex_426(D)].Progression
$L312:
 # Library/Player/Pathfinding.c:1043:         if (AIPathfinder[BotIndex].Direction > 0)
	lui	$3,%hi(AIPathfinder)	 # tmp1196,
$L387:
	sll	$2,$16,1	 # tmp1200, BotIndex,
	addu	$2,$2,$16	 # tmp1201, tmp1200, BotIndex
	sll	$2,$2,2	 # tmp1202, tmp1201,
	subu	$2,$2,$16	 # tmp1203, tmp1202, BotIndex
	sll	$2,$2,2	 # tmp1204, tmp1203,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1197, tmp1196,
	addu	$2,$3,$2	 # tmp1198, tmp1197, tmp1204
 # Library/Player/Pathfinding.c:1043:         if (AIPathfinder[BotIndex].Direction > 0)
	lb	$2,36($2)		 # AIPathfinder[BotIndex_426(D)].Direction, AIPathfinder[BotIndex_426(D)].Direction
	blez	$2,$L313	 #, AIPathfinder[BotIndex_426(D)].Direction,
	lui	$3,%hi(AIPathfinder)	 # tmp1206,

 # Library/Player/Pathfinding.c:1045:             if (AIPathfinder[BotIndex].NearestMarker > AIPathfinder[BotIndex].Progression)
	sll	$2,$16,1	 # tmp1210, BotIndex,
	addu	$2,$2,$16	 # tmp1211, tmp1210, BotIndex
	sll	$2,$2,2	 # tmp1212, tmp1211,
	subu	$2,$2,$16	 # tmp1213, tmp1212, BotIndex
	sll	$2,$2,2	 # tmp1214, tmp1213,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1207, tmp1206,
	addu	$2,$3,$2	 # tmp1208, tmp1207, tmp1214
	lh	$3,26($2)		 # _256, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:1045:             if (AIPathfinder[BotIndex].NearestMarker > AIPathfinder[BotIndex].Progression)
	lh	$2,24($2)		 # AIPathfinder[BotIndex_426(D)].Progression, AIPathfinder[BotIndex_426(D)].Progression
	slt	$2,$2,$3	 # tmp1225, AIPathfinder[BotIndex_426(D)].Progression, _256
	beql	$2,$0,$L386	 #, tmp1225,,
	lui	$3,%hi(AIPathfinder)	 # tmp1264,

 # Library/Player/Pathfinding.c:1047:                 AIPathfinder[BotIndex].Progression = AIPathfinder[BotIndex].NearestMarker;
	sll	$2,$16,1	 # tmp1229, BotIndex,
	addu	$2,$2,$16	 # tmp1230, tmp1229, BotIndex
	sll	$2,$2,2	 # tmp1231, tmp1230,
	subu	$2,$2,$16	 # tmp1232, tmp1231, BotIndex
	sll	$2,$2,2	 # tmp1233, tmp1232,
	lui	$4,%hi(AIPathfinder)	 # tmp1226,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp1234, tmp1226,
	addu	$2,$2,$4	 # tmp1227, tmp1233, tmp1234
	b	$L314	 #
	sh	$3,24($2)	 # _256, AIPathfinder[BotIndex_426(D)].Progression

$L342:
 # Library/Player/Pathfinding.c:1010:             GlobalFloatA = 5000.0;  
	b	$L307	 #
	lwc1	$f6,%lo($LC10)($3)	 # cstore_325,

$L361:
 # Library/Player/Pathfinding.c:1027:             AIPathfinder[BotIndex].ProgressTimer++;
	addu	$2,$2,$16	 # tmp1151, tmp1150, BotIndex
	sll	$2,$2,2	 # tmp1152, tmp1151,
	subu	$2,$2,$16	 # tmp1153, tmp1152, BotIndex
	sll	$2,$2,2	 # tmp1154, tmp1153,
	lui	$3,%hi(AIPathfinder)	 # tmp1147,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1155, tmp1147,
	addu	$2,$2,$3	 # tmp1148, tmp1154, tmp1155
	lhu	$3,32($2)	 #, AIPathfinder[BotIndex_426(D)].ProgressTimer
	addiu	$3,$3,1	 # tmp1166, AIPathfinder[BotIndex_426(D)].ProgressTimer,
	b	$L310	 #
	sh	$3,32($2)	 # tmp1166, AIPathfinder[BotIndex_426(D)].ProgressTimer

$L311:
 # Library/Player/Pathfinding.c:1035:         else if (AIPathfinder[BotIndex].Progression < 0)
	bgez	$2,$L387	 #, _251,
	lui	$3,%hi(AIPathfinder)	 # tmp1196,

 # Library/Player/Pathfinding.c:1037:             AIPathfinder[BotIndex].Progression = 0;
	sll	$2,$16,1	 # tmp1190, BotIndex,
	addu	$2,$2,$16	 # tmp1191, tmp1190, BotIndex
	sll	$2,$2,2	 # tmp1192, tmp1191,
	subu	$2,$2,$16	 # tmp1193, tmp1192, BotIndex
	sll	$2,$2,2	 # tmp1194, tmp1193,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1195, tmp1187,
	addu	$2,$2,$3	 # tmp1188, tmp1194, tmp1195
	b	$L312	 #
	sh	$0,24($2)	 #, AIPathfinder[BotIndex_426(D)].Progression

$L313:
 # Library/Player/Pathfinding.c:1052:             if (AIPathfinder[BotIndex].NearestMarker < AIPathfinder[BotIndex].Progression)
	sll	$2,$16,1	 # tmp1239, BotIndex,
	addu	$2,$2,$16	 # tmp1240, tmp1239, BotIndex
	sll	$2,$2,2	 # tmp1241, tmp1240,
	subu	$2,$2,$16	 # tmp1242, tmp1241, BotIndex
	sll	$2,$2,2	 # tmp1243, tmp1242,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1236, tmp1235,
	addu	$2,$3,$2	 # tmp1237, tmp1236, tmp1243
	lh	$3,26($2)		 # _258, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:1052:             if (AIPathfinder[BotIndex].NearestMarker < AIPathfinder[BotIndex].Progression)
	lh	$2,24($2)		 # AIPathfinder[BotIndex_426(D)].Progression, AIPathfinder[BotIndex_426(D)].Progression
	slt	$2,$3,$2	 # tmp1254, _258, AIPathfinder[BotIndex_426(D)].Progression
	beql	$2,$0,$L386	 #, tmp1254,,
	lui	$3,%hi(AIPathfinder)	 # tmp1264,

 # Library/Player/Pathfinding.c:1054:                 AIPathfinder[BotIndex].Progression = AIPathfinder[BotIndex].NearestMarker;
	sll	$2,$16,1	 # tmp1258, BotIndex,
	addu	$2,$2,$16	 # tmp1259, tmp1258, BotIndex
	sll	$2,$2,2	 # tmp1260, tmp1259,
	subu	$2,$2,$16	 # tmp1261, tmp1260, BotIndex
	sll	$2,$2,2	 # tmp1262, tmp1261,
	lui	$4,%hi(AIPathfinder)	 # tmp1255,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp1263, tmp1255,
	addu	$2,$2,$4	 # tmp1256, tmp1262, tmp1263
	b	$L314	 #
	sh	$3,24($2)	 # _258, AIPathfinder[BotIndex_426(D)].Progression

$L368:
 # Library/Player/Pathfinding.c:1078:             if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
	addu	$2,$2,$16	 # tmp1277, tmp1276, BotIndex
	sll	$2,$2,2	 # tmp1278, tmp1277,
	subu	$2,$2,$16	 # tmp1279, tmp1278, BotIndex
	sll	$2,$2,2	 # tmp1280, tmp1279,
	lui	$3,%hi(AIPathfinder)	 # tmp1282,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1281, tmp1282,
	addu	$2,$3,$2	 # _261, tmp1281, tmp1280
	sw	$2,56($sp)	 # _261, %sfp
	move	$7,$22	 #, DropLengths
	move	$6,$23	 #, RampLengths
	move	$5,$18	 #, PathLengths
	jal	PathfinderComplete	 #
	move	$4,$2	 #, _261

 # Library/Player/Pathfinding.c:1078:             if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
	beq	$2,$0,$L374	 #, tmp2199,,
	sll	$2,$16,1	 # tmp1897, BotIndex,

 # Library/Player/Pathfinding.c:1073:     float diff_y = rival_y - bot_y;
	sub.s	$f0,$f22,$f20	 # diff_y, rival_y, bot_y
 # Library/Player/Pathfinding.c:1080:                 if ((diff_y >= 225.0f) && ((AIHeader->TotalRamps) > 0)) //If target is above bot and ramps exist, look for ramps
	lui	$2,%hi($LC12)	 # tmp1285,
	lwc1	$f2,%lo($LC12)($2)	 # tmp1284,
	c.le.s	$f2,$f0	 #, tmp1284, diff_y
	nop	
	bc1f	$L362	 #,,
	lui	$2,%hi($LC16)	 # tmp1448,

 # Library/Player/Pathfinding.c:1080:                 if ((diff_y >= 225.0f) && ((AIHeader->TotalRamps) > 0)) //If target is above bot and ramps exist, look for ramps
	lhu	$3,26($17)	 # _263, AIHeader_413(D)->TotalRamps
 # Library/Player/Pathfinding.c:1080:                 if ((diff_y >= 225.0f) && ((AIHeader->TotalRamps) > 0)) //If target is above bot and ramps exist, look for ramps
	bnel	$3,$0,$L373	 #, _263,,
	sw	$0,32($sp)	 #, MEM[(float[3] *)_130]

 # Library/Player/Pathfinding.c:1117:                 else if ( (diff_y <= -225.0f) && ((AIHeader->TotalRamps) > 0 || ((AIHeader->TotalDrops) > 0)) ) //If target is below bot and ramps or drops exist, look for ramps and drops
	lwc1	$f2,%lo($LC16)($2)	 # tmp2022,
	c.le.s	$f0,$f2	 #, diff_y, tmp2022
	nop	
	bc1f	$L388	 #,,
	lui	$3,%hi(AIPathfinder)	 # tmp1784,

 # Library/Player/Pathfinding.c:1117:                 else if ( (diff_y <= -225.0f) && ((AIHeader->TotalRamps) > 0 || ((AIHeader->TotalDrops) > 0)) ) //If target is below bot and ramps or drops exist, look for ramps and drops
	lhu	$2,28($17)	 # AIHeader_413(D)->TotalDrops, AIHeader_413(D)->TotalDrops
$L375:
	beq	$2,$0,$L388	 #, AIHeader_413(D)->TotalDrops,,
	lui	$3,%hi(AIPathfinder)	 # tmp1784,

	move	$3,$0	 # _288,
 # Library/Player/Pathfinding.c:1120:                     float rampNodePosition[] = {0.,0.,0.};
	sw	$0,44($sp)	 #, rampNodePosition
$L390:
	sw	$0,48($sp)	 #, rampNodePosition
	sw	$0,52($sp)	 #, rampNodePosition
 # Library/Player/Pathfinding.c:1121:                     float dropNodePosition[] = {0.,0.,0.};
	sw	$0,32($sp)	 #, MEM[(float[3] *)_130]
	sw	$0,36($sp)	 #, MEM[(float[3] *)_130]
	sw	$0,40($sp)	 #, MEM[(float[3] *)_130]
 # Library/Player/Pathfinding.c:1123:                     int ramp_path_index = FindNearestRampNode(GlobalPlayer[BotIndex].position, rampNodePosition, rival_y, CourseRamps, RampLengths, (AIHeader->TotalRamps), 225.0f);
	sll	$2,$16,3	 # tmp1451, BotIndex,
	subu	$2,$2,$16	 # tmp1452, tmp1451, BotIndex
	sll	$2,$2,4	 # tmp1453, tmp1452,
	subu	$2,$2,$16	 # tmp1454, tmp1453, BotIndex
	sll	$2,$2,2	 # tmp1455, tmp1454,
	subu	$2,$2,$16	 # tmp1456, tmp1455, BotIndex
	sll	$2,$2,3	 # tmp1457, tmp1456,
	addiu	$2,$2,20	 # tmp1458, tmp1457,
	lui	$4,%hi(GlobalPlayer)	 # tmp1460,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp1459, tmp1460,
	sw	$4,64($sp)	 # tmp1459, %sfp
	addu	$8,$4,$2	 # _290, tmp1459, tmp1458
 # Library/Player/Pathfinding.c:1123:                     int ramp_path_index = FindNearestRampNode(GlobalPlayer[BotIndex].position, rampNodePosition, rival_y, CourseRamps, RampLengths, (AIHeader->TotalRamps), 225.0f);
	lui	$2,%hi($LC12)	 # tmp1462,
	lwc1	$f24,%lo($LC12)($2)	 # tmp1463,
	swc1	$f24,24($sp)	 # tmp1463,
	sll	$3,$3,16	 # _288, _288,
	sra	$3,$3,16	 # _288, _288,
	sw	$3,20($sp)	 # _288,
	sw	$23,16($sp)	 # RampLengths,
	move	$7,$fp	 #, CourseRamps
	mfc1	$6,$f22	 #, rival_y
	addiu	$5,$sp,44	 #,,
	sw	$8,60($sp)	 # _290, %sfp
	jal	FindNearestRampNode	 #
	move	$4,$8	 #, _290

	sw	$2,68($sp)	 # tmp2201, %sfp
 # Library/Player/Pathfinding.c:1124:                     int drop_path_index = FindNearestDropNode(GlobalPlayer[BotIndex].position, dropNodePosition, rival_y, CourseDrops, DropLengths, (AIHeader->TotalRamps), 225.0f);
	swc1	$f24,24($sp)	 # tmp1463,
	lh	$2,26($17)		 # AIHeader_413(D)->TotalRamps, AIHeader_413(D)->TotalRamps
	sw	$2,20($sp)	 # AIHeader_413(D)->TotalRamps,
	sw	$22,16($sp)	 # DropLengths,
	move	$7,$21	 #, CourseDrops
	mfc1	$6,$f22	 #, rival_y
	addiu	$5,$sp,32	 #,,
	jal	FindNearestDropNode	 #
	lw	$4,60($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:1127:                     float dist_to_nearest_ramp = PythagoreanTheorem(GlobalPlayer[BotIndex].position[0], rampNodePosition[0], GlobalPlayer[BotIndex].position[2], rampNodePosition[2]);
	sll	$3,$16,3	 # tmp1472, BotIndex,
	subu	$3,$3,$16	 # tmp1473, tmp1472, BotIndex
	sll	$3,$3,4	 # tmp1474, tmp1473,
	subu	$3,$3,$16	 # tmp1475, tmp1474, BotIndex
	sll	$3,$3,2	 # tmp1476, tmp1475,
	subu	$3,$3,$16	 # tmp1477, tmp1476, BotIndex
	sll	$3,$3,3	 # tmp1478, tmp1477,
	lw	$4,64($sp)		 # tmp1459, %sfp
	addu	$3,$4,$3	 # tmp1470, tmp1459, tmp1478
	lwc1	$f6,20($3)	 # _294, GlobalPlayer[BotIndex_426(D)].position
	lwc1	$f8,44($sp)	 # _295, rampNodePosition
	sub.s	$f4,$f6,$f8	 # tmp1479, _294, _295
	cvt.d.s	$f4,$f4	 # _297, tmp1479
	lwc1	$f2,28($3)	 # _299, GlobalPlayer[BotIndex_426(D)].position
	lwc1	$f10,52($sp)	 # _300, rampNodePosition
	sub.s	$f0,$f2,$f10	 # tmp1491, _299, _300
	cvt.d.s	$f0,$f0	 # _302, tmp1491
	mul.d	$f4,$f4,$f4	 # tmp1492, _297, _297
	mul.d	$f0,$f0,$f0	 # tmp1493, _302, _302
	add.d	$f4,$f4,$f0	 # tmp1494, tmp1492, tmp1493
 # Library/Player/Pathfinding.c:1127:                     float dist_to_nearest_ramp = PythagoreanTheorem(GlobalPlayer[BotIndex].position[0], rampNodePosition[0], GlobalPlayer[BotIndex].position[2], rampNodePosition[2]);
	cvt.s.d	$f4,$f4	 # dist_to_nearest_ramp, tmp1494
 # Library/Player/Pathfinding.c:1128:                     float dist_to_nearest_drop = PythagoreanTheorem(GlobalPlayer[BotIndex].position[0], dropNodePosition[0], GlobalPlayer[BotIndex].position[2], dropNodePosition[2]);
	lwc1	$f14,32($sp)	 # _306, MEM[(float[3] *)_130]
	sub.s	$f6,$f6,$f14	 # tmp1495, _294, _306
	cvt.d.s	$f6,$f6	 # _308, tmp1495
	lwc1	$f12,40($sp)	 # _311, MEM[(float[3] *)_130]
	sub.s	$f2,$f2,$f12	 # tmp1496, _299, _311
	cvt.d.s	$f0,$f2	 # _313, tmp1496
	mul.d	$f0,$f0,$f0	 # tmp1497, _313, _313
	mul.d	$f6,$f6,$f6	 # tmp1498, _308, _308
	add.d	$f0,$f0,$f6	 # tmp1499, tmp1497, tmp1498
 # Library/Player/Pathfinding.c:1128:                     float dist_to_nearest_drop = PythagoreanTheorem(GlobalPlayer[BotIndex].position[0], dropNodePosition[0], GlobalPlayer[BotIndex].position[2], dropNodePosition[2]);
	cvt.s.d	$f0,$f0	 # dist_to_nearest_drop, tmp1499
 # Library/Player/Pathfinding.c:1129:                     if (dist_to_nearest_ramp < dist_to_nearest_drop || drop_path_index == -1) //If a ramp is closer than a drop, use the ramp
	c.lt.s	$f4,$f0	 #, dist_to_nearest_ramp, dist_to_nearest_drop
	nop	
	bc1tl	$L389	 #,,
	lui	$2,%hi($LC17)	 # tmp1502,

 # Library/Player/Pathfinding.c:1129:                     if (dist_to_nearest_ramp < dist_to_nearest_drop || drop_path_index == -1) //If a ramp is closer than a drop, use the ramp
	li	$3,-1			# 0xffffffffffffffff	 # tmp1500,
	beq	$2,$3,$L329	 #, drop_path_index, tmp1500,
	lui	$3,%hi($LC17)	 # tmp1645,

 # Library/Player/Pathfinding.c:1155:                         if (dist_to_nearest_drop < RAMPDISTANCESQUARE) //If bot is at drop, use drop
	lwc1	$f2,%lo($LC17)($3)	 # tmp1644,
	c.lt.s	$f0,$f2	 #, dist_to_nearest_drop, tmp1644
	nop	
	bc1f	$L365	 #,,
	lui	$3,%hi(AIPathfinder)	 # tmp1646,

 # Library/Player/Pathfinding.c:1157:                             AIPathfinder[BotIndex].Target[0] = rival_x;
	sll	$4,$16,1	 # tmp1650, BotIndex,
	addu	$4,$4,$16	 # tmp1651, tmp1650, BotIndex
	sll	$4,$4,2	 # tmp1652, tmp1651,
	subu	$4,$4,$16	 # tmp1653, tmp1652, BotIndex
	sll	$4,$4,2	 # tmp1654, tmp1653,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1647, tmp1646,
	addu	$3,$3,$4	 # tmp1648, tmp1647, tmp1654
	swc1	$f28,12($3)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1158:                             AIPathfinder[BotIndex].Target[1] = rival_y;
	swc1	$f22,16($3)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1159:                             AIPathfinder[BotIndex].Target[2] = rival_z;
	swc1	$f30,20($3)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1161:                             AIPathfinder[BotIndex].LastPath = TargetPath;
	sh	$20,2($3)	 # TargetPath, AIPathfinder[BotIndex_426(D)].LastPath
 # Library/Player/Pathfinding.c:1162:                             AIPathfinder[BotIndex].TargetPath = drop_path_index;
	sh	$2,0($3)	 # drop_path_index, AIPathfinder[BotIndex_426(D)].TargetPath
 # Library/Player/Pathfinding.c:1163:                             AIPathfinder[BotIndex].Progression = 0;
	sh	$0,24($3)	 #, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:1164:                             AIPathfinder[BotIndex].Direction = 1;
	li	$4,1			# 0x1	 # tmp1709,
	sb	$4,36($3)	 # tmp1709, AIPathfinder[BotIndex_426(D)].Direction
 # Library/Player/Pathfinding.c:1165:                             AIPathfinder[BotIndex].PathType = 2;
	li	$4,2			# 0x2	 # tmp1719,
	sb	$4,37($3)	 # tmp1719, AIPathfinder[BotIndex_426(D)].PathType
 # Library/Player/Pathfinding.c:1166:                             AIPathfinder[BotIndex].NearestMarker = 0;
	sh	$0,26($3)	 #, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:1167:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
	sll	$2,$2,2	 # tmp1738, drop_path_index,
	addu	$2,$21,$2	 # tmp1739, CourseDrops, tmp1738
 # Library/Player/Pathfinding.c:1167:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
	lw	$2,0($2)		 # *_340, *_340
 # Library/Player/Pathfinding.c:1167:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
	lh	$2,2($2)		 # _341->Position, _341->Position
	mtc1	$2,$f0	 # _341->Position, _341->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp1742, _341->Position
	swc1	$f0,28($3)	 # tmp1742, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
	b	$L317	 #
	sh	$0,32($3)	 #, AIPathfinder[BotIndex_426(D)].ProgressTimer

$L373:
 # Library/Player/Pathfinding.c:1082:                     float nodePosition[] = {0.,0.,0.};
	sw	$0,36($sp)	 #, MEM[(float[3] *)_130]
	sw	$0,40($sp)	 #, MEM[(float[3] *)_130]
 # Library/Player/Pathfinding.c:1085:                     ramp_path_index = FindNearestRampNode(GlobalPlayer[BotIndex].position, nodePosition, rival_y, CourseRamps, RampLengths, (AIHeader->TotalRamps), 225.0f);
	sll	$2,$16,3	 # tmp1287, BotIndex,
	subu	$2,$2,$16	 # tmp1288, tmp1287, BotIndex
	sll	$2,$2,4	 # tmp1289, tmp1288,
	subu	$2,$2,$16	 # tmp1290, tmp1289, BotIndex
	sll	$2,$2,2	 # tmp1291, tmp1290,
	subu	$2,$2,$16	 # tmp1292, tmp1291, BotIndex
	sll	$2,$2,3	 # tmp1293, tmp1292,
	addiu	$2,$2,20	 # tmp1294, tmp1293,
 # Library/Player/Pathfinding.c:1085:                     ramp_path_index = FindNearestRampNode(GlobalPlayer[BotIndex].position, nodePosition, rival_y, CourseRamps, RampLengths, (AIHeader->TotalRamps), 225.0f);
	swc1	$f2,24($sp)	 # tmp1299,
	sll	$3,$3,16	 # _263, _263,
	sra	$3,$3,16	 # _263, _263,
	sw	$3,20($sp)	 # _263,
	sw	$23,16($sp)	 # RampLengths,
	move	$7,$fp	 #, CourseRamps
	mfc1	$6,$f22	 #, rival_y
	addiu	$5,$sp,32	 #,,
	lui	$4,%hi(GlobalPlayer)	 # tmp1296,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp1295, tmp1296,
	jal	FindNearestRampNode	 #
	addu	$4,$4,$2	 #, tmp1295, tmp1294

 # Library/Player/Pathfinding.c:1089:                     if (ramp_path_index == -1) //If no path is found in the middle of a fall
	li	$3,-1			# 0xffffffffffffffff	 # tmp1301,
	beq	$2,$3,$L277	 #, ramp_path_index, tmp1301,
	lwc1	$f2,32($sp)	 # _266, MEM[(float[3] *)_130]

 # Library/Player/Pathfinding.c:1094:                     if (PythagoreanTheorem(bot_x, nodePosition[0], bot_z, nodePosition[2]) < RAMPDISTANCESQUARE) //If bot is at ramp, use ramp
	sub.s	$f24,$f24,$f2	 # tmp1302, bot_x, _266
	cvt.d.s	$f24,$f24	 # _268, tmp1302
	lwc1	$f0,40($sp)	 # _270, MEM[(float[3] *)_130]
	sub.s	$f26,$f26,$f0	 # tmp1303, bot_z, _270
	cvt.d.s	$f26,$f26	 # _272, tmp1303
	mul.d	$f24,$f24,$f24	 # tmp1304, _268, _268
	mul.d	$f26,$f26,$f26	 # tmp1305, _272, _272
	add.d	$f24,$f24,$f26	 # tmp1306, tmp1304, tmp1305
 # Library/Player/Pathfinding.c:1094:                     if (PythagoreanTheorem(bot_x, nodePosition[0], bot_z, nodePosition[2]) < RAMPDISTANCESQUARE) //If bot is at ramp, use ramp
	lui	$3,%hi($LC15)	 # tmp1308,
	ldc1	$f4,%lo($LC15)($3)	 # tmp1307,
	c.lt.d	$f24,$f4	 #, tmp1306, tmp1307
	nop	
	bc1f	$L363	 #,,
	lui	$3,%hi(AIPathfinder)	 # tmp1309,

 # Library/Player/Pathfinding.c:1096:                         AIPathfinder[BotIndex].Target[0] = rival_x;
	sll	$4,$16,1	 # tmp1313, BotIndex,
	addu	$4,$4,$16	 # tmp1314, tmp1313, BotIndex
	sll	$4,$4,2	 # tmp1315, tmp1314,
	subu	$4,$4,$16	 # tmp1316, tmp1315, BotIndex
	sll	$4,$4,2	 # tmp1317, tmp1316,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1310, tmp1309,
	addu	$3,$3,$4	 # tmp1311, tmp1310, tmp1317
	swc1	$f28,12($3)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1097:                         AIPathfinder[BotIndex].Target[1] = rival_y;
	swc1	$f22,16($3)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1098:                         AIPathfinder[BotIndex].Target[2] = rival_z;
	swc1	$f30,20($3)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1100:                         AIPathfinder[BotIndex].LastPath = TargetPath;
	sh	$20,2($3)	 # TargetPath, AIPathfinder[BotIndex_426(D)].LastPath
 # Library/Player/Pathfinding.c:1101:                         AIPathfinder[BotIndex].TargetPath = ramp_path_index;
	sh	$2,0($3)	 # ramp_path_index, AIPathfinder[BotIndex_426(D)].TargetPath
 # Library/Player/Pathfinding.c:1102:                         AIPathfinder[BotIndex].Progression = 0;
	sh	$0,24($3)	 #, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:1103:                         AIPathfinder[BotIndex].Direction = 1;
	li	$4,1			# 0x1	 # tmp1372,
	sb	$4,36($3)	 # tmp1372, AIPathfinder[BotIndex_426(D)].Direction
 # Library/Player/Pathfinding.c:1104:                         AIPathfinder[BotIndex].PathType = 1;
	sb	$4,37($3)	 # tmp1372, AIPathfinder[BotIndex_426(D)].PathType
 # Library/Player/Pathfinding.c:1105:                         AIPathfinder[BotIndex].NearestMarker = 0;
	sh	$0,26($3)	 #, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:1106:                         AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][0].Position[1];
	sll	$2,$2,2	 # tmp1401, ramp_path_index,
	addu	$2,$fp,$2	 # tmp1402, CourseRamps, tmp1401
 # Library/Player/Pathfinding.c:1106:                         AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][0].Position[1];
	lw	$2,0($2)		 # *_278, *_278
 # Library/Player/Pathfinding.c:1106:                         AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][0].Position[1];
	lh	$2,2($2)		 # _279->Position, _279->Position
	mtc1	$2,$f0	 # _279->Position, _279->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp1405, _279->Position
	swc1	$f0,28($3)	 # tmp1405, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
	b	$L317	 #
	sh	$0,32($3)	 #, AIPathfinder[BotIndex_426(D)].ProgressTimer

$L363:
 # Library/Player/Pathfinding.c:1110:                         AIPathfinder[BotIndex].Target[0] = nodePosition[0];
	sll	$2,$16,1	 # tmp1419, BotIndex,
	addu	$2,$2,$16	 # tmp1420, tmp1419, BotIndex
	sll	$2,$2,2	 # tmp1421, tmp1420,
	subu	$2,$2,$16	 # tmp1422, tmp1421, BotIndex
	sll	$2,$2,2	 # tmp1423, tmp1422,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1416, tmp1415,
	addu	$2,$3,$2	 # tmp1417, tmp1416, tmp1423
	swc1	$f2,12($2)	 # _266, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1111:                         AIPathfinder[BotIndex].Target[1] = nodePosition[1];
	lwc1	$f2,36($sp)	 # MEM[(float[3] *)_130], MEM[(float[3] *)_130]
	swc1	$f2,16($2)	 # MEM[(float[3] *)_130], AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1112:                         AIPathfinder[BotIndex].Target[2] = nodePosition[2];
	swc1	$f0,20($2)	 # _270, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1113:                         UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                            
	lui	$2,%hi($LC12)	 # tmp1443,
	lwc1	$f0,%lo($LC12)($2)	 # tmp1444,
	swc1	$f0,28($sp)	 # tmp1444,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,225			# 0xe1	 #,
	jal	UpdateBKPath	 #
	lw	$4,56($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:1081:                 {
	b	$L374	 #
	sll	$2,$16,1	 # tmp1897, BotIndex,

$L362:
 # Library/Player/Pathfinding.c:1117:                 else if ( (diff_y <= -225.0f) && ((AIHeader->TotalRamps) > 0 || ((AIHeader->TotalDrops) > 0)) ) //If target is below bot and ramps or drops exist, look for ramps and drops
	lwc1	$f2,%lo($LC16)($2)	 # tmp1447,
	c.le.s	$f0,$f2	 #, diff_y, tmp1447
	nop	
	bc1f	$L326	 #,,
	lui	$3,%hi(AIPathfinder)	 # tmp1784,

 # Library/Player/Pathfinding.c:1117:                 else if ( (diff_y <= -225.0f) && ((AIHeader->TotalRamps) > 0 || ((AIHeader->TotalDrops) > 0)) ) //If target is below bot and ramps or drops exist, look for ramps and drops
	lhu	$3,26($17)	 # _288, AIHeader_413(D)->TotalRamps
 # Library/Player/Pathfinding.c:1117:                 else if ( (diff_y <= -225.0f) && ((AIHeader->TotalRamps) > 0 || ((AIHeader->TotalDrops) > 0)) ) //If target is below bot and ramps or drops exist, look for ramps and drops
	bnel	$3,$0,$L390	 #, _288,,
	sw	$0,44($sp)	 #, rampNodePosition

	b	$L375	 #
	lhu	$2,28($17)	 # AIHeader_413(D)->TotalDrops, AIHeader_413(D)->TotalDrops

$L329:
 # Library/Player/Pathfinding.c:1131:                         if (dist_to_nearest_ramp < RAMPDISTANCESQUARE) //If bot is at ramp, use ramp
	lui	$2,%hi($LC17)	 # tmp1502,
$L389:
	lwc1	$f0,%lo($LC17)($2)	 # tmp1501,
	c.lt.s	$f4,$f0	 #, dist_to_nearest_ramp, tmp1501
	nop	
	bc1f	$L364	 #,,
	sll	$3,$16,1	 # tmp1507, BotIndex,

 # Library/Player/Pathfinding.c:1133:                             AIPathfinder[BotIndex].Target[0] = rival_x;
	lui	$2,%hi(AIPathfinder)	 # tmp1503,
	addu	$3,$3,$16	 # tmp1508, tmp1507, BotIndex
	sll	$3,$3,2	 # tmp1509, tmp1508,
	subu	$3,$3,$16	 # tmp1510, tmp1509, BotIndex
	sll	$3,$3,2	 # tmp1511, tmp1510,
	addiu	$2,$2,%lo(AIPathfinder)	 # tmp1504, tmp1503,
	addu	$2,$2,$3	 # tmp1505, tmp1504, tmp1511
	swc1	$f28,12($2)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1134:                             AIPathfinder[BotIndex].Target[1] = rival_y;
	swc1	$f22,16($2)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1135:                             AIPathfinder[BotIndex].Target[2] = rival_z;
	swc1	$f30,20($2)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1137:                             AIPathfinder[BotIndex].LastPath = TargetPath;
	sh	$20,2($2)	 # TargetPath, AIPathfinder[BotIndex_426(D)].LastPath
 # Library/Player/Pathfinding.c:1138:                             AIPathfinder[BotIndex].TargetPath = ramp_path_index;
	lw	$5,68($sp)		 # ramp_path_index, %sfp
	sh	$5,0($2)	 # ramp_path_index, AIPathfinder[BotIndex_426(D)].TargetPath
 # Library/Player/Pathfinding.c:1139:                             AIPathfinder[BotIndex].Progression = RampLengths[ramp_path_index];
	sll	$3,$5,1	 # tmp1548, ramp_path_index,
	addu	$23,$23,$3	 # _319, RampLengths, tmp1548
	lh	$3,0($23)		 # _320, *_319
 # Library/Player/Pathfinding.c:1139:                             AIPathfinder[BotIndex].Progression = RampLengths[ramp_path_index];
	sh	$3,24($2)	 # _320, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:1140:                             AIPathfinder[BotIndex].Direction = -1;
	li	$3,-1			# 0xffffffffffffffff	 # tmp1567,
	sb	$3,36($2)	 # tmp1567, AIPathfinder[BotIndex_426(D)].Direction
 # Library/Player/Pathfinding.c:1141:                             AIPathfinder[BotIndex].PathType = 1;
	li	$3,1			# 0x1	 # tmp1577,
	sb	$3,37($2)	 # tmp1577, AIPathfinder[BotIndex_426(D)].PathType
 # Library/Player/Pathfinding.c:1142:                             AIPathfinder[BotIndex].NearestMarker = RampLengths[ramp_path_index];
	lh	$4,0($23)		 # _321, *_319
 # Library/Player/Pathfinding.c:1142:                             AIPathfinder[BotIndex].NearestMarker = RampLengths[ramp_path_index];
	sh	$4,26($2)	 # _321, AIPathfinder[BotIndex_426(D)].NearestMarker
 # Library/Player/Pathfinding.c:1143:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][RampLengths[ramp_path_index]].Position[1];
	sll	$3,$5,2	 # tmp1596, ramp_path_index,
	addu	$3,$fp,$3	 # tmp1597, CourseRamps, tmp1596
 # Library/Player/Pathfinding.c:1143:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][RampLengths[ramp_path_index]].Position[1];
	lw	$3,0($3)		 # *_323, *_323
	sll	$4,$4,3	 # tmp1599, _321,
	addu	$4,$3,$4	 # tmp1600, *_323, tmp1599
 # Library/Player/Pathfinding.c:1143:                             AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][RampLengths[ramp_path_index]].Position[1];
	lh	$3,2($4)		 # _328->Position, _328->Position
	mtc1	$3,$f0	 # _328->Position, _328->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp1602, _328->Position
	swc1	$f0,28($2)	 # tmp1602, AIPathfinder[BotIndex_426(D)].NearestMarkerHeight
	b	$L317	 #
	sh	$0,32($2)	 #, AIPathfinder[BotIndex_426(D)].ProgressTimer

$L364:
 # Library/Player/Pathfinding.c:1147:                             AIPathfinder[BotIndex].Target[0] = rampNodePosition[0];
	lui	$3,%hi(AIPathfinder)	 # tmp1612,
	sll	$2,$16,1	 # tmp1616, BotIndex,
	addu	$2,$2,$16	 # tmp1617, tmp1616, BotIndex
	sll	$2,$2,2	 # tmp1618, tmp1617,
	subu	$2,$2,$16	 # tmp1619, tmp1618, BotIndex
	sll	$2,$2,2	 # tmp1620, tmp1619,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1613, tmp1612,
	addu	$2,$3,$2	 # tmp1614, tmp1613, tmp1620
	swc1	$f8,12($2)	 # _295, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1148:                             AIPathfinder[BotIndex].Target[1] = rampNodePosition[1];
	lwc1	$f0,48($sp)	 # rampNodePosition, rampNodePosition
	swc1	$f0,16($2)	 # rampNodePosition, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1149:                             AIPathfinder[BotIndex].Target[2] = rampNodePosition[2];
	swc1	$f10,20($2)	 # _300, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1150:                             UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                            
	lui	$2,%hi($LC12)	 # tmp1640,
	lwc1	$f0,%lo($LC12)($2)	 # tmp1641,
	swc1	$f0,28($sp)	 # tmp1641,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,225			# 0xe1	 #,
	jal	UpdateBKPath	 #
	lw	$4,56($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:1212:     if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
	b	$L374	 #
	sll	$2,$16,1	 # tmp1897, BotIndex,

$L365:
 # Library/Player/Pathfinding.c:1171:                             AIPathfinder[BotIndex].Target[0] = dropNodePosition[0];
	sll	$2,$16,1	 # tmp1756, BotIndex,
	addu	$2,$2,$16	 # tmp1757, tmp1756, BotIndex
	sll	$2,$2,2	 # tmp1758, tmp1757,
	subu	$2,$2,$16	 # tmp1759, tmp1758, BotIndex
	sll	$2,$2,2	 # tmp1760, tmp1759,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1753, tmp1752,
	addu	$2,$3,$2	 # tmp1754, tmp1753, tmp1760
	swc1	$f14,12($2)	 # _306, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1172:                             AIPathfinder[BotIndex].Target[1] = dropNodePosition[1];
	lwc1	$f0,36($sp)	 # MEM[(float[3] *)_130], MEM[(float[3] *)_130]
	swc1	$f0,16($2)	 # MEM[(float[3] *)_130], AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1173:                             AIPathfinder[BotIndex].Target[2] = dropNodePosition[2];
	swc1	$f12,20($2)	 # _311, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1174:                             UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                            
	lui	$2,%hi($LC12)	 # tmp1780,
	lwc1	$f0,%lo($LC12)($2)	 # tmp1781,
	swc1	$f0,28($sp)	 # tmp1781,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,225			# 0xe1	 #,
	jal	UpdateBKPath	 #
	lw	$4,56($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:1118:                 {
	b	$L374	 #
	sll	$2,$16,1	 # tmp1897, BotIndex,

$L326:
$L388:
 # Library/Player/Pathfinding.c:1182:                     AIPathfinder[BotIndex].Target[0] = rival_x;
	sll	$2,$16,1	 # tmp1788, BotIndex,
	addu	$2,$2,$16	 # tmp1789, tmp1788, BotIndex
	sll	$2,$2,2	 # tmp1790, tmp1789,
	subu	$2,$2,$16	 # tmp1791, tmp1790, BotIndex
	sll	$2,$2,2	 # tmp1792, tmp1791,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1785, tmp1784,
	addu	$2,$3,$2	 # tmp1786, tmp1785, tmp1792
	swc1	$f28,12($2)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1183:                     AIPathfinder[BotIndex].Target[1] = rival_y;
	swc1	$f22,16($2)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1184:                     AIPathfinder[BotIndex].Target[2] = rival_z;
	swc1	$f30,20($2)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1185:                     UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);
	lui	$2,%hi($LC12)	 # tmp1811,
	lwc1	$f0,%lo($LC12)($2)	 # tmp1812,
	swc1	$f0,28($sp)	 # tmp1812,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,225			# 0xe1	 #,
	jal	UpdateBKPath	 #
	lw	$4,56($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:1212:     if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
	b	$L374	 #
	sll	$2,$16,1	 # tmp1897, BotIndex,

$L315:
 # Library/Player/Pathfinding.c:1190:             if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
	sll	$20,$16,1	 # tmp1816, BotIndex,
	addu	$20,$20,$16	 # tmp1817, tmp1816, BotIndex
	sll	$20,$20,2	 # tmp1818, tmp1817,
	subu	$20,$20,$16	 # tmp1819, tmp1818, BotIndex
	sll	$2,$20,2	 # tmp1820, tmp1819,
	lui	$20,%hi(AIPathfinder)	 # tmp1822,
	addiu	$20,$20,%lo(AIPathfinder)	 # tmp1821, tmp1822,
	addu	$20,$20,$2	 # _353, tmp1821, tmp1820
	move	$7,$22	 #, DropLengths
	move	$6,$23	 #, RampLengths
	move	$5,$18	 #, PathLengths
	jal	PathfinderComplete	 #
	move	$4,$20	 #, _353

 # Library/Player/Pathfinding.c:1190:             if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
	beql	$2,$0,$L374	 #, tmp2203,,
	sll	$2,$16,1	 # tmp1897, BotIndex,

 # Library/Player/Pathfinding.c:1192:                 AIPathfinder[BotIndex].Target[0] = rival_x; //Done with the ramp so go back to a flat path
	swc1	$f28,12($20)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1193:                 AIPathfinder[BotIndex].Target[1] = rival_y;
	swc1	$f22,16($20)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1194:                 AIPathfinder[BotIndex].Target[2] = rival_z;
	swc1	$f30,20($20)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1195:                 UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                   
	lui	$2,%hi($LC12)	 # tmp1851,
	lwc1	$f0,%lo($LC12)($2)	 # tmp1852,
	swc1	$f0,28($sp)	 # tmp1852,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,225			# 0xe1	 #,
	jal	UpdateBKPath	 #
	move	$4,$20	 #, _353

 # Library/Player/Pathfinding.c:1212:     if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
	b	$L374	 #
	sll	$2,$16,1	 # tmp1897, BotIndex,

$L316:
 # Library/Player/Pathfinding.c:1199:             if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
	addu	$20,$20,$16	 # tmp1857, tmp1856, BotIndex
	sll	$20,$20,2	 # tmp1858, tmp1857,
	subu	$20,$20,$16	 # tmp1859, tmp1858, BotIndex
	sll	$2,$20,2	 # tmp1860, tmp1859,
	lui	$20,%hi(AIPathfinder)	 # tmp1862,
	addiu	$20,$20,%lo(AIPathfinder)	 # tmp1861, tmp1862,
	addu	$20,$20,$2	 # _358, tmp1861, tmp1860
	move	$7,$22	 #, DropLengths
	move	$6,$23	 #, RampLengths
	move	$5,$18	 #, PathLengths
	jal	PathfinderComplete	 #
	move	$4,$20	 #, _358

 # Library/Player/Pathfinding.c:1199:             if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
	beql	$2,$0,$L374	 #, tmp2204,,
	sll	$2,$16,1	 # tmp1897, BotIndex,

 # Library/Player/Pathfinding.c:1201:                 AIPathfinder[BotIndex].Target[0] = rival_x; //Done with the ramp so go back to a flat path
	swc1	$f28,12($20)	 # rival_x, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1202:                 AIPathfinder[BotIndex].Target[1] = rival_y;
	swc1	$f22,16($20)	 # rival_y, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1203:                 AIPathfinder[BotIndex].Target[2] = rival_z;
	swc1	$f30,20($20)	 # rival_z, AIPathfinder[BotIndex_426(D)].Target
 # Library/Player/Pathfinding.c:1204:                 UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                   
	lui	$2,%hi($LC12)	 # tmp1891,
	lwc1	$f0,%lo($LC12)($2)	 # tmp1892,
	swc1	$f0,28($sp)	 # tmp1892,
	sw	$0,24($sp)	 #,
	sll	$2,$16,16	 # BotIndex, BotIndex,
	sra	$2,$2,16	 # BotIndex, BotIndex,
	sw	$2,20($sp)	 # BotIndex,
	lh	$2,24($17)		 # AIHeader_413(D)->TotalPaths, AIHeader_413(D)->TotalPaths
	sw	$2,16($sp)	 # AIHeader_413(D)->TotalPaths,
	move	$7,$18	 #, PathLengths
	move	$6,$19	 #, CoursePaths
	li	$5,225			# 0xe1	 #,
	jal	UpdateBKPath	 #
	move	$4,$20	 #, _358

 # Library/Player/Pathfinding.c:1212:     if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
	b	$L374	 #
	sll	$2,$16,1	 # tmp1897, BotIndex,

$L369:
 # Library/Player/Pathfinding.c:1217:         return StandardBattleBotBot(BotIndex, (int)AIPathfinder[BotIndex].RivalPlayer);
	lui	$3,%hi(AIPathfinder)	 # tmp1906,
	sll	$2,$16,1	 # tmp1910, BotIndex,
	addu	$2,$2,$16	 # tmp1911, tmp1910, BotIndex
	sll	$2,$2,2	 # tmp1912, tmp1911,
	subu	$2,$2,$16	 # tmp1913, tmp1912, BotIndex
	sll	$2,$2,2	 # tmp1914, tmp1913,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp1907, tmp1906,
	addu	$2,$3,$2	 # tmp1908, tmp1907, tmp1914
 # Library/Player/Pathfinding.c:1217:         return StandardBattleBotBot(BotIndex, (int)AIPathfinder[BotIndex].RivalPlayer);
	lb	$5,39($2)		 #, AIPathfinder[BotIndex_426(D)].RivalPlayer
	jal	StandardBattleBotBot	 #
	move	$4,$16	 #, BotIndex

	b	$L376	 #
	lw	$31,108($sp)		 #,

$L370:
 # Library/Player/Pathfinding.c:1228:         GlobalPlayer[BotIndex].acc_maxcount = 0.75 * AIPathfinder[BotIndex].MaxSpeed; //Slow the bot down when encountering a rival or item box 
	sll	$2,$16,3	 # tmp1951, BotIndex,
	subu	$2,$2,$16	 # tmp1952, tmp1951, BotIndex
	sll	$2,$2,4	 # tmp1953, tmp1952,
	subu	$2,$2,$16	 # tmp1954, tmp1953, BotIndex
	sll	$2,$2,2	 # tmp1955, tmp1954,
	subu	$2,$2,$16	 # tmp1956, tmp1955, BotIndex
	sll	$2,$2,3	 # tmp1957, tmp1956,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp1948, tmp1947,
	addu	$2,$3,$2	 # tmp1949, tmp1948, tmp1957
 # Library/Player/Pathfinding.c:1228:         GlobalPlayer[BotIndex].acc_maxcount = 0.75 * AIPathfinder[BotIndex].MaxSpeed; //Slow the bot down when encountering a rival or item box 
	sll	$3,$16,1	 # tmp1961, BotIndex,
	addu	$3,$3,$16	 # tmp1962, tmp1961, BotIndex
	sll	$3,$3,2	 # tmp1963, tmp1962,
	subu	$3,$3,$16	 # tmp1964, tmp1963, BotIndex
	sll	$3,$3,2	 # tmp1965, tmp1964,
	lui	$4,%hi(AIPathfinder)	 # tmp1958,
	addiu	$4,$4,%lo(AIPathfinder)	 # tmp1966, tmp1958,
	addu	$3,$3,$4	 # tmp1959, tmp1965, tmp1966
 # Library/Player/Pathfinding.c:1228:         GlobalPlayer[BotIndex].acc_maxcount = 0.75 * AIPathfinder[BotIndex].MaxSpeed; //Slow the bot down when encountering a rival or item box 
	lwc1	$f0,8($3)	 # AIPathfinder[BotIndex_426(D)].MaxSpeed, AIPathfinder[BotIndex_426(D)].MaxSpeed
	lui	$4,%hi($LC20)	 # tmp1970,
	lwc1	$f2,%lo($LC20)($4)	 # tmp1969,
	mul.s	$f0,$f0,$f2	 # tmp1967, AIPathfinder[BotIndex_426(D)].MaxSpeed, tmp1969
 # Library/Player/Pathfinding.c:1228:         GlobalPlayer[BotIndex].acc_maxcount = 0.75 * AIPathfinder[BotIndex].MaxSpeed; //Slow the bot down when encountering a rival or item box 
	swc1	$f0,532($2)	 # tmp1967, GlobalPlayer[BotIndex_426(D)].acc_maxcount
 # Library/Player/Pathfinding.c:1230:         return StandardBattleBotBot(BotIndex, (int)AIPathfinder[BotIndex].RivalPlayer);
	lb	$5,39($3)		 #, AIPathfinder[BotIndex_426(D)].RivalPlayer
	jal	StandardBattleBotBot	 #
	move	$4,$16	 #, BotIndex

	b	$L376	 #
	lw	$31,108($sp)		 #,

$L371:
 # Library/Player/Pathfinding.c:1242:         BotPressed[BotIndex] = BTN_Z;
	sll	$17,$16,1	 # tmp2002, BotIndex,
	lui	$2,%hi(BotPressed)	 # tmp2001,
	addiu	$2,$2,%lo(BotPressed)	 # tmp2004, tmp2001,
	addu	$2,$17,$2	 # tmp2003, tmp2002, tmp2004
	li	$3,8192			# 0x2000	 # tmp2005,
	sh	$3,0($2)	 # tmp2005, BotPressed
 # Library/Player/Pathfinding.c:1243:         BotButtons[BotIndex] = BTN_A + BTN_Z;
	lui	$2,%hi(BotButtons)	 # tmp2006,
	addiu	$2,$2,%lo(BotButtons)	 # tmp2009, tmp2006,
	addu	$2,$17,$2	 # tmp2008, tmp2002, tmp2009
	li	$3,-24576			# 0xffffffffffffa000	 # tmp2010,
	sh	$3,0($2)	 # tmp2010, BotButtons
 # Library/Player/Pathfinding.c:1244:         AIPathfinder[BotIndex].ShootingTimer = (250 + MakeRandomLimmit(500));
	jal	MakeRandomLimmit	 #
	li	$4,500			# 0x1f4	 #,

 # Library/Player/Pathfinding.c:1244:         AIPathfinder[BotIndex].ShootingTimer = (250 + MakeRandomLimmit(500));
	lui	$3,%hi(AIPathfinder)	 # tmp2012,
	addu	$17,$17,$16	 # tmp2017, tmp2002, BotIndex
	sll	$17,$17,2	 # tmp2018, tmp2017,
	subu	$16,$17,$16	 # tmp2019, tmp2018, BotIndex
	sll	$16,$16,2	 # tmp2020, tmp2019,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp2013, tmp2012,
	addu	$16,$3,$16	 # tmp2014, tmp2013, tmp2020
 # Library/Player/Pathfinding.c:1244:         AIPathfinder[BotIndex].ShootingTimer = (250 + MakeRandomLimmit(500));
	addiu	$2,$2,250	 # tmp2021, tmp2206,
 # Library/Player/Pathfinding.c:1244:         AIPathfinder[BotIndex].ShootingTimer = (250 + MakeRandomLimmit(500));
	b	$L277	 #
	sh	$2,34($16)	 # tmp2021, AIPathfinder[BotIndex_426(D)].ShootingTimer

$L292:
 # Library/Player/Pathfinding.c:981:         short Progression = AIPathfinder[BotIndex].Progression;
	sll	$2,$16,1	 # tmp2036, BotIndex,
$L380:
	addu	$2,$2,$16	 # tmp2037, tmp2036, BotIndex
	sll	$2,$2,2	 # tmp2038, tmp2037,
	subu	$2,$2,$16	 # tmp2039, tmp2038, BotIndex
	sll	$2,$2,2	 # tmp2040, tmp2039,
	lui	$3,%hi(AIPathfinder)	 # tmp2033,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp2041, tmp2033,
	addu	$2,$2,$3	 # tmp2034, tmp2040, tmp2041
	lh	$2,24($2)		 # Progression, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:986:                 objectPosition[0] = (float)CoursePaths[TargetPath][Progression].Position[0];
	sll	$4,$20,2	 # tmp2042, TargetPath,
	addu	$4,$19,$4	 # _162, CoursePaths, tmp2042
 # Library/Player/Pathfinding.c:986:                 objectPosition[0] = (float)CoursePaths[TargetPath][Progression].Position[0];
	sll	$5,$2,3	 # _165, Progression,
 # Library/Player/Pathfinding.c:986:                 objectPosition[0] = (float)CoursePaths[TargetPath][Progression].Position[0];
	lui	$3,%hi(objectPosition)	 # tmp2043,
 # Library/Player/Pathfinding.c:986:                 objectPosition[0] = (float)CoursePaths[TargetPath][Progression].Position[0];
	lw	$6,0($4)		 # *_162, *_162
	addu	$6,$6,$5	 # tmp2045, *_162, _165
 # Library/Player/Pathfinding.c:986:                 objectPosition[0] = (float)CoursePaths[TargetPath][Progression].Position[0];
	lh	$6,0($6)		 # _166->Position, _166->Position
	mtc1	$6,$f0	 # _166->Position, _166->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2047, _166->Position
	swc1	$f0,%lo(objectPosition)($3)	 # tmp2047, objectPosition
 # Library/Player/Pathfinding.c:987:                 objectPosition[1] = (float)CoursePaths[TargetPath][Progression].Position[1];
	addiu	$3,$3,%lo(objectPosition)	 # tmp2049, tmp2043,
 # Library/Player/Pathfinding.c:987:                 objectPosition[1] = (float)CoursePaths[TargetPath][Progression].Position[1];
	lw	$6,0($4)		 # *_162, *_162
	addu	$6,$6,$5	 # tmp2051, *_162, _165
 # Library/Player/Pathfinding.c:987:                 objectPosition[1] = (float)CoursePaths[TargetPath][Progression].Position[1];
	lh	$6,2($6)		 # _170->Position, _170->Position
	mtc1	$6,$f0	 # _170->Position, _170->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2053, _170->Position
	swc1	$f0,4($3)	 # tmp2053, objectPosition
 # Library/Player/Pathfinding.c:988:                 objectPosition[2] = (float)CoursePaths[TargetPath][Progression].Position[2]; 
	lw	$4,0($4)		 # *_162, *_162
	addu	$4,$4,$5	 # tmp2057, *_162, _165
 # Library/Player/Pathfinding.c:988:                 objectPosition[2] = (float)CoursePaths[TargetPath][Progression].Position[2]; 
	lh	$4,4($4)		 # _174->Position, _174->Position
	mtc1	$4,$f0	 # _174->Position, _174->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2059, _174->Position
	swc1	$f0,8($3)	 # tmp2059, objectPosition
 # Library/Player/Pathfinding.c:989:                 GlobalIntA = PathLengths[TargetPath];
	sll	$3,$20,1	 # tmp2061, TargetPath,
	addu	$3,$18,$3	 # tmp2062, PathLengths, tmp2061
	lh	$4,0($3)		 # *_178, *_178
	lui	$3,%hi(GlobalIntA)	 # tmp2060,
 # Library/Player/Pathfinding.c:990:                 break;
	b	$L340	 #
	sw	$4,%lo(GlobalIntA)($3)	 # *_178, GlobalIntA

$L291:
 # Library/Player/Pathfinding.c:981:         short Progression = AIPathfinder[BotIndex].Progression;
	sll	$2,$16,1	 # tmp2067, BotIndex,
$L382:
	addu	$2,$2,$16	 # tmp2068, tmp2067, BotIndex
	sll	$2,$2,2	 # tmp2069, tmp2068,
	subu	$2,$2,$16	 # tmp2070, tmp2069, BotIndex
	sll	$2,$2,2	 # tmp2071, tmp2070,
	lui	$3,%hi(AIPathfinder)	 # tmp2064,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp2072, tmp2064,
	addu	$2,$2,$3	 # tmp2065, tmp2071, tmp2072
	lh	$2,24($2)		 # Progression, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:992:                 objectPosition[0] = (float)CourseRamps[TargetPath][Progression].Position[0];
	sll	$4,$20,2	 # tmp2073, TargetPath,
	addu	$4,$fp,$4	 # _183, CourseRamps, tmp2073
 # Library/Player/Pathfinding.c:992:                 objectPosition[0] = (float)CourseRamps[TargetPath][Progression].Position[0];
	sll	$5,$2,3	 # _186, Progression,
 # Library/Player/Pathfinding.c:992:                 objectPosition[0] = (float)CourseRamps[TargetPath][Progression].Position[0];
	lui	$3,%hi(objectPosition)	 # tmp2074,
 # Library/Player/Pathfinding.c:992:                 objectPosition[0] = (float)CourseRamps[TargetPath][Progression].Position[0];
	lw	$6,0($4)		 # *_183, *_183
	addu	$6,$6,$5	 # tmp2076, *_183, _186
 # Library/Player/Pathfinding.c:992:                 objectPosition[0] = (float)CourseRamps[TargetPath][Progression].Position[0];
	lh	$6,0($6)		 # _187->Position, _187->Position
	mtc1	$6,$f0	 # _187->Position, _187->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2078, _187->Position
	swc1	$f0,%lo(objectPosition)($3)	 # tmp2078, objectPosition
 # Library/Player/Pathfinding.c:993:                 objectPosition[1] = (float)CourseRamps[TargetPath][Progression].Position[1];
	addiu	$3,$3,%lo(objectPosition)	 # tmp2080, tmp2074,
 # Library/Player/Pathfinding.c:993:                 objectPosition[1] = (float)CourseRamps[TargetPath][Progression].Position[1];
	lw	$6,0($4)		 # *_183, *_183
	addu	$6,$6,$5	 # tmp2082, *_183, _186
 # Library/Player/Pathfinding.c:993:                 objectPosition[1] = (float)CourseRamps[TargetPath][Progression].Position[1];
	lh	$6,2($6)		 # _191->Position, _191->Position
	mtc1	$6,$f0	 # _191->Position, _191->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2084, _191->Position
	swc1	$f0,4($3)	 # tmp2084, objectPosition
 # Library/Player/Pathfinding.c:994:                 objectPosition[2] = (float)CourseRamps[TargetPath][Progression].Position[2]; 
	lw	$4,0($4)		 # *_183, *_183
	addu	$4,$4,$5	 # tmp2088, *_183, _186
 # Library/Player/Pathfinding.c:994:                 objectPosition[2] = (float)CourseRamps[TargetPath][Progression].Position[2]; 
	lh	$4,4($4)		 # _195->Position, _195->Position
	mtc1	$4,$f0	 # _195->Position, _195->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2090, _195->Position
	swc1	$f0,8($3)	 # tmp2090, objectPosition
 # Library/Player/Pathfinding.c:995:                 GlobalIntA = RampLengths[TargetPath];
	sll	$3,$20,1	 # tmp2092, TargetPath,
	addu	$3,$23,$3	 # tmp2093, RampLengths, tmp2092
	lh	$4,0($3)		 # *_199, *_199
	lui	$3,%hi(GlobalIntA)	 # tmp2091,
 # Library/Player/Pathfinding.c:996:                 break;
	b	$L340	 #
	sw	$4,%lo(GlobalIntA)($3)	 # *_199, GlobalIntA

$L289:
 # Library/Player/Pathfinding.c:981:         short Progression = AIPathfinder[BotIndex].Progression;
	sll	$2,$16,1	 # tmp2098, BotIndex,
$L384:
	addu	$2,$2,$16	 # tmp2099, tmp2098, BotIndex
	sll	$2,$2,2	 # tmp2100, tmp2099,
	subu	$2,$2,$16	 # tmp2101, tmp2100, BotIndex
	sll	$2,$2,2	 # tmp2102, tmp2101,
	lui	$3,%hi(AIPathfinder)	 # tmp2095,
	addiu	$3,$3,%lo(AIPathfinder)	 # tmp2103, tmp2095,
	addu	$2,$2,$3	 # tmp2096, tmp2102, tmp2103
	lh	$2,24($2)		 # Progression, AIPathfinder[BotIndex_426(D)].Progression
 # Library/Player/Pathfinding.c:998:                 objectPosition[0] = (float)CourseDrops[TargetPath][Progression].Position[0];
	sll	$4,$20,2	 # tmp2104, TargetPath,
	addu	$4,$21,$4	 # _204, CourseDrops, tmp2104
 # Library/Player/Pathfinding.c:998:                 objectPosition[0] = (float)CourseDrops[TargetPath][Progression].Position[0];
	sll	$5,$2,3	 # _207, Progression,
 # Library/Player/Pathfinding.c:998:                 objectPosition[0] = (float)CourseDrops[TargetPath][Progression].Position[0];
	lui	$3,%hi(objectPosition)	 # tmp2105,
 # Library/Player/Pathfinding.c:998:                 objectPosition[0] = (float)CourseDrops[TargetPath][Progression].Position[0];
	lw	$6,0($4)		 # *_204, *_204
	addu	$6,$6,$5	 # tmp2107, *_204, _207
 # Library/Player/Pathfinding.c:998:                 objectPosition[0] = (float)CourseDrops[TargetPath][Progression].Position[0];
	lh	$6,0($6)		 # _208->Position, _208->Position
	mtc1	$6,$f0	 # _208->Position, _208->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2109, _208->Position
	swc1	$f0,%lo(objectPosition)($3)	 # tmp2109, objectPosition
 # Library/Player/Pathfinding.c:999:                 objectPosition[1] = (float)CourseDrops[TargetPath][Progression].Position[1];
	addiu	$3,$3,%lo(objectPosition)	 # tmp2111, tmp2105,
 # Library/Player/Pathfinding.c:999:                 objectPosition[1] = (float)CourseDrops[TargetPath][Progression].Position[1];
	lw	$6,0($4)		 # *_204, *_204
	addu	$6,$6,$5	 # tmp2113, *_204, _207
 # Library/Player/Pathfinding.c:999:                 objectPosition[1] = (float)CourseDrops[TargetPath][Progression].Position[1];
	lh	$6,2($6)		 # _212->Position, _212->Position
	mtc1	$6,$f0	 # _212->Position, _212->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2115, _212->Position
	swc1	$f0,4($3)	 # tmp2115, objectPosition
 # Library/Player/Pathfinding.c:1000:                 objectPosition[2] = (float)CourseDrops[TargetPath][Progression].Position[2]; 
	lw	$4,0($4)		 # *_204, *_204
	addu	$4,$4,$5	 # tmp2119, *_204, _207
 # Library/Player/Pathfinding.c:1000:                 objectPosition[2] = (float)CourseDrops[TargetPath][Progression].Position[2]; 
	lh	$4,4($4)		 # _216->Position, _216->Position
	mtc1	$4,$f0	 # _216->Position, _216->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp2121, _216->Position
	swc1	$f0,8($3)	 # tmp2121, objectPosition
 # Library/Player/Pathfinding.c:1001:                 GlobalIntA = DropLengths[TargetPath];
	sll	$3,$20,1	 # tmp2123, TargetPath,
	addu	$3,$22,$3	 # tmp2124, DropLengths, tmp2123
	lh	$4,0($3)		 # *_220, *_220
	lui	$3,%hi(GlobalIntA)	 # tmp2122,
 # Library/Player/Pathfinding.c:1002:                 break;
	b	$L340	 #
	sw	$4,%lo(GlobalIntA)($3)	 # *_220, GlobalIntA

	.set	macro
	.set	reorder
	.end	OKBattleBot
	.size	OKBattleBot, .-OKBattleBot
	.globl	ItemBoxIndex
	.section	.bss,"aw",@nobits
	.align	2
	.type	ItemBoxIndex, @object
	.size	ItemBoxIndex, 200
ItemBoxIndex:
	.space	200
	.globl	ItemBoxCount
	.align	1
	.type	ItemBoxCount, @object
	.size	ItemBoxCount, 2
ItemBoxCount:
	.space	2
	.globl	BotAnalog
	.align	2
	.type	BotAnalog, @object
	.size	BotAnalog, 4
BotAnalog:
	.space	4
	.globl	BotPressed
	.align	2
	.type	BotPressed, @object
	.size	BotPressed, 8
BotPressed:
	.space	8
	.globl	BotButtons
	.align	2
	.type	BotButtons, @object
	.size	BotButtons, 8
BotButtons:
	.space	8
	.globl	AIPathfinder
	.align	2
	.type	AIPathfinder, @object
	.size	AIPathfinder, 176
AIPathfinder:
	.space	176
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1287568416
	.align	2
$LC1:
	.word	-859915232
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC2:
	.word	1071644672
	.word	0
	.section	.rodata.cst4
	.align	2
$LC3:
	.word	1084227584
	.align	2
$LC4:
	.word	1000593162
	.align	2
$LC5:
	.word	1092616192
	.align	2
$LC6:
	.word	1056964608
	.section	.rodata.cst8
	.align	3
$LC7:
	.word	1072273817
	.word	-1717986918
	.section	.rodata.cst4
	.align	2
$LC8:
	.word	1109393408
	.align	2
$LC9:
	.word	1101004800
	.align	2
$LC10:
	.word	1167867904
	.align	2
$LC11:
	.word	1163575296
	.align	2
$LC12:
	.word	1130430464
	.section	.rodata.cst8
	.align	3
$LC13:
	.word	1080827904
	.word	0
	.align	3
$LC14:
	.word	1081876480
	.word	0
	.align	3
$LC15:
	.word	1088653312
	.word	0
	.section	.rodata.cst4
	.align	2
$LC16:
	.word	-1017053184
	.align	2
$LC17:
	.word	1193033728
	.align	2
$LC18:
	.word	1120403456
	.section	.rodata.cst8
	.align	3
$LC19:
	.word	1078730752
	.word	0
	.section	.rodata.cst4
	.align	2
$LC20:
	.word	1061158912
	.ident	"GCC: (GNU) 10.1.0"
