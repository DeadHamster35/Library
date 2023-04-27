/*
This is our BootCode
it overwrites the existing startup routines, attempts a check on Expansion RAM
If Expansion RAM is present, the game runs, if not an Error Image is loaded into the FrameBuffer

It needs to be placed in static ROM with no offset to the address
*/


.definelabel DMA_FUNC,    		0x80001158
.definelabel PRELOAD_RAM,          0x80200000
.definelabel ExpansionCheckAddress,          0x80001264




.ifndef OverwriteCrash
    .notice "Using Default Crash Screen"
    Crash:
    .import "../library/data/test/Crash512.bin"
    .align 0x10
    CrashEnd:
.endif


.align 0x10
.ifndef OverwriteFonts
    .notice "Using Default Fonts"
    
    NiceFontROMDefault:
    .definelabel NiceFontROM, NiceFontROMDefault
    .import "../library/data/nice_font.mio0.bin"

    HudButtonsROMDefault:
    .definelabel HudButtonsROM, HudButtonsROMDefault
    .import "../library/data/hud_buttons.mio0.bin"

    BigFontROMDefault:
    .definelabel BigFontROM, BigFontROMDefault
    .import "../library/data/big_font.mio0.bin"
.endif
.align 0x10







///PLACE EVERYTHING BEFORE HERE

.align 0x10
PreCodeROM:
.importobj "../Library/PreCode.o"
PreCodeEnd:



///BOOT CODE START
.align 0x10
.headersize 0
//REPLACEMENT FOR InitializeSystemWorks
BootCode:
.import "../library/data/BootCode.bin"


//NEW CUSTOM BOOT CODE
//OVERWRITES InitializeSystemWorks

.headersize (ExpansionCheckAddress - 0x1E64)
LoadMainCode:
.org ExpansionCheckAddress
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp)
LUI a0, hi(PRELOAD_RAM)
ADDIU a0, a0, lo(PRELOAD_RAM)
LUI a1, hi(PreCodeROM)
ADDIU a1, a1, lo(PreCodeROM) 
LUI a2, hi(PreCodeEnd - PreCodeROM)
JAL DMA_FUNC
ADDIU a2, lo(PreCodeEnd - PreCodeROM)
JAL  PRELOAD_RAM
NOP
JAL  (PRELOAD_RAM + 0x200)
NOP
LW ra, 0x001C (sp)
ADDIU sp, sp, 0x20
jr ra
NOP


.align 0x10
.importobj "../Library/PreSwitch.o"

.align 0x10
PrintMenuHook:
LW ra, 0x14 (sp)
SW ra, 0x1C (sp)
JAL printMenuSwitch
NOP
J 0x80001F64
LW ra, 0x001C(sp)

//Custom triangle collision check
.org 0x11746C
JAL custom_check_triangle_zx
.org 0x1176BC
JAL custom_check_triangle_zx
.org 0x115950
JAL custom_check_triangle_zx
.org 0x115B78
JAL custom_check_triangle_zx

.org 0x1174B0
JAL custom_check_triangle_xy
.org 0x117758
JAL custom_check_triangle_xy
.org 0x1159A8
JAL custom_check_triangle_xy
.org 0x115CB8
JAL custom_check_triangle_xy

.org 0x1174EC
JAL custom_check_triangle_yz
.org 0x117710
JAL custom_check_triangle_yz
.org 0x1158FC
JAL custom_check_triangle_yz
.org 0x115C34
JAL custom_check_triangle_yz

.org 0x0922B0
JAL custom_check_bump
.org 0x00EB2C
JAL custom_check_bump
.org 0x0890DC
JAL custom_check_bump
.org 0x00DC3C
JAL custom_check_bump
.org 0x00DAA0
JAL custom_check_bump
.org 0x01F558
JAL custom_check_bump

.org 0x030584
JAL custom_check_bump_2
.org 0x039BE0
JAL custom_check_bump_2
.org 0x02F77C
JAL custom_check_bump_2
.org 0x02E818
JAL custom_check_bump_2

.org 0x117014
JAL custom_check_triangle_zx_v
.org 0x11729C
JAL custom_check_triangle_zx_v
.org 0x119208
JAL custom_check_triangle_zx_v
.org 0x119514
JAL custom_check_triangle_zx_v

.org 0x117070
JAL custom_check_triangle_xy_v
.org 0x117358
JAL custom_check_triangle_xy_v
.org 0x1192C4
JAL custom_check_triangle_xy_v
.org 0x119718
JAL custom_check_triangle_xy_v

.org 0x1170BC
JAL custom_check_triangle_yz_v
.org 0x117300
JAL custom_check_triangle_yz_v
.org 0x11914C
JAL custom_check_triangle_yz_v
.org 0x119628
JAL custom_check_triangle_yz_v
=======
//Disable BackgroundFlag to control ourselves via gameCode
.org 0x0F93D8
NOP
NOP
.org 0x0F8B64
NOP
NOP
.org 0x0F9214
=======
.align 0x10
GlobalCustomCode:
ADDIU sp, sp, -0x20
SW ra, 0x001C (sp) //push ra to the stack
>>>>>>> 067e06a (Re-orded and properly numbered LIBRARYBUILD to be in the same order that they need to be called in.)
NOP
JAL allRunSwitch
NOP
LW ra, 0x001C (sp) //pop ra from the stack
ADDIU sp, sp, 0x20
J 0x8000286C //tells the game where to jump back to, dont remove
NOP



