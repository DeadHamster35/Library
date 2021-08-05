#include <stdbool.h>
#include "Struct.h"
#include "OKStruct.h"

//check platform
extern bool ConsolePlatform;

//???
extern int GlobalAddressA, GlobalAddressB, GlobalAddressC;
extern int GlobalIntA, GlobalIntB, GlobalIntC, GlobalIntD;
extern unsigned int GlobalUIntA, GlobalUIntB;
extern int MenuIntA, MenuIntB, MenuIntC, MenuIntD;
extern float GlobalFloatA, GlobalFloatB, GlobalFloatC, GlobalFloatD;
extern char GlobalCharA,GlobalCharB,GlobalCharC,GlobalCharD,GlobalCharE,GlobalFrameChar;

extern short GlobalShortA, GlobalShortB, GlobalShortC, GlobalShortD;
extern unsigned short GlobalUShortA, GlobalUShortB;
extern bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
extern unsigned long FreeSpaceAddress;
extern short GlobalShortA, GlobalShortB;
extern bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
extern int LoopValue;
extern bool CustomWaterHeight[];
extern short CloudCourseID, Snow3DCourseID; 

extern short MenuPosition[2];
extern int wholeNumber;
extern int decimalNumber;
extern int printOffsetA, printOffsetB, printOffsetC, printOffsetD;
extern int minutes;
extern int seconds;

extern Object *GlobalObjectA, *GlobalObjectB;

extern float ZeroVector[3];

extern struct POSXY PlayerSelectPositions[];
extern struct PlayerTextureTable SelectNamePlateTable;
extern struct PlayerTextureTable SelectPortraitTable[9];
extern struct ObjBlock GlobalMenuHUD[32];
extern struct Stats GlobalStat;
extern struct Player GlobalPlayer[];
extern struct Controller *GlobalController[];
extern struct Screen *GlobalScreen[];
extern struct Camera *GlobalCamera[];
extern struct Viewport *GlobalViewport[];
extern struct Lakitu *GlobalLakitu[];
extern struct AnmObject_Lakitu AnimatedLakituStruct[];
extern struct AnmObject g_DynamicObjects[];
extern struct FaceStruct CourseFaceStruct[];
extern struct PlayerState *GlobalPlayerState[];  
extern struct Skycolor *GlobalSkycolor[];
extern struct Playercolor *GlobalPlayercolor[];





//MarioKart3D Variables
extern int CoinCount;
extern float AffineMatrix[4][4];
extern float objectPosition[3];
extern float objectVelocity[3];
extern short objectAngle[3];
extern short objectIndex;
//
//
extern struct OKEngine EngineClass[3][3];

extern short EngineSpeed[3][3];
extern short AccelerationCurve[3][10];
extern short SteerAngle[3];
extern short SteerValue[3];
extern short PowerBand[3];
extern short EnginePowerDownRT[3][15];
extern short EnginePowerDownFT[3][15];


extern char MenuBackup,MenuChanged,MenuTimer;
extern char MenuFlash[4];
extern char MenuProgress[4];

extern char PlayerCharacterSelect[4];
extern char PlayerShowStats[4];
extern char PlayerEngineSelect[4];
extern char PlayerSteerSelect[4];
extern struct PlayerTextureTable BackupNamePlateTable;
extern struct PlayerTextureTable BackupPortraitTable[9];


//Mario Kart Stats
extern char StatsID;
//
//





//SharedFunctions
extern long dataLength; //
extern int *targetAddress;
extern int *sourceAddress;
extern int *tempPointer;
extern long *graphPointer;
extern int *freeSpacePoint;
extern int *tkmPoint;
extern int RSPNumber;
extern int RSPOffset;
extern char *hex;
//

//Stock Names
extern char *stockCourseNames[];
extern char *stockCharacterNames[];

//Custom Levels


//Main

extern struct OKObject OKObjectHeaders[];
extern short hsLabel, raceStatus, startupSwitch, courseSwapped;
extern bool scrollLock;
extern int currentHeaderAddress;
extern short CoinPositions[8][3]; //8 Coins XYZ

extern short FireParticlePositions[8][3];


extern short gpCourseIndex, HotSwapID, hsGP, gpTimeCheck, courseValue;
extern float gpTotalTime;


extern int VersionNumber;
extern char MenuButtonHeld, ButtonHeld, ButtonTimer, AudioLanguage;
extern short SystemType;
//
//


//CustomLevels
extern int ScrollValues[32][2];
