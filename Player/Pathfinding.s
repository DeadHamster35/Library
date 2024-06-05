	.file	1 "Pathfinding.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg

 # -G value = 0, Arch = vr4300, ISA = 3
 # GNU C17 (GCC) version 10.1.0 (mips64-elf)
 #	compiled by GNU C version Apple LLVM 14.0.0 (clang-1400.0.29.202), GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.26-GMP

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
 # Library/Player/Pathfinding.c:16:     ItemBoxCount = 0;
	lui	$2,%hi(ItemBoxCount)	 # tmp204,
	sh	$0,%lo(ItemBoxCount)($2)	 #, ItemBoxCount
	lui	$3,%hi(g_SimpleObjectArray)	 # tmp205,
	addiu	$3,$3,%lo(g_SimpleObjectArray)	 # ivtmp.62, tmp205,
	move	$9,$0	 # ItemBoxCount_lsm_flag.56,
	move	$5,$0	 # ItemBoxCount_lsm.55,
 # Library/Player/Pathfinding.c:17:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	move	$2,$0	 # ThisObject,
 # Library/Player/Pathfinding.c:19:         if (g_SimpleObjectArray[ThisObject].category == IBOX)
	li	$7,12			# 0xc	 # tmp207,
 # Library/Player/Pathfinding.c:21:             ItemBoxIndex[ItemBoxCount] = ThisObject;
	lui	$8,%hi(ItemBoxIndex)	 # tmp217,
	addiu	$8,$8,%lo(ItemBoxIndex)	 # tmp218, tmp217,
 # Library/Player/Pathfinding.c:22:             ItemBoxCount++;
	li	$10,1			# 0x1	 # ItemBoxCount_lsm_flag.56,
 # Library/Player/Pathfinding.c:17:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	b	$L3	 #
	li	$6,100			# 0x64	 # tmp214,

$L2:
 # Library/Player/Pathfinding.c:17:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	addiu	$2,$2,1	 # ThisObject, ThisObject,
$L7:
 # Library/Player/Pathfinding.c:17:     for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
	beq	$2,$6,$L6	 #, ThisObject, tmp214,
	addiu	$3,$3,112	 # ivtmp.62, ivtmp.62,

$L3:
 # Library/Player/Pathfinding.c:19:         if (g_SimpleObjectArray[ThisObject].category == IBOX)
	lh	$4,0($3)		 # MEM[base: _24, offset: 0B], MEM[base: _24, offset: 0B]
	bnel	$4,$7,$L7	 #, MEM[base: _24, offset: 0B], tmp207,
	addiu	$2,$2,1	 # ThisObject, ThisObject,

 # Library/Player/Pathfinding.c:21:             ItemBoxIndex[ItemBoxCount] = ThisObject;
	sll	$4,$5,1	 # tmp209, ItemBoxCount_lsm.55,
	addu	$4,$4,$8	 # tmp210, tmp209, tmp218
	sh	$2,0($4)	 # ThisObject, ItemBoxIndex
 # Library/Player/Pathfinding.c:22:             ItemBoxCount++;
	addiu	$5,$5,1	 # tmp213, ItemBoxCount_lsm.55,
	sll	$5,$5,16	 # ItemBoxCount_lsm.55, tmp213,
	sra	$5,$5,16	 # ItemBoxCount_lsm.55, ItemBoxCount_lsm.55,
	b	$L2	 #
	move	$9,$10	 # ItemBoxCount_lsm_flag.56, ItemBoxCount_lsm_flag.56

$L6:
	beq	$9,$0,$L8	 #, ItemBoxCount_lsm_flag.56,,
	lui	$2,%hi(ItemBoxCount)	 # tmp215,

	sh	$5,%lo(ItemBoxCount)($2)	 # ItemBoxCount_lsm.55, ItemBoxCount
$L8:
 # Library/Player/Pathfinding.c:25: }
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
 # Library/Player/Pathfinding.c:37:     switch (Pathfinder->PathType)
	lb	$3,32($4)		 # _1, Pathfinder_34(D)->PathType
 # Library/Player/Pathfinding.c:37:     switch (Pathfinder->PathType)
	li	$2,1			# 0x1	 # tmp245,
	beql	$3,$2,$L10	 #, _1, tmp245,
	lh	$3,28($4)		 # Pathfinder_34(D)->ProgressTimer, Pathfinder_34(D)->ProgressTimer

	li	$2,2			# 0x2	 # tmp246,
	beql	$3,$2,$L11	 #, _1, tmp246,
	lh	$3,28($4)		 # Pathfinder_34(D)->ProgressTimer, Pathfinder_34(D)->ProgressTimer

	bne	$3,$0,$L65	 #, _1,,
	move	$2,$0	 # <retval>,

 # Library/Player/Pathfinding.c:48:                 || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
	lh	$3,28($4)		 # Pathfinder_34(D)->ProgressTimer, Pathfinder_34(D)->ProgressTimer
	slt	$3,$3,90	 # tmp248, Pathfinder_34(D)->ProgressTimer,
	beq	$3,$0,$L65	 #, tmp248,,
	li	$2,1			# 0x1	 # iftmp.4_30,

 # Library/Player/Pathfinding.c:44:                 || (Pathfinder->TargetPath == -1) 
	lh	$2,0($4)		 # _3, Pathfinder_34(D)->TargetPath
 # Library/Player/Pathfinding.c:44:                 || (Pathfinder->TargetPath == -1) 
	li	$3,-1			# 0xffffffffffffffff	 # tmp249,
	beq	$2,$3,$L33
	nop
	 #, _3, tmp249,
 # Library/Player/Pathfinding.c:45:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lh	$3,22($4)		 # _4, Pathfinder_34(D)->NearestMarker
 # Library/Player/Pathfinding.c:45:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	bnel	$3,$0,$L14	 #, _4,,
	sll	$2,$2,1	 # tmp252, _3,

 # Library/Player/Pathfinding.c:45:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lb	$7,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction
	li	$6,-1			# 0xffffffffffffffff	 # tmp251,
	beq	$7,$6,$L55
	nop
	 #, Pathfinder_34(D)->Direction, tmp251,
 # Library/Player/Pathfinding.c:46:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	sll	$2,$2,1	 # tmp287, _3,
	addu	$5,$5,$2	 # tmp288, PathLengths, tmp287
	lh	$5,0($5)		 # _50, *_49
 # Library/Player/Pathfinding.c:46:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$5,$0,$L56	 #, _50,,
	lb	$4,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L26:
	jr	$31	 #
	slt	$2,$5,$3	 # iftmp.4_30, _50, _4

$L14:
 # Library/Player/Pathfinding.c:46:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	addu	$5,$5,$2	 # tmp253, PathLengths, tmp252
	lh	$5,0($5)		 # _50, *_8
 # Library/Player/Pathfinding.c:46:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$3,$5,$L57	 #, _4, _50,
	lb	$4,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L16:
 # Library/Player/Pathfinding.c:47:                 || (Pathfinder->NearestMarker < 0) 
	bltz	$3,$L65	 #, _4,
	li	$2,1			# 0x1	 # iftmp.4_30,

	b	$L26
	nop
	 #
$L57:
 # Library/Player/Pathfinding.c:46:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp255,
	bne	$4,$2,$L16
	nop
	 #, Pathfinder_34(D)->Direction, tmp255,
$L65:
	jr	$31
	nop
	 #
$L33:
 # Library/Player/Pathfinding.c:48:                 || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.4_30,

$L55:
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.4_30,

$L10:
 # Library/Player/Pathfinding.c:62:                 || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
	slt	$3,$3,120	 # tmp261, Pathfinder_34(D)->ProgressTimer,
	beq	$3,$0,$L65	 #, tmp261,,
	li	$2,1			# 0x1	 # iftmp.5_31,

 # Library/Player/Pathfinding.c:58:                 || (Pathfinder->TargetPath == -1) 
	lh	$2,0($4)		 # _12, Pathfinder_34(D)->TargetPath
 # Library/Player/Pathfinding.c:58:                 || (Pathfinder->TargetPath == -1) 
	li	$3,-1			# 0xffffffffffffffff	 # tmp262,
	beq	$2,$3,$L38
	nop
	 #, _12, tmp262,
 # Library/Player/Pathfinding.c:59:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lh	$3,22($4)		 # _13, Pathfinder_34(D)->NearestMarker
 # Library/Player/Pathfinding.c:59:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	bnel	$3,$0,$L18	 #, _13,,
	sll	$2,$2,1	 # tmp265, _12,

 # Library/Player/Pathfinding.c:59:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lb	$7,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction
	li	$5,-1			# 0xffffffffffffffff	 # tmp264,
	beq	$7,$5,$L58
	nop
	 #, Pathfinder_34(D)->Direction, tmp264,
 # Library/Player/Pathfinding.c:60:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	sll	$2,$2,1	 # tmp289, _12,
	addu	$6,$6,$2	 # tmp290, RampLengths, tmp289
	lh	$5,0($6)		 # _54, *_53
 # Library/Player/Pathfinding.c:60:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$5,$0,$L59	 #, _54,,
	lb	$4,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L28:
	jr	$31	 #
	slt	$2,$5,$3	 # iftmp.5_31, _54, _13

$L18:
 # Library/Player/Pathfinding.c:60:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	addu	$6,$6,$2	 # tmp266, RampLengths, tmp265
	lh	$5,0($6)		 # _54, *_17
 # Library/Player/Pathfinding.c:60:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$3,$5,$L60	 #, _13, _54,
	lb	$4,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L20:
 # Library/Player/Pathfinding.c:61:                 || (Pathfinder->NearestMarker < 0) 
	bltz	$3,$L65	 #, _13,
	li	$2,1			# 0x1	 # iftmp.5_31,

	b	$L28
	nop
	 #
$L60:
 # Library/Player/Pathfinding.c:60:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp268,
	bne	$4,$2,$L20
	nop
	 #, Pathfinder_34(D)->Direction, tmp268,
	jr	$31
	nop
	 #
$L38:
 # Library/Player/Pathfinding.c:62:                 || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.5_31,

$L58:
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.5_31,

$L11:
 # Library/Player/Pathfinding.c:76:                 || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
	slt	$3,$3,120	 # tmp274, Pathfinder_34(D)->ProgressTimer,
	beq	$3,$0,$L65	 #, tmp274,,
	li	$2,1			# 0x1	 # iftmp.6_32,

 # Library/Player/Pathfinding.c:72:                 || (Pathfinder->TargetPath == -1) 
	lh	$2,0($4)		 # _21, Pathfinder_34(D)->TargetPath
 # Library/Player/Pathfinding.c:72:                 || (Pathfinder->TargetPath == -1) 
	li	$3,-1			# 0xffffffffffffffff	 # tmp275,
	beq	$2,$3,$L43
	nop
	 #, _21, tmp275,
 # Library/Player/Pathfinding.c:73:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lh	$3,22($4)		 # _22, Pathfinder_34(D)->NearestMarker
 # Library/Player/Pathfinding.c:73:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	bnel	$3,$0,$L22	 #, _22,,
	sll	$2,$2,1	 # tmp278, _21,

 # Library/Player/Pathfinding.c:73:                 || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
	lb	$6,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction
	li	$5,-1			# 0xffffffffffffffff	 # tmp277,
	beq	$6,$5,$L61
	nop
	 #, Pathfinder_34(D)->Direction, tmp277,
 # Library/Player/Pathfinding.c:74:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	sll	$2,$2,1	 # tmp291, _21,
	addu	$7,$7,$2	 # tmp292, DropLengths, tmp291
	lh	$5,0($7)		 # _58, *_57
 # Library/Player/Pathfinding.c:74:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$5,$0,$L62	 #, _58,,
	lb	$4,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L30:
	jr	$31	 #
	slt	$2,$5,$3	 # iftmp.6_32, _58, _22

$L22:
 # Library/Player/Pathfinding.c:74:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	addu	$7,$7,$2	 # tmp279, DropLengths, tmp278
	lh	$5,0($7)		 # _58, *_26
 # Library/Player/Pathfinding.c:74:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	beql	$3,$5,$L63	 #, _22, _58,
	lb	$4,31($4)		 # Pathfinder_34(D)->Direction, Pathfinder_34(D)->Direction

$L24:
 # Library/Player/Pathfinding.c:75:                 || (Pathfinder->NearestMarker < 0) 
	bltz	$3,$L65	 #, _22,
	li	$2,1			# 0x1	 # iftmp.6_32,

	b	$L30
	nop
	 #
$L63:
 # Library/Player/Pathfinding.c:74:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp281,
	bne	$4,$2,$L24
	nop
	 #, Pathfinder_34(D)->Direction, tmp281,
	jr	$31
	nop
	 #
$L43:
 # Library/Player/Pathfinding.c:76:                 || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.6_32,

$L61:
	jr	$31	 #
	li	$2,1			# 0x1	 # iftmp.6_32,

$L56:
 # Library/Player/Pathfinding.c:46:                 || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp294,
	bne	$4,$2,$L26
	nop
	 #, Pathfinder_34(D)->Direction, tmp294,
 # Library/Player/Pathfinding.c:48:                 || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
	jr	$31
	nop
	 #
$L62:
 # Library/Player/Pathfinding.c:74:                 || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp296,
	bne	$4,$2,$L30
	nop
	 #, Pathfinder_34(D)->Direction, tmp296,
 # Library/Player/Pathfinding.c:76:                 || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
	jr	$31
	nop
	 #
$L59:
 # Library/Player/Pathfinding.c:60:                 || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
	li	$2,1			# 0x1	 # tmp298,
	bne	$4,$2,$L28
	nop
	 #, Pathfinder_34(D)->Direction, tmp298,
 # Library/Player/Pathfinding.c:62:                 || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
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
 # Library/Player/Pathfinding.c:91:     float TargetHeightDifference = pow(CurrentPosition[1] - TargetY, 2);//Square to get absolute distance. 
	lwc1	$f10,4($4)	 # _1, MEM[(float *)CurrentPosition_104(D) + 4B]
 # Library/Player/Pathfinding.c:91:     float TargetHeightDifference = pow(CurrentPosition[1] - TargetY, 2);//Square to get absolute distance. 
	sub.s	$f12,$f10,$f4	 # _2, _1, TargetY
 # Library/Player/Pathfinding.c:93:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	lh	$11,22($sp)		 # _139, PathCount
 # Library/Player/Pathfinding.c:93:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	blez	$11,$L77	 #, _139,
	mul.s	$f12,$f12,$f12	 # _17, _2, _2

	move	$9,$7	 # ivtmp.70, PathArray
	lw	$8,16($sp)		 # ivtmp.71, MarkerCounts
 # Library/Player/Pathfinding.c:93:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	move	$6,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:90:     short use_this_marker=0;
	move	$12,$0	 # use_this_marker,
 # Library/Player/Pathfinding.c:89:     short use_this_path= -1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
 # Library/Player/Pathfinding.c:86:     float Distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp283,
	lwc1	$f6,%lo($LC0)($3)	 # Distance,
 # Library/Player/Pathfinding.c:100:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	lwc1	$f8,24($sp)	 # HeightCheckSquared, HeightCheckSquared
	cvt.d.s	$f8,$f8	 # _21, HeightCheckSquared
 # Library/Player/Pathfinding.c:110:                     use_this_marker = 0;
	b	$L76	 #
	move	$13,$0	 # use_this_marker,

$L68:
 # Library/Player/Pathfinding.c:115:         if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
	sub.s	$f0,$f10,$f0	 # tmp303, _1, path_height_end_node
$L87:
 # Library/Player/Pathfinding.c:115:         if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
	cvt.d.s	$f0,$f0	 # _43, tmp303
	mul.d	$f0,$f0,$f0	 # tmp304, _43, _43
 # Library/Player/Pathfinding.c:115:         if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
	c.lt.d	$f0,$f8	 #, tmp304, _21
	nop	
	bc1tl	$L85	 #,,
	sub.s	$f0,$f14,$f4	 # tmp305, path_height_start_node, TargetY

$L72:
 # Library/Player/Pathfinding.c:93:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$6,$6,1	 # ThisPath, ThisPath,
$L88:
 # Library/Player/Pathfinding.c:93:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$9,$9,4	 # ivtmp.70, ivtmp.70,
	beq	$6,$11,$L86	 #, ThisPath, _139,
	addiu	$8,$8,2	 # ivtmp.71, ivtmp.71,

$L76:
 # Library/Player/Pathfinding.c:95:         path_height_start_node = (float)PathArray[ThisPath][0].Position[1];
	lw	$14,0($9)		 # _8, MEM[base: _47, offset: 0B]
 # Library/Player/Pathfinding.c:95:         path_height_start_node = (float)PathArray[ThisPath][0].Position[1];
	lh	$3,2($14)		 # _8->Position, _8->Position
	mtc1	$3,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f14,$f0	 # path_height_start_node, _8->Position
 # Library/Player/Pathfinding.c:96:         path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
	lh	$10,0($8)		 # _12, MEM[base: _127, offset: 0B]
 # Library/Player/Pathfinding.c:96:         path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
	sll	$3,$10,3	 # tmp285, _12,
	addu	$3,$14,$3	 # _15, _8, tmp285
 # Library/Player/Pathfinding.c:96:         path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
	lh	$15,2($3)		 # _15->Position, _15->Position
	mtc1	$15,$f0	 # _15->Position, _15->Position
 # Library/Player/Pathfinding.c:100:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	sub.s	$f2,$f10,$f14	 # tmp287, _1, path_height_start_node
 # Library/Player/Pathfinding.c:100:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	cvt.d.s	$f2,$f2	 # _19, tmp287
	mul.d	$f2,$f2,$f2	 # tmp288, _19, _19
 # Library/Player/Pathfinding.c:100:         if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
	c.lt.d	$f2,$f8	 #, tmp288, _21
	nop	
	bc1f	$L68	 #,,
	cvt.s.w	$f0,$f0	 # path_height_end_node, _15->Position

 # Library/Player/Pathfinding.c:102:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	sub.s	$f2,$f0,$f4	 # tmp289, path_height_end_node, TargetY
 # Library/Player/Pathfinding.c:102:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f2,$f2	 # _23, tmp289
 # Library/Player/Pathfinding.c:102:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f16,$f12	 # tmp290, _17
 # Library/Player/Pathfinding.c:102:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	mul.d	$f2,$f2,$f2	 # tmp291, _23, _23
 # Library/Player/Pathfinding.c:102:             if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
	c.lt.d	$f2,$f16	 #, tmp291, tmp290
	nop	
	bc1fl	$L87	 #,,
	sub.s	$f0,$f10,$f0	 # tmp303, _1, path_height_end_node

 # Library/Player/Pathfinding.c:104:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
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
 # Library/Player/Pathfinding.c:104:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
	cvt.s.d	$f2,$f2	 # CheckDistance, tmp302
 # Library/Player/Pathfinding.c:106:                 if (CheckDistance < Distance)
	c.lt.s	$f2,$f6	 #, CheckDistance, Distance
	nop	
	bc1fl	$L87	 #,,
	sub.s	$f0,$f10,$f0	 # tmp303, _1, path_height_end_node

 # Library/Player/Pathfinding.c:109:                     use_this_path = ThisPath;
	sll	$2,$6,16	 # use_this_path, ThisPath,
	sra	$2,$2,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:108:                     Distance = CheckDistance;
	mov.s	$f6,$f2	 # Distance, CheckDistance
 # Library/Player/Pathfinding.c:110:                     use_this_marker = 0;
	b	$L68	 #
	move	$12,$13	 # use_this_marker, use_this_marker

$L85:
 # Library/Player/Pathfinding.c:117:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f0,$f0	 # _46, tmp305
 # Library/Player/Pathfinding.c:117:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	cvt.d.s	$f2,$f12	 # tmp306, _17
 # Library/Player/Pathfinding.c:117:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	mul.d	$f0,$f0,$f0	 # tmp307, _46, _46
 # Library/Player/Pathfinding.c:117:             if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
	c.lt.d	$f0,$f2	 #, tmp307, tmp306
	nop	
	bc1fl	$L88	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:119:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[0], 
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
 # Library/Player/Pathfinding.c:119:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp318
 # Library/Player/Pathfinding.c:121:                 if (CheckDistance < Distance)
	c.lt.s	$f0,$f6	 #, CheckDistance, Distance
	nop	
	bc1fl	$L88	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:124:                     use_this_path = ThisPath;
	sll	$2,$6,16	 # use_this_path, ThisPath,
	sra	$2,$2,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:125:                     use_this_marker = MarkerCounts[ThisPath];
	move	$12,$10	 # use_this_marker, _12
 # Library/Player/Pathfinding.c:123:                     Distance = CheckDistance;
	b	$L72	 #
	mov.s	$f6,$f0	 # Distance, CheckDistance

$L86:
 # Library/Player/Pathfinding.c:130:     if (use_this_path != -1)
	li	$3,-1			# 0xffffffffffffffff	 # tmp319,
	beq	$2,$3,$L89	 #, use_this_path, tmp319,
	sll	$3,$2,2	 # tmp320, use_this_path,

 # Library/Player/Pathfinding.c:132:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	addu	$7,$7,$3	 # _75, PathArray, tmp320
 # Library/Player/Pathfinding.c:132:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	sll	$12,$12,3	 # _78, use_this_marker,
 # Library/Player/Pathfinding.c:132:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	lw	$3,0($7)		 # *_75, *_75
	addu	$3,$3,$12	 # tmp322, *_75, _78
 # Library/Player/Pathfinding.c:132:             FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
	lh	$3,0($3)		 # _79->Position, _79->Position
	mtc1	$3,$f0	 # _79->Position, _79->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp324, _79->Position
	swc1	$f0,0($5)	 # tmp324, *FoundNodePosition_111(D)
 # Library/Player/Pathfinding.c:133:             FoundNodePosition[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
	lw	$3,0($7)		 # *_75, *_75
	addu	$3,$3,$12	 # tmp326, *_75, _78
 # Library/Player/Pathfinding.c:133:             FoundNodePosition[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
	lh	$3,2($3)		 # _83->Position, _83->Position
	mtc1	$3,$f0	 # _83->Position, _83->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp328, _83->Position
	swc1	$f0,4($5)	 # tmp328, MEM[(float *)FoundNodePosition_111(D) + 4B]
 # Library/Player/Pathfinding.c:134:             FoundNodePosition[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
	lw	$3,0($7)		 # *_75, *_75
	addu	$12,$3,$12	 # tmp330, *_75, _78
 # Library/Player/Pathfinding.c:134:             FoundNodePosition[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
	lh	$3,4($12)		 # _87->Position, _87->Position
	mtc1	$3,$f0	 # _87->Position, _87->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp332, _87->Position
	jr	$31	 #
	swc1	$f0,8($5)	 # tmp332, MEM[(float *)FoundNodePosition_111(D) + 8B]

$L77:
 # Library/Player/Pathfinding.c:89:     short use_this_path= -1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
$L89:
 # Library/Player/Pathfinding.c:138: }
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
 # Library/Player/Pathfinding.c:146:     float player_x = CurrentPosition[0];
	lwc1	$f12,0($4)	 # player_x, *CurrentPosition_22(D)
 # Library/Player/Pathfinding.c:147:     float player_y = CurrentPosition[1];
	lwc1	$f10,4($4)	 # player_y, MEM[(float *)CurrentPosition_22(D) + 4B]
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lui	$2,%hi(ItemBoxCount)	 # tmp227,
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lh	$2,%lo(ItemBoxCount)($2)		 # ItemBoxCount, ItemBoxCount
	blez	$2,$L97	 #, ItemBoxCount,
	lwc1	$f14,8($4)	 # player_z, MEM[(float *)CurrentPosition_22(D) + 8B]

	mtc1	$6,$f8	 # HeightCheckSquared, tmp268
	lui	$6,%hi(ItemBoxIndex)	 # tmp229,
	addiu	$6,$6,%lo(ItemBoxIndex)	 # ivtmp.77, tmp229,
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	move	$8,$0	 # ThisItemBox,
 # Library/Player/Pathfinding.c:151:     int found_item_box = -1;
	li	$2,-1			# 0xffffffffffffffff	 # <retval>,
 # Library/Player/Pathfinding.c:149:     float distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp226,
	lwc1	$f4,%lo($LC0)($3)	 # distance,
 # Library/Player/Pathfinding.c:157:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	lui	$9,%hi(g_SimpleObjectArray)	 # tmp230,
	addiu	$9,$9,%lo(g_SimpleObjectArray)	 # tmp236, tmp230,
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	cvt.d.s	$f8,$f8	 # tmp237, HeightCheckSquared
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	mtc1	$0,$f6	 #, tmp264
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	slt	$10,$7,4	 # tmp265, courseType,
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	b	$L102	 #
	lui	$7,%hi(ItemBoxCount)	 # tmp260,

$L97:
 # Library/Player/Pathfinding.c:183:     return found_item_box;
	jr	$31	 #
	li	$2,-1			# 0xffffffffffffffff	 # <retval>,

$L110:
 # Library/Player/Pathfinding.c:184: }
	ldc1	$f20,0($sp)	 #,
	jr	$31	 #
	addiu	$sp,$sp,8	 #,,

$L104:
$L112:
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lh	$3,%lo(ItemBoxCount)($7)		 # ItemBoxCount, ItemBoxCount
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	slt	$3,$8,$3	 # tmp262, ThisItemBox, ItemBoxCount
	beq	$3,$0,$L114	 #, tmp262,,
	addiu	$6,$6,2	 # ivtmp.77, ivtmp.77,

$L102:
 # Library/Player/Pathfinding.c:157:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	lh	$4,0($6)		 # _1, MEM[base: _35, offset: 0B]
 # Library/Player/Pathfinding.c:157:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	sll	$3,$4,3	 # tmp233, _1,
	subu	$3,$3,$4	 # tmp234, tmp233, _1
	sll	$3,$3,4	 # tmp235, tmp234,
	addu	$3,$3,$9	 # tmp231, tmp235, tmp236
	lwc1	$f16,28($3)	 # item_box_position_y, g_SimpleObjectArray[_1].position
 # Library/Player/Pathfinding.c:158:         float diff_y = item_box_position_y - player_y;
	sub.s	$f2,$f16,$f10	 # diff_y, item_box_position_y, player_y
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	cvt.d.s	$f0,$f2	 # _2, diff_y
	mul.d	$f0,$f0,$f0	 # tmp238, _2, _2
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	c.lt.d	$f0,$f8	 #, tmp238, tmp237
	nop	
	bc1fl	$L112	 #,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	c.le.s	$f6,$f2	 #, tmp264, diff_y
	nop	
	bc1t	$L108
	nop
	 #,,
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	bnel	$10,$0,$L104	 #, tmp265,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

$L108:
 # Library/Player/Pathfinding.c:144: {   
	addiu	$sp,$sp,-8	 #,,
	sdc1	$f20,0($sp)	 #,
 # Library/Player/Pathfinding.c:161:             float item_box_position_x = g_SimpleObjectArray[i].position[0];
	sll	$3,$4,3	 # tmp244, _1,
$L111:
	subu	$3,$3,$4	 # tmp245, tmp244, _1
$L115:
	sll	$3,$3,4	 # tmp246, tmp245,
	addu	$3,$3,$9	 # tmp242, tmp246, tmp236
	lwc1	$f20,24($3)	 # item_box_position_x, g_SimpleObjectArray[_1].position
 # Library/Player/Pathfinding.c:162:             float item_box_position_z = g_SimpleObjectArray[i].position[2];
	lwc1	$f18,32($3)	 # item_box_position_z, g_SimpleObjectArray[_1].position
 # Library/Player/Pathfinding.c:163:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	sub.s	$f2,$f20,$f12	 # tmp255, item_box_position_x, player_x
 # Library/Player/Pathfinding.c:163:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	cvt.d.s	$f2,$f2	 # _6, tmp255
 # Library/Player/Pathfinding.c:164:                             pow(item_box_position_z - player_z, 2);
	sub.s	$f0,$f18,$f14	 # tmp256, item_box_position_z, player_z
 # Library/Player/Pathfinding.c:164:                             pow(item_box_position_z - player_z, 2);
	cvt.d.s	$f0,$f0	 # _9, tmp256
	mul.d	$f0,$f0,$f0	 # tmp257, _9, _9
 # Library/Player/Pathfinding.c:163:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	mul.d	$f2,$f2,$f2	 # tmp258, _6, _6
 # Library/Player/Pathfinding.c:163:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	add.d	$f0,$f0,$f2	 # tmp259, tmp257, tmp258
 # Library/Player/Pathfinding.c:163:             CheckDistance = pow(item_box_position_x - player_x, 2) +
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp259
 # Library/Player/Pathfinding.c:165:             if (CheckDistance < distance)
	c.lt.s	$f0,$f4	 #, CheckDistance, distance
	nop	
	bc1f	$L113	 #,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

 # Library/Player/Pathfinding.c:169:                 FoundItemBoxPosition[0] = item_box_position_x;
	swc1	$f20,0($5)	 # item_box_position_x, *FoundItemBoxPosition_37(D)
 # Library/Player/Pathfinding.c:170:                 FoundItemBoxPosition[1] = item_box_position_y;
	swc1	$f16,4($5)	 # item_box_position_y, MEM[(float *)FoundItemBoxPosition_37(D) + 4B]
 # Library/Player/Pathfinding.c:171:                 FoundItemBoxPosition[2] = item_box_position_z;
	swc1	$f18,8($5)	 # item_box_position_z, MEM[(float *)FoundItemBoxPosition_37(D) + 8B]
 # Library/Player/Pathfinding.c:172:                 found_item_box = i;
	move	$2,$4	 # <retval>, _1
 # Library/Player/Pathfinding.c:167:                 distance = CheckDistance;
	mov.s	$f4,$f0	 # distance, CheckDistance
$L113:
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	lh	$3,%lo(ItemBoxCount)($7)		 # ItemBoxCount, ItemBoxCount
 # Library/Player/Pathfinding.c:154:     for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
	slt	$3,$8,$3	 # tmp262, ThisItemBox, ItemBoxCount
	beq	$3,$0,$L110	 #, tmp262,,
	addiu	$6,$6,2	 # ivtmp.77, ivtmp.77,

 # Library/Player/Pathfinding.c:157:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	lh	$4,0($6)		 # _1, MEM[base: _35, offset: 0B]
 # Library/Player/Pathfinding.c:157:         float item_box_position_y = g_SimpleObjectArray[i].position[1];
	sll	$3,$4,3	 # tmp233, _1,
	subu	$3,$3,$4	 # tmp234, tmp233, _1
	sll	$3,$3,4	 # tmp235, tmp234,
	addu	$3,$3,$9	 # tmp231, tmp235, tmp236
	lwc1	$f16,28($3)	 # item_box_position_y, g_SimpleObjectArray[_1].position
 # Library/Player/Pathfinding.c:158:         float diff_y = item_box_position_y - player_y;
	sub.s	$f2,$f16,$f10	 # diff_y, item_box_position_y, player_y
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	cvt.d.s	$f0,$f2	 # _2, diff_y
	mul.d	$f0,$f0,$f0	 # tmp238, _2, _2
 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	c.lt.d	$f0,$f8	 #, tmp238, tmp237
	nop	
	bc1fl	$L113	 #,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	c.le.s	$f6,$f2	 #, tmp264, diff_y
	nop	
	bc1t	$L111	 #,,
	sll	$3,$4,3	 # tmp244, _1,

 # Library/Player/Pathfinding.c:159:         if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
	bnel	$10,$0,$L113	 #, tmp265,,
	addiu	$8,$8,1	 # ThisItemBox, ThisItemBox,

	b	$L115	 #
	subu	$3,$3,$4	 # tmp245, tmp244, _1

$L114:
 # Library/Player/Pathfinding.c:184: }
	jr	$31
	nop
	 #
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
 # Library/Player/Pathfinding.c:197:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	lh	$9,22($sp)		 # _68, PathCount
 # Library/Player/Pathfinding.c:197:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	blez	$9,$L122	 #, _68,
	move	$8,$7	 # ivtmp.82, PathArray

 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lwc1	$f10,4($4)	 # _1, MEM[(float *)CurrentPosition_56(D) + 4B]
 # Library/Player/Pathfinding.c:197:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	move	$6,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:194:     short use_this_path=-1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
 # Library/Player/Pathfinding.c:192:     float Distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp242,
	lwc1	$f4,%lo($LC0)($3)	 # Distance,
 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lwc1	$f8,24($sp)	 # HeightCheckSquared, HeightCheckSquared
	b	$L121	 #
	cvt.d.s	$f8,$f8	 # tmp246, HeightCheckSquared

$L118:
 # Library/Player/Pathfinding.c:197:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$6,$6,1	 # ThisPath, ThisPath,
$L127:
 # Library/Player/Pathfinding.c:197:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	beq	$6,$9,$L126	 #, ThisPath, _68,
	addiu	$8,$8,4	 # ivtmp.82, ivtmp.82,

$L121:
 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lw	$10,0($8)		 # _5, MEM[base: _60, offset: 0B]
 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	lh	$3,2($10)		 # _5->Position, _5->Position
	mtc1	$3,$f0	 # _5->Position, _5->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp243, _5->Position
 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	sub.s	$f0,$f10,$f0	 # tmp245, _1, tmp243
 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	cvt.d.s	$f0,$f0	 # _9, tmp245
	mul.d	$f0,$f0,$f0	 # tmp247, _9, _9
 # Library/Player/Pathfinding.c:201:         if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
	c.lt.d	$f0,$f8	 #, tmp247, tmp246
	nop	
	bc1fl	$L127	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:205:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
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
 # Library/Player/Pathfinding.c:205:                 CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp258
 # Library/Player/Pathfinding.c:207:                 if (CheckDistance < Distance)
	c.lt.s	$f0,$f4	 #, CheckDistance, Distance
	nop	
	bc1fl	$L127	 #,,
	addiu	$6,$6,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:210:                     use_this_path = ThisPath;
	sll	$2,$6,16	 # use_this_path, ThisPath,
	sra	$2,$2,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:209:                     Distance = CheckDistance;
	b	$L118	 #
	mov.s	$f4,$f0	 # Distance, CheckDistance

$L126:
 # Library/Player/Pathfinding.c:218:     if (use_this_path != -1) //If a drop was actually found
	li	$3,-1			# 0xffffffffffffffff	 # tmp259,
	beq	$2,$3,$L128	 #, use_this_path, tmp259,
	sll	$3,$2,2	 # tmp260, use_this_path,

 # Library/Player/Pathfinding.c:221:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	addu	$7,$7,$3	 # _30, PathArray, tmp260
 # Library/Player/Pathfinding.c:221:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lw	$3,0($7)		 # *_30, *_30
 # Library/Player/Pathfinding.c:221:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lh	$3,0($3)		 # _31->Position, _31->Position
	mtc1	$3,$f0	 # _31->Position, _31->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp263, _31->Position
	swc1	$f0,0($5)	 # tmp263, *FoundNodePosition_51(D)
 # Library/Player/Pathfinding.c:222:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lw	$3,0($7)		 # *_30, *_30
 # Library/Player/Pathfinding.c:222:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lh	$3,2($3)		 # _34->Position, _34->Position
	mtc1	$3,$f0	 # _34->Position, _34->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp266, _34->Position
	swc1	$f0,4($5)	 # tmp266, MEM[(float *)FoundNodePosition_51(D) + 4B]
 # Library/Player/Pathfinding.c:223:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lw	$3,0($7)		 # *_30, *_30
 # Library/Player/Pathfinding.c:223:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lh	$3,4($3)		 # _37->Position, _37->Position
	mtc1	$3,$f0	 # _37->Position, _37->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp269, _37->Position
	jr	$31	 #
	swc1	$f0,8($5)	 # tmp269, MEM[(float *)FoundNodePosition_51(D) + 8B]

$L122:
 # Library/Player/Pathfinding.c:194:     short use_this_path=-1;
	li	$2,-1			# 0xffffffffffffffff	 # use_this_path,
$L128:
 # Library/Player/Pathfinding.c:228: }
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
 # Library/Player/Pathfinding.c:239:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	lh	$7,18($sp)		 # _65, PathCount
 # Library/Player/Pathfinding.c:239:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	blez	$7,$L138	 #, _65,
	move	$3,$0	 # ThisPath,

 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	lwc1	$f12,0($4)	 # _7, *CurrentPosition_54(D)
 # Library/Player/Pathfinding.c:244:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	lwc1	$f10,4($4)	 # _14, MEM[(float *)CurrentPosition_54(D) + 4B]
 # Library/Player/Pathfinding.c:245:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	lwc1	$f8,8($4)	 # _22, MEM[(float *)CurrentPosition_54(D) + 8B]
	move	$4,$6	 # ivtmp.88, PathArray
 # Library/Player/Pathfinding.c:237:     short use_this_path=-1;
	li	$8,-1			# 0xffffffffffffffff	 # use_this_path,
 # Library/Player/Pathfinding.c:235:     float Distance = -99999999.0;
	lui	$2,%hi($LC1)	 # tmp239,
	b	$L133	 #
	lwc1	$f4,%lo($LC1)($2)	 # Distance,

$L131:
 # Library/Player/Pathfinding.c:239:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	addiu	$3,$3,1	 # ThisPath, ThisPath,
$L137:
 # Library/Player/Pathfinding.c:239:     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
	beq	$3,$7,$L136	 #, ThisPath, _65,
	addiu	$4,$4,4	 # ivtmp.88, ivtmp.88,

$L133:
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	lw	$9,0($4)		 # _4, MEM[base: _56, offset: 0B]
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	lh	$2,0($9)		 # _4->Position, _4->Position
	mtc1	$2,$f0	 # _4->Position, _4->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp240, _4->Position
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	sub.s	$f0,$f0,$f12	 # tmp242, tmp240, _7
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	cvt.d.s	$f0,$f0	 # _9, tmp242
 # Library/Player/Pathfinding.c:244:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	lh	$2,2($9)		 # _4->Position, _4->Position
	mtc1	$2,$f2	 # _4->Position, _4->Position
	nop	
	cvt.s.w	$f6,$f2	 # tmp243, _4->Position
 # Library/Player/Pathfinding.c:244:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	sub.s	$f6,$f6,$f10	 # tmp245, tmp243, _14
 # Library/Player/Pathfinding.c:244:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	cvt.d.s	$f6,$f6	 # _16, tmp245
 # Library/Player/Pathfinding.c:245:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	lh	$2,4($9)		 # _4->Position, _4->Position
	mtc1	$2,$f2	 # _4->Position, _4->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp246, _4->Position
 # Library/Player/Pathfinding.c:245:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	sub.s	$f2,$f2,$f8	 # tmp248, tmp246, _22
 # Library/Player/Pathfinding.c:245:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	cvt.d.s	$f2,$f2	 # _24, tmp248
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	mul.d	$f0,$f0,$f0	 # tmp249, _9, _9
 # Library/Player/Pathfinding.c:244:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	mul.d	$f6,$f6,$f6	 # tmp250, _16, _16
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	add.d	$f0,$f0,$f6	 # tmp251, tmp249, tmp250
 # Library/Player/Pathfinding.c:245:                         pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
	mul.d	$f2,$f2,$f2	 # tmp252, _24, _24
 # Library/Player/Pathfinding.c:244:                         pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
	add.d	$f0,$f0,$f2	 # tmp253, tmp251, tmp252
 # Library/Player/Pathfinding.c:243:         CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp253
 # Library/Player/Pathfinding.c:246:         if (CheckDistance > Distance)
	c.lt.s	$f4,$f0	 #, Distance, CheckDistance
	nop	
	bc1fl	$L137	 #,,
	addiu	$3,$3,1	 # ThisPath, ThisPath,

 # Library/Player/Pathfinding.c:249:             use_this_path = ThisPath;
	sll	$8,$3,16	 # use_this_path, ThisPath,
	sra	$8,$8,16	 # use_this_path, use_this_path,
 # Library/Player/Pathfinding.c:248:             Distance = CheckDistance;
	b	$L131	 #
	mov.s	$f4,$f0	 # Distance, CheckDistance

$L136:
 # Library/Player/Pathfinding.c:253:     if (use_this_path != -1) //If a drop was actually found
	li	$2,-1			# 0xffffffffffffffff	 # tmp254,
	beq	$8,$2,$L138	 #, use_this_path, tmp254,
	sll	$8,$8,2	 # tmp255, use_this_path,

 # Library/Player/Pathfinding.c:256:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	addu	$8,$6,$8	 # _30, PathArray, tmp255
 # Library/Player/Pathfinding.c:256:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lw	$2,0($8)		 # *_30, *_30
 # Library/Player/Pathfinding.c:256:         FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
	lh	$2,0($2)		 # _31->Position, _31->Position
	mtc1	$2,$f0	 # _31->Position, _31->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp258, _31->Position
	swc1	$f0,0($5)	 # tmp258, *FoundNodePosition_50(D)
 # Library/Player/Pathfinding.c:257:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lw	$2,0($8)		 # *_30, *_30
 # Library/Player/Pathfinding.c:257:         FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
	lh	$2,2($2)		 # _34->Position, _34->Position
	mtc1	$2,$f0	 # _34->Position, _34->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp261, _34->Position
	swc1	$f0,4($5)	 # tmp261, MEM[(float *)FoundNodePosition_50(D) + 4B]
 # Library/Player/Pathfinding.c:258:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lw	$2,0($8)		 # *_30, *_30
 # Library/Player/Pathfinding.c:258:         FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
	lh	$2,4($2)		 # _37->Position, _37->Position
	mtc1	$2,$f0	 # _37->Position, _37->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp264, _37->Position
	swc1	$f0,8($5)	 # tmp264, MEM[(float *)FoundNodePosition_50(D) + 8B]
$L138:
 # Library/Player/Pathfinding.c:260: }
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
 # Library/Player/Pathfinding.c:276:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	bltz	$6,$L147	 #, Markercount,
	lh	$2,18($sp)		 # defaultMarker, defaultMarker

 # Library/Player/Pathfinding.c:278:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
	sll	$7,$7,2	 # tmp229, ThisPath,
	addu	$5,$5,$7	 # tmp230, PathArray, tmp229
	lw	$5,0($5)		 # _4, *_3
	lwc1	$f8,0($4)	 # _10, *CurrentPosition_36(D)
	lwc1	$f6,8($4)	 # _18, MEM[(float *)CurrentPosition_36(D) + 8B]
	move	$7,$5	 # ivtmp.94, _4
	addiu	$5,$5,4	 # ivtmp.95, _4,
	addiu	$6,$6,1	 # _55, Markercount,
 # Library/Player/Pathfinding.c:276:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	move	$4,$0	 # ThisMarker,
 # Library/Player/Pathfinding.c:273:     float Distance = 99999999.0;
	lui	$3,%hi($LC0)	 # tmp228,
	b	$L143	 #
	lwc1	$f4,%lo($LC0)($3)	 # Distance,

$L141:
 # Library/Player/Pathfinding.c:276:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	addiu	$4,$4,1	 # ThisMarker, ThisMarker,
$L146:
 # Library/Player/Pathfinding.c:276:     for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
	addiu	$7,$7,8	 # ivtmp.94, ivtmp.94,
	beq	$4,$6,$L147	 #, ThisMarker, _55,
	addiu	$5,$5,8	 # ivtmp.95, ivtmp.95,

$L143:
 # Library/Player/Pathfinding.c:278:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
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
 # Library/Player/Pathfinding.c:278:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp239
 # Library/Player/Pathfinding.c:280:         if (CheckDistance < Distance)
	c.lt.s	$f0,$f4	 #, CheckDistance, Distance
	nop	
	bc1fl	$L146	 #,,
	addiu	$4,$4,1	 # ThisMarker, ThisMarker,

 # Library/Player/Pathfinding.c:283:             use_this_marker = ThisMarker;
	sll	$2,$4,16	 # defaultMarker, ThisMarker,
	sra	$2,$2,16	 # defaultMarker, defaultMarker,
 # Library/Player/Pathfinding.c:282:             Distance = CheckDistance;
	b	$L141	 #
	mov.s	$f4,$f0	 # Distance, CheckDistance

$L147:
 # Library/Player/Pathfinding.c:288: }
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
 # Library/Player/Pathfinding.c:302:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	blez	$6,$L161	 #, PathCount,
	lh	$8,86($sp)		 # PlayerID, PlayerID

 # Library/Player/Pathfinding.c:306:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	lwc1	$f18,8($4)	 # _12, Pathfinder_125(D)->Target
	lwc1	$f16,16($4)	 # _20, Pathfinder_125(D)->Target
 # Library/Player/Pathfinding.c:321:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
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
	move	$4,$7	 # ivtmp.104, MarkerCounts
	move	$3,$18	 # ivtmp.105, PathArray
 # Library/Player/Pathfinding.c:302:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	move	$2,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:301:     float DistanceToBot = 99999999.0f;
	lui	$5,%hi($LC0)	 # tmp291,
	lwc1	$f2,%lo($LC0)($5)	 # DistanceToBot,
 # Library/Player/Pathfinding.c:300:     float DistanceToTarget = 99999999.0f;
	mov.s	$f4,$f2	 # DistanceToTarget, DistanceToBot
 # Library/Player/Pathfinding.c:296:     short nearestToBotPath = -1;
	li	$16,-1			# 0xffffffffffffffff	 # ThisPath,
 # Library/Player/Pathfinding.c:295:     short nearestToTargetPath = -1;
	b	$L158	 #
	li	$5,-1			# 0xffffffffffffffff	 # nearestToTargetPath,

$L156:
	addiu	$2,$2,1	 # tmp343, ThisPath,
$L175:
	sll	$2,$2,16	 # ThisPath, tmp343,
	sra	$2,$2,16	 # ThisPath, ThisPath,
 # Library/Player/Pathfinding.c:302:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	addiu	$4,$4,2	 # ivtmp.104, ivtmp.104,
	beq	$6,$2,$L170	 #, PathCount, ThisPath,
	addiu	$3,$3,4	 # ivtmp.105, ivtmp.105,

$L158:
 # Library/Player/Pathfinding.c:306:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
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
 # Library/Player/Pathfinding.c:306:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f6,$f6	 # CheckDistance, tmp324
 # Library/Player/Pathfinding.c:308:         if (CheckDistance < DistanceToTarget)
	c.lt.s	$f6,$f4	 #, CheckDistance, DistanceToTarget
	nop	
	bc1f	$L172	 #,,
	lh	$9,0($10)		 # _6->Position, _6->Position

 # Library/Player/Pathfinding.c:310:             DistanceToTarget = CheckDistance;
	mov.s	$f4,$f6	 # DistanceToTarget, CheckDistance
 # Library/Player/Pathfinding.c:308:         if (CheckDistance < DistanceToTarget)
	move	$5,$2	 # nearestToTargetPath, ThisPath
$L172:
 # Library/Player/Pathfinding.c:313:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
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
 # Library/Player/Pathfinding.c:313:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f20,$f20	 # CheckDistance, tmp331
 # Library/Player/Pathfinding.c:315:         if (CheckDistance < DistanceToTarget)
	c.lt.s	$f20,$f4	 #, CheckDistance, DistanceToTarget
	nop	
	bc1f	$L173	 #,,
	sub.s	$f0,$f0,$f14	 # tmp332, _11, _45

 # Library/Player/Pathfinding.c:317:             DistanceToTarget = CheckDistance;
	mov.s	$f4,$f20	 # DistanceToTarget, CheckDistance
 # Library/Player/Pathfinding.c:315:         if (CheckDistance < DistanceToTarget)
	move	$5,$2	 # nearestToTargetPath, ThisPath
$L173:
 # Library/Player/Pathfinding.c:321:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
	cvt.d.s	$f0,$f0	 # _47, tmp332
	sub.s	$f10,$f10,$f12	 # tmp333, _19, _53
	cvt.d.s	$f10,$f10	 # _55, tmp333
	mul.d	$f0,$f0,$f0	 # tmp334, _47, _47
	mul.d	$f10,$f10,$f10	 # tmp335, _55, _55
	add.d	$f0,$f0,$f10	 # tmp336, tmp334, tmp335
 # Library/Player/Pathfinding.c:321:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
	cvt.s.d	$f0,$f0	 # CheckDistance, tmp336
 # Library/Player/Pathfinding.c:323:         if (CheckDistance < DistanceToBot)
	c.lt.s	$f0,$f2	 #, CheckDistance, DistanceToBot
	nop	
	bc1fl	$L174	 #,,
	sub.s	$f0,$f6,$f14	 # tmp337, _27, _45

 # Library/Player/Pathfinding.c:325:             DistanceToBot = CheckDistance;
	mov.s	$f2,$f0	 # DistanceToBot, CheckDistance
 # Library/Player/Pathfinding.c:323:         if (CheckDistance < DistanceToBot)
	move	$16,$2	 # ThisPath, ThisPath
 # Library/Player/Pathfinding.c:328:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
	sub.s	$f0,$f6,$f14	 # tmp337, _27, _45
$L174:
	cvt.d.s	$f0,$f0	 # _63, tmp337
	sub.s	$f6,$f8,$f12	 # tmp338, _34, _53
	cvt.d.s	$f6,$f6	 # _70, tmp338
	mul.d	$f0,$f0,$f0	 # tmp339, _63, _63
	mul.d	$f6,$f6,$f6	 # tmp340, _70, _70
	add.d	$f0,$f0,$f6	 # tmp341, tmp339, tmp340
 # Library/Player/Pathfinding.c:328:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
	cvt.s.d	$f20,$f0	 # CheckDistance, tmp341
 # Library/Player/Pathfinding.c:330:         if (CheckDistance < DistanceToBot)
	c.lt.s	$f20,$f2	 #, CheckDistance, DistanceToBot
	nop	
	bc1fl	$L175	 #,,
	addiu	$2,$2,1	 # tmp343, ThisPath,

 # Library/Player/Pathfinding.c:328:         CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
	mov.s	$f2,$f20	 # DistanceToBot, CheckDistance
 # Library/Player/Pathfinding.c:330:         if (CheckDistance < DistanceToBot)
	b	$L156	 #
	move	$16,$2	 # ThisPath, ThisPath

$L170:
 # Library/Player/Pathfinding.c:341:     if (nearestToTargetPath > nearestToBotPath)
	slt	$2,$16,$5	 # tmp344, ThisPath, nearestToTargetPath
	beq	$2,$0,$L149	 #, tmp344,,
	srl	$2,$6,31	 # tmp346, PathCount,

 # Library/Player/Pathfinding.c:344:         if (diff < PathCount/2)
	addu	$2,$2,$6	 # tmp347, tmp346, PathCount
 # Library/Player/Pathfinding.c:343:         diff = nearestToTargetPath - nearestToBotPath;
	subu	$5,$5,$16	 # tmp351, nearestToTargetPath, ThisPath
 # Library/Player/Pathfinding.c:344:         if (diff < PathCount/2)
	sra	$2,$2,1	 # tmp352, tmp347,
	sll	$5,$5,16	 # tmp353, tmp351,
	sra	$5,$5,16	 # tmp353, tmp353,
	slt	$2,$5,$2	 # tmp354, tmp353, tmp352
	bne	$2,$0,$L159	 #, tmp354,,
	li	$19,1			# 0x1	 # Direction,

 # Library/Player/Pathfinding.c:351:             Direction = -1;           
	li	$19,-1			# 0xffffffffffffffff	 # Direction,
$L159:
 # Library/Player/Pathfinding.c:368:     if (ThisPath == PathCount) //error catch in case we went completeyl around the circle
	beql	$16,$6,$L160	 #, ThisPath, PathCount,
	move	$16,$0	 # ThisPath,

$L160:
 # Library/Player/Pathfinding.c:382:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$2,$16,1	 # tmp365, ThisPath,
	addu	$2,$7,$2	 # tmp366, MarkerCounts, tmp365
 # Library/Player/Pathfinding.c:382:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$4,$8,3	 # tmp369, PlayerID,
	subu	$4,$4,$8	 # tmp370, tmp369, PlayerID
	sll	$4,$4,4	 # tmp371, tmp370,
	subu	$4,$4,$8	 # tmp372, tmp371, PlayerID
	sll	$4,$4,2	 # tmp373, tmp372,
	subu	$8,$4,$8	 # tmp374, tmp373, PlayerID
	sll	$8,$8,3	 # tmp375, tmp374,
	addiu	$8,$8,20	 # tmp376, tmp375,
 # Library/Player/Pathfinding.c:382:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sw	$0,16($sp)	 #,
	move	$7,$16	 #, ThisPath
	lh	$6,0($2)		 #, *_87
	move	$5,$18	 #, PathArray
	lui	$4,%hi(GlobalPlayer)	 # tmp378,
	addiu	$4,$4,%lo(GlobalPlayer)	 # tmp377, tmp378,
	jal	FindNearestMarker	 #
	addu	$4,$4,$8	 #, tmp377, tmp376

 # Library/Player/Pathfinding.c:382:     short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$2,$2,16	 # nearestMarker, tmp412,
	sra	$2,$2,16	 # nearestMarker, nearestMarker,
 # Library/Player/Pathfinding.c:383:     Pathfinder->Distance = CheckDistance;
	swc1	$f20,4($17)	 # CheckDistance, Pathfinder_125(D)->Distance
 # Library/Player/Pathfinding.c:384:     Pathfinder->TargetPath = ThisPath;
	sh	$16,0($17)	 # ThisPath, Pathfinder_125(D)->TargetPath
 # Library/Player/Pathfinding.c:385:     Pathfinder->Progression = nearestMarker;
	sh	$2,20($17)	 # nearestMarker, Pathfinder_125(D)->Progression
 # Library/Player/Pathfinding.c:386:     Pathfinder->Direction = Direction;
	sb	$19,31($17)	 # Direction, Pathfinder_125(D)->Direction
 # Library/Player/Pathfinding.c:387:     Pathfinder->PathType = 0;
	sb	$0,32($17)	 #, Pathfinder_125(D)->PathType
 # Library/Player/Pathfinding.c:388:     Pathfinder->NearestMarker = nearestMarker;
	sh	$2,22($17)	 # nearestMarker, Pathfinder_125(D)->NearestMarker
 # Library/Player/Pathfinding.c:389:     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	sll	$16,$16,2	 # tmp380, ThisPath,
	addu	$16,$18,$16	 # tmp381, PathArray, tmp380
 # Library/Player/Pathfinding.c:389:     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lw	$3,0($16)		 # *_92, *_92
	sll	$2,$2,3	 # tmp383, nearestMarker,
	addu	$2,$3,$2	 # tmp384, *_92, tmp383
 # Library/Player/Pathfinding.c:389:     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lh	$2,2($2)		 # _96->Position, _96->Position
	mtc1	$2,$f0	 # _96->Position, _96->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp386, _96->Position
	swc1	$f0,24($17)	 # tmp386, Pathfinder_125(D)->NearestMarkerHeight
 # Library/Player/Pathfinding.c:390:     Pathfinder->ProgressTimer = 0;
	sh	$0,28($17)	 #, Pathfinder_125(D)->ProgressTimer
 # Library/Player/Pathfinding.c:399: }
	lw	$31,44($sp)		 #,
	lw	$19,40($sp)		 #,
	lw	$18,36($sp)		 #,
	lw	$17,32($sp)		 #,
	lw	$16,28($sp)		 #,
	ldc1	$f22,56($sp)	 #,
	ldc1	$f20,48($sp)	 #,
	jr	$31	 #
	addiu	$sp,$sp,64	 #,,

$L161:
 # Library/Player/Pathfinding.c:299:     float CheckDistance  = 99999999.0f;
	lui	$2,%hi($LC0)	 # tmp293,
	lwc1	$f20,%lo($LC0)($2)	 # CheckDistance,
 # Library/Player/Pathfinding.c:296:     short nearestToBotPath = -1;
	li	$16,-1			# 0xffffffffffffffff	 # ThisPath,
 # Library/Player/Pathfinding.c:295:     short nearestToTargetPath = -1;
	li	$5,-1			# 0xffffffffffffffff	 # nearestToTargetPath,
$L149:
 # Library/Player/Pathfinding.c:357:         if (diff < PathCount/2)
	srl	$2,$6,31	 # tmp356, PathCount,
	addu	$2,$2,$6	 # tmp357, tmp356, PathCount
 # Library/Player/Pathfinding.c:356:         diff = nearestToBotPath - nearestToTargetPath;
	subu	$5,$16,$5	 # tmp361, ThisPath, nearestToTargetPath
 # Library/Player/Pathfinding.c:357:         if (diff < PathCount/2)
	sra	$2,$2,1	 # tmp362, tmp357,
	sll	$5,$5,16	 # tmp363, tmp361,
	sra	$5,$5,16	 # tmp363, tmp363,
	slt	$5,$5,$2	 # tmp364, tmp363, tmp362
	bne	$5,$0,$L159	 #, tmp364,,
	li	$19,-1			# 0xffffffffffffffff	 # Direction,

 # Library/Player/Pathfinding.c:363:             Direction = 1;
	b	$L159	 #
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
	move	$20,$4	 # Pathfinder, tmp464
	sw	$5,116($sp)	 # tmp465, FirstMarkerDistance
	sw	$6,120($sp)	 # tmp466, PathArray
	sw	$7,124($sp)	 # tmp467, MarkerCounts
	lh	$23,130($sp)		 # PathCount, PathCount
	lh	$4,134($sp)		 # PlayerID, PlayerID
	lb	$2,139($sp)		 # TypeOfPath, TypeOfPath
	sw	$2,40($sp)	 # TypeOfPath, %sfp
 # Library/Player/Pathfinding.c:408:     float player_height = GlobalPlayer[PlayerID].position[1];
	lui	$2,%hi(GlobalPlayer)	 # tmp325,
	sll	$3,$4,3	 # tmp329, PlayerID,
	subu	$3,$3,$4	 # tmp330, tmp329, PlayerID
	sll	$3,$3,4	 # tmp331, tmp330,
	subu	$3,$3,$4	 # tmp332, tmp331, PlayerID
	sll	$3,$3,2	 # tmp333, tmp332,
	subu	$3,$3,$4	 # tmp334, tmp333, PlayerID
	sll	$3,$3,3	 # tmp335, tmp334,
	addiu	$2,$2,%lo(GlobalPlayer)	 # tmp326, tmp325,
	addu	$3,$2,$3	 # tmp327, tmp326, tmp335
	lwc1	$f20,24($3)	 # player_height, GlobalPlayer[_1].position
 # Library/Player/Pathfinding.c:412:     Pathfinder->Distance = 99999999.0f; // Set an impossible value to ensure the first return is true. 
	lui	$2,%hi($LC0)	 # tmp336,
	lwc1	$f0,%lo($LC0)($2)	 # tmp337,
	swc1	$f0,4($20)	 # tmp337, Pathfinder_133(D)->Distance
 # Library/Player/Pathfinding.c:417:     if (Pathfinder->TargetPath != -1)
	lh	$2,0($20)		 # _2, Pathfinder_133(D)->TargetPath
 # Library/Player/Pathfinding.c:417:     if (Pathfinder->TargetPath != -1)
	li	$3,-1			# 0xffffffffffffffff	 # tmp338,
	bnel	$2,$3,$L177	 #, _2, tmp338,
	sh	$2,2($20)	 # _2, Pathfinder_133(D)->LastPath

$L177:
 # Library/Player/Pathfinding.c:421:     Pathfinder->TargetPath = -1;     
	li	$2,-1			# 0xffffffffffffffff	 # tmp339,
 # Library/Player/Pathfinding.c:422:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	blez	$23,$L178	 #, PathCount,
	sh	$2,0($20)	 # tmp339, Pathfinder_133(D)->TargetPath

 # Library/Player/Pathfinding.c:432:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	sll	$2,$4,3	 # tmp341, PlayerID,
	subu	$2,$2,$4	 # tmp342, tmp341, PlayerID
	sll	$2,$2,4	 # tmp343, tmp342,
	subu	$2,$2,$4	 # tmp344, tmp343, PlayerID
	sll	$2,$2,2	 # tmp345, tmp344,
	subu	$2,$2,$4	 # tmp346, tmp345, PlayerID
	sll	$2,$2,3	 # tmp347, tmp346,
	addiu	$2,$2,20	 # tmp348, tmp347,
	lui	$3,%hi(GlobalPlayer)	 # tmp350,
	addiu	$3,$3,%lo(GlobalPlayer)	 # tmp349, tmp350,
	addu	$2,$3,$2	 # _24, tmp349, tmp348
	sw	$2,28($sp)	 # _24, %sfp
	lw	$18,124($sp)		 # ivtmp.112, MarkerCounts
	lw	$17,120($sp)		 # ivtmp.113, PathArray
 # Library/Player/Pathfinding.c:422:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	move	$16,$0	 # ThisPath,
 # Library/Player/Pathfinding.c:425:         if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lwc1	$f0,140($sp)	 # tmp476, HeightCheckSquared
	cvt.d.s	$f22,$f0	 # _14, tmp476
 # Library/Player/Pathfinding.c:428:             objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
	lui	$fp,%hi(objectPosition)	 # tmp460,
 # Library/Player/Pathfinding.c:429:             objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
	addiu	$22,$fp,%lo(objectPosition)	 # tmp461, tmp460,
 # Library/Player/Pathfinding.c:432:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	lui	$2,%hi($LC2)	 # tmp462,
	sw	$2,32($sp)	 # tmp462, %sfp
	lwc1	$f0,%lo($LC2)($2)	 # tmp463,
	b	$L185	 #
	swc1	$f0,36($sp)	 # tmp463, %sfp

$L179:
 # Library/Player/Pathfinding.c:468:         if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
	sll	$4,$21,3	 # _57, EndMarker,
$L199:
	lw	$3,0($19)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
$L200:
	addu	$3,$3,$4	 # _58, MEM[base: _195, offset: 0B], _57
 # Library/Player/Pathfinding.c:468:         if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
	lh	$2,2($3)		 # _58->Position, _58->Position
	mtc1	$2,$f0	 # _58->Position, _58->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp395, _58->Position
 # Library/Player/Pathfinding.c:468:         if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
	sub.s	$f0,$f20,$f0	 # tmp397, player_height, tmp395
 # Library/Player/Pathfinding.c:468:         if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
	cvt.d.s	$f0,$f0	 # _62, tmp397
	mul.d	$f0,$f0,$f0	 # tmp398, _62, _62
 # Library/Player/Pathfinding.c:468:         if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
	c.lt.d	$f0,$f22	 #, tmp398, _14
	nop	
	bc1tl	$L196	 #,,
	lh	$2,0($3)		 # _58->Position, _58->Position

$L182:
	addiu	$16,$16,1	 # tmp439, ThisPath,
$L201:
	sll	$16,$16,16	 # ThisPath, tmp439,
	sra	$16,$16,16	 # ThisPath, ThisPath,
 # Library/Player/Pathfinding.c:422:     for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
	addiu	$18,$18,2	 # ivtmp.112, ivtmp.112,
	beq	$23,$16,$L197	 #, PathCount, ThisPath,
	addiu	$17,$17,4	 # ivtmp.113, ivtmp.113,

$L185:
	sw	$18,24($sp)	 # ivtmp.112, %sfp
 # Library/Player/Pathfinding.c:424:         EndMarker = MarkerCounts[ThisPath];
	lh	$21,0($18)		 # EndMarker, MEM[base: _116, offset: 0B]
 # Library/Player/Pathfinding.c:425:         if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lw	$3,0($17)		 # _8, MEM[base: _195, offset: 0B]
 # Library/Player/Pathfinding.c:425:         if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lh	$2,2($3)		 # _8->Position, _8->Position
	mtc1	$2,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp351, _8->Position
 # Library/Player/Pathfinding.c:425:         if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	sub.s	$f0,$f20,$f0	 # tmp353, player_height, tmp351
 # Library/Player/Pathfinding.c:425:         if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	cvt.d.s	$f0,$f0	 # _12, tmp353
	mul.d	$f0,$f0,$f0	 # tmp354, _12, _12
 # Library/Player/Pathfinding.c:425:         if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	c.lt.d	$f0,$f22	 #, tmp354, _14
	nop	
	bc1f	$L179	 #,,
	move	$19,$17	 # _195, ivtmp.113

 # Library/Player/Pathfinding.c:428:             objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
	lh	$2,0($3)		 # _8->Position, _8->Position
	mtc1	$2,$f0	 # _8->Position, _8->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp357, _8->Position
	swc1	$f0,%lo(objectPosition)($fp)	 # tmp357, objectPosition
 # Library/Player/Pathfinding.c:429:             objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
	lw	$2,0($17)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
 # Library/Player/Pathfinding.c:429:             objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
	lh	$2,2($2)		 # _18->Position, _18->Position
	mtc1	$2,$f0	 # _18->Position, _18->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp362, _18->Position
	swc1	$f0,4($22)	 # tmp362, objectPosition
 # Library/Player/Pathfinding.c:430:             objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];
	lw	$2,0($17)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
 # Library/Player/Pathfinding.c:430:             objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];
	lh	$2,4($2)		 # _21->Position, _21->Position
	mtc1	$2,$f0	 # _21->Position, _21->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp367, _21->Position
	swc1	$f0,8($22)	 # tmp367, objectPosition
 # Library/Player/Pathfinding.c:432:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	lw	$7,36($sp)		 #, %sfp
	move	$6,$22	 #, tmp461
	lwc1	$f0,116($sp)	 # tmp485, FirstMarkerDistance
	cvt.s.w	$f0,$f0	 # tmp484, tmp485
	mfc1	$5,$f0	 #, tmp484
	jal	TestCollideSphere	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:432:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
	beq	$2,$0,$L199	 #, tmp468,,
	sll	$4,$21,3	 # _57, EndMarker,

 # Library/Player/Pathfinding.c:434:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	sll	$3,$21,3	 # tmp373, EndMarker,
	lw	$2,0($17)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	addu	$3,$2,$3	 # _30, MEM[base: _195, offset: 0B], tmp373
	lh	$2,0($3)		 # _30->Position, _30->Position
	mtc1	$2,$f0	 # _30->Position, _30->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp375, _30->Position
	lwc1	$f2,8($20)	 # Pathfinder_133(D)->Target, Pathfinder_133(D)->Target
	sub.s	$f0,$f0,$f2	 # tmp377, tmp375, Pathfinder_133(D)->Target
	cvt.d.s	$f0,$f0	 # _35, tmp377
	lh	$2,4($3)		 # _30->Position, _30->Position
	mtc1	$2,$f2	 # _30->Position, _30->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp379, _30->Position
	lwc1	$f4,16($20)	 # Pathfinder_133(D)->Target, Pathfinder_133(D)->Target
	sub.s	$f2,$f2,$f4	 # tmp381, tmp379, Pathfinder_133(D)->Target
	cvt.d.s	$f2,$f2	 # _43, tmp381
	mul.d	$f0,$f0,$f0	 # tmp383, _35, _35
	mul.d	$f2,$f2,$f2	 # tmp384, _43, _43
	add.d	$f0,$f0,$f2	 # tmp385, tmp383, tmp384
 # Library/Player/Pathfinding.c:434:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f24,$f0	 # CheckDistance, tmp385
 # Library/Player/Pathfinding.c:440:                 if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
	lwc1	$f0,4($20)	 # Pathfinder_133(D)->Distance, Pathfinder_133(D)->Distance
	c.lt.s	$f24,$f0	 #, CheckDistance, Pathfinder_133(D)->Distance
	nop	
	bc1fl	$L200	 #,,
	lw	$3,0($19)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]

 # Library/Player/Pathfinding.c:443:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sw	$0,16($sp)	 #,
	move	$7,$16	 #, ThisPath
	lw	$2,24($sp)		 # _116, %sfp
	lh	$6,0($2)		 #, MEM[base: _116, offset: 0B]
	lw	$5,120($sp)		 #, PathArray
	jal	FindNearestMarker	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:443:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
	sll	$2,$2,16	 # nearestMarker, tmp469,
	sra	$2,$2,16	 # nearestMarker, nearestMarker,
 # Library/Player/Pathfinding.c:445:                     Pathfinder->Distance = CheckDistance;
	swc1	$f24,4($20)	 # CheckDistance, Pathfinder_133(D)->Distance
 # Library/Player/Pathfinding.c:446:                     Pathfinder->TargetPath = ThisPath;
	sh	$16,0($20)	 # ThisPath, Pathfinder_133(D)->TargetPath
 # Library/Player/Pathfinding.c:448:                     Pathfinder->Progression = nearestMarker;
	sh	$2,20($20)	 # nearestMarker, Pathfinder_133(D)->Progression
 # Library/Player/Pathfinding.c:449:                     Pathfinder->Direction = 1;
	li	$3,1			# 0x1	 # tmp388,
	sb	$3,31($20)	 # tmp388, Pathfinder_133(D)->Direction
 # Library/Player/Pathfinding.c:450:                     Pathfinder->PathType = TypeOfPath;
	lw	$3,40($sp)		 # TypeOfPath, %sfp
	sb	$3,32($20)	 # TypeOfPath, Pathfinder_133(D)->PathType
 # Library/Player/Pathfinding.c:452:                     Pathfinder->NearestMarker = nearestMarker;
	sh	$2,22($20)	 # nearestMarker, Pathfinder_133(D)->NearestMarker
 # Library/Player/Pathfinding.c:454:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lw	$3,0($17)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	sll	$2,$2,3	 # tmp390, nearestMarker,
	addu	$2,$3,$2	 # tmp391, MEM[base: _195, offset: 0B], tmp390
 # Library/Player/Pathfinding.c:454:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lh	$2,2($2)		 # _52->Position, _52->Position
	mtc1	$2,$f0	 # _52->Position, _52->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp393, _52->Position
	swc1	$f0,24($20)	 # tmp393, Pathfinder_133(D)->NearestMarkerHeight
 # Library/Player/Pathfinding.c:455:                     Pathfinder->ProgressTimer = 0;
	b	$L179	 #
	sh	$0,28($20)	 #, Pathfinder_133(D)->ProgressTimer

$L196:
 # Library/Player/Pathfinding.c:471:             objectPosition[0] = (float)PathArray[ThisPath][EndMarker].Position[0];
	mtc1	$2,$f0	 # _58->Position, _58->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp401, _58->Position
	swc1	$f0,%lo(objectPosition)($fp)	 # tmp401, objectPosition
 # Library/Player/Pathfinding.c:472:             objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
	lw	$2,0($19)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	addu	$2,$2,$4	 # tmp405, MEM[base: _195, offset: 0B], _57
 # Library/Player/Pathfinding.c:472:             objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
	lh	$2,2($2)		 # _69->Position, _69->Position
	mtc1	$2,$f0	 # _69->Position, _69->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp407, _69->Position
	swc1	$f0,4($22)	 # tmp407, objectPosition
 # Library/Player/Pathfinding.c:473:             objectPosition[2] = (float)PathArray[ThisPath][EndMarker].Position[2];
	lw	$2,0($19)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	addu	$4,$2,$4	 # tmp411, MEM[base: _195, offset: 0B], _57
 # Library/Player/Pathfinding.c:473:             objectPosition[2] = (float)PathArray[ThisPath][EndMarker].Position[2];
	lh	$2,4($4)		 # _73->Position, _73->Position
	mtc1	$2,$f0	 # _73->Position, _73->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp413, _73->Position
	swc1	$f0,8($22)	 # tmp413, objectPosition
 # Library/Player/Pathfinding.c:475:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
	lw	$2,32($sp)		 # tmp462, %sfp
	lw	$7,%lo($LC2)($2)		 #,
	move	$6,$22	 #, tmp461
	lwc1	$f0,116($sp)	 # tmp497, FirstMarkerDistance
	cvt.s.w	$f0,$f0	 # tmp496, tmp497
	mfc1	$5,$f0	 #, tmp496
	jal	TestCollideSphere	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:475:             if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
	beql	$2,$0,$L201	 #, tmp470,,
	addiu	$16,$16,1	 # tmp439, ThisPath,

 # Library/Player/Pathfinding.c:478:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	lw	$3,0($19)		 # _79, MEM[base: _195, offset: 0B]
	lh	$2,0($3)		 # _79->Position, _79->Position
	mtc1	$2,$f0	 # _79->Position, _79->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp419, _79->Position
	lwc1	$f2,8($20)	 # Pathfinder_133(D)->Target, Pathfinder_133(D)->Target
	sub.s	$f0,$f0,$f2	 # tmp421, tmp419, Pathfinder_133(D)->Target
	cvt.d.s	$f0,$f0	 # _84, tmp421
	lh	$2,4($3)		 # _79->Position, _79->Position
	mtc1	$2,$f2	 # _79->Position, _79->Position
	nop	
	cvt.s.w	$f2,$f2	 # tmp423, _79->Position
	lwc1	$f4,16($20)	 # Pathfinder_133(D)->Target, Pathfinder_133(D)->Target
	sub.s	$f2,$f2,$f4	 # tmp425, tmp423, Pathfinder_133(D)->Target
	cvt.d.s	$f2,$f2	 # _91, tmp425
	mul.d	$f0,$f0,$f0	 # tmp427, _84, _84
	mul.d	$f2,$f2,$f2	 # tmp428, _91, _91
	add.d	$f0,$f0,$f2	 # tmp429, tmp427, tmp428
 # Library/Player/Pathfinding.c:478:                 CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
	cvt.s.d	$f24,$f0	 # CheckDistance, tmp429
 # Library/Player/Pathfinding.c:483:                 if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
	lwc1	$f0,4($20)	 # Pathfinder_133(D)->Distance, Pathfinder_133(D)->Distance
	c.lt.s	$f24,$f0	 #, CheckDistance, Pathfinder_133(D)->Distance
	nop	
	bc1fl	$L201	 #,,
	addiu	$16,$16,1	 # tmp439, ThisPath,

 # Library/Player/Pathfinding.c:486:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, EndMarker);
	sw	$21,16($sp)	 # EndMarker,
	move	$7,$16	 #, ThisPath
	lw	$2,24($sp)		 # _116, %sfp
	lh	$6,0($2)		 #, MEM[base: _116, offset: 0B]
	lw	$5,120($sp)		 #, PathArray
	jal	FindNearestMarker	 #
	lw	$4,28($sp)		 #, %sfp

 # Library/Player/Pathfinding.c:486:                     nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, EndMarker);
	sll	$2,$2,16	 # nearestMarker, tmp471,
	sra	$2,$2,16	 # nearestMarker, nearestMarker,
 # Library/Player/Pathfinding.c:488:                     Pathfinder->Distance = CheckDistance;
	swc1	$f24,4($20)	 # CheckDistance, Pathfinder_133(D)->Distance
 # Library/Player/Pathfinding.c:489:                     Pathfinder->TargetPath = ThisPath;
	sh	$16,0($20)	 # ThisPath, Pathfinder_133(D)->TargetPath
 # Library/Player/Pathfinding.c:491:                     Pathfinder->Progression = nearestMarker;
	sh	$2,20($20)	 # nearestMarker, Pathfinder_133(D)->Progression
 # Library/Player/Pathfinding.c:492:                     Pathfinder->Direction = -1;
	li	$3,-1			# 0xffffffffffffffff	 # tmp432,
	sb	$3,31($20)	 # tmp432, Pathfinder_133(D)->Direction
 # Library/Player/Pathfinding.c:493:                     Pathfinder->PathType = TypeOfPath;
	lw	$3,40($sp)		 # TypeOfPath, %sfp
	sb	$3,32($20)	 # TypeOfPath, Pathfinder_133(D)->PathType
 # Library/Player/Pathfinding.c:495:                     Pathfinder->NearestMarker = nearestMarker;
	sh	$2,22($20)	 # nearestMarker, Pathfinder_133(D)->NearestMarker
 # Library/Player/Pathfinding.c:497:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lw	$3,0($19)		 # MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	sll	$2,$2,3	 # tmp434, nearestMarker,
	addu	$2,$3,$2	 # tmp435, MEM[base: _195, offset: 0B], tmp434
 # Library/Player/Pathfinding.c:497:                     Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
	lh	$2,2($2)		 # _100->Position, _100->Position
	mtc1	$2,$f0	 # _100->Position, _100->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp437, _100->Position
	swc1	$f0,24($20)	 # tmp437, Pathfinder_133(D)->NearestMarkerHeight
 # Library/Player/Pathfinding.c:498:                     Pathfinder->ProgressTimer = 0;
	b	$L182	 #
	sh	$0,28($20)	 #, Pathfinder_133(D)->ProgressTimer

$L197:
 # Library/Player/Pathfinding.c:514:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	lh	$3,0($20)		 # Pathfinder_133(D)->TargetPath, Pathfinder_133(D)->TargetPath
	li	$2,-1			# 0xffffffffffffffff	 # tmp441,
	beql	$3,$2,$L202	 #, Pathfinder_133(D)->TargetPath, tmp441,
	lh	$3,2($20)		 # _106, Pathfinder_133(D)->LastPath

$L176:
 # Library/Player/Pathfinding.c:534: }
	lw	$31,84($sp)		 #,
$L203:
	lw	$fp,80($sp)		 #,
$L204:
	lw	$23,76($sp)		 #,
$L205:
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

$L178:
 # Library/Player/Pathfinding.c:514:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	lh	$3,2($20)		 # _106, Pathfinder_133(D)->LastPath
 # Library/Player/Pathfinding.c:514:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	li	$2,-1			# 0xffffffffffffffff	 # tmp442,
$L202:
	beq	$3,$2,$L176	 #, _106, tmp442,
	slt	$23,$3,$23	 # tmp443, _106, PathCount

 # Library/Player/Pathfinding.c:514:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	beq	$23,$0,$L203	 #, tmp443,,
	lw	$31,84($sp)		 #,

 # Library/Player/Pathfinding.c:514:     if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
	lb	$2,32($20)		 # Pathfinder_133(D)->PathType, Pathfinder_133(D)->PathType
	bne	$2,$0,$L204	 #, Pathfinder_133(D)->PathType,,
	lw	$fp,80($sp)		 #,

 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	sll	$2,$3,2	 # tmp445, _106,
	lw	$4,120($sp)		 # tmp503, PathArray
	addu	$2,$4,$2	 # tmp446, tmp503, tmp445
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lw	$2,0($2)		 # *_110, *_110
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lh	$2,2($2)		 # _111->Position, _111->Position
	mtc1	$2,$f0	 # _111->Position, _111->Position
	nop	
	cvt.s.w	$f0,$f0	 # tmp448, _111->Position
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	sub.s	$f20,$f20,$f0	 # tmp450, player_height, tmp448
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	cvt.d.s	$f20,$f20	 # _115, tmp450
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	lwc1	$f0,140($sp)	 # tmp505, HeightCheckSquared
	cvt.d.s	$f0,$f0	 # tmp451, tmp505
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	mul.d	$f20,$f20,$f20	 # tmp452, _115, _115
 # Library/Player/Pathfinding.c:516:         if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
	c.lt.d	$f20,$f0	 #, tmp452, tmp451
	nop	
	bc1f	$L205	 #,,
	lw	$23,76($sp)		 #,

 # Library/Player/Pathfinding.c:518:             Pathfinder->TargetPath = Pathfinder->LastPath;
	sh	$3,0($20)	 # _106, Pathfinder_133(D)->TargetPath
 # Library/Player/Pathfinding.c:519:             Pathfinder->ProgressTimer = 0.0;
	sh	$0,28($20)	 #, Pathfinder_133(D)->ProgressTimer
 # Library/Player/Pathfinding.c:520:             if (Pathfinder->Direction == 1)
	lb	$4,31($20)		 # Pathfinder_133(D)->Direction, Pathfinder_133(D)->Direction
	li	$2,1			# 0x1	 # tmp454,
	beq	$4,$2,$L198	 #, Pathfinder_133(D)->Direction, tmp454,
	li	$2,1			# 0x1	 # tmp458,

 # Library/Player/Pathfinding.c:528:                 Pathfinder->Progression = 0;
	sh	$0,20($20)	 #, Pathfinder_133(D)->Progression
 # Library/Player/Pathfinding.c:534: }
	b	$L176	 #
	sb	$2,31($20)	 # tmp458, Pathfinder_133(D)->Direction

$L198:
 # Library/Player/Pathfinding.c:522:                 Pathfinder->Progression = MarkerCounts[Pathfinder->TargetPath];
	sll	$2,$3,1	 # tmp455, _106,
	lw	$3,124($sp)		 # tmp506, MarkerCounts
	addu	$2,$3,$2	 # tmp456, tmp506, tmp455
	lh	$2,0($2)		 # _123, *_122
 # Library/Player/Pathfinding.c:522:                 Pathfinder->Progression = MarkerCounts[Pathfinder->TargetPath];
	sh	$2,20($20)	 # _123, Pathfinder_133(D)->Progression
 # Library/Player/Pathfinding.c:523:                 Pathfinder->Direction = -1;
	li	$2,-1			# 0xffffffffffffffff	 # tmp457,
	b	$L176	 #
	sb	$2,31($20)	 # tmp457, Pathfinder_133(D)->Direction

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
 # Library/Player/Pathfinding.c:542:     switch (MakeRandomLimmit(3))
	jal	MakeRandomLimmit	 #
	li	$4,3			# 0x3	 #,

 # Library/Player/Pathfinding.c:542:     switch (MakeRandomLimmit(3))
	li	$3,1			# 0x1	 # tmp202,
	beq	$2,$3,$L207	 #, _1, tmp202,
	li	$3,2			# 0x2	 # tmp203,

	beql	$2,$3,$L208	 #, _1, tmp203,
	lui	$2,%hi(LaneData)	 # tmp219,

	beq	$2,$0,$L211	 #, _1,,
	lui	$2,%hi(LaneData)	 # tmp204,

$L209:
 # Library/Player/Pathfinding.c:556:     LaneData[playerID].speed = 10.0f;
	sll	$16,$16,4	 # tmp230, playerID,
	lui	$4,%hi(LaneData)	 # tmp228,
	addiu	$4,$4,%lo(LaneData)	 # tmp231, tmp228,
	addu	$16,$16,$4	 # tmp229, tmp230, tmp231
	lui	$2,%hi($LC4)	 # tmp232,
	lwc1	$f0,%lo($LC4)($2)	 # tmp233,
	swc1	$f0,8($16)	 # tmp233, LaneData[playerID_10(D)].speed
 # Library/Player/Pathfinding.c:557: }
	lw	$31,20($sp)		 #,
	lw	$16,16($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,24	 #,,

$L211:
 # Library/Player/Pathfinding.c:545:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	sll	$3,$16,4	 # tmp207, playerID,
	addiu	$2,$2,%lo(LaneData)	 # tmp205, tmp204,
	addu	$2,$2,$3	 # tmp206, tmp205, tmp207
 # Library/Player/Pathfinding.c:545:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	lui	$3,%hi(g_RoadWidth)	 # tmp208,
 # Library/Player/Pathfinding.c:545:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	lwc1	$f0,%lo(g_RoadWidth)($3)	 # g_RoadWidth, g_RoadWidth
	lui	$3,%hi($LC3)	 # tmp212,
	lwc1	$f2,%lo($LC3)($3)	 # tmp211,
	mul.s	$f0,$f0,$f2	 # tmp209, g_RoadWidth, tmp211
	mfc1	$3,$f0	 # tmp209, tmp209
 # Library/Player/Pathfinding.c:545:         LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
	li	$4,-2147483648			# 0xffffffff80000000	 # tmp214,
	xor	$3,$3,$4	 # tmp213, tmp209, tmp214
 # Library/Player/Pathfinding.c:546:         break;
	b	$L209	 #
	sw	$3,12($2)	 # tmp213, LaneData[playerID_10(D)].lane_free_drive

$L207:
 # Library/Player/Pathfinding.c:548:         LaneData[playerID].lane_free_drive = 0;
	lui	$2,%hi(LaneData)	 # tmp215,
	sll	$3,$16,4	 # tmp218, playerID,
	addiu	$2,$2,%lo(LaneData)	 # tmp216, tmp215,
	addu	$2,$2,$3	 # tmp217, tmp216, tmp218
 # Library/Player/Pathfinding.c:549:         break;
	b	$L209	 #
	sw	$0,12($2)	 #, LaneData[playerID_10(D)].lane_free_drive

$L208:
 # Library/Player/Pathfinding.c:551:         LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
	sll	$3,$16,4	 # tmp222, playerID,
	addiu	$2,$2,%lo(LaneData)	 # tmp220, tmp219,
	addu	$2,$2,$3	 # tmp221, tmp220, tmp222
 # Library/Player/Pathfinding.c:551:         LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
	lui	$3,%hi(g_RoadWidth)	 # tmp223,
 # Library/Player/Pathfinding.c:551:         LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
	lwc1	$f0,%lo(g_RoadWidth)($3)	 # g_RoadWidth, g_RoadWidth
	lui	$3,%hi($LC3)	 # tmp227,
	lwc1	$f2,%lo($LC3)($3)	 # tmp226,
	mul.s	$f0,$f0,$f2	 # tmp224, g_RoadWidth, tmp226
 # Library/Player/Pathfinding.c:552:         break;        
	b	$L209	 #
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
 # Library/Player/Pathfinding.c:561:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	sll	$2,$4,1	 # tmp201, playerID,
	lui	$3,%hi(g_playerPathPointTable)	 # tmp200,
	addiu	$3,$3,%lo(g_playerPathPointTable)	 # tmp203, tmp200,
	addu	$2,$2,$3	 # tmp202, tmp201, tmp203
	lh	$2,0($2)		 # _1, g_playerPathPointTable
 # Library/Player/Pathfinding.c:561:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	slt	$5,$2,$5	 # tmp204, _1, tmp212
	bne	$5,$0,$L220
	nop
	 #, tmp204,,
 # Library/Player/Pathfinding.c:560: {
	addiu	$sp,$sp,-24	 #,,
	sw	$31,20($sp)	 #,
	sw	$16,16($sp)	 #,
 # Library/Player/Pathfinding.c:561:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	slt	$2,$6,$2	 # tmp205, pointCheckMax, _1
	beq	$2,$0,$L218	 #, tmp205,,
	move	$16,$4	 # playerID, tmp211

 # Library/Player/Pathfinding.c:566: }
	lw	$31,20($sp)		 #,
$L219:
	lw	$16,16($sp)		 #,
	jr	$31	 #
	addiu	$sp,$sp,24	 #,,

$L218:
 # Library/Player/Pathfinding.c:563:         CurrentPathID[playerID] = MakeRandomLimmit(maxPathIDs);
	jal	MakeRandomLimmit	 #
	move	$4,$7	 #, maxPathIDs

 # Library/Player/Pathfinding.c:563:         CurrentPathID[playerID] = MakeRandomLimmit(maxPathIDs);
	sll	$3,$16,1	 # tmp208, playerID,
	lui	$4,%hi(CurrentPathID)	 # tmp207,
	addiu	$4,$4,%lo(CurrentPathID)	 # tmp210, tmp207,
	addu	$3,$3,$4	 # tmp209, tmp208, tmp210
	sh	$2,0($3)	 # tmp215, CurrentPathID
 # Library/Player/Pathfinding.c:564:         ResetLaneDefaultOffset(playerID);
	jal	ResetLaneDefaultOffset	 #
	move	$4,$16	 #, playerID

 # Library/Player/Pathfinding.c:566: }
	b	$L219	 #
	lw	$31,20($sp)		 #,

$L220:
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
 # Library/Player/Pathfinding.c:570:     if (CurrentPathID[playerID] != currentpathID)
	sll	$2,$4,1	 # tmp202, playerID,
	lui	$3,%hi(CurrentPathID)	 # tmp201,
	addiu	$3,$3,%lo(CurrentPathID)	 # tmp204, tmp201,
	addu	$2,$2,$3	 # tmp203, tmp202, tmp204
 # Library/Player/Pathfinding.c:570:     if (CurrentPathID[playerID] != currentpathID)
	lhu	$2,0($2)	 # tmp205, CurrentPathID
	bne	$2,$7,$L228	 #, tmp205, tmp223,
	sll	$2,$4,1	 # tmp207, playerID,

 # Library/Player/Pathfinding.c:575:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	lui	$3,%hi(g_playerPathPointTable)	 # tmp206,
	addiu	$3,$3,%lo(g_playerPathPointTable)	 # tmp209, tmp206,
	addu	$2,$2,$3	 # tmp208, tmp207, tmp209
	lh	$2,0($2)		 # _2, g_playerPathPointTable
 # Library/Player/Pathfinding.c:575:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	slt	$5,$2,$5	 # tmp210, _2, pointCheckMin
	bne	$5,$0,$L228	 #, tmp210,,
	slt	$2,$6,$2	 # tmp211, pointCheckMax, _2

 # Library/Player/Pathfinding.c:575:     if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
	beq	$2,$0,$L227	 #, tmp211,,
	sll	$3,$4,1	 # tmp213, playerID,

$L228:
	jr	$31
	nop
	 #
$L227:
 # Library/Player/Pathfinding.c:569: {
	addiu	$sp,$sp,-24	 #,,
	sw	$31,20($sp)	 #,
 # Library/Player/Pathfinding.c:577:         CurrentPathID[playerID] = newpathID;
	lui	$2,%hi(CurrentPathID)	 # tmp212,
	addiu	$2,$2,%lo(CurrentPathID)	 # tmp215, tmp212,
	addu	$2,$3,$2	 # tmp214, tmp213, tmp215
	lhu	$5,42($sp)	 # newpathID, newpathID
	sh	$5,0($2)	 # newpathID, CurrentPathID
 # Library/Player/Pathfinding.c:578:         g_playerPathPointTable[playerID] = pointCheckMax;
	lui	$2,%hi(g_playerPathPointTable)	 # tmp216,
	addiu	$2,$2,%lo(g_playerPathPointTable)	 # tmp219, tmp216,
	addu	$3,$3,$2	 # tmp218, tmp213, tmp219
 # Library/Player/Pathfinding.c:579:         ResetLaneDefaultOffset(playerID);
	jal	ResetLaneDefaultOffset	 #
	sh	$6,0($3)	 # pointCheckMax, g_playerPathPointTable

 # Library/Player/Pathfinding.c:581: }
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
 # Library/Player/Pathfinding.c:587:     CenterPathBP[(int)pathID] = (Marker*)altPath;
	sll	$3,$6,2	 # tmp237, pathID,
	lui	$2,%hi(CenterPathBP)	 # tmp236,
	addiu	$2,$2,%lo(CenterPathBP)	 # tmp239, tmp236,
	addu	$2,$3,$2	 # tmp238, tmp237, tmp239
	sw	$4,0($2)	 # tmp318, CenterPathBP
 # Library/Player/Pathfinding.c:588:     g_courseTotalPathPoints[(int)pathID] = length;
	sll	$2,$6,1	 # tmp241, pathID,
	lui	$4,%hi(g_courseTotalPathPoints)	 # tmp240,
	addiu	$4,$4,%lo(g_courseTotalPathPoints)	 # tmp243, tmp240,
	addu	$2,$2,$4	 # tmp242, tmp241, tmp243
	sh	$5,0($2)	 # length, g_courseTotalPathPoints
 # Library/Player/Pathfinding.c:589:     MaxPathPoints[(int)pathID] = length;
	lui	$2,%hi(MaxPathPoints)	 # tmp244,
	addiu	$2,$2,%lo(MaxPathPoints)	 # tmp247, tmp244,
	addu	$3,$3,$2	 # tmp246, tmp237, tmp247
 # Library/Player/Pathfinding.c:591:     for (int i = 0; i < length; i++)
	blez	$5,$L230	 #, _67,
	sw	$5,0($3)	 # length, MaxPathPoints

	move	$7,$5	 # length, tmp319
 # Library/Player/Pathfinding.c:591:     for (int i = 0; i < length; i++)
	move	$5,$0	 # i,
 # Library/Player/Pathfinding.c:593:         CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
	lui	$8,%hi(CenterPathBP)	 # tmp248,
	sll	$6,$6,2	 # tmp249, pathID,
	addiu	$2,$8,%lo(CenterPathBP)	 # tmp251, tmp248,
	addu	$6,$6,$2	 # tmp250, tmp249, tmp251
 # Library/Player/Pathfinding.c:593:         CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
	lui	$9,%hi(g_mirrorValue)	 # tmp255,
$L231:
	sll	$4,$5,3	 # _40, i,
 # Library/Player/Pathfinding.c:593:         CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
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
 # Library/Player/Pathfinding.c:594:         CenterPathBP[(int)pathID][i].Group = CenterPathBP[0][i].Group;
	lw	$2,%lo(CenterPathBP)($8)		 # CenterPathBP, CenterPathBP
	addu	$2,$2,$4	 # tmp261, CenterPathBP, _40
	lh	$3,6($2)		 # _17, _14->Group
 # Library/Player/Pathfinding.c:594:         CenterPathBP[(int)pathID][i].Group = CenterPathBP[0][i].Group;
	lw	$2,0($6)		 # tmp266, CenterPathBP
	addu	$2,$2,$4	 # tmp267, tmp266, _40
 # Library/Player/Pathfinding.c:591:     for (int i = 0; i < length; i++)
	addiu	$5,$5,1	 # i, i,
 # Library/Player/Pathfinding.c:591:     for (int i = 0; i < length; i++)
	bne	$5,$7,$L231	 #, i, _67,
	sh	$3,6($2)	 # _17, _16->Group

$L230:
 # Library/Player/Pathfinding.c:597:     SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	sll	$18,$16,2	 # tmp269, pathID,
	lui	$17,%hi(MaxPathPoints)	 # tmp268,
	addiu	$17,$17,%lo(MaxPathPoints)	 # tmp271, tmp268,
	addu	$17,$18,$17	 # tmp270, tmp269, tmp271
 # Library/Player/Pathfinding.c:597:     SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lw	$4,0($17)		 # tmp273, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,3	 #, tmp273,

 # Library/Player/Pathfinding.c:597:     SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lui	$3,%hi(SideLPathBP)	 # tmp274,
	addiu	$3,$3,%lo(SideLPathBP)	 # tmp277, tmp274,
	addu	$3,$18,$3	 # tmp276, tmp269, tmp277
	sw	$2,0($3)	 # tmp321, SideLPathBP
 # Library/Player/Pathfinding.c:598:     SideRPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lw	$4,0($17)		 # tmp283, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,3	 #, tmp283,

 # Library/Player/Pathfinding.c:598:     SideRPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
	lui	$3,%hi(SideRPathBP)	 # tmp284,
	addiu	$3,$3,%lo(SideRPathBP)	 # tmp287, tmp284,
	addu	$3,$18,$3	 # tmp286, tmp269, tmp287
	sw	$2,0($3)	 # tmp322, SideRPathBP
 # Library/Player/Pathfinding.c:599:     CurvePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lw	$4,0($17)		 # tmp293, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,1	 #, tmp293,

 # Library/Player/Pathfinding.c:599:     CurvePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lui	$3,%hi(CurvePathDataBP)	 # tmp294,
	addiu	$3,$3,%lo(CurvePathDataBP)	 # tmp297, tmp294,
	addu	$3,$18,$3	 # tmp296, tmp269, tmp297
	sw	$2,0($3)	 # tmp323, CurvePathDataBP
 # Library/Player/Pathfinding.c:600:     AnglePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lw	$4,0($17)		 # tmp303, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,1	 #, tmp303,

 # Library/Player/Pathfinding.c:600:     AnglePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lui	$3,%hi(AnglePathDataBP)	 # tmp304,
	addiu	$3,$3,%lo(AnglePathDataBP)	 # tmp307, tmp304,
	addu	$3,$18,$3	 # tmp306, tmp269, tmp307
	sw	$2,0($3)	 # tmp324, AnglePathDataBP
 # Library/Player/Pathfinding.c:601:     ShortCutPathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lw	$4,0($17)		 # tmp313, MaxPathPoints
	jal	AllocateMemory	 #
	sll	$4,$4,1	 #, tmp313,

 # Library/Player/Pathfinding.c:601:     ShortCutPathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
	lui	$3,%hi(ShortCutPathDataBP)	 # tmp314,
	addiu	$3,$3,%lo(ShortCutPathDataBP)	 # tmp317, tmp314,
	addu	$18,$18,$3	 # tmp316, tmp269, tmp317
	sw	$2,0($18)	 # tmp325, ShortCutPathDataBP
 # Library/Player/Pathfinding.c:603:     SidePointCalcBP((int)pathID);
	jal	SidePointCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:604:     CurveDataCalcBP((int)pathID);
	jal	CurveDataCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:605:     AngleDataCalcBP((int)pathID);
	jal	AngleDataCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:606:     ShortcutDataCalcBP((int)pathID);
	jal	ShortcutDataCalcBP	 #
	move	$4,$16	 #, pathID

 # Library/Player/Pathfinding.c:607: }
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
	.globl	AIPathfinder
	.align	2
	.type	AIPathfinder, @object
	.size	AIPathfinder, 144
AIPathfinder:
	.space	144
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1287568416
	.align	2
$LC1:
	.word	-859915232
	.align	2
$LC2:
	.word	1084227584
	.align	2
$LC3:
	.word	1000593162
	.align	2
$LC4:
	.word	1092616192
	.ident	"GCC: (GNU) 10.1.0"
