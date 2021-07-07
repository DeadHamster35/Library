#include <sys/types.h>
#include <math.h>
#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "LibraryVariables.h"
#include "SubProgram.h"

/*
//Soundeffect IDs//
0 - Kart: Boing jump/thwomp hit
1 - Kart: Boom (high fall royal)
2 - Kart: Motor DK
3 - EnemySounds: Kart: Motor Idle
4 - Mario: Wehee!
5 - Mario: Wohoo!
6 - Mario: Yeah! Hahahaa!
7 - Mario: Wouououou!
8 - Mario: Mamma Mia!
9 - Mario: Ou! Wowowowow!
10 - Mario: Okiedokie!
11 - Mario: Let's go
12 - Mario: Hihi! I got it!
13 - Luigi: Hohoo!
14 - Luigi: Here we go!
15 - Luigi: Bingo! Hohohoho!
16 - Course: Penguin Noise
17 - Luigi: Mamma Mia!
18 - Luigi: Wouououou!
19 - Surface: Ice
20 - Luigi: Yahoo!
21 - Luigi: I'm-a Luigi! Number one!
22 - Yoshi: positive/negative
23 - Surface: Drowning in water
24 - (unknown)Thud Hit
25 - DK: Happy
26 - DK: Upset
27 - Bowser: Happy
28 - Bowser: Upset
29 - Course: Seagull Noise
30 - Yoshi: positive/negative
31 - Toad: Whooo!
32 - Toad: Here we go!
33 - Toad: Yeah! Ahahahaha!
34 - Toad: Okay!
35 - Toad: Ou! Wowowowow!
36 - Toad: Aaaaaaaah!
37 - Surface: Fall into Water
38 - Toad: Yahoo!
39 - Course: Waterfall
40 - Jingle: Race Start
41 - Course: Turnpike Bus/Tanker Motor
42 - Course: Turnpike Car Honk
43 - Course: Turnpike Truck/Bus Honk
44 - Course: Turnpike Tanker Honk
45 - Course: Jungle Noises
46 - Peach: Alright!
47 - Peach: Peachy!
48 - Kart: Motor Bowser/Wario
49 - Wario: Fire!
50 - Wario: Here I go!
51 - Wario: Ahahahaha!
52 - Toad: I'm the best!
53 - Wario: Wayayayaa!
54 - Wario: Waaah!
55 - Course: Turnpike Truck/Bus Honk
56 - Wario: Ehehehehe!
57 - Wario: I'm-a Wario! I'm-a gonna win!
58 - Peach: Take that!
59 - Peach: Here we go!
60 - Peach: Bingo! Bye-bye!
61 - Course: Turnpike Car Motor 2
62 - Course: Crowd
63 - Peach: Hayyyy!
64 - Course: Bowser Statue Fire
65 - Peach: Let's go!
66 - Peach: Yeah! Peach has got it!
67 - (unknown) Beep Low
68 - (unknown) Beep High
69 - (unknown) Beep Medium
70 - Course: Kalimari Train Rail Noise
71 - Course: Cow Noise
72 - (unknown) Thump Hit
73 - (unknown) Ding
74 - Kart: Glass Shatter (freeze)
75 - Kart: Ceramic Shatter (defreeze)
76 - Kart: Brake
77 - Kart: Drift
78 - Surface: Sand/Grass
79 - Surface: Wet Sand
80 - (unknown) Ding High
81 - (unknown) Doot
82 - Enemysounds: Kart: Motor who?
83 - (unknown) Short Beep
84 - EnemySounds: Kart: Motor who?
85 - EnemySounds/Course: Kart: Motor Wario? / Turnpike Truck Motor
86 - (unknown) Short Beep
87 - (unknown) Bell or Beep
88 - Kart: Motor Peach/Yoshi
89 - EnemySounds: Kart: Motor who?
90 - Kart: Motor Toad
91 - Course: Jungle Nut Hit
92 - Kart: Jump Hit Ground
93 - Kart: Hit Wall
94 - Kart/Course: Kart Collision/Thwomp Pound
95 - (unknown) Thud Hit
96 - (unknown) Engine Noise
97 - Mario: Yippie!
98 - (unknown) Short Beep 2
99 - Menu: Title Motor Noise
100 - Item: Item Box Hit
101 - Course: Train/Ship Honk
102 - Course: Kalimari Train Engine
103 - Item: Shell hit/Mushroom/Dash
104 - Course: Boo Laugh
105 - Menu: Mario Grand Prix
106 - Menu: Time Trial
107 - Menu: Versus
108 - Menu: Battle
109 - Menu: Select a Level
110 - Menu: OK?
111 - Menu: Option
112 - Menu: Data
113 - Menu: Select your Player
114 - Menu: Select Map
115 - Menu: Congratulations!
116 - Jingle: Last Lap
117 - EnemySounds: Item: Starman
118 - Kart: Motor Mario/Luigi
119 - Course: Kalimari Crossing Signal
120 - (unknown) Wooden Sticks
121 - Course: Rainbow Dog Noise
122 - Mario: Hey! You're very good! See you next time!
123 - (unknown: JAP Intro?) Course: Crowd Cheer
124 - Menu: Welcome to Mario Kart!
125 - Surface: Dirt/Dirt Trap
126 - (unknown) Short Boop
*/


void SetCustomSFXData(char sfxID, long rawSFX, long loopPred, long predictors)
{
// Follow all the pointers
    GlobalAddressA = *(long*)(g_sfxPointer + 0x4) + (sfxID * 0x4);
    GlobalAddressB = *(long*)(GlobalAddressA);
    GlobalAddressC = (GlobalAddressB + 0x10);
    GlobalAddressA = *(long*)(GlobalAddressC);

// Set of pointers to sound data 
    *(long*)(GlobalAddressA + (1* 0x4)) = rawSFX;
    *(long*)(GlobalAddressA + (2* 0x4)) = loopPred;
    *(long*)(GlobalAddressA + (3* 0x4)) = predictors;
}

void PlayCustomSound()
{
    SetCustomSFXData(122, 0xADE1C0, 0x803F6980, 0x803F6930);
//	SetCustomSFXData(122, 0xAED840, 0x803F6A30, 0x803F3E50); //Test
    playSound(0x49008026);
}




//Kart Various
#define SE_KART_JUMP_BOING  	    0x19008000
#define SE_KART_FEATHER_JUMP	    0x19008002
#define SE_KART_FINISH_RACE         0x1900f103
#define SE_KART_WATER_SPLASH		0x19008008
#define SE_KART_LANDING     		0x1900a209
#define SE_KART_LANDING_BIG 		0x1900a60a
#define SE_KART_DASH				0x1900a40b
#define SE_KART_OVER_DRIFT	        0x1900851e
#define SE_KART_EXPLOSION		    0x19018010
#define SE_KART_EXPLOSION_BIG	    0x19009005
#define SE_KART_FLATTENED_SWAYING	0x0100f024
#define SE_KART_SLIPSTREAM  	    0x19008011
#define SE_KART_PUT_BANANA		    0x19008012
#define SE_KART_ITEM_THROW  	    0x19008004
#define SE_KART_ITEM_THROW_HIGH		0x19018014

//Kart Hit
#define SE_KART_HIT_TREE			0x19007018
#define SE_KART_HIT_WALL			0x19007019
#define SE_KART_HIT_GUARD_RAIL		0x1900701a
#define SE_KART_HIT_HAND_RAIL		0x1900701b
#define SE_KART_HIT_METAL   	    0x19008001
#define SE_KART_HIT_ICE 			0x1900701d
#define SE_KART_HIT_SHRUB			0x1900701f
#define SE_KART_HIT_PENGUIN         0x1900a046
#define SE_KART_HIT_THWOMP  		0x1900a04c
#define SE_KART_HIT_PIRANHA 		0x1900a052

//Fanfares
#define SE_2ND_LAP_FANFARE			0x1900f015
#define SE_FINAL_LAP_FANFARE		0x1900ff3a

//Various
#define SE_FREEZING     			0x1900a055
#define SE_ICE_CRUSH        	    0x1900a056
#define SE_THWOMP_LAND  		    0x1900800f
#define SE_THWOMP_DESTROY		    0x1901a24a
#define SE_BALLOON_LOST     		0x19009051
#define SE_ITEMBOX_DESTROY          0x19008406
#define SE_ITEM_BOO_SWOOSH  		0x19009e59
#define SE_WATER_SPLASH		        0x1900801c
#define SE_RAILROAD_CROSSING_DING	0x19017016
#define SE_METAL_COFFIN             0x1901904e
#define SE_THUNDER          		0x1900f013
#define SE_BOWSER_FIRE              0x51038009
#define SE_BOWSER_FIRE_SMALL    	0x5102800a
#define SE_ITEM_BANANA_BUNCH_HIT	0x19019053
#define SE_ITEM_SHELL_HIT		    0x19008054
#define SE_ITEM_ROULETTE_FINISH     0x0100fe47
#define SE_UI_CAMERA_OUT    		0x1900904f
#define SE_UI_CAMERA_IN     		0x19009050
#define SE_UI_ERROR_MISSING			0x1900a058

//Entities
#define SE_BOO_LAUGH    			0x1900705a
#define SE_THWOMP_LAUGH     		0x19036045
#define SE_BAT_SINGLE    			0x19017044
#define SE_COW      				0x1901904d
#define SE_MONTY_MOLE   		    0x19018007
#define SE_SEAGULL      			0x19017043
#define SE_PENGUIN_BIG		        0x19007017
#define SE_PENGUIN_SMALL    		0x19007049
#define SE_CHAIN_CHOMP  			0x19018057

//Horns
#define SE_SEDAN_HORN_SINGLE		0x1901703b
#define SE_SEDAN_HORN_MULTI         0x1901703c
#define SE_BUS_TRUCK_HORN_SINGLE	0x1901703d
#define SE_BUS_TRUCK_HORN_MULTI		0x1901703e
#define SE_TANKLORRY_HORN_SINGLE	0x19017041
#define SE_TANKLORRY_HORN_MULTI     0x19017042
#define SE_TRAIN_WHISTLE_SINGLE		0x1901800d
#define SE_TRAIN_WHISTLE_MULTI		0x1901800e
#define SE_BOAT_HORN_SINGLE			0x19018047
#define SE_BOAT_HORN_MULTI			0x19018048

//Global only
#define SE_GLOBAL_THUNDER			0x1900f00c
#define SE_GLOBAL_COIN				0x49008017
#define SE_GLOBAL_FIREWORKS			0x4900801e
#define SE_GLOBAL_CHEEPCHEEP_CHARGE	0x4900801f
#define SE_GLOBAL_CHEEPCHEEP_INTRO	0x49008020
#define SE_GLOBAL_CHEEPCHEEP_FIRE	0x49008021
#define SE_GLOBAL_PODIUM_JUMP		0x49008022
#define SE_GLOBAL_STAR_SHIMMER		0x49008023
#define SE_GLOBAL_CROWD_EEEH		0x4900802a

//Looping
#define SE_LAKITU_REVERSE			0x0100fa28
#define SE_ITEM_ROULETTE			0x0100fe1c
#define SE_DRIVE_SPIN_OUT           0x0100f81d
#define SE_DRIVE_ROPE_BRIDGE		0x0100f020
#define SE_DRIVE_AB_SPIN    		0x0100f822
#define SE_DRIVE_WOOD_BRIDGE		0x0100f023
#define SE_DRIVE_BRICKS		        0x51038007
#define SE_DRIVE_RAILWAY            0x01008046
#define SE_DRIVE_BUBBLES	        0x0100f025
#define SE_LEVEL_ENGINE_TRAIN       0x51018000
#define SE_LEVEL_ENGINE_BUS	        0x51018002
#define SE_LEVEL_ENGINE_TRUCK       0x51018003
#define SE_LEVEL_ENGINE_TANKLORRY   0x51018004
#define SE_LEVEL_ENGINE_SEDAN       0x51018005
#define SE_LEVEL_BATS    	        0x51028006
#define SE_LEVEL_JUNGLE_NOISES      0x0170802d
#define SE_LEVEL_WATERFALL	        0x51028001
#define SE_LEVEL_AUDIENCE	        0x5103700b
#define SE_STATE_THUNDERED		    0x5101c00c
#define SE_STATE_INVISIBLE	        0x0100fa4c
#define SE_STATE_INVINCIBLE	        0x0100ff2c
#define SE_ITEM_BLUE_SHELL 	        0x51018008


bool isAnyPlayerNear(float targetpos[], float radius)
{
    char near[4];

    for (int playerID = 0; playerID < 4; playerID++)		
    {
        if(((GlobalPlayer[(int)playerID].flag & IS_PLAYER) != 0) && ((GlobalPlayer[(int)playerID].flag & IS_GHOST) == 0))
        {
            if(KWCheckRadiusXZ(GlobalPlayer[(int)playerID].position[0],GlobalPlayer[(int)playerID].position[2],targetpos[0],targetpos[2],radius) == 1)
            {
                near[(int)playerID] = 1;
            }
            else
            {
                near[(int)playerID] = 0;
            }
        }
    }

    if(near[0] == 1 || near[1] == 1 || near[2] == 1 || near[3] == 1)
    {
        return true;
    }
    else
    {
        return false;
    }
}


char isPlaying[50]; //Reserve table for playing checks

int SFX[8] = {SE_SEDAN_HORN_MULTI,SE_UI_CAMERA_OUT,SE_LEVEL_BATS,SE_BALLOON_LOST,SE_SEAGULL,SE_PENGUIN_SMALL,SE_KART_HIT_PENGUIN,SE_ITEM_BLUE_SHELL}; //temp array SFX ID
float SFX_rad[8] = {100,75,300,75,50,100,100,300}; //temp array SFX radius
char SFX_global[8] = {0,0,0,1,1,0,1,0}; //temp array directional or global check


void LevelSoundDistanceCheck() //Using fire particle positions for testing
{
char TotalLevelSounds = 8; //How many sounds are used in level

    if (g_startingIndicator == 0x01)
    {
        for (int initi = 0; initi < 50; initi++)
        {
            isPlaying[initi] = 0; //Reset playing checks on init
        } 
    }
    for (int index = 0; index < TotalLevelSounds; index++)
    {
        if (g_startingIndicator > 0x01)
        {
            if(isAnyPlayerNear(g_DynamicObjects[FireParticleAllocArray[index]].pos_start, SFX_rad[index])) //Checks if any player is inside radius of SFX coordinates
            {
                if (isPlaying[index] == 0)
                {
                    isPlaying[index] = 1;

                    if(SFX_global[index] == 1 && g_playerCount == 1)
                    {
                        NaPlyLevelStart(0,SFX[index]); //Play globally
                    }
                    else
                    {
                        NaSceneLevelStart(g_DynamicObjects[FireParticleAllocArray[index]].pos_start,ZeroVector,SFX[index]); //Play directionally
                    }
                }
            }
            else
            {
                isPlaying[index] = 0;

                switch (SFX[index]) //Stop Loop Sounds
                {
                case SE_LAKITU_REVERSE:
                case SE_ITEM_ROULETTE:
                case SE_DRIVE_SPIN_OUT:
                case SE_DRIVE_ROPE_BRIDGE:
                case SE_DRIVE_AB_SPIN:
                case SE_DRIVE_WOOD_BRIDGE:
                case SE_DRIVE_BRICKS:
                case SE_DRIVE_RAILWAY:
                case SE_DRIVE_BUBBLES:
                case SE_LEVEL_ENGINE_TRAIN:
                case SE_LEVEL_ENGINE_BUS:
                case SE_LEVEL_ENGINE_TRUCK:
                case SE_LEVEL_ENGINE_TANKLORRY:
                case SE_LEVEL_ENGINE_SEDAN:
                case SE_LEVEL_BATS:
                case SE_LEVEL_JUNGLE_NOISES:
                case SE_LEVEL_WATERFALL:
                case SE_LEVEL_AUDIENCE:
                case SE_STATE_THUNDERED:
                case SE_STATE_INVISIBLE:
                case SE_STATE_INVINCIBLE:
                case SE_ITEM_BLUE_SHELL:
                    if(SFX_global[index] == 1 && g_playerCount == 1)
                    {
                        NaPlyLevelStop(0,SFX[index]); //Stop globally
                    }
                    else
                    {
                        NaSceneLevelStop(g_DynamicObjects[FireParticleAllocArray[index]].pos_start,SFX[index]); //Stop directionally
                    }                    
                    break;
                
                default:
                    break;
                }
            }
        }
    }
}

void MapDelayInit() //Removes standard audience sfx on custom courses 
{
    if(HotSwapID == 0)
    {
        DelayInitialMap();
    }
}

void SetLevelSounds()
{
    LevelSoundDistanceCheck();
}