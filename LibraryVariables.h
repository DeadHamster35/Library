#include <stdbool.h>
extern int GlobalAddressA, GlobalAddressB, GlobalAddressC;
extern int GlobalIntA, GlobalIntB, GlobalIntC, GlobalIntD;
extern int MenuIntA, MenuIntB, MenuIntC, MenuIntD;
extern float GlobalFloatA;
extern char GlobalCharA,GlobalCharB,GlobalCharC,GlobalCharD,GlobalFrameChar;
extern short GlobalShortA, GlobalShortB, GlobalShortC, GlobalShortD;
extern unsigned short GlobalUShortA, GlobalUShortB;
extern bool GlobalBoolA, GlobalBoolB, GlobalBoolC, GlobalBoolD;

extern unsigned long FreeSpaceAddress;

extern int LoopValue;

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
