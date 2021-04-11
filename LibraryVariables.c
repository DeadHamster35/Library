#include <stdbool.h>
#include "OKHeader.h"
#include "GameVariables/NTSC/GameOffsets.h"
#include "Struct.h"
#include "OKStruct.h"

int GlobalAddressA, GlobalAddressB, GlobalAddressC;
int GlobalIntA, GlobalIntB, GlobalIntC, GlobalIntD;
int MenuIntA, MenuIntB, MenuIntC, MenuIntD;
float GlobalFloatA;
char GlobalCharA,GlobalCharB,GlobalCharC,GlobalCharD,GlobalCharE,GlobalFrameChar;

short GlobalShortA, GlobalShortB, GlobalShortC, GlobalShortD;
unsigned short GlobalUShortA, GlobalUShortB;
bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
unsigned long FreeSpaceAddress;
short GlobalShortA, GlobalShortB;
bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
int LoopValue;

Object *GlobalObjectA, *GlobalObjectB;

Player *GlobalPlayer[8] = 
{
     &g_PlayerStruct1,
     &g_PlayerStruct2,
     &g_PlayerStruct3,
     &g_PlayerStruct4,
     &g_PlayerStruct5,
     &g_PlayerStruct6,
     &g_PlayerStruct7,
     &g_PlayerStruct8,
};


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

//MarioKart3D Variables
int CoinCount = 0;
float AffineMatrix[4][4];
float objectPosition[3] = {0,0,0};
float objectVelocity[3] = {0,0,0};
short objectAngle[3] = {0,0,0};
short objectIndex;
//
//



//Mario Kart Stats
char StatsID;


//SharedFunctions
long dataLength = 0; //
long *targetAddress = &ok_Target;
long *sourceAddress = &ok_Source;
long *tempPointer = &ok_Pointer;
long *graphPointer = &GraphPtrOffset;
long *freeSpacePoint = &ok_FreeSpace;
long *tkmPoint = &ok_TKMSpace;
int RSPNumber;
int RSPOffset;
char *hex = "0123456789ABCDEF";
//
//


//Custom Levels

//Main

struct OKObject OKObjectHeaders[100];

//OKCustom Objects
short CoinPositions[8][3]; //8 Coins XYZ

short hsLabel, raceStatus, startupSwitch, courseSwapped = -1;
bool scrollLock = false;
int currentHeaderAddress = 0;



short gpCourseIndex, HotSwapID, hsGP, gpTimeCheck, courseValue = -1;
float gpTotalTime = 0;


int VersionNumber;
char MenuButtonHeld, ButtonHeld, ButtonTimer, AudioLanguage;
short SystemType;


//
//


//CustomLevels
int ScrollValues[32][2];
//
//
