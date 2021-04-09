#include <stdbool.h>
#include "Struct.h"
#include "OKStruct.h"
extern int GlobalAddressA, GlobalAddressB, GlobalAddressC;
extern int GlobalIntA, GlobalIntB, GlobalIntC, GlobalIntD;
extern int MenuIntA, MenuIntB, MenuIntC, MenuIntD;
extern float GlobalFloatA;
extern char GlobalCharA,GlobalCharB,GlobalCharC,GlobalCharD,GlobalFrameChar;

extern short GlobalShortA, GlobalShortB, GlobalShortC, GlobalShortD;
extern unsigned short GlobalUShortA, GlobalUShortB;
extern bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
extern unsigned long FreeSpaceAddress;
extern short GlobalShortA, GlobalShortB;
extern bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
extern int LoopValue;

extern Object *GlobalObjectA, *GlobalObjectB;


extern struct Player *GlobalPlayer[];
extern struct Controller *GlobalController[];
extern struct Screen *GlobalScreen[];

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




//MarioKart3D Variables
extern int CoinCount;
extern float AffineMatrix[4][4];
extern float objectPosition[3];
extern float objectVelocity[3];
extern short objectAngle[3];
extern short objectIndex;
//
//



//Mario Kart Stats
extern char StatsID;
//
//





//SharedFunctions
extern long dataLength; //
extern long *targetAddress;
extern long *sourceAddress;
extern long *tempPointer;
extern long *graphPointer;
extern long *freeSpacePoint;
extern long *tkmPoint;
extern int RSPNumber;
extern int RSPOffset;
extern char *hex;
//
//

//Custom Levels


//Main

extern struct OKObject OKObjectHeaders[];
extern short hsLabel, raceStatus, startupSwitch, courseSwapped;
extern bool scrollLock;
extern int currentHeaderAddress;
extern short CoinPositions[8][3]; //8 Coins XYZ



extern short gpCourseIndex, HotSwapID, hsGP, gpTimeCheck, courseValue;
extern float gpTotalTime;


extern int VersionNumber;
extern char MenuButtonHeld, ButtonHeld, ButtonTimer, AudioLanguage;
extern short SystemType;
//
//


//CustomLevels
extern int ScrollValues[32][2];