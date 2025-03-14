#ifndef MarioKartMenuH
#define MarioKartMenuH
#include "MainInclude.h"
extern void printMap(int devParameter);
extern void printDetails();
extern void printGPTime(float printTime, int OffsetY);
extern void printTime(float printTime);
extern void PrintMenuTest();
extern void MapSelectMenuDefault();
extern void DrawMapSelectDefault();


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
extern void ModularMenu(OKMenu* OptionsMenu);
extern void CourseMenu(int Alpha);

extern void PrintNiceText(int posx, int posy, float scale, char *text);
extern void PrintBigText(int posx, int posy, float scale, char *text);
extern void PrintNiceTextNumber(int posx, int posy, float scale, char *text, int value);
extern void PrintBigTextNumber(int posx, int posy, float scale, char *text, int value);
extern void PrintBigTextNumberNoGap(int posx, int posy, float scale, char *text, int value);
extern void DrawFPS(int X, int Y);
extern void DrawLapCounter();
extern void KWDisplayInit();
#endif