#include <sys/types.h>
#include <math.h>
#include <stdbool.h>

extern int LoadData(int SourceInput, int SizeData);
extern bool CheckPlatform();
extern void runDMA();
extern void runRAM();
extern void runTKM();
extern void runMIO();

extern ushort GetRGBA16;
extern uint GetRGB32;

extern void SetFontColor(int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB);
extern void printFloat(int X, int Y, float Value);
extern int GetRealAddress(long RSPAddress);

extern void ResetObject();
extern void DrawBox(int X, int Y, int SizeX, int SizeY, int R, int G, int B, int A);
extern char* printHex(char *buf, int num, int nDigits);
extern void printNumberSprite(int X, int Y, int Value);

extern char ReturnStringLength(char *stringAddress);
extern void loadNiceFont();
extern void PrintNiceText(int posx, int posy, float scale, char *text);
extern void PrintNiceTextNumber(int posx, int posy, float scale, char *text, int value);

extern void loadHudButtons();
extern void SpriteBtnA(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnB(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnStart(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnCUp(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnCDown(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnCLeft(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnCRight(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnL(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnR(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnZ(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnDUp(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnDDown(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnDLeft(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnDRight(int posx, int posy, float scale, bool pressed);
extern void SpriteBtnDMid(int posx, int posy, float scale);
extern void SpriteAnalogStick(int posx, int posy, float scale, char direction);

extern char CharacterConvert[];
extern char CharacterUnconvert[];