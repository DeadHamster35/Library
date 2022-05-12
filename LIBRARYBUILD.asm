



.align 0x10
.importobj "../library/LibraryVariables.o"
.align 0x10
.importobj "../library/MarioKart3D.o"
.align 0x10
.importobj "../library/MarioKartObjects.o"
.align 0x10
.importobj "../library/MarioKartMenu.o"
.align 0x10
.importobj "../library/SharedFunctions.o"



.align 0x10
.importobj "../library/Player/MarioKartStats.o"
.align 0x10
.importobj "../library/Player/PlayerEffects.o"
.align 0x10
.importobj "../library/Player/PlayerChecks.o"
.align 0x10
.importobj "../library/Player/Pathfinding.o"

.align 0x10
.importobj "../library/CustomCourses/CustomLevels.o"
.align 0x10
.importobj "../library/CustomCourses/CustomSurfaces.o"

.align 0x10
.importobj "../library/MusicSound/CustomSounds.o"
.align 0x10
.importobj "../library/MusicSound/MusicControl.o"

.align 0x10
.importobj "../library/CustomObjects/OKBehaviors.o"
.align 0x10
.importobj "../library/CustomObjects/OKCustomObjects.o"
.align 0x10
.importobj "../library/CustomObjects/ObjectHandler.o"


.align 0x10
.importobj "../library/CustomParticles/CustomParticles.o"
.include "../library/CustomParticles/PARTICLES.asm"


.align 0x10
.importobj "../library/Gametypes/CTF.o"
.importobj "../library/Gametypes/Soccer.o"


.align 0x10

Unknown33:
.import "../library/data/stats/Unknown33.bin"
.align 0x10
Unknown41:
.import "../library/data/stats/Unknown41.bin"
.align 0x10
AccelerationTable:
.import "../library/data/stats/AccelerationTable.bin"
.align 0x10






.align 0x10
bannerN:
.import "../library/data/banner_n.mio0.bin"        ;;  324

.align 0x10
bannerU:
.import "../library/data/banner_U.mio0.bin"        ;;  311


.align 0x10
SnowHook:
LW a0, 0x40(sp)
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
JAL SnowCustomCheck
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
J 0x800786B8
NOP

.align 0x10
DisplayMap2Hook:
SW ra, 0x001C(sp)
LW a0, 0x270(sp)
JAL XLUDisplay
NOP
LW ra, 0x001C(sp)
addiu sp, sp, 0x270
JR ra
NOP


.align 0x10
GhostHook:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
NOP
JAL SetGhostData
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
LUI $at, 0x8016
JR ra
SH $zero, 0x2DA0($at)




.align 0x10
CustomCodeTitleScreen:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp)
JAL	0x80095574 //run what we overwrote with our hook
NOP
JAL titleMenu
NOP
LW ra, 0x001C (sp)
ADDIU sp, sp, 0x20
J 0x80094BD8 //jump back to where we were
NOP
NOP



.align 0x10
FreeDraw:
JAL DrawPerScreen
NOP
LW ra, 0x24 (sp)
LW s0, 0x18 (sp)
LW s1, 0x1C (sp)
LW s2, 0x20 (sp)
JR ra
ADDIU sp, sp, 0x98

.align 0x10
race1P:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
NOP
JAL gameCode
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
LUI a0, 0x800E
LHU a0, 0xC520 (a0)
LUI a1, 0x800E
J 0x8000161C
NOP

.align 0x10
race2P:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
NOP
JAL gameCode
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
LUI t3, 0x800E
LW t3, 0xC5E8 (t3)
J 0x80001AA4
NOP

.align 0x10
race2PLR:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
NOP
JAL gameCode
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
LUI t3, 0x800E
LW t3, 0xC5E8 (t3)
J 0x800018FC
NOP


.align 0x10
raceMP:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
NOP
JAL gameCode
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
LUI v0, 0x800E
LW v0, 0xC5E8 (v0)
J 0x80001D00
NOP






.align 0x10
DisplayHop:
MOVE  $a0, $s1
JAL   DisplayObject
MOVE  $a1, $s0
J     0x802A34D4
NOP



.align 0x10
CollisionHop:
LW    $t4, 0xbc($a3)
MOVE  $a0, $a3
LW    $ra, 0x1c($sp)
JAL  CollideObject
MOVE  $a1, $s0
J     0x802A0D44
LW    $ra, 0x1c($sp)





.align 0x10
DisplayHopTable:
.word 0x802A31E4, 0x802A31FC, 0x802A3214, 0x802A32EC
.word 0x802A3318, 0x802A3330, 0x802A3348, 0x802A34C0
.word 0x802A3378, 0x802A34D4, 0x802A34D4, 0x802A34D4
.word 0x802A34D4, 0x802A3390, 0x802A33A4, 0x802A33B8
.word 0x802A33CC, 0x802A322C, 0x802A33E4, 0x802A34D4  //19
.word 0x802A34D4, 0x802A33FC, 0x802A34D4, 0x802A3428  //23
.word 0x802A3244, 0x802A34D4, 0x802A325C, 0x802A328C  //27
.word 0x802A32A4, 0x802A32BC, 0x802A32D4, 0x802A3274  //31
.word 0x802A34D4, 0x802A3414, 0x802A34D4, 0x802A345C  //35
.word 0x802A3440, 0x802A34AC, 0x802A3470, 0x802A3484  //39
.word 0x802A3360, 0x802A34D4, 0x802A3498, 0x802A3300  //43
.word 0x802A33E4, DisplayHop, DisplayHop, DisplayHop  //47
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //51
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //55
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //59
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //63
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //67
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //71
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //75
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop  //79
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop
.word DisplayHop, DisplayHop, DisplayHop, DisplayHop //99


.align 0x10
CollisionHopTable:
.word 0x802A09B0, 0x802A09B0, 0x802A09B0, 0x802A09D4
.word 0x802A04E0, 0x802A063C, 0x802A0858, 0x802A04AC  //7
.word 0x802A0968, 0x802A0D40, 0x802A0CBC, 0x802A0AA4
.word 0x802A0D40, 0x802A0D40, 0x802A0D40, 0x802A0D40
.word 0x802A0D40, 0x802A09B0, 0x802A0D40, 0x802A0D40 //19
.word 0x802A0D40, 0x802A098C, 0x802A0D40, 0x802A09B0
.word 0x802A09B0, 0x802A0D40, 0x802A09B0, 0x802A09B0
.word 0x802A09B0, 0x802A09B0, 0x802A09B0, 0x802A09B0
.word 0x802A0D40, 0x802A0D40, 0x802A0D40, 0x802A0D40
.word 0x802A0D40, 0x802A0D40, 0x802A0D40, 0x802A0D40 //39
.word 0x802A0744, 0x802A0C34, 0x802A09B0, 0x802A09B0
.word 0x802A09B0, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop //59
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop //79
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop
.word CollisionHop, CollisionHop, CollisionHop, CollisionHop //99






