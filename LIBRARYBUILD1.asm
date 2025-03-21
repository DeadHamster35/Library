/*
This overwrites existing functions in the US ROM with new code hooks.
it needs to be placed in static ROM with no offset to the address
*/



.org 0x3314
NOP


//change kwtexture2d_RGBA32PT to XLU mode not opaque
.org 0x047350
.word 0x27397968



//Change kwtexture2d to use loadtile
//.org 0x463E0
//.word 0x0C010F0A
//fix kwtexture2D_rgba32_bl
//.org 0x0473F0
//.word 0x0C011869
//add XLU to RGBA32
//.org 0x047350
//.word 0x273979E8
//.org 0x0473C4
//.word 0x273979E8

//.org 0x046F14
//.word 0x268E0000





// fix for MKInit duplicate calls which are overwritten by our boot code.
// gamecode never needs to be reloaded.
.org 0x3314
NOP
.org 0x3354
NOP
.org 0x1CC64
NOP
//
//
//


//Overwrite EEPROM load functions
.org 0xB51E0
jr RA
NOP
.org 0x0B5270
jr RA
NOP
.org 0x0B619C
jr RA
NOP
.org 0x0B6548
jr RA
NOP
.org 0x0B5610
jr RA
NOP

//end EEPROM funcs



//KT1 Tree Display Call
.org 0x10C7FC
JAL DisplayTree1Bypass

//Pakkun Display Call for PiranhaPlants
.org 0x10C990
JAL DisplayPiranhaBypass

//Pakkun Strategy Hook for PiranhaPlants
.org 0x10CC70
JAL PakkunStrategyOverride






// Move FreeMemoryPointer loads to EOF using new funcs and rewrites


    // Rewrite for Segment 6 LoadPressData
    .org 0x114004
    JAL LoadPressDataBypass

    // Rewrite for Segment 47 TransGFXData
    .org 0x114028
    JAL LoadDataBypass

    //Stop loading StaticMemoryPointer over LastMemoryPointer
    .org 0x36F8
    NOP

//



//AddGravityHooks
.org 0x2E00C
JAL AddGravityEdit
.org 0x2F2A4
JAL AddGravityEdit
.org 0x3997C
JAL AddGravityEdit


//InitSmokeHooks
.org 0x6D59C
JAL InitRndSmokeHook
.org 0x6D584
JAL InitRapidSmokeHook
.org 0x6D520
JAL InitSpinSmokeHook


.org 0x0FF450
JAL SearchListHook

.org 0x0FF468
JAL SearchListHook

.org 0x0FF47C
JAL SearchListHook

//SearchListFileHook
.org 0xFF488
JAL SearchListFileHook

.org 0x0FFB38
JAL SearchList2Hook


//Display Custom Levels Hook
.org 0x0FF0BC
JAL DisplayKT1Hook
.org 0x0FF1AC
JAL DisplayKT16Hook
.org 0x1076E4
JAL KT16Itembox
NOP

.org 0x0FECE0
.word 0x3C190600

.org 0x0FECE4
.word 0x27390000

//Map Startup Hooks
.org 0x123B0C
JAL MapStartup
.org 0x0036F4
JAL MapStartup
.org 0x12506C
JAL MapStartup

//InitialMap Hook
.org 0x0036FC
JAL InitialMapCode

//InitialMapObject
.org 0x107DCC
JAL InitialMapObjectCode

//Litro Snow Code
.org 0x079290
J SnowHook
NOP



//Fix bad border pixels
.org 0x10DA48
.word 0x3C0EF628
.org 0x10DA54
.word 0x3C18F628
.org 0x10DA68
.word 0x35EFC000
.org 0x10DA74
.word 0x35CE03BC
.org 0x10DA88
.word 0x3739C1E0
.org 0x10DAAC
.word 0x3739C000
.org 0x10DAB8
.word 0x371803BC
.org 0x10DACC
.word 0x35EFC1E0




//Replace Jugemu Check for exploration mode.
//Replace Jugemu Check for exploration mode.
//
.org 0x02D988
JAL ExplorerHangJugemu

.org 0x090074
JAL ExplorerSetJugemu
.org 0x02D374
JAL ExplorerSetJugemu
.org 0x02D3B4
JAL ExplorerSetJugemu
.org 0x07A51C
JAL ExplorerSetJugemu

.org 0x09007C
JAL ExplorerCallJugemu
.org 0x02D37C
JAL ExplorerCallJugemu
.org 0x02D3BC
JAL ExplorerCallJugemu
.org 0x07A86C
JAL ExplorerCallJugemu
.org 0x07AA88
JAL ExplorerCallJugemu

.org 0x058EAC
JAL ExplorerKWDisplayJugemu
.org 0x058F74
JAL ExplorerKWDisplayJugemu
.org 0x05903C
JAL ExplorerKWDisplayJugemu
.org 0x059118
JAL ExplorerKWDisplayJugemu


//
//Replace Jugemu Check for exploration mode.
//Replace Jugemu Check for exploration mode.





//Hook for DisplayGroupmap Direction Check. 
//Used for ZFLIP
//written inline to original location due to available space
.org 0x0FA3F8
LW $a2, 4($a1)
addu $t3, $t2, $at
JAL CheckDirectionFunc
SW $t3, 0x24($sp)
J 0x80290EB8
NOP


.org 0x0FA4C8
LH $a3, 0x36($a1)
//End Groupmap Direction Check  



//Hook display after map.
.org 0x0FBA68
J DisplayMap2Hook
NOP


//Fix for MIO0 Decompression ; Return End Address
.org 0x040D64 
move v0, $t8



//CheckMapBG_ZX Hooks
.org 0x2EBE0
JAL CheckMapBG_ZX_Hook
.org 0x2FB10
JAL CheckMapBG_ZX_Hook
.org 0x30614
JAL CheckMapBG_ZX_Hook
.org 0x39CC0
JAL CheckMapBG_ZX_Hook

.org 0x2A74
JAL MiniMapDraw
//remove KWViewportCall for minimap drawing.
.org 0x059F40
NOP



//change IceKage offset to custommodel
.org 0x0534BE
.halfword 0x0800
.org 0x0534CE
.halfword 0x0000


//AirControlChange
.org 0x38A04
NOP
.org 0x38A10
JAL ProStickAngleHook
.org 0x38A4C
NOP

//Print Menu Hooks
.org 0x2B30
J PrintMenuHook
NOP


// fixes Alpha loading for level data vert color
.org 0x111E2C
JAL DecodeVertex2_OK

.org 0x113CA4
JAL DecodeSP1Triangle_OK

.org 0x113CC8
JAL DecodeSP2Triangle_OK

.org 0x113CEC
JAL DecodeSP1Quadrangle_OK

//Staff Ghost routine
.org 0x5BA4
J    GhostHook
NOP














//Kart Collision Wrappers
.org 0x02BF48 
JAL BombThrowRolloverWrap
.org 0x02BF6C
JAL RolloverWrap
.org 0x02BF90
JAL WheelspinWrap
.org 0x02C044
JAL BrokenWrap
.org 0x02C068
JAL ThunderWrap
.org 0x02C08C
JAL SpinWrap
.org 0x02C0B0
JAL BombRolloverWrap
.org 0x02C0D4
JAL BombThrowRolloverWrap
.org 0x02C184
JAL ProWheelSpinWrap
.org 0x02C1A4
JAL BombRolloverWrap





//PlayStarMusicHook
.org 0x90420
JAL PlayStarMusicHook

//StopStarMusicHook
.org 0x904B4
JAL StopStarMusicHook
.org 0x902D8
JAL StopStarMusicHook




//For handling lakitu respawns
.org 0x091890
JAL LakituSpawnBypass
.org 0x091920
JAL LakituSpawnBypass

//PlayFinalLapMusicHook
.org 0xF8954
JAL PlayFinalLapMusicHook

.org 0x11C890
JAL ExecuteItemHook

//.org 0x06C408
//JAL BalloonCheck
.org 0x06C42C
JAL BalloonCheck
.org 0x06C450
JAL BalloonCheck


//original hook placement
.org 0x34BC //RAM address 0x800028BC
J GlobalCustomCode
NOP




.org 0x72094
JAL KWKumo_Alloc_Hook
.org 0x7209C
JAL KWKumo_Alloc_Hook
.org 0x72464
JAL KWKumo_Alloc_Hook
.org 0x7246C
JAL KWKumo_Alloc_Hook
.org 0x7266C
JAL KWKumo_Alloc_Hook
.org 0x72674
JAL KWKumo_Alloc_Hook


.org 0x5A9A4
JAL KWChart_Kumo_Hook
.org 0x5AA00
JAL KWChart_Kumo_Hook
.org 0x5AA10
JAL KWChart_Kumo_Hook
.org 0x5AA60
JAL KWChart_Kumo_Hook
.org 0x5AA98
JAL KWChart_Kumo_Hook
.org 0x5AAF0
JAL KWChart_Kumo_Hook
.org 0x5AB28
JAL KWChart_Kumo_Hook
.org 0x5AD00
JAL KWChart_Kumo_Hook

//EventDisplay Hooks
.org 0x058EB4
JAL EventDisplay
.org 0x058F7C
JAL EventDisplay
.org 0x059044
JAL EventDisplay
.org 0x059120
JAL EventDisplay
//EventDisplay_After Hooks
.org 0x0592E4
JAL EventDisplay_After
.org 0x05938C
JAL EventDisplay_After
.org 0x059434
JAL EventDisplay_After
.org 0x0594DC
JAL EventDisplay_After

//CommonGameEvent Hooks
.org 0x05AA18
JAL CommonGameEventChart
.org 0x05AAA8
JAL CommonGameEventChart
.org 0x05AB38
JAL CommonGameEventChart
.org 0x05AC50
JAL CommonGameEventChart
.org 0x05AD08
JAL CommonGameEventChart



.org 0x527C4
JAL KumoColorMode

.org 0x52A10
JAL KumoColorMode




//1p
.org 0x2214
J race1P
NOP
//2p
.org 0x269C
J race2P
NOP
.org 0x24F4
J race2PLR
NOP
//mp
.org 0x28F8
J raceMP
NOP



//title screen hook
.org 0x957D0 //RAM address 0x80094BD0
J CustomCodeTitleScreen
NOP



//3D Screen-Perspective Correct Draw 
.org 0x10CB44
J FreeDraw
NOP



//Push the level-data cache to EOF
.org 0x113FBA
.halfword 0x8080
.org 0x113FCE
.byte 0x00




//Code for auto-displaying custom crash screen
.org 0x0051E8
JAL DisplayCrashScreen
.org 0x5200
NOP
.org 0x5240
NOP

//Auto draw without button imprompt
.org 0xDD2FC
.halfword 0xFFFF
//


//Fix for incorrect distance tables - mario raceway and custom courses.
.org 0xDD7B4
.word 0x800DCAF4


//Custom objects using the standard object array
//
.org 0x10C7E2
.halfword hi(DisplayHopTable)
.org 0x10C7EA
.halfword lo(DisplayHopTable)
.org 0x10C7D6
.halfword(100)
.org 0x109AAA
.halfword hi(CollisionHopTable)
.org 0x109AB2
.halfword lo(CollisionHopTable)
.org 0x109A92
.halfword(100)


//Disable ROM Staff Ghosts from Luigi Raceway, Royal Raceway and Mario Raceway.
//Current implementation of equal-stats in TT renders the staff ghosts inaccurate.
//Will need new implementation of function to maintain compatability with original inputs.
.org 0x005C50
NOP
.org 0x005C58
NOP
.org 0x005C60
NOP

//Disable the Goal Flag Gate / Starting Line Banner
.org 0x10C7A4
JAL DisplayFlagGateCheck


//Disable BackgroundFlag to control ourselves via gameCode
//Stops the sky from being drawn. 
.org 0x0F93D8
NOP
NOP
.org 0x0F8B64
NOP
NOP
.org 0x0F9214
NOP
NOP
.org 0x0F8278
NOP
NOP



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

//Custom Spin Kart
.org 0x029788
JAL custom_SpinKart
.org 0x0298FC
JAL custom_SpinKart
.org 0x029A38
JAL custom_SpinKart

//Custom Run Kart
.org 0x029798
JAL custom_RunKart
.org 0x0297FC
JAL custom_RunKart
.org 0x02990C
JAL custom_RunKart
.org 0x029A48
JAL custom_RunKart



.org 0x04FD50
JAL RadarFinishLine
//disables the finishline



//LapCounters
//calc_oga_area_sub_BP
.org 0x9AE4
JAL CalcOGAAreaSubBP_Wrapper
.org 0xD8F8
JAL CalcOGAAreaSubBP_Wrapper
.org 0xDB40
JAL CalcOGAAreaSubBP_Wrapper
.org 0xDE9C
JAL CalcOGAAreaSubBP_Wrapper




//2p LeftRight LapText


.org 0x059A3C
JAL KWDisplay2P_1LR
.org 0x059A5C
JAL KWDisplay2P_2LR


.org 0x059A7C
JAL KWDisplay2P_1UD
.org 0x059A9C
JAL KWDisplay2P_2UD

.org 0x059ABC
JAL KWDisplay4P_1
.org 0x059ADC
JAL KWDisplay4P_2
.org 0x059AFC
JAL KWDisplay4P_3
.org 0x059B30
JAL KWDisplay4P_4


.org 0x059BEC
NOP
.org 0x05A0D0
NOP


.org 0x059BF4
JAL Zanzou2

