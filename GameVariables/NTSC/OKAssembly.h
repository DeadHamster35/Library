
// the following all deal with ASM instructions in the game.
// we edit them in the customASM and stockASM routines.


extern long nopASM; //0x80002714
extern long asm_tempo1A; //0x800015C4  ;;3C0F8015
extern short asm_tempo1ASpeed; //0x800015C7  ;;speed value
extern long asm_tempo1B; //0x800015C8  ;;8DEF0114
extern short asm_tempo1BSpeed; //0x800015CB  ;; speed value

extern long asm_tempo2A; //0x80001A38  ;;3C098015
extern short asm_tempo2ASpeed; //0x80001A3B  ;;speed value
extern long asm_tempo2B; //0x80001A3C  ;;8D290114
extern short asm_tempo2BSpeed; //0x80001A3F  ;; speed value

extern long asm_tempo3A; //0x80001C90  ;;3C0A8015
extern short asm_tempo3ASpeed; //0x80001C93  ;;speed value
extern long asm_tempo3B; //0x80001C94  ;;8D4A0114
extern short asm_tempo3BSpeed; //0x80001C97  ;; speed value

extern short asm_selectA; //0x800B3924
extern short asm_selectB; //0x800B3924
extern short asm_selectC; //0x800B3924
extern short asm_selectD; //0x800B3924
extern short asm_selectE; //0x800B3924
extern short asm_selectF; //0x800B3924

extern short asm_BorderDraw;


extern long previewReload;

extern short g_EchoStart;
extern short g_EchoStop;

extern long highpolypipeA; //0x802911E8   ;;3C190700
extern long highpolypipeB; //0x802911EC   ;;373908E8

extern long lowpolypipeA; //0x8029120C   ;;3C0A0700
extern long lowpolypipeB; //0x80291210   ;;354A2D68


extern long bigmushroomA; //0x802911A4   ;;3C180700
extern long bigmushroomB; //0x802911A8   ;;37181140

extern long bigmushroomsurfaceA; //0x80295E3C   ;;3C040700
extern long bigmushroomsurfaceB; //0x80295E44   ;;34841140

extern long uraGrpA;
extern long uraGrpB;

extern long audienceA; //0x802927EC   ;;3C0F0700
extern long audienceB; //0x802927F0   ;;35EF14A0

extern long audienceflagsA; //0x802928F0   ;;3C0D0700
extern long audienceflagsB; //0x802928F4   ;;35AD0160

extern long billboard1A; //0x802927CC   ;;
extern long billboard1B; //0x802927D0   ;;

extern long billboard2A; //0x802927AC   ;;
extern long billboard2B; //0x802927B0   ;;

extern long billboardpost1A; //0x80292898   ;;
extern long billboardpost1B; //0x8029289C   ;;

extern long billboardpost2A; //0x80292878   ;;
extern long billboardpost2B; //0x8029287C   ;;



extern long fencesA; //0x802928BC   ;;3C180700
extern long fencesB; //0x802928D4   ;;371800E0

extern long bigsignA; //0x802A2AA4   ;;3C0A0601
extern long bigsignB; //0x802A2AA8   ;;254A9330


extern short g_pathLength; //800DD9D0  - DE5D0
extern long pathOffset; //0x800DC8D0  -  DD4D0
extern long pathOffsetB; //0x800DC780


// these are offsets to POP data inside segment 6.

extern long itemboxesA; //0x8029DBD4   ;;3C040601
extern long itemboxesB; //0x8029DBDC   ;;24849498

extern long treeslistA; //0x8029DBBC   ;;3C040601
extern long treeslistB; //0x8029DBC4   ;;24849570

extern long treesdisplayA; //0x802992C8   ;;3C180600
extern long treesdisplayB; //0x802992E0   ;;27186A68

extern long piranhalistA; //0x8029DBC8   ;;3C040601
extern long piranhalistB; //0x8029DBD0   ;;24849518

extern long piranhadisplayA; //0x80298668   ;;3C0F0600
extern long piranhadisplayB; //0x8029866C   ;;25EF6990


// offsets for course data

extern long unknownA1; //0x802927FC   ;;3C190601 -> 3C190600
extern long unknownB1; //0x802927FC   ;;3C190601 -> 3C190600
extern long unknownC1; //0x802927FC   ;;3C190601 -> 3C190600
extern long unknownD1; //0x802927FC   ;;3C190601 -> 3C190600

extern long unknownA2; //0x80292810   ;;248401F0 -> 24840000

extern long unknownB; //0x802927FC   ;;34841140 -> 34840000
extern long unknownC; //0x80292810   ;;348408E8 -> 34840000
extern long unknownD; //0x80295E70   ;;34842D68 -> 34840000


extern long sectionviewA; //0x802927FC   ;;3C040900
extern long sectionviewB; //0x80292810   ;;248401F0

extern long surfacemapA; //0x80295E74   ;;3C040601
extern long surfacemapB; //0x80295E7C   ;;24849650

extern long asm_GPLevelSelect;
