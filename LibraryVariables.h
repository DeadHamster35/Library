#ifndef LibraryVariablesH
#define LibraryVariablesH
#include "MainInclude.h"

extern struct Dynamic *gDynamicP;
extern uint GlobalAddressA, GlobalAddressB, GlobalAddressC, GlobalAddressD;
extern int GlobalIntA, GlobalIntB, GlobalIntC, GlobalIntD;
extern int64     GlobalInt64;
extern uint64    GlobalUInt64;
extern unsigned int GlobalUIntA, GlobalUIntB;
extern float GlobalFloatA, GlobalFloatB, GlobalFloatC, GlobalFloatD;
extern char GlobalCharA,GlobalCharB,GlobalCharC,GlobalCharD,GlobalCharE,GlobalFrameChar;

extern short GlobalShortA, GlobalShortB, GlobalShortC, GlobalShortD;
extern unsigned short GlobalUShortA, GlobalUShortB;
extern bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;
extern unsigned long FreeSpaceAddress;
extern int LoopValue;

extern bool ConsolePlatform, EmulatorPlatform, TempoBool, StopSwop;
extern bool CustomWaterHeight[];
extern short CloudCourseID, Snow3DCourseID; 
extern char CloudCourseValue, Snow3DCourseValue, WeatherCourseValue, PADCourseValue;

extern short MenuPosition[2];
extern ushort PerspectiveValue;


extern int wholeNumber;
extern int decimalNumber;
extern int printOffsetA, printOffsetB, printOffsetC, printOffsetD;
extern int minutes;
extern int seconds;

extern float DebugPosition[3];
extern Object *GlobalObjectA, *GlobalObjectB;
extern OKRAMHeader OverKartRAMHeader;


extern short AnimationTimer;

extern float ZeroVector[3];

extern struct POSXY PlayerSelectPositions[];
extern struct PlayerTextureTable SelectNamePlateTable;
extern struct PlayerTextureTable SelectPortraitTable[9];
extern struct ObjBlock GlobalMenuHUD[32];
extern struct Stats GlobalStat;
extern float GlobalWeight[];
extern struct Player GlobalPlayer[];


extern struct Controller *GlobalController[];
extern struct Screen *GlobalScreen[];
extern struct Camera *GlobalCamera[];
extern short *GlobalPath[];
extern long *GlobalLap[];
extern struct Lakitu *GlobalLakitu[];
extern struct AnmObject_Lakitu AnimatedLakituStruct[];
extern struct AnmObject g_DynamicObjects[];
extern FaceStruct *CourseFaceStruct;
extern struct PlayerState *GlobalPlayerState[];  
extern struct Hud *GlobalHud[];
extern char *GlobalLightning[];
extern struct Skycolor *GlobalSkyColorTop[20];
extern struct Skycolor *GlobalSkyColorBot[20];
extern struct Playercolor *GlobalPlayercolor[];





//MarioKart3D Variables
extern short CoinCount[8];
extern short IFrames[8];
extern float AffineMatrix[4][4];
extern float AffineMatrix2[4][4];
extern float objectPosition[3];
extern Vector objectVector;
extern float objectVelocity[3];
extern short objectAngle[3];
extern short objectIndex;
//
//
extern struct OKEngine EngineClass[3][3];

extern short EngineSpeed[4][3];
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

extern struct OKObject OKObjectArray[];
extern short hsLabel, raceStatus, startupSwitch, courseSwapped;
extern bool scrollLock;
extern int currentHeaderAddress;
extern short CoinPositions[8][3]; //8 Coins XYZ

extern short FireParticlePositions[8][3];

extern ushort MenuButtonHeld, MenuBlink, ButtonTimer, AudioLanguage;
extern short gpCourseIndex, HotSwapID, hsGP, gpTimeCheck, courseValue;
extern short MenuAngle[4];
extern char ButtonHolding, MenuToggle;
extern float gpTotalTime;


extern int VersionNumber;

extern int MenuIndex, MenuType, MenuCup;
//
//


//CustomLevels
extern int ScrollValues[32][2];





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

#endif