///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   GENERAL STUFF or unsorted                            //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////









///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   PLAYER / KARTS                                       //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
#define P1 0 //Human
#define P2 1 //Human or CPU
#define P3 2
#define P4 3
#define P5 4 //CPUs
#define P6 5
#define P7 6
#define P8 7

#define MARIO  0
#define LUIGI  1
#define YOSHI  2
#define TOAD   3
#define DK     4
#define WARIO  5
#define PEACH  6
#define BOWSER 7

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   IN-RACE                                              //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Course
#define  MARIO_RW   0 //KT1
#define  CHOCO_MT   1 //KT2
#define  BOWSER_CA  2 //KT3
#define  BANSHEE_BW	3 //KT4
#define  YOSHI_VA	4 //KT5
#define  FRAPPE_SL	5 //KT6
#define  KOOPA_BE	6 //KT7
#define  ROYAL_RW	7 //KT8
#define  LUIGI_RW	8 //KT9
#define  MOOMOO_FA	9 //KT10
#define  TOAD_TP	10 //KT11
#define  KALI_DE	11 //KT12
#define  SHERB_LA	12 //KT13
#define  RAINBOW_RD	13 //KT14
#define  WARIO_ST	14 //KT15
#define  BLOCK_FO	15 //KT16
#define  SKY_SK	  	16 //KT17
#define  DOUBLE_DE	17 //KT18
#define  DK_JP	  	18 //KT19
#define  BIG_DO	  	19 //KT20
#define  TROPHY_CE	20 //KT21?

//Surfaces
#define NOTHING 		0
#define ASPHALT 		1
#define DIRT			2
#define SAND			3
#define STONE			4
#define SNOW            5
#define WOOD			6
#define SAND_TRAP		7
#define GRASS			8
#define ICE  			9
#define WET_SAND		10
#define WET_SNOW        11
#define ROCK            12
#define DIRT_TRAP       13
#define RAILWAY         14
#define CAVE            15
#define ROPE_BRIDGE     16		//BRIDGE
#define SOLID_BRIDGE    17      //KIBASHI
#define DASHMARK2		252	    //in DK JP
#define JUMPMARK		253	    //in DK JP
#define DASHMARK		254	    //in Royal_RW
#define OTHER 			255

//Lap
#define STARTLAP	 -1
#define FIRSTLAP	  0
#define SECONDLAP     1
#define FINALLAP      2
#define FINISHLAP     3

//g_gameMode
#define GP	  0
#define TT    1
#define VS    2
#define BA    3

//g_startingIndicator
#define STARTRACE	0
#define DEMOCAMERA	1
#define COUNTDOWN 	2
#define RACING    	3
#define WAITFINISH	4
#define FINISHRACE	5
#define FADEOUTRACE	6
#define NOOPERATION	7

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   FONT                                                 //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
//Size
#define	LET_BIG	0.9
#define	LET_MID	0.8
#define	LET_SML	0.9
#define	LET_MIC	0.8
#define	LET_THA	0.7
#define	LET_MIN	0.65

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   TECHNICAL / MATH                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
#define SPEED_KM(a)	(a*18.0)/216.0 ///18=1METER ,1frame=60->60*60*60=216000/1000=216

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   SCREEN / VIEW                                        //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Screen
#define	HT	240
#define	WD	320
#define	SCREEN_WIDTH		320
#define	SCREEN_HEIGHT		240
#define	SCREEN_ASPECT		(320.0f/240.0f)
#define	SCREEN_NEAR			156.0f
#define	SCREEN_FAR			20000.0f
#define	SCREEN_ANGLE		55.0f

//Compass
#define NORTH   0
#define EAST	1
#define SOUTH	2
#define WEST	3

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   CONTROLLER                                           //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Analog
#define ANA_RIGHT 0x0100
#define ANA_LEFT  0x0200
#define ANA_DOWN  0x0400
#define ANA_UP    0x0800

//Buttons
#define 	BTN_A		0x8000 
#define 	BTN_B		0x4000 
#define 	BTN_Z		0x2000 
#define 	BTN_START	0x1000 
#define 	BTN_DUP		0x0800 
#define 	BTN_DDOWN	0x0400 
#define 	BTN_DLEFT	0x0200 
#define 	BTN_DRIGHT	0x0100 
#define 	BTN_L		0x0020 
#define 	BTN_R		0x0010 
#define 	BTN_CUP		0x0008 
#define 	BTN_CDOWN	0x0004 
#define 	BTN_CLEFT	0x0002 
#define 	BTN_CRIGHT	0x0001

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   RAM SETUP                                            //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
#define	CODE_SEGMENT			 0
#define	DYNAMIC_SEGMENT			 1
#define	STATIC_SEGMENT	         2
#define	STATIC_SEGMENT2			13  /*STATICSEGMENT=0x0d000000*/
#define	OBJECT_TEXTURE			 3
#define	SEG_COURSE_DATA			 6  /*COURSESEGMENT=0x06000000*/
#define	COURSE_VERTEX			 4
#define	COURSE_TEXTURE			 5
#define	COURSE_DISPLAYLIST		 7
#define	COURSE_MATERIAL		     9
#define	SEG_COURSE_DATA2	     9  
#define	TEX_DATA_SEGMENT		10
#define	STEX_DATA_SEGMENT		11
#define	RESULT_SEGMENT		    11
#define	OBJECT_SEGMENT			14
#define	TEXTURE_SEGMENT    		15
#define	PK_SEGMENT       		15
#define	KART_SEGMENT    		15
#define	OTHER_SEGMENT    		15

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   LAKITU                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Animation Bit Flag
#define ANM_PLAYING			0x00002000
#define ANM_REVERSE			0x00004000

//Alpha Bit Flag
#define ANM_ALPHA_VISIBLE	0x00000001
#define ANM_ALPHA_DITHER	0x00000002

//Event Flag
#define LAKITU_START		1
#define LAKITU_GOAL			2
#define LAKITU_RESCUE		3
#define LAKITU_LAP2			4
#define LAKITU_LAPFINAL		5
#define LAKITU_REVERSE		6
#define LAKITU_RESCUE_ICE    7

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   GHOST                                                //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
#define GHOST_DRIVE   	0
#define GHOST_STOP    	1
#define GHOST_OFF	  	2
#define GHOST_WRITE 	0
#define GHOST_DRAW   	0
#define LOST_GHOST   	1
#define LOAD_GHOST      1
#define NONELOAD_GHOST  0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   PLAYER FLAGS                                         //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Player Flag
#define MOTOR_ON	   		0x0010 //ENGINE_START
#define HIT_ITEMBOX 		0x0020 //ROULETTE_START
#define IS_BOMB      		0x0040 //BOMB_KART
#define IS_ACTION     		0x0080 //ACTION
#define IS_GHOST			0x0100 //GHOST
#define IS_GP_OPENING		0x0200 //OPENING
#define IS_AUTO      		0x0200 //AUTO
#define IS_RACE_FINISH		0x0800 //GOALIN
#define IS_CPU_PLAYER		0x1000 //COP
#define NO_CONTROLS			0x2000 //NOCONT
#define IS_PLAYER			0x4000 //PLAYER
#define EXISTS				0x8000 //EXIST

//Player Status Flag
#define P1_DMA_SPRITE		0x0001
#define P1_DRAW_SPRITE		0x0002
#define P1_FLIP_SPRITE		0x0004
#define P1_DRAW_PARTICLES	0x0008
#define P2_DMA_SPRITE		0x0010
#define P2_DRAW_SPRITE		0x0020
#define P2_FLIP_SPRITE		0x0040
#define P2_DRAW_PARTICLES	0x0080
#define P3_DMA_SPRITE		0x0100
#define P3_DRAW_SPRITE		0x0200
#define P3_FLIP_SPRITE		0x0400
#define P3_DRAW_PARTICLES	0x0800
#define P4_DMA_SPRITE		0x1000
#define P4_DRAW_SPRITE		0x2000
#define P4_FLIP_SPRITE		0x4000
#define P4_DRAW_PARTICLES	0x8000

//Player Weapon Flag
#define HIT_BANANA      	0x00000001
#define HIT_REDSHELL    	0x00000002
#define HIT_GREENSHELL  	0x00000004
#define PRESS_SAVESPIN		0x00000080 //SET_PRO_WHEELSPIN
#define PRESS_SQUISH    	0x00000100 //PRESS_DOSHIN
#define USE_MUSHROOM    	0x00000200
#define USE_BOO				0x00000800 //USE_TERESA
#define USE_FEATHER			0x00001000 //USE_WING
#define USE_STAR            0x00002000
#define HIT_LIGHTNING      	0x00004000 //HIT_THUNDER
#define PRESS_BOOSTJUMP	    0x00008000 //HIT_DASH_MIDJUMP
#define HIT_TORNADO         0x00020000 //HIT_STORM
#define USE_BANANA	        0x00040000 //HANG_BANANA
#define HIT_BOAT			0x00080000 //HIT_FUNE
#define HIT_HEIGHTJUMP		0x00100000
#define HIT_CRITTER			0x00200000 //HIT_KANI
#define HIT_BOMB			0x00400000
#define PRESS_BOOSTPAD		0x00800000 //HIT_DASHJUMP
#define HIT_BOMB_THROW		0x01000000
#define USE_STARTDASH		0x02000000 //START_DUSH
#define PRESS_BECOME_BOMB	0x04000000 //CHANGE_BOMB
#define PRESS_IS_BOMB		0x08000000 //REAL_BOMB
#define PRESS_STARTSPIN		0x10000000 //CHECK_RAPID

//Player Hit Flag
#define CARHIT_JOIN   		0x0001
#define CARHIT_DOSHIN   	0x0002
#define CARHIT_DOSHIN_JOIN  0x0004
#define CARHIT_FIRST   		0x0008
#define WALLHIT	   	   	  	0x0010
#define WALLHIT_JOIN   		0x0020
#define CHECK_DOSHIN   	    0x0040
#define DOSHIN_DOWN   	 	0x0080

//Player Handling Flag
#define    REVERSE_GEAR		0x0001
#define    STEER_RIGHT		0x0002 //COUNTERST_R
#define    STEER_LEFT		0x0004 //COUNTERST_L
#define    REVERSE_ACCEL	0x0008 //N_REVERSE
#define    CPU_SIMPLE_KART	0x0010 //SIMPLE_RUN
#define    ACCELERATE		0x0020 //ACCELE
#define    START_SPIN_RIGHT	0x0040 //RAPID_R
#define    START_SPIN_LEFT	0x0080 //RAPID_L
#define    LANDING_DUST		0x0100 //LAND
#define    BOO_SMOKE_EFFECT	0x0200 //START_TERESA
#define    TROPHYJUMP_START	0x0400 //USE_RESULT_JUMP
#define    TROPHYJUMP_END	0x0800 //RESULT_JUMP
#define    TROPHYJUMP_STARS	0x1000 //RESULT_STAR
#define    TROPHYJUMP_KEEP	0x2000 //RESULT_KEEP
#define    SPINOUT_SWERVE	0x4000 //PRO_WHEELSPIN
#define    BALLOON_CUT		0x8000 //CUT_BALLOON

//Player Talk Flag
#define MUSIC_NOTE			0x0020 //TALK_ONPU
#define CRASH				0x0040
#define WHIRRR				0x0080
#define POOMP     			0x0100
#define BOING				0x0800
#define FLASH				0x1000 //HIT

//Player Slip Flag
#define IS_BRAKING	 		0x00000001 //BREAKE
#define IS_JUMPING 			0x00000002 //D_JUMP
#define IS_BOOSTJUMP_ZONE	0x00000004 //DASH_MIDJUMP
#define IS_IN_AIR 			0x00000008 //N_JUMP
#define IS_DRIFTING			0x00000010 //DRIFT
#define IS_AB_SPINNING		0x00000020 //SPIN_TURN
#define SPINOUT_RIGHT 		0x00000040 //SPIN_R
#define SPINOUT_LEFT 		0x00000080 //SPIN_L
#define IS_DRIFT_BOOSTING	0x00000100 //DRIFT_TURBO
#define IS_STAR 			0x00000200 //STAR
#define IS_TUMBLING			0x00000400 //ROLLOVER
#define IS_SPINNING_OUT		0x00000800 //WHEELSPIN
#define ON_CENTER_LINE		0x00001000 //CENTER_LINE
#define IS_TURBO_BOOSTING	0x00002000 //TURBO
#define IS_START_SPINNING	0x00004000 //RAPID_ACC 
#define IS_BONKING      	0x00008000 //CARHIT
#define IS_WALL_TUMBLING  	0x00010000 //ROLLOVER_FALL 
#define LIGHTNING_SPIN		0x00020000 //THUNDER_SPIN
#define DISABLE_SPIN	 	0x00040000 //DISABLE_SPIN
#define IS_FEATHER_JUMPING	0x00080000 //WING
#define IS_BOOST_JUMPING	0x00100000 //DASH_JUMP
#define IS_SLIP_STREAMING	0x00200000 //SLIP_STREAM
#define IS_WRONG_WAY		0x00400000 //REVERSE
#define IS_TORNADO_JUMPING	0x00800000 //STORM
#define IS_VERTICAL_HIT		0x01000000 //EXPLODE
#define IS_MOMENTUM_HIT		0x02000000 //THROW_EXPLODE
#define IS_SQUISHED			0x04000000 //BROKEN
#define IS_UNSQUISHED		0x08000000 //RESTORE
#define IS_HEIGHT_JUMPING	0x10000000 //HEIGHT_JUMP	
#define IS_DRIFT_STEERING	0x20000000 //STOPSTERR
#define IS_LIGHTNING_HIT	0x40000000 //THUNDER
#define IS_BOO				0x80000000 //TERESA

//Player Jugemu (Lakitu) Flag
#define IS_IN_WATER			0x0001 //WATER_FALL
#define ON_LAKITU_ROD 		0x0002 //HANG_JUGEMU
#define IS_FADING_OUT		0x0004 //ERASE
#define OUT_OF_BOUNDS  		0x0008 //OUTAREA
#define IS_FROZEN      		0x0010 //FREEZE
#define IS_MELTING 			0x0020 //MELT
#define IS_ALL_MELTING		0x0040 //ALL_MELT
#define HAS_ICE_CUBE		0x0080 //ICE_CUBE
#define LAKITU_CAMERA  		0x0100 //UP_CAMERA
#define LAVA_EFFECT   		0x1000 //FALL_LAVA
#define WATER_EFFECT		0x2000 //FALL_WATER

//Player Water Flag
#define SUBMERGED		0x0001 //DIVE
#define HALF_SUBMERGED	0x0002 //HALF_DIVE
#define SPLASH_START 	0x0004
#define SPLASH_DIVE  	0x0008 

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   ITEMS                                                //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Item flags
//#define ib_max		15
//#define	kwitemkazumax	ib_max
#define ib_nothing	0
#define ib_banana	1	
#define ib_bananas	2     
#define ib_gkame	3     
#define ib_gskame	4     
#define ib_rkame	5     
#define ib_rskame	6
#define ib_tkame	7     
#define ib_thunder	8	
#define ib_imbox	9
#define ib_star		10
#define ib_tellesa	11     
#define ib_kinoko1	12    
#define ib_kinoko2	13
#define ib_kinoko3	14
#define ib_kinokoc	15

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   OBJECTS                                              //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Simple Object Category
#define DOSHIN      1
#define TREE1       2
#define TREE2       3
#define TREE3       4
#define IWA         5
#define BANANA      6
#define GSHELL	    7
#define RSHELL	    8
#define EGG	        9
#define PAKKUN	   10
#define PUKUPUKU   11
#define IBOX   	   12
#define FAKEIBOX   13
#define SBANANA    14
#define SL1        15
#define SL2        16
#define SL3        17
#define COW        18
#define TREE4      19
#define PYLON      20
#define SGSHELL    21
#define SRSHELL    22
#define MKANBAN    23
#define FIRE       24
#define PALMTREE   25
#define TREE5      26
#define TREE6      27
#define TREE7      28
#define SNOWTREE   29
#define SABOTEN1   30
#define SABOTEN2   31
#define SABOTEN3   32
#define TREE8      33
#define BLUEFIRE   34
#define WKANBAN    35
#define FIREPILLAR 36
#define TRUCK1     37
#define SHIP       38
#define FUMIKIRI   39
#define BUS        40
#define TANKLORRY  41
#define TSHELL	   42
#define SIBOX	   43
#define RV	   	   44
#define SEDAN	   44
#define NUTS	   45
#define HOOTINGBOX 46 //Place new categories here

//Simple Object Flags
#define EXISTOBJ   	 0x8000
#define HITOBJ     	 0x4000
#define MOVEOBJ    	 0x2000
#define MYOBJ        0x1000
#define HIDEOBJ  	 0x800
#define FLYINGOBJ  	 0x400
#define SEBANANAOBJ  0x200
#define SEKAMEHITOBJ 0x100
#define SEKAMEOUTOBJ 0x80
#define ONSCREEN1    0x1
#define ONSCREEN2    0x2
#define ONSCREEN3    0x4
#define ONSCREEN4    0x8

//Special object defines !!! Probably not working with compiler !!!
//#define NOWSPIN SPIN_R|SPIN_L|ROLLOVER
#define BANANAHIT IS_SPINNING_OUT|SPINOUT_LEFT|SPINOUT_RIGHT//WHEELSPIN|SPIN_L|SPIN_R
#define RSHELLHIT IS_VERTICAL_HIT //EXPLODE
#define GSHELLHIT IS_TUMBLING //ROLLOVER
#define WEAPONHIT IS_SPINNING_OUT|SPINOUT_LEFT|SPINOUT_RIGHT|IS_VERTICAL_HIT|IS_TUMBLING //WHELLSPIN|SPIN_L|SPIN_R|EXPLODE|ROLLOVER

//Object Numbers
#define objnum_TRAIN_SMOKE	1
#define objnum_DOSUN_SMOKE	2
#define objnum_DOSUN_BROKEN	3
#define objnum_KOOPA_FIRE	4
#define objnum_KOKOOPA_FIRE	5
#define objnum_SHIP_SMOKE	6
#define objnum_TREE_LEAF	7
#define objnum_TREE_SNOW	8
#define objnum_FIRE_WALL	9
#define objnum_KAME_FIRE	10
#define objnum_CAVE_FIRE	11
#define objnum_STAR		    12
#define objnum_BAT		    13

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   MUSIC                                                //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Sequence Channel
#define CHANNEL_MUTE		0x10000000
#define CHANNEL_PAUSE		0x20000000
#define CHANNEL_IDLE		0x40000000
#define CHANNEL_PLAYING		0x80000000

//BGM Flags
#define NA_SEQ_SE		0x0000
#define TITLE_BGM		0x0001
#define SELECT_BGM		0x0002
#define CIRCUIT_BGM		0x0003
#define COUNTRY_BGM		0x0004
#define MOUNTAIN_BGM	0x0005
#define BEACH_BGM		0x0006
#define OBAKE_BGM		0x0007
#define SNOW_BGM		0x0008
#define CASTLE_BGM		0x0009
#define DIRT_BGM		0x000a
#define GRID_BGM		0x000b
#define FINALLAP_FAN	0x000c
#define GOALIN_A_BGM	0x000d
#define GOALIN_B_BGM	0x000e
#define GOALIN_C_BGM	0x000f
#define RESULT_BGM		0x0010
#define STAR_BGM		0x0011
#define RAINBOW_BGM		0x0012
#define JUNGLE_BGM		0x0013
#define GAMEOVER_BGM	0x0014
#define HIGHWAY_BGM		0x0015
#define TIMEGRID_BGM	0x0016
#define VSRESULT_BGM	0x0017
#define LOSTRESULT_BGM	0x0018
#define BATTLE_BGM		0x0019
#define PRIZE_A_BGM		0x001a
#define PRIZE_B_BGM		0x001b
#define ENDING_BGM		0x001c
#define PRIZE_C_BGM		0x001d

//BGM Volume
#define FULL_VOLUME 127
#define HARF_VOLUME	75
#define ZERO_VOLUME	0

//SFX Echo Flags
#define ECHO_TUNNEL	85
#define ECHO_ROOM	65
#define ECHO_WALL	30

//SFX Flags
#define SE_ENGINE_MARIO	    0x0104ff00 //ENGINE PLAYER
#define SE_ENGINE_LUIZI	    0x0104ff01
#define SE_ENGINE_YOSSY	    0x0104ff02
#define SE_ENGINE_KINOP	    0x0104ff03
#define SE_ENGINE_DONKY	    0x0104ff04
#define SE_ENGINE_WARIO	    0x0104ff05
#define SE_ENGINE_PEACH	    0x0104ff06
#define SE_ENGINE_KUPPA	    0x0104ff07

#define SE_BRAKE			0x0100f908
#define SE_SLIP				0x0100f009
#define SE_DRIFT			0x0100f40a
#define SE_GRASS_C			0x0100f00b
#define SE_GRASS_L			0x0100f00c
#define SE_GRASS_R			0x0100f00d
#define SE_WATER_C			0x0100f00e
#define SE_WATER_L			0x0100f00f
#define SE_WATER_R			0x0100f010
#define SE_SAND_TRAP_C		0x0100f011
#define SE_SAND_TRAP_L		0x0100f012
#define SE_SAND_TRAP_R		0x0100f013
#define SE_WOOD				0x0100f01e
#define SE_STONE			0x0100f01f
#define SE_SNOW				0x0100f021
#define SE_PLY_ENG_BARIBARI	0x0100f926
#define SE_PLY_ENG_BARI4	0x01008026
#define SE_ICE				0x0100f027
#define SE_DIRT_TRAP_C		0x0100f029
#define SE_DIRT_TRAP_L		0x0100f02a
#define SE_DIRT_TRAP_R		0x0100f02b
#define SE_WET_SNOW_C		0x0100f048
#define SE_WET_SNOW_L		0x0100f049
#define SE_WET_SNOW_R		0x0100f04a
#define SE_JYUGEMU_LEVEL	0x0100fa4b

#define SE_CRUSH00			0x19007020
#define SE_CRUSH01			0x19007021
#define SE_CRUSH02			0x19007022
#define SE_CRUSH03			0x19007023
#define SE_CRUSH04			0x19007024
#define SE_CRUSH05			0x19007025
#define SE_CRUSH06			0x19007026
#define SE_CRUSH07			0x19007027
#define SE_CRUSH08			0x19007028
#define SE_CRUSH09			0x19007029
#define SE_CRUSH10			0x1900702a
#define SE_CRUSH11			0x1900702b
#define SE_CRUSH12			0x1900702c
#define SE_CRUSH13			0x1900702d
#define SE_CRUSH14			0x1900702e
#define SE_CRUSH15			0x1900702f
#define SE_CRUSH16			0x19007030
#define SE_CRUSH17			0x19007031
#define SE_CRUSH18			0x19007032
#define SE_CRUSH19			0x19007033
#define SE_CRUSH20			0x19007034
#define SE_CRUSH21			0x19007035
#define SE_CRUSH22			0x19007036
#define SE_CRUSH23			0x19007037
#define SE_CRUSH24			0x19007038
#define SE_CRUSH25			0x19007039
#define SE_HORN5			0x1901703f
#define SE_HORN6			0x19017040
#define SE_WARAU			0x19018045
#define SE_HARAHORO			0x1901904b

#define SE_VOICE_SHOT	    0x29008000 //VOICE
#define SE_VOICE_GOGO	    0x29008001
#define SE_VOICE_GOGO2	    0x29008002
#define SE_VOICE_SPIN	    0x29008003
#define SE_VOICE_FALL	    0x29008004
#define SE_VOICE_DAMAGE	    0x29008005
#define SE_VOICE_HIT	    0x29008006
#define SE_VOICE_GOALIN	    0x29008007
#define SE_VOICE_LUCKY	    0x29008008
#define SE_ENM_VOICE_LUCKY	0x29008008
#define SE_ENM_VOICE_THROW	0x29008009
#define SE_ENM_VOICE_SPIN	0x2900800a
#define SE_ENM_VOICE_DAMAGE	0x2900800b
#define SE_VOICE_JUMP		0x2900800c
#define SE_VOICE_YAHHO		0x2900800d
#define SE_ENM_VOICE_OVERTAKE	0x2900800d
#define SE_VOICE_DECIDE	    0x2900800e

#define SE_MARIO			0x00000000 // VOICE OFFSETS
#define SE_LUIZI			0x00000010
#define SE_YOSSY			0x00000020
#define SE_KINOP			0x00000030
#define SE_DONKY			0x00000040
#define SE_WARIO			0x00000050
#define SE_PEACH			0x00000060
#define SE_KUPPA			0x00000070

#define SE_ENM_ENG_MARIO    0x31028000 //ENGINE ENEMY
#define SE_ENM_ENG_LUIZI    0x31028001
#define SE_ENM_ENG_YOSSY    0x31028002
#define SE_ENM_ENG_KINOP    0x31028003
#define SE_ENM_ENG_DONKY    0x31028004
#define SE_ENM_ENG_WARIO    0x31028005
#define SE_ENM_ENG_PEACH    0x31028006
#define SE_ENM_ENG_KUPPA    0x31028007
#define SE_ENM_MUTEKI		0x31029008

#define SE_CURSOL			0x49008000 //MENU
#define SE_DECIDE			0x49008001
#define SE_CANCEL			0x49008002
#define SE_RED_SIGNAL	    0x49008003
#define SE_GREEN_SIGNAL	    0x49008004
#define SE_PAUSE_ON			0x49008005
#define SE_PAUSE_OFF		0x49008006
#define SE_BUBU				0x4900ff07
#define SE_LOGO				0x49018008
#define SE_ThisIsMarioKart	0x49009009
#define SE_MarioGrandprix	0x4900900a
#define SE_TimeAttack		0x4900900b
#define SE_Versus			0x4900900c
#define SE_Battle			0x4900900d
#define SE_SelectLevel		0x4900900e
#define SE_OK				0x4900900f
#define SE_Option			0x49009010
#define SE_Data				0x49009011
#define SE_SelectYourPlayer	0x49009012
#define SE_SelectMap		0x49009013
#define SE_Congratulations	0x49009014
#define SE_WIPE_RESULT		0x49008015
#define SE_MENU_OK			0x49008016
#define SE_KARABUKASHI1		0x49008018
#define SE_KARABUKASHI2		0x49008019
#define SE_MENU_OK_TITLE	0x4900801a
#define SE_MENU_OK_QUIT		0x4900801b
#define SE_MAP_CHANGE		0x4900801c
#define SE_BGM_MUTE			0x4900801c
#define SE_ERASE_DATA		0x4900801d
#define SE_STEREO			0x49008024
#define SE_HEADPHONE		0x49008025
#define SE_THE_END			0x49008026
#define SE_KARABUKASHI1_J	0x49008027
#define SE_KARABUKASHI2_J	0x49008028
#define SE_MONO				0x49008029

//NAMED BY LITRO:
//Kart Various
#define SE_KART_JUMP_BOING  	    0x19008000 //SE_MINI_JUMP
#define SE_KART_FEATHER_JUMP	    0x19008002 //SE_HANE_JUMP
#define SE_KART_FINISH_RACE         0x1900f103 //SE_GOAL_IN
#define SE_KART_WATER_SPLASH		0x19008008 //SE_DIVE_WATER
#define SE_KART_LANDING     		0x1900a209 //SE_CHAKUCHI_M
#define SE_KART_LANDING_BIG 		0x1900a60a //SE_CHAKUCHI_L
#define SE_KART_DASH				0x1900a40b //SE_DASH
#define SE_KART_OVER_DRIFT	        0x1900851e //SE_OVER_DRIFT
#define SE_KART_EXPLOSION		    0x19018010 //SE_KAME_HIT
#define SE_KART_EXPLOSION_BIG	    0x19009005 //SE_BIG_CRUSH
#define SE_KART_FLATTENED_SWAYING	0x0100f024 //SE_FUWAFUWA
#define SE_KART_SLIPSTREAM  	    0x19008011 //SE_SLIPSTREEM
#define SE_KART_PUT_BANANA		    0x19008012 //SE_BANANA
#define SE_KART_ITEM_THROW  	    0x19008004 //SE_KAME_HASSHA
#define SE_KART_ITEM_THROW_HIGH		0x19018014 //SE_ENM_THROW

//Kart Hit
#define SE_KART_HIT_TREE			0x19007018 //SE_TREE
#define SE_KART_HIT_WALL			0x19007019 //SE_WALL
#define SE_KART_HIT_GUARD_RAIL		0x1900701a //SE_GARD
#define SE_KART_HIT_HAND_RAIL		0x1900701b //SE_TESURI
#define SE_KART_HIT_METAL   	    0x19008001 //SE_ENEMY_CRUSH
#define SE_KART_HIT_ICE 			0x1900701d //SE_SHARBET
#define SE_KART_HIT_SHRUB			0x1900701f //SE_UEKOMI
#define SE_KART_HIT_PENGUIN         0x1900a046 //SE_PENGUIN_CRUSH
#define SE_KART_HIT_THWOMP  		0x1900a04c //SE_DOSSUN_HIT
#define SE_KART_HIT_PIRANHA 		0x1900a052 //SE_PAKKUN_CRUSH

//Fanfares
#define SE_2ND_LAP_FANFARE			0x1900f015 //SE_2ND_LAP
#define SE_FINAL_LAP_FANFARE		0x1900ff3a //SE_FINALLAP_BGM

//Various
#define SE_FREEZING     			0x1900a055 //SE_FREEZE
#define SE_ICE_CRUSH        	    0x1900a056 //SE_ICE_CRUSH
#define SE_THWOMP_LAND  		    0x1900800f //SE_DOSSUN
#define SE_THWOMP_DESTROY		    0x1901a24a //SE_DOSSUN_CRUSH
#define SE_BALLOON_LOST     		0x19009051 //SE_FUUSEN_OUT
#define SE_ITEMBOX_DESTROY          0x19008406 //SE_ITEMBOX
#define SE_ITEM_BOO_SWOOSH  		0x19009e59 //SE_OBAKE_TRG
#define SE_WATER_SPLASH		        0x1900801c //SE_DIVE_YOUGAN
#define SE_RAILROAD_CROSSING_DING	0x19017016 //SE_FUMIKIRI
#define SE_METAL_COFFIN             0x1901904e //SE_KANOKE
#define SE_THUNDER          		0x1900f013 //SE_THUNDER_PAN
#define SE_BOWSER_FIRE              0x51038009 //SE_KUPPA_FIRE
#define SE_BOWSER_FIRE_SMALL    	0x5102800a //SE_KOKUPPA_FIRE
#define SE_ITEM_BANANA_BUNCH_HIT	0x19019053 //SE_BANANA_OUT
#define SE_ITEM_SHELL_HIT		    0x19008054 //SE_KAME_OUT
#define SE_ITEM_ROULETTE_FINISH     0x0100fe47 //SE_ITEM_DECIDE_L
#define SE_UI_CAMERA_OUT    		0x1900904f //SE_CAMERA_LONG
#define SE_UI_CAMERA_IN     		0x19009050 //SE_CAMERA_SHORT
#define SE_UI_ERROR_MISSING			0x1900a058 //SE_HAZURE

//Entities
#define SE_BOO_LAUGH    			0x1900705a //SE_TERESA
#define SE_THWOMP_LAUGH     		0x19036045 //SE_WARAU_SLIDE
#define SE_BAT_SINGLE    			0x19017044 //SE_KOUMORI
#define SE_COW      				0x1901904d //SE_COU
#define SE_MONTY_MOLE   		    0x19018007 //SE_CHOROPU
#define SE_SEAGULL      			0x19017043 //SE_KAMOME
#define SE_PENGUIN_BIG		        0x19007017 //SE_PENGUIN
#define SE_PENGUIN_SMALL    		0x19007049 //SE_KOPENGUIN
#define SE_CHAIN_CHOMP  			0x19018057 //SE_WANWAN

//Horns
#define SE_SEDAN_HORN_SINGLE		0x1901703b //SE_HORN1
#define SE_SEDAN_HORN_MULTI         0x1901703c //SE_HORN2
#define SE_BUS_TRUCK_HORN_SINGLE	0x1901703d //SE_HORN3
#define SE_BUS_TRUCK_HORN_MULTI		0x1901703e //SE_HORN4
#define SE_TANKLORRY_HORN_SINGLE	0x19017041 //SE_HORN7
#define SE_TANKLORRY_HORN_MULTI     0x19017042 //SE_HORN8
#define SE_TRAIN_WHISTLE_SINGLE		0x1901800d //SE_KITEKI
#define SE_TRAIN_WHISTLE_MULTI		0x1901800e //SE_KITEKI2
#define SE_BOAT_HORN_SINGLE			0x19018047 //SE_KISEN
#define SE_BOAT_HORN_MULTI			0x19018048 //SE_KISEN2

//Global only
#define SE_GLOBAL_THUNDER			0x1900f00c //SE_THUNDER  
#define SE_GLOBAL_COIN				0x49008017 //SE_COIN
#define SE_GLOBAL_FIREWORKS			0x4900801e //SE_HANABI
#define SE_GLOBAL_CHEEPCHEEP_CHARGE	0x4900801f //SE_PUKUPUKU_BIGGER
#define SE_GLOBAL_CHEEPCHEEP_INTRO	0x49008020 //SE_PUKUPUKU_DOWN
#define SE_GLOBAL_CHEEPCHEEP_FIRE	0x49008021 //SE_PUKUPUKU_FIRE
#define SE_GLOBAL_PODIUM_JUMP		0x49008022 //SE_DODAI_UP
#define SE_GLOBAL_STAR_SHIMMER		0x49008023 //SE_STAR_BURST
#define SE_GLOBAL_CROWD_EEEH		0x4900802a //SE_EEEE

//Looping
#define SE_LAKITU_REVERSE			0x0100fa28 //SE_REVERSE
#define SE_ITEM_ROULETTE			0x0100fe1c //SE_ROULETTE
#define SE_DRIVE_SPIN_OUT           0x0100f81d //SE_RAPID_ACC
#define SE_DRIVE_ROPE_BRIDGE		0x0100f020 //SE_TURIBASHI
#define SE_DRIVE_AB_SPIN    		0x0100f822 //SE_SPIN_TURN
#define SE_DRIVE_WOOD_BRIDGE		0x0100f023 //SE_KIBASHI
#define SE_DRIVE_BRICKS		        0x51038007 //SE_ZUSSIN_SLIDE
#define SE_DRIVE_RAILWAY            0x01008046 //SE_RAILWAY
#define SE_DRIVE_BUBBLES	        0x0100f025 //SE_BABLE
#define SE_LEVEL_ENGINE_TRAIN       0x51018000 //SE_KISHA_LEVEL
#define SE_LEVEL_ENGINE_BUS	        0x51018002 //SE_BUS_LEVEL
#define SE_LEVEL_ENGINE_TRUCK       0x51018003 //SE_TRUCK_LEVEL
#define SE_LEVEL_ENGINE_TANKLORRY   0x51018004 //SE_TRAILER_LEVEL
#define SE_LEVEL_ENGINE_SEDAN       0x51018005 //SE_COUPE_LEVEL
#define SE_LEVEL_BATS    	        0x51028006 //SE_KOUMORI_LEVEL
#define SE_LEVEL_JUNGLE_NOISES      0x0170802d //SE_JUNGLE_LEVEL
#define SE_LEVEL_WATERFALL	        0x51028001 //SE_WATER_FALL
#define SE_LEVEL_AUDIENCE	        0x5103700b //SE_KANSEI
#define SE_STATE_THUNDERED		    0x5101c00c //SE_THUNDER_LEV
#define SE_STATE_INVISIBLE	        0x0100fa4c //SE_OBAKE_LEV
#define SE_STATE_INVINCIBLE	        0x0100ff2c //SE_MUTEKI_BGM
#define SE_ITEM_BLUE_SHELL 	        0x51018008 //SE_TOGEGAME_LEVEL

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   MENU                                                 //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Object Block IDs
#define KO_TITLE	1
#define KO_TITLE2	2
#define KO_TITLE3	3
#define KO_NOCONTROLLER	4
#define KO_TITLE_TIME	5
#define KO_GSEL_LOGO	10
#define KO_GSEL_1P	(KO_GSEL_LOGO+1)
#define KO_GSEL_2P	(KO_GSEL_LOGO+2)
#define KO_GSEL_3P	(KO_GSEL_LOGO+3)
#define KO_GSEL_4P	(KO_GSEL_LOGO+4)
#define KO_GSEL_OK	(KO_GSEL_LOGO+5)
#define KO_GSEL_OPTION	(KO_GSEL_LOGO+6)
#define KO_GSEL_RECORD	(KO_GSEL_LOGO+7)
#define KO_GSEL_50CC	(KO_GSEL_LOGO+8)
#define KO_GSEL_100CC	(KO_GSEL_LOGO+9)
#define KO_GSEL_150CC	(KO_GSEL_LOGO+10)
#define KO_GSEL_PRO	(KO_GSEL_LOGO+11)
#define KO_GSEL_ITEMON	(KO_GSEL_LOGO+12)
#define KO_GSEL_ITEMOFF	(KO_GSEL_LOGO+13)
#define KO_GSEL_TRY	(KO_GSEL_LOGO+14)
#define KO_GSEL_DATA	(KO_GSEL_LOGO+15)
//#define KO_GSEL_GHOST	(KO_GSEL_LOGO+16)
#define KO_GSEL_CAUTION	(KO_GSEL_LOGO+17)

#define KO_GSEL_BACK	35
#define KO_PSEL_BACK	36
#define KO_MSEL_BACK	37

#define KO_PSEL_LOGO	42
#define KO_PSEL_MA	43
#define KO_PSEL_LU	44
#define KO_PSEL_PE	45
#define KO_PSEL_KI	46
#define KO_PSEL_YO	47
#define KO_PSEL_KA	48
#define KO_PSEL_WA	49
#define KO_PSEL_KU	50
#define KO_PSEL_OK	51
#define KO_PSEL_1P	52
#define KO_PSEL_2P	53
#define KO_PSEL_3P	54
#define KO_PSEL_4P	55
#define KO_MSEL_LOGO	82
#define KO_MSEL_KCUP	83
#define KO_MSEL_FCUP	84
#define KO_MSEL_SCUP	85
#define KO_MSEL_SPCUP	86
#define KO_MSEL_MAP	87
#define KO_MSEL_KNAME	88
#define KO_MSEL_FNAME	89
#define KO_MSEL_SNAME	90
#define KO_MSEL_SPNAME	91
#define KO_MSEL_BATTLE	92
#define KO_MSEL_OK	93
#define KO_MSEL_NOISE	94
#define KO_MSEL_MAP1	95
#define KO_MSEL_MAP2	(KO_MSEL_MAP1+1)
#define KO_MSEL_MAP3	(KO_MSEL_MAP1+2)
#define KO_MSEL_MAP4	(KO_MSEL_MAP1+3)
#define KO_MSEL_MAPMAN	100
#define KO_MSEL_BRECORD	101
#define KO_MSEL_BLAP	102
#define KO_MSEL_CUP	103
#define KO_MSEL_LEVEL	104
#define KO_MSEL_GHOST	105
#define KO_MSEL_BTMES	110
#define KO_TSEL_KCUP	120
#define KO_TSEL_FCUP	121
#define KO_TSEL_SCUP	122
#define KO_TSEL_SPCUP	123
#define KO_TSEL_KCUP1	124
#define KO_TSEL_KCUP2	(KO_TSEL_KCUP1+1)
#define KO_TSEL_KCUP3	(KO_TSEL_KCUP1+2)
#define KO_TSEL_KCUP4	(KO_TSEL_KCUP1+3)
#define KO_TSEL_FCUP1	(KO_TSEL_KCUP1+4)
#define KO_TSEL_FCUP2	(KO_TSEL_KCUP1+5)
#define KO_TSEL_FCUP3	(KO_TSEL_KCUP1+6)
#define KO_TSEL_FCUP4	(KO_TSEL_KCUP1+7)
#define KO_TSEL_SCUP1	(KO_TSEL_KCUP1+8)
#define KO_TSEL_SCUP2	(KO_TSEL_KCUP1+9)
#define KO_TSEL_SCUP3	(KO_TSEL_KCUP1+10)
#define KO_TSEL_SCUP4	(KO_TSEL_KCUP1+11)
#define KO_TSEL_SPCUP1	(KO_TSEL_KCUP1+12)
#define KO_TSEL_SPCUP2	(KO_TSEL_KCUP1+13)
#define KO_TSEL_SPCUP3	(KO_TSEL_KCUP1+14)
#define KO_TSEL_SPCUP4	(KO_TSEL_KCUP1+15)
#define KO_TSEL_TITLE	140
#define KO_TSEL_CURSOR	141
#define KO_GAME_CUP	150
#define KO_GAME_CIRCUIT	(KO_GAME_CUP+1)
#define KO_GAME_CUT_UD	(KO_GAME_CUP+2)
#define KO_GAME_MA	(KO_GAME_CUP+10)
#define KO_GAME_LU	(KO_GAME_CUP+11)
#define KO_GAME_TIME	170
#define KO_GAME_POINT	(KO_GAME_TIME+1)
#define KO_GAME_GPLOSE	(KO_GAME_TIME+2)
#define KO_GAME_INFO3P	175
#define KO_GAME_VS_RES	176
#define KO_GAME_VS_1P	177
#define KO_GAME_VS_2P	178
#define KO_GAME_VS_3P	179
#define KO_GAME_VS_4P	180
#define KO_GAME_TA1	185
#define KO_GAME_TA2	186
#define KO_GAME_TA_SORT	187
#define KO_GAME_TA_MES1	188
#define KO_GAME_TA_REP	189
#define KO_GAME_TA_RANK	190
#define KO_GAME_PAUSE	199
#define KO_TEST_CPFONT	200
#define KO_CP_BG1	210
#define KO_CP_BG2	(KO_CP_BG1+1)
#define KO_CP_GNOTE	(KO_CP_BG1+2)
#define KO_CP_MES1	(KO_CP_BG1+3)
#define KO_CP_MES2	(KO_CP_BG1+4)
#define KO_CP_FREE	(KO_CP_BG1+5)
#define KO_CP_CURSOR1	(KO_CP_BG1+6)
#define KO_CP_CURSOR2	(KO_CP_BG1+7)
#define KO_CP_CSCOLOR	(KO_CP_BG1+8)
#define KO_DSEL_SNAP	230
#define KO_DSEL_MES1	(KO_DSEL_SNAP+1)
#define KO_DSEL_SEL1	(KO_DSEL_SNAP+2)
#define KO_DSEL_SEL2	(KO_DSEL_SNAP+3)
#define KO_DSEL_SEL3	(KO_DSEL_SNAP+4)
#define KO_OPT_MES	240
#define KO_OPT_LOGO	241
#define KO_NINTEN_LOGO	250
#define KO_CHECKER_FLAG	251
#define KO_TA_LOSTGHOST	270
#define KO_END1_FADE	299
#define KO_END1_MES1	300
#define KO_END1_MES2	301
#define KO_END1_MES3	302
#define KO_END1_MES4	303
#define KO_END1_FACE	304
#define KO_SR_A1	400
#define KO_SR_A2	401
#define KO_SR_B1	402
#define KO_SR_B2	403
#define KO_SR_C1	404
#define KO_SR_C2	405
#define KO_SR_D1	406
#define KO_SR_D2	407
#define KO_SR_E1	408
#define KO_SR_E2	409
#define KO_SR_E3	410
#define KO_SR_E4	411
#define KO_SR_E5	412
#define KO_SR_E6	413
#define KO_SR_E7	414
#define KO_SR_F1	415
#define KO_SR_F2	416
#define KO_SR_F3	417
#define KO_SR_F4	418
#define KO_SR_G1	419
#define KO_SR_G2	420
#define KO_SR_H1	421
#define KO_SR_H2	422
#define KO_SR_H3	423
#define KO_SR_H4	424
#define KO_SR_H5	425
#define KO_SR_H6	426
#define KO_SR_H7	427
#define KO_SR_H8	428
#define KO_SR_I1	429
#define KO_SR_I2	430
#define KO_SR_I3	431
#define KO_SR_I4	432
#define KO_SR_J1	433
#define KO_SR_J2	434
#define KO_SR_K1	435
#define KO_SR_K2	436
#define KO_SR_K3	437
#define KO_SR_L1	438
#define KO_SR_L2	439
#define KO_SR_L3	440
#define KO_SR_L4	441
#define KO_SR_L5	442
#define KO_SR_L6	443
#define KO_SR_L7	444
#define KO_SR_M1	445
#define KO_SR_M2	446
#define KO_SR_M3	447
#define KO_SR_M4	448
#define KO_SR_N1	449
#define KO_SR_N2	450
#define KO_SR_N3	451
#define KO_SR_O1	452
#define KO_SR_O2	453
#define KO_SR_O3	454
#define KO_SR_O4	455
#define KO_SR_O5	456
#define KO_SR_O6	457
#define KO_SR_O7	458
#define KO_SR_O8	459
#define KO_SR_O9	460
#define KO_SR_P1	461
#define KO_SR_Q1	462

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   COLORS                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

#define BLACK  0x00000000
#define WHITE  0x00FFFFFF
#define RED    0x00FF0000
#define BLUE   0x00646464

#define STAR_YELLOW 0x00707000
#define STAR_GREEN  0x00007000
#define STAR_RED    0x00700000
#define STAR_BLUE   0x00000070

#define LIGHT_BLACK  0x006F6F6F
#define LAVA_BLACK   0x00F0F0F0

#define THUNDER_WHITE 0x00808080
#define THUNDER_BLUE   0x00000070
#define THUNDER_YELLOW 0x008f8f00
#define MAP_ADJRED      0x00004040
#define MAP_RED     	0x00340000
#define MAP_ADJYELLOW   0x000000E0
#define MAP_YELLOW  	0x001C0000

#define NORMAL_COL 		0x00ffffff
#define LAVA_COL 		0x00000000
#define DIRT_COL  		0x00ff4040
#define DIRT_COL1 		0x00FF8247
#define DIRT_TRAP_COL   0x00ffA54F
#define SANDTRAP_COL  	0x00FFD37A
#define SAND_COL  		0x00ffd080
#define WET_SAND_COL  	0x00ffA54F
#define WOOD_COL  		0x00ff4040
#define ASPHALT_COL 	0x00ffffff
#define SNOW_COL 		0x00ffffff
#define TURBO_COL 		0x00ffff00
#define YELLOW          0x00ffff20

#define NORM_GASS_IN    0x00FBFFFB
#define NORM_GASS_OUT   0x0089628F
#define TURBO_GASS_IN    0x00FFFB86
#define TURBO_GASS_OUT   0x00FE0109
#define TURBO_SLIP_IN    0x00FFFFDF
#define TURBO_SLIP_OUT   0x00FF5F00

#define NORM_SMOKE_NUM      	0
#define DIRT_SMOKE_NUM      	1
#define SAND_TRAP_SMOKE_NUM 	2
#define SAND_SMOKE_NUM      	3
#define WET_SAND_SMOKE_NUM  	4
#define DIRT_TRAP_SMOKE_NUM 	5
#define SNOW_SMOKE_NUM      	6
#define DIRT11_SMOKE_NUM     	7
#define DIRT9_SMOKE_NUM     	8
#define DIRT14_SMOKE_NUM     	9
#define DIRT4_SMOKE_NUM     	10
#define DIRT18_SMOKE_NUM     	11

#define NORM_SMOKE_IN  0x00FBFFFB
#define NORM_SMOKE_OUT 0x00B0B0B0
#define DIRT_SMOKE_IN  0x00A06011
#define DIRT_SMOKE_OUT 0x00804011 
#define SAND_TRAP_SMOKE_IN  0x00E0C090
#define SAND_TRAP_SMOKE_OUT 0x00B08050
#define SAND_SMOKE_IN  0x00D0B080
#define SAND_SMOKE_OUT 0x00A07040
#define WET_SAND_SMOKE_IN  0x00907040
#define WET_SAND_SMOKE_OUT 0x00603011
#define DIRT_TRAP_SMOKE_IN  0x00C07010
#define DIRT_TRAP_SMOKE_OUT 0x00804010
#define SNOW_SMOKE_IN  0x00D0F0FF
#define SNOW_SMOKE_OUT 0x007090A0
#define DIRT24_SMOKE_IN  0x00FF8247
#define DIRT24_SMOKE_OUT 0x00FF8247
#define DIRT11_SMOKE_IN  0x00E09030
#define DIRT11_SMOKE_OUT 0x00A06030 
#define DIRT9_SMOKE_IN  0x00C09030
#define DIRT9_SMOKE_OUT 0x00A07010
#define DIRT14_SMOKE_IN  0x00604020
#define DIRT14_SMOKE_OUT 0x00301011 
#define DIRT4_SMOKE_IN  0x00F0D0B0
#define DIRT4_SMOKE_OUT 0x00B0A080
#define DIRT18_SMOKE_IN  0x00A08030
#define DIRT18_SMOKE_OUT 0x00806010 

#define ACDITHER_ALPHA  0xA8
#define ACNONE_ALPHA    0x80

#define MARIO_BALLOON 		0x00C80100
#define MARIO_BALLOON_ADJ 	0x00DC0000
#define LUIZI_BALLOON		0x00007001
#define LUIZI_BALLOON_ADJ 	0x00008c06
#define YOSSY_BALLOON 		0x00107951
#define YOSSY_BALLOON_ADJ 	0x00000051
#define KINOP_BALLOON		0x00005970
#define KINOP_BALLOON_ADJ 	0x00000000
#define DONKY_BALLOON 		0x00705500
#define DONKY_BALLOON_ADJ 	0x00000000
#define WARIO_BALLOON		0x007A7E00
#define WARIO_BALLOON_ADJ 	0x00000000
#define PEACH_BALLOON 		0x00772C24
#define PEACH_BALLOON_ADJ 	0x00000000
#define KUPPA_BALLOON 		0x00301458
#define KUPPA_BALLOON_ADJ 	0x00000000
