#include <stdbool.h>
#include "OKHeader.h"

#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "Struct.h"
#include "OKStruct.h"


uint GlobalAddressA, GlobalAddressB, GlobalAddressC, GlobalAddressD;
int GlobalIntA, GlobalIntB, GlobalIntC, GlobalIntD;
uint GlobalUIntA, GlobalUIntB;
int MenuIntA, MenuIntB, MenuIntC, MenuIntD;
float GlobalFloatA, GlobalFloatB, GlobalFloatC, GlobalFloatD;
char GlobalCharA,GlobalCharB,GlobalCharC,GlobalCharD,GlobalCharE,GlobalFrameChar;

short GlobalShortA, GlobalShortB, GlobalShortC, GlobalShortD;
unsigned short GlobalUShortA, GlobalUShortB;
bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
unsigned long FreeSpaceAddress;
short GlobalShortA, GlobalShortB;
bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
int LoopValue;

bool ConsolePlatform;
bool CustomWaterHeight[8];
short CloudCourseID, Snow3DCourseID;

short MenuPosition [2];

int wholeNumber = 0;
int decimalNumber = 0;
int printOffsetA, printOffsetB, printOffsetC, printOffsetD = 0;
int minutes = 0;
int seconds = 0;

Object *GlobalObjectA, *GlobalObjectB;
float ZeroVector[3] = {0.0, 0.0, 0.0};
OKRAMHeader OverKartRAMHeader;

Controller *GlobalController[5] = 
{
     &g_Controller1,
     &g_Controller2,
     &g_Controller3,
     &g_Controller4,
     &g_ControllerMenu
};

Screen *GlobalScreen[4] = 
{
     &g_Screen1,
     &g_Screen2,
     &g_Screen3,
     &g_Screen4
};

Camera *GlobalCamera[4] = 
{
     &g_Camera1,
     &g_Camera2,
     &g_Camera3,
     &g_Camera4
};

short *GlobalPath[8] =
{
     &g_PathPointPlayer1,
     &g_PathPointPlayer2,
     &g_PathPointPlayer3,
     &g_PathPointPlayer4,
     &g_PathPointPlayer5,
     &g_PathPointPlayer6,
     &g_PathPointPlayer7,
     &g_PathPointPlayer8,
};

long *GlobalLap[8] =
{
     &g_gameLapPlayer1,
     &g_gameLapPlayer2,
     &g_gameLapPlayer3,
     &g_gameLapPlayer4,
     &g_gameLapPlayer5,
     &g_gameLapPlayer6,
     &g_gameLapPlayer7,
     &g_gameLapPlayer8,
};

Hud *GlobalHud[4] =
{
     &g_hudPlayer1,
     &g_hudPlayer2,
     &g_hudPlayer3,
     &g_hudPlayer4,
};

Lakitu *GlobalLakitu[4] =
{
     &g_lakituStatusPlayer1,
     &g_lakituStatusPlayer2,
     &g_lakituStatusPlayer3,
     &g_lakituStatusPlayer4,
};

char *GlobalLightning[8] =
{
     &g_lightningFlagPlayer1,
     &g_lightningFlagPlayer2,
     &g_lightningFlagPlayer3,
     &g_lightningFlagPlayer4,
     &g_lightningFlagPlayer5,
     &g_lightningFlagPlayer6,
     &g_lightningFlagPlayer7,
     &g_lightningFlagPlayer8,
};

Skycolor *GlobalSkycolor[20] =
{
     &g_skyColorTop00,
     &g_skyColorTop01,
     &g_skyColorTop02,
     &g_skyColorTop03,
     &g_skyColorTop04,
     &g_skyColorTop05,
     &g_skyColorTop06,
     &g_skyColorTop07,
     &g_skyColorTop08,
     &g_skyColorTop09,
     &g_skyColorTop0A,
     &g_skyColorTop0B,
     &g_skyColorTop0C,
     &g_skyColorTop0D,
     &g_skyColorTop0E,
     &g_skyColorTop0F,
     &g_skyColorTop10,
     &g_skyColorTop11,
     &g_skyColorTop12,
     &g_skyColorTop13,
};

Playercolor *GlobalPlayercolor[20] =
{
     &g_colorPlayer0R,
     &g_colorPlayer1R,
     &g_colorPlayer2R,
     &g_colorPlayer3R,
     &g_colorPlayer4R,
     &g_colorPlayer5R,
     &g_colorPlayer6R,
     &g_colorPlayer7R,

};

//MarioKart3D Variables
int CoinCount = 0;
float AffineMatrix[4][4];
float AffineMatrix2[4][4];
float objectPosition[3] = {0,0,0};
float objectVelocity[3] = {0,0,0};
short objectAngle[3] = {0,0,0};
short objectIndex;
//
//

struct OKEngine EngineClass[3][3];


/*
#define ENGINE_BALANCE	0
#define ENGINE_ACCEL	1
#define ENGINE_SPEED	2
*/
short EngineSpeed[4][3] = { {292,288,296},{312,308,316},{322,318,326},{245,245,245}};
short AccelerationCurve[3][10] = {{20,20,20,16,14,12,10,8,6,4},{20,20,25,26,26,20,15,8,8,8},{20,20,20,16,10,10,10,18,18,12}};
short SteerAngle[3] = {135,125,110};
short SteerValue[3] = {2,0,-2};

short PowerBand[3] = {25, 30, 15};
short EnginePowerDownRT[3][15] = {{0,0,0,3,0,0,0,9,9,0,0,9,0,9,9}, {0,0,0,2,0,0,0,8,8,0,0,8,0,8,8}, {0,0,0,4,0,0,0,10,10,0,0,10,0,10,10}};
short EnginePowerDownFT[3][15] = {{0,0,0,0,0,0,0,3,3,0,0,3,0,3,3}, {0,0,0,0,0,0,0,2,2,0,0,2,0,2,2}, {0,0,0,0,0,0,0,04,04,0,0,04,0,04,04}};


char MenuBackup = 0, MenuChanged = 0, MenuTimer = 0;
char MenuFlash[4] = {0,0,0,0};
char MenuProgress[4] = {0,0,0,0};
char PlayerCharacterSelect[4] = {0,1,2,3};
char PlayerEngineSelect[4] = {0,0,0,0};
char PlayerSteerSelect[4] = {0,0,0,0};
char PlayerShowStats[4] = {0,0,0,0};
struct PlayerTextureTable BackupNamePlateTable;
struct PlayerTextureTable BackupPortraitTable[9];

//Mario Kart Stats
char StatsID;


//SharedFunctions
long dataLength = 0; //
int *targetAddress = &ok_Target;
int *sourceAddress = &ok_Source;
int *tempPointer = &ok_Pointer;
long *graphPointer = &GraphPtrOffset;
int *freeSpacePoint = &ok_FreeSpace;
int *tkmPoint = &ok_TKMSpace;
int RSPNumber;
int RSPOffset;
char *hex = "0123456789ABCDEF";
//

//Stock Names
char *stockCourseNames[] = {"Mario Raceway", "Choco Mountain", "Bowser's Castle", "Banshee Boardwalk",
                         "Yoshi Valley", "Frappe Snowland", "Koopa Troopa Beach", "Royal Raceway",
                         "Luigi Raceway", "Moo Moo Farm", "Toad's Turnpike","Kalimari Desert",
                         "Sherbet Land", "Rainbow Road", "Wario Stadium", "Block Fort",
                         "Skyscraper", "Double Deck", "D.K.'s Jungle Parkway", "Big Donut"};
char *stockCharacterNames[] = {"MARIO", "LUIGI", "YOSHI", "TOAD", "D.K.", "WARIO", "PEACH", "BOWSER"};


//Custom Levels

//Main

struct OKObject OKObjectArray[100];

//OKCustom Objects
short CoinPositions[8][3]; //8 Coins XYZ

short hsLabel, raceStatus, startupSwitch, courseSwapped = -1;
bool scrollLock = false;
int currentHeaderAddress = 0;

short FireParticlePositions[8][3];


short gpCourseIndex, HotSwapID, hsGP, gpTimeCheck, courseValue = -1;
float gpTotalTime = 0;


int VersionNumber;
char MenuButtonHeld, ButtonHeld, ButtonTimer, AudioLanguage;
short SystemType;


//
//


//CustomLevels
int ScrollValues[32][2];
long *CourseFaceStruct = &g_courseFaceStructPtr;
//
//
