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
#define GetRGBA16Inline(R,G,B,A) (short)((R & 0x1F)<<11 | (G & 0x1F)<<6 | (B & 0x1F)<<1 | (A & 0x01))
#define CHARS2SHORT(charA, charB) 				(charA & 0xFF)<<8 | (charB & 0xFF)
#define CHARS2INT(charA, charB, charC, charD) 	(charA & 0xFF)<<24 | (charB & 0xFF)<<16 | (charC & 0xFF)<<8 | (charD & 0xFF)
#define SHORTS2INT(shortA, shortB) 				(shortA & 0xFF)<<16 | (shortB & 0xFF)

#define PythagoreanTheorem(x1, x2, z1, z2) (pow(x1-x2, 2) + pow(z1-z2, 2))
#define  deg(n)       ((short)(65536/360*n))






extern void gameCodeDefault();
extern void titleMenuDefault();
extern void DisplayObjectDefault(void *Car, Object *InputObject);
extern void CollideObjectDefault(Player* Car, Object* Target);
extern void DisplayCrashScreenDefault();
extern long RAMCheckDefault, RAMCheckEndDefault;
extern void PrintMenuFunctionDefault();
extern void DrawPerScreenDefault(Camera* LocalCamera);
extern void DisplayFlagGateCheck(Camera* LocalCamera);
extern void allRunDefault();
extern void PrintMenuFunctionDefault();
extern void CheckHitDefault(int PlayerIndex, int HitType);
extern void ExecuteItemHookDefault(Player* Car);
extern void MiniMapDrawDefault();


//NEED OVERWRITE WITH OWN FUNCTIONS
extern void gameCode();
extern void titleMenu();
extern void DisplayObject(void *Car, Object *InputObject);
extern void CollideObject(Player* Car, Object* Target);
extern void ItemboxCollideCheck(Player* Car, Object* Target);
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


extern void DetectEmulator();

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

extern ushort CalcVerticalDirection(Vector origin,Vector object);
void MakeAlignVectorX(Vector Input, short RotX);
void MakeAlignVectorZ(Vector Input, short RotX);

extern void ResetObject();
extern void DrawBox(int X, int Y, int SizeX, int SizeY, int R, int G, int B, int A);
extern char* printHex(char *buf, int num, int nDigits);
extern void printNumberSprite(int X, int Y, int Value);
extern void ShiftVertColor(uint address,uint counter,uint v_buff,char alpha,char red,char green,char blue);

extern int ReturnStringLength(char *stringAddress);
extern char CharacterConvert[];
extern char CharacterUnconvert[];

extern void RunWaveSpeed(ushort *WaveDir,short WaveSpeed);
extern void SpriteDrawWave(int cx,int cy,ushort *addr,int sizex,int sizey,float WaveScale,short WaveAngleStep,ushort WaveDirAddr);
extern ushort custom_check_bump_2(Bump* bump, float radius, float px, float py, float pz, float lastx, float lasty, float lastz);
#endif