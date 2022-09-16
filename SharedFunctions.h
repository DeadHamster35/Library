#ifndef SharedFunctionsH
#define SharedFunctionsH
#include "MainInclude.h"


#define SIZE_OF_ARRAY(array) (sizeof(array)/sizeof((array)[0]))

#define ALIGN(x) __attribute__((aligned(x)))

#define min(a, b) ((a) <= (b) ? (a) : (b))
#define max(a, b) ((a) > (b) ? (a) : (b))

#define sqr(x) ((x) * (x))
#define PythagoreanTheorem(x1, x2, z1, z2) (pow(x1-x2, 2) + pow(z1-z2, 2))


#define SET_FLAG(n, f) ((n) |= (f)) 
#define CLR_FLAG(n, f) ((n) &= ~(f)) 
#define TGL_FLAG(n, f) ((n) ^= (f)) 
#define CHK_FLAG(n, f) ((n) & (f))

#define CHARS2SHORT(charA, charB) 				(charA & 0xFF)<<8 | (charB & 0xFF)
#define CHARS2INT(charA, charB, charC, charD) 	(charA & 0xFF)<<24 | (charB & 0xFF)<<16 | (charC & 0xFF)<<8 | (charD & 0xFF)
#define SHORTS2INT(shortA, shortB) 				(shortA & 0xFF)<<16 | (shortB & 0xFF)

#define  deg(n)       ((short)(65536/360*n))



//NEED OVERWRITE WITH OWN FUNCTIONS
extern void gameCode();
extern void titleMenu();
extern void DisplayObject(void *Car, Object *InputObject);
extern int CollideObject(Player* Car, Object* Target);
extern void DisplayCrashScreen();
extern long RAMCheck, RAMCheckEnd;
extern void PrintMenuFunction();
extern void DrawPerScreen(Camera* LocalCamera);
extern void allRun();
extern void PrintMenuFunction();
extern void CheckHit(int PlayerIndex, int HitType);
extern void ExecuteItemHook(Player* Car);

//END OF OVERWRITE FUNCTIONS


extern int LoadOKData(uint SourceInput, uint SizeData);
extern int LoadDataBypass(uint RomStart, uint RomEnd);
extern int LoadPressDataBypass(uint RomStart, uint RomEnd);
extern bool CheckPlatform();
extern bool CheckEmulator();

extern void runDMA();
extern void runRAM();
extern void runTKM();
extern int runMIO();
extern void loadEEPROM(uint Destination);
extern void saveEEPROM(uint Source);
extern uint getStarTimer(uchar playerID);
extern uint getBooTimer(uchar playerID);

extern short CustomLevelID();

extern ushort GetRGBA16(int R, int G, int B, int A);
extern uint GetRGB32(int R, int G, int B);

extern void SetFontColor(int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB);
extern void LoadFontF3D(uint Address);
extern void SetupFontF3D();
extern void printDecimal(int X, int Y, float Value, int Length);
extern void printFloat(int X, int Y, float Value);
extern int GetRealAddress(int RSPAddress);

extern void loadNiceFont();
extern void loadBigFont();
extern void ResetObject();
extern void DrawBox(int X, int Y, int SizeX, int SizeY, int R, int G, int B, int A);
extern char* printHex(char *buf, int num, int nDigits);
extern void printNumberSprite(int X, int Y, int Value);
extern void ShiftVertColor(uint address,uint counter,uint v_buff,char alpha,char red,char green,char blue);

extern int ReturnStringLength(char *stringAddress);
extern char CharacterConvert[];
extern char CharacterUnconvert[];
#endif