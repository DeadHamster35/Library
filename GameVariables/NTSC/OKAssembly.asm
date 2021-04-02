
; the following all deal with ASM instructions in the game.
; we edit them in the customASM and stockASM routines.


.definelabel nopASM, 0x80002714



.definelabel asm_tempo1A, 0x800015C4  ;;3C0F8015
.definelabel asm_tempo1ASpeed, 0x800015C6  ;;speed value
.definelabel asm_tempo1B, 0x800015C8  ;;8DEF0114
.definelabel asm_tempo1BSpeed, 0x800015CA  ;; speed value

.definelabel asm_tempo2A, 0x80001A38  ;;3C098015
.definelabel asm_tempo2ASpeed, 0x80001A3A  ;;speed value
.definelabel asm_tempo2B, 0x80001A3C  ;;8D290114
.definelabel asm_tempo2BSpeed, 0x80001A3E  ;; speed value

.definelabel asm_tempo3A, 0x80001C90  ;;3C0A8015
.definelabel asm_tempo3ASpeed, 0x80001C92  ;;speed value
.definelabel asm_tempo3B, 0x80001C94  ;;8D4A0114
.definelabel asm_tempo3BSpeed, 0x80001C96  ;; speed value

.definelabel asm_BorderDraw, 0x80001E64

.definelabel asm_selectA, 0x800B3924
.definelabel asm_selectB, 0x800B3936
.definelabel asm_selectC, 0x800B39A4
.definelabel asm_selectD, 0x800B39B6
.definelabel asm_selectE, 0x800B3A38
.definelabel asm_selectF, 0x800B3A4E

.definelabel previewReload, 0x80094BF0
//0C0266BB

.definelabel g_EchoStart, 0x80027F52  ;;short value
.definelabel g_EchoStop, 0x80027F5A  ;;short value


.definelabel highpolypipeA, 0x802911E8   ;;3C190700
.definelabel highpolypipeB, 0x802911EC   ;;373908E8

.definelabel lowpolypipeA, 0x8029120C   ;;3C0A0700
.definelabel lowpolypipeB, 0x80291210   ;;354A2D68


.definelabel bigmushroomA, 0x802911A4   ;;3C180700
.definelabel bigmushroomB, 0x802911A8   ;;37181140

.definelabel bigmushroomsurfaceA, 0x80295E3C   ;;3C040700
.definelabel bigmushroomsurfaceB, 0x80295E44   ;;34841140

.definelabel uraGrpA, 0x8029250C   ;;3C0E0700
.definelabel uraGrpB, 0x80292510   ;;35CE3050

.definelabel audienceA, 0x802927EC   ;;3C0F0700
.definelabel audienceB, 0x802927F0   ;;35EF14A0

.definelabel audienceflagsA, 0x802928F0   ;;3C0D0700
.definelabel audienceflagsB, 0x802928F4   ;;35AD0160

.definelabel billboard1A, 0x802927CC   ;;3C0C0700
.definelabel billboard1B, 0x802927D0   ;;358C3240

.definelabel billboard2A, 0x802927AC   ;;3C0F0700
.definelabel billboard2B, 0x802927B0   ;;35EF3508

.definelabel billboardpost1A, 0x80292898   ;;3C190700
.definelabel billboardpost1B, 0x8029289C   ;;37390240

.definelabel billboardpost2A, 0x80292878   ;;3C0E0700
.definelabel billboardpost2B, 0x8029287C   ;;35CE0450



.definelabel fencesA, 0x802928BC   ;;3C180700
.definelabel fencesB, 0x802928D4   ;;371800E0

.definelabel bigsignA, 0x802A2AA4   ;;3C0A0601
.definelabel bigsignB, 0x802A2AA8   ;;254A9330

.definelabel g_pathLength, 0x800DD9D0
.definelabel pathOffset, 0x800DC8D0

.definelabel pathOffsetB, 0x800DC780


;; these are offsets to POP data inside segment 6.

.definelabel itemboxesA, 0x8029DBD4   ;;3C040601
.definelabel itemboxesB, 0x8029DBDC   ;;24849498

.definelabel treeslistA, 0x8029DBBC   ;;3C040601
.definelabel treeslistB, 0x8029DBC4   ;;24849570

.definelabel treesdisplayA, 0x802992C8   ;;3C180600
.definelabel treesdisplayB, 0x802992E0   ;;27186A68

.definelabel piranhalistA, 0x8029DBC8   ;;3C040601
.definelabel piranhalistB, 0x8029DBD0   ;;24849518

.definelabel piranhadisplayA, 0x80298668   ;;3C0F0600
.definelabel piranhadisplayB, 0x8029866C   ;;25EF6990


;; offsets for course data

.definelabel unknownA1, 0x802956D0   ;;3C190601 -> 3C190600
.definelabel unknownA2, 0x802956D4   ;;248401F0 -> 24840000

.definelabel unknownB1, 0x80295E3C   ;;3C040700 -> 34840000
.definelabel unknownB, 0x80295E44   ;;34841140 -> 34840000

.definelabel unknownC1, 0x80295E54   ;;3C040700 -> 34840000
.definelabel unknownC, 0x80295E5C   ;;348408E8 -> 34840000

.definelabel unknownD1, 0x80295E68   ;;3C040700 -> 34840000
.definelabel unknownD, 0x80295E70   ;;34842D68 -> 34840000

.definelabel sectionviewA, 0x802927FC   ;;3C040900
.definelabel sectionviewB, 0x80292810   ;;248401F0

.definelabel surfacemapA, 0x80295E74   ;;3C040601
.definelabel surfacemapB, 0x80295E7C   ;;24849650

.definelabel asm_GPLevelSelect, 0x80002AC0


.definelabel tbl_pathOffset, 0x8000DC780
.definelabel tbl_pathOffsetB, 0x8000DC8D0
.definelabel tbl_g_pathLength, 0x8000DD9D0
.definelabel tbl_objectList, 0x802B97AC
