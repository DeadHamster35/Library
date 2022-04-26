#ifndef OKExternalH
#define OKExternalH
#include "MainInclude.h"
//for OverKart's BUILD.ASM









//NEED OVERWRITE WITH OWN FUNCTIONS
extern void gameCode();
extern void titleMenu();
extern void DisplayObject(void *Car, Object *InputObject);
extern int CollideObject(void *Camera, void *Object);
extern void DisplayCrashScreen();
extern long RAMCheck, RAMCheckEnd;
extern void PrintMenuFunction();
extern void DrawPerScreen(Camera* LocalCamera);
extern void allRun();
extern void PrintMenuFunction();
extern void CheckHit(int PlayerIndex);

//END OF OVERWRITE FUNCTIONS



extern long ExpansionCheckAddress, PRELOAD_RAM, PAYLOAD_ROM, DMA_MAX_LENGTH;
extern long StartRAMData;
extern long EndRAMData;
extern long ModelDataStart;
extern long bannerN;
extern long bannerU;
extern long previewN;
extern long previewU;

extern long LogoROM;
extern long RCSpriteROM;
extern long ArrowsSpriteROM;
extern long NumbersSpriteROM;
extern long AlpacaSpriteROM;
extern long HeartSpriteROM;
extern long TitleMenuFrameROM;


extern long NiceFontROM;
extern long BigFontROM;
extern long HudButtonsROM;

extern long TestTexture;

extern long JP_Audio;
extern long JP_Bank;

extern long itemChanceHi;
extern long itemChanceLo;

extern long Pirate;
extern long PirateEnd;
extern long SplashLogo;
extern long SplashEnd;
extern long TitleLogo;
extern long TitleEnd;
extern long StartLogo;
extern long BackDrop, BackDropEnd;
extern long StartEnd;
extern long BackgroundLogo;
extern long Boo, BooEnd;
extern long BackgroundEnd;
extern long Crash;
extern long CrashEnd;
extern long TESTROMIMG;
extern long Test32;
extern long End32;
extern long Splash3D, Splash3DEnd;


extern long ROMEOF;

extern long Unknown33;
extern long Unknown41;
extern long AccelerationTable;
#endif