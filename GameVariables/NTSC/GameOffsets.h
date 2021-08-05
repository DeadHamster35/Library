#include "../../Struct.h"
#include "GameDefines.h"

/*
	INFO: 
    - Use VS Code plugin 'Marks to outline'. Creates jump table in outline view.
      Create headline by commenting in CAPITAL letters: 'MaRK: - HEADLINETEXT' 
    - Naming convention proposal:
      'g_player'   bound to players
      'g_kart'     bound to characters (e.g. Mario)
      'asm_xxxJAL' for noping JALs
      'asm_xxx'    for changing stuff in funcs
*/		

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   UNSORTED                                             //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern void GetFramebuffer(int PixelX,int PixelY,int Width,int Height,unsigned short *Source,unsigned short *Destination); //0x802A7658
extern short g_monitorCounter; //0x802B87D8
extern void *g_CfbPtrs[3]; //0x801502A8
extern long KBGNumber; //0x800E86A0
extern long KBGChange; //0x800E86A4
extern long KBGNumberNext;  //0x8018EDE0
extern long asm_itemJump1A;// 0x8007B084  //3C058016
extern long asm_itemJump1B;// 0x8007B098  //84A543BA
extern long asm_itemJump2A;// 0x8007AFC0  //3C058016
extern long asm_itemJump2B;// 0x8007AFD4  //84A543BA
extern char g_itemBoolean; //0x80165F5F
extern short g_progressValue; //0x8016328A
extern long g_CourseObstacle; //0x8016359C
extern short PutPylon(Vector pos,short number); //0x8029ABD4
extern short PutObject(Vector pos,int category); //0x8029ED38
extern float g_TrialTime; //0x8015F898
extern float g_lap2Time; //0x8015F89C
extern float g_lap3Time; //0x8015F8A0
extern void KWAnmNext(int num); //0x80086FD4
void KWDisplayEvent(int player); //0x800588F4
void KWDisplayEvent_After(int player); //0x80058B58
void KWGameEventCommon_VF(); //0x8005A71C
void KWGameEventCommon(); //0x8005A74C
extern unsigned short g_DispFrame; //0x800DC55C
extern float CheckHight(float X_value, float Y_value, float Z_value); //0x802AE1C0
extern int KWCheckRadiusXZ(float x1,float y1,float x2,float y2,float radius); //0x80041608
extern long spriteKillA; //0x80020000 //03E00008
extern long spriteKillC; //0x80021244 //03E00008
extern short spriteKillB; //0x80020004 //2400
extern short spriteKillD; //0x80021248 //2400


///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                       !!! DELETED & RENAMED !!!                                 			 //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
/* DELETE */ extern short g_surfaceCheckP1; //inside struct
/* DELETE */ extern short surface_p0;
/* DELETE */ extern short g_P1TopSpeed;     
/* DELETE */ extern char g_zoomLevelPlayer1; //ceated array: extern short g_zoomLevelPlayer[4];
/* DELETE */ extern char g_zoomLevelPlayer2;
/* DELETE */ extern char g_zoomLevelPlayer3;
/* DELETE */ extern char g_zoomLevelPlayer4;
/* DELETE */ extern long g_gameLapPlayer1;    //ceated array: extern long g_GameLapTable[8];
/* DELETE */ extern long g_gameLapPlayer2;    // 0x8  0164394
/* DELETE */ extern long g_gameLapPlayer3;    // 0x8  0164398
/* DELETE */ extern long g_gameLapPlayer4;    // 0x8  016439C
/* DELETE */ extern long g_gameLapPlayer5;    // 0x8  01643A0
/* DELETE */ extern long g_gameLapPlayer6;    // 0x8  01643A4
/* DELETE */ extern long g_gameLapPlayer7;    // 0x8  01643A8
/* DELETE */ extern long g_gameLapPlayer8;    // 0x8  01643AC
/* DELETE */ extern short g_player1ScreenWidth; //0x8015F4AC  //inside struct
/* DELETE */ extern short g_player1ScreenHeight; //0x8015F4AE
/* DELETE */ extern short g_player1ScreenX; //0x8015F4B0
/* DELETE */ extern short g_player1ScreenY; //0x8015F4B2
/* DELETE */ extern short g_player1View; //0x8015F4B4
/* DELETE */ extern short g_player1Section; //0x8015F4B8
/* DELETE */ extern short g_player2ScreenWidth; //0x8015F4AC
/* DELETE */ extern short g_player2ScreenHeight; //0x8015F4AE
/* DELETE */ extern short g_player2ScreenX; //0x8015F4B0
/* DELETE */ extern short g_player2ScreenY; //0x8015F4B2
/* DELETE */ extern short g_player2View; //0x8015F4B4
/* DELETE */ extern short g_player2Section; //0x8015F4B8
/* DELETE */ extern short g_player3ScreenWidth; //0x8015F4EC
/* DELETE */ extern short g_player3ScreenHeight; //0x8015F4EE
/* DELETE */ extern short g_player3ScreenX; //0x8015F4F0
/* DELETE */ extern short g_player3ScreenY; //0x8015F4F2
/* DELETE */ extern short g_player3View; //0x8015F4F4
/* DELETE */ extern short g_player3Section; //0x8015F4F8
/* DELETE */ extern short g_player4ScreenWidth; //0x8015F42C
/* DELETE */ extern short g_player4ScreenHeight; //0x8015F42E
/* DELETE */ extern short g_player4ScreenX; //0x8015F430
/* DELETE */ extern short g_player4ScreenY; //0x8015F432
/* DELETE */ extern short g_player4View; //0x8015F434
/* DELETE */ extern short g_player4Section; //0x8015F438
/* DELETE */ extern short g_cup0Array0; //0x800F2BB4 //use array g_cupArray0[4];
/* DELETE */ extern short g_cup0Array1; //0x800F2BB6
/* DELETE */ extern short g_cup0Array2; //0x800F2BB8
/* DELETE */ extern short g_cup0Array3; //0x800F2BBA
/* DELETE */ extern short g_cup1Array0; //0x800F2BBC //use array g_cupArray1[4];
/* DELETE */ extern short g_cup1Array1; //0x800F2BBE
/* DELETE */ extern short g_cup1Array2; //0x800F2BC0
/* DELETE */ extern short g_cup1Array3; //0x800F2BC2
/* DELETE */ extern short g_cup2Array0; //0x800F2BC4 //use array g_cupArray2[4];
/* DELETE */ extern short g_cup2Array1; //0x800F2BC6
/* DELETE */ extern short g_cup2Array2; //0x800F2BC8
/* DELETE */ extern short g_cup2Array3; //0x800F2BCA
/* DELETE */ extern short g_cup3Array0; //0x800F2BCC //use array g_cupArray3[4];
/* DELETE */ extern short g_cup3Array1; //0x800F2BCE
/* DELETE */ extern short g_cup3Array2; //0x800F2BD0
/* DELETE */ extern short g_cup3Array3; //0x800F2BD0
/* DELETE */ extern short g_cupBArray0; //0x800F2BD4 //use array g_cupArrayB[4];
/* DELETE */ extern short g_cupBArray1; //0x800F2BD6
/* DELETE */ extern short g_cupBArray2; //0x800F2BD8
/* DELETE */ extern short g_cupBArray3; //0x800F2BDA
/* DELETE */ extern long g_playerPosition1;// 801643B8 //use array extern long g_playerPosition[8];// 801643B8
/* DELETE */ extern long g_playerPosition2;//, 801643BC
/* DELETE */ extern long g_playerPosition3;//, 801643C0
/* DELETE */ extern long g_playerPosition4;//, 801643C4
/* DELETE */ extern long g_playerPosition5;//, 801643C8
/* DELETE */ extern long g_playerPosition6;//, 801643CC
/* DELETE */ extern long g_playerPosition7;//, 801643D0
/* DELETE */ extern long g_playerPosition8;//, 801643D4
/* DELETE */ extern float gravity_1; //0x800E2650 //use array extern float gravity[8]; //0x800E2650
/* DELETE */ extern float gravity_2; //0x800E2654
/* DELETE */ extern float gravity_3; //0x800E2658
/* DELETE */ extern float gravity_4; //0x800E265C
/* DELETE */ extern float gravity_5; //0x800E2660
/* DELETE */ extern float gravity_6; //0x800E2664
/* DELETE */ extern float gravity_7; //0x800E2668
/* DELETE */ extern float gravity_8; //0x800E266C
/* DELETE */ extern short p_Input; //0x800F6914 //inside struct
/* DELETE */ extern char d_Input; //0x800F6914
/* DELETE */ extern char c_Input; //0x800F691A
/* DELETE */ extern short player1inputX; //0x800F6910
/* DELETE */ extern short player1inputY; //0x800F6912
/* DELETE */ extern short p1Button; //0x800F6914
/* DELETE */ extern float g_player1LocationX; //0x800F69A4
/* DELETE */ extern float g_player1LocationY; //0x800F69A8
/* DELETE */ extern float g_player1LocationZ; //0x800F69AC
/* DELETE */ extern float g_player1LastLocationX; //0x800F69B0
/* DELETE */ extern float g_player1LastLocationY; //0x800F69B4
/* DELETE */ extern float g_player1LastLocationZ; //0x800F69B8
/* DELETE */ extern long g_player1LocationA; //0x800F69BC
/* DELETE */ extern float g_player1SpeedX; //0x800F69C4
/* DELETE */ extern float g_player1SpeedY; //0x800F69C8
/* DELETE */ extern float g_player1SpeedZ; //0x800F69CC
/* DELETE */ extern float g_player1SpeedA; //0x800F6A24
/* DELETE */ extern float g_player1SpeedU1; //0x800F6A28
/* DELETE */ extern float g_player1SpeedU2; //0x800F6A2C
/* DELETE */ extern long g_playerStatus; //0x800F6A58
/* DELETE */ extern float g_player1CameraX; //0x800F6B28
/* DELETE */ extern float g_player1CameraY; //0x800F6B2C
/* DELETE */ extern float g_player1CameraZ; //0x800F6B30
/* DELETE */ extern float g_playerSpriteSize; //0x800F6BB4
/* DELETE */ extern float player2X;
/* DELETE */ extern float player2Y;
/* DELETE */ extern float player2Z;
/* DELETE */ extern float player3X;
/* DELETE */ extern float player3Y;
/* DELETE */ extern float player3Z;
/* DELETE */ extern float player4X;
/* DELETE */ extern float player4Y;
/* DELETE */ extern float player4Z;
/* DELETE */extern long cpu2Speed; //0x800F797C
/* DELETE */extern long cpu3Speed; //0x800F8754
/* DELETE */extern long cpu4Speed; //0x800F952C
/* DELETE */extern char boost1; //0x800F699E
/* DELETE */extern char boost2; //0x800F7776
/* DELETE */extern char boost3; //0x800F854E
/* DELETE */extern char boost4; //0x800F9326
/* DELETED extern struct Hud g_hudPlayer1; use array g_hudStruct[4] */
/* DELETED extern struct Hud g_hudPlayer2; */
/* DELETED extern struct Hud g_hudPlayer3; */
/* DELETED extern struct Hud g_hudPlayer4; */
/* DELETE */extern short g_PathPointPlayer1; // use g_playerPathPointTable[8];
/* DELETE */extern short g_PathPointPlayer2;
/* DELETE */extern short g_PathPointPlayer3;
/* DELETE */extern short g_PathPointPlayer4;
/* DELETE */extern short g_PathPointPlayer5;
/* DELETE */extern short g_PathPointPlayer6;
/* DELETE */extern short g_PathPointPlayer7;
/* DELETE */extern short g_PathPointPlayer8;
/* DELETE */extern char g_lightningFlagPlayer1; // use g_playerFlagLightning[8];
/* DELETE */extern char g_lightningFlagPlayer2; // 0x800E9F25
/* DELETE */extern char g_lightningFlagPlayer3; // 0x800E9F26
/* DELETE */extern char g_lightningFlagPlayer4; // 0x800E9F27
/* DELETE */extern char g_lightningFlagPlayer5; // 0x800E9F28
/* DELETE */extern char g_lightningFlagPlayer6; // 0x800E9F29
/* DELETE */extern char g_lightningFlagPlayer7; // 0x800E9F2A
/* DELETE */extern char g_lightningFlagPlayer8; // 0x800E9F2B
/* DELETE */extern short g_offroadFlagPlayer1; // use g_playerFlagOffroad[8];
/* DELETE */extern short g_offroadFlagPlayer2; // 0x80165332 
/* DELETE */extern short g_offroadFlagPlayer3; // 0x80165334 
/* DELETE */extern short g_offroadFlagPlayer4; // 0x80165336 
/* DELETE */extern char g_ShadowflagPlayer0; //use g_playerFlagShadow[8];
/* DELETE */extern char g_ShadowflagPlayer1; //0x800F795F
/* DELETE */extern char g_ShadowflagPlayer2;
/* DELETE */extern char g_ShadowflagPlayer3;
/* DELETE */extern short g_wrongwayFlagPlayer1; // use g_playerFlagWrongway[8];
/* DELETE */extern short g_wrongwayFlagPlayer2; // 0x80163272 
/* DELETE */extern short g_wrongwayFlagPlayer3; // 0x80163274 
/* DELETE */extern short g_wrongwayFlagPlayer4; // 0x80163276 
/* DELETE */extern float g_hudCharpicRankX1; // use  g_hudCharpicRankX[8];
/* DELETE */extern float g_hudCharpicRankX2; // 0x8018D02B
/* DELETE */extern float g_hudCharpicRankX3; // 0x8018D02F 
/* DELETE */extern float g_hudCharpicRankX4; // 0x8018D033 
/* DELETE */extern float g_hudCharpicRankY1; // use   g_hudCharpicRankY[8];
/* DELETE */extern float g_hudCharpicRankY2; // 0x8018D054 
/* DELETE */extern char g_hudCharpicRankY3; // 0x8018D058 
/* DELETE */extern float g_hudCharpicRankY4; // 0x8018D05C 

//RENAMED
// g_ScreenSplitB to g_screenSplitB (cause g_screenSplitA)

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   CUSTOM OVERKART STUFF                                //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern char g_itemA;
extern char g_itemB;
extern char g_itemC;
extern long g_gameType;




///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   SYSTEM                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern long SYSTEM_Region; //0x80000300
extern void InitMKCode(); //0x80091B78

extern void InitControllers(); //0x800008A4
extern void readControllers(); //0x80000A28

extern void DMA(int output, int input, long Length); //0x80001158
extern void DMABuffer(void* Car, void* Camera, char kno, char place); //0x80020000
extern void DrawBuffer(void* Car, char kno, char place); //0x80021244

extern void ramCopy(long output, long input, long Length); //0x800D7FE0

extern void decodeMIO0(long input, long output); //0x800400D0 ;MIO0 File A0 = input, A1 = output
extern void decodeTKMK(int input, int *temp, int output, int transparent); //0x800405D0

extern long antialiasToggle; //0x800EB3DC
extern long antialiasToggleB; //0x800EB40C

extern long SegmentTable[]; //0x80150258
extern void SetSegment(int number, int cpuAddr); //0x802A7B94
extern long g_SegmentA; //0x80117974
extern void *SegmentToVirtual(uint *RSPAddress); //0x802A7BD4

extern void initializePlayer(int playerStructure, int characterID, float deltaX, float deltaZ, int characterID2, int unknown0xB000); //0x800393C0
extern void RunKart(void* Car, void* Camera, int place, int playerID); // 8002D268
extern void RunKartSimple(void* Car, void* Camera, int place, int playerID); // 8002F35C

extern void DelayInitialMap(); //0x80002DAC

extern long g_DEBUG; //0x80430000
extern short g_DebugSection; //0x800DC514
extern short g_DebugMode; //0x800DC520
extern short g_DebugBars; //0x800DC662

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   EEPROM                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern struct Eeprom g_eeprom_struct; //0x8018EB90

extern uchar GetCupStatus(int c_select,int r_level); //0x800B54C0

//delete if struct working:
extern uchar g_RAMtrophies[4];//0x8018ED10 00 empty - 01 mush bron - 02 mush silv - 03 mush gold - 04 flow bron - 08 flow silv - 0c flow gold - 10 star bron - 20 star silv - 30 star gold - 40 spec bron - 80 spec silv - C0 spec gold

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   CONTR-PAK & GHOST                                    //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern uint lost_ghost;// 0x80162DF8
extern short g_GhostHUDID; //0x8018DAAA

extern void VSGhost(void *Car,char PlayerID); //0x8008F8E4
extern void SetVSGhost(void *Car,char PlayerID); //0x8008FA38
extern void ResetVSGhost(void *Car,char PlayerID); //0x8008FB30

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   CAMERA                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern struct Camera g_CameraTable; //0x801646F0
extern struct Camera g_Camera1; //0x801646F0
extern struct Camera g_Camera2; //0x801647A8
extern struct Camera g_Camera3; //0x80164860
extern struct Camera g_Camera4; //0x80164918

extern char g_zoomFOVPlayer1; //0x80150131 20-zoomed in 70-zoomed out
extern char g_zoomFOVPlayer2; //0x80150135
extern char g_zoomFOVPlayer3; //0x80150139
extern char g_zoomFOVPlayer4; //0x8015013D

extern short g_zoomLevelPlayer[4]; //0x80164678 0-zoomed in 1-zoomed out 2-super close

extern void ShakeCamera(Camera *camera); //0x8001CA10
extern void ShakeHitCamera(Player *Car,float speed); //0x8001CA24

extern ushort KWLookCamera(float x,float z,Camera *camera); //0x800418AC
extern ushort KWLookCameraPitch(float y,float z,Camera *camera); //0x800418E8

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   SCREEN                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern struct Screen g_ScreenStruct; //0x8015F480
extern struct Screen g_Screen1;
extern struct Screen g_Screen2;
extern struct Screen g_Screen3;
extern struct Screen g_Screen4;

extern struct Viewport g_ViewportStruct; //0x8015F490
extern struct Viewport g_Viewport1;
extern struct Viewport g_Viewport2;
extern struct Viewport g_Viewport3;
extern struct Viewport g_Viewport4;

extern float g_screenViewAngle[4]; //0x80150130

extern short g_screenBorders; // 0x80001E64 // disable 2400

extern long g_screenSplitA; //0x800DC52C
extern long g_screenSplitB; //0x800DC530

extern float g_aspectRatio; //0x80150148
extern float g_farClip; //0x8015014C

extern void SetFadeOutB(); //0x8009E208
extern void FadeMain(); //0x8009CA2C
extern void FadeMain2(int i); //0x8009CA6C
extern void SetFadeOut(int Fade); //0x8009DFE0
extern short g_fadeOutFlag; //0x800DC5C0
extern short g_fadeOutCounter; //0x800DC5C4

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -               2D: PRINT                                 .                              //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern unsigned long* GraphPtr; //0x80150298
extern long GraphPtrOffset; //0x80150298

extern void loadFont(); //0x80057710

extern void colorFont(int color); //0x800930D8
extern void SetPalette(int palette_number); //0x800930D8
extern uint64 g_DebugTextPalette; //0x801A6818

extern void SetWord(int x,int y,char *printText); //0x800930E4
extern void SetWord2(int x,int y,char *printText); //0x80093134
extern void SetWord2A(int x,int y,char *printText,int interval,float mulx,float muly,int type); //0x80093324
extern void SetWord2AP(int x,int y,char *printText,int interval,float mulx,float muly); //0x80093358
extern void SetWord3(int x,int y,char *printText,int interval,float mulx,float muly,int type); //0x8009338C
extern void SetWord3A(int x,int y,char *printText,int interval,float mulx,float muly); //0x800936B8
extern void SetWord3AC(int x,int y,char *printText,int interval,float mulx,float muly); //0x800936EC
extern void SetWord3AP(int x,int y,char *printText,int interval,float mulx,float muly); //0x80093720
extern void SetWord3ACP(int x,int y,char *printText,int interval,float mulx,float muly); //0x80093754
extern void SetWord4(int x,int y,char *printText,int interval,float mulx,float muly,int type); //0x80093788
extern void SetWord4A(int x,int y,char *printText,int interval,float mulx,float muly); //0x800939C8
extern void SetWord4AP(int x,int y,char *printText,int interval,float mulx,float muly); //0x800939FC

extern void printNumber(int *xPosition, int *yPosition, int num, int base); //0x80057524
extern void printString(int xPosition, int yPosition, char *printText); //0x800577A4
extern void printStringBinary(int xPosition, int yPosition, char *printText, int printValue); //0x80057908
extern void printStringNumber(int xPosition, int yPosition, char *printText, int printValue); //0x800577D0
extern void printStringUnsignedNumber(int xPosition, int yPosition, char *printText, uint printValue); //0x80057814
extern void printStringHex(int xPosition, int yPosition, char *printText, int printValue); //0x80057858
extern void printStringUnsignedHex(int xPosition, int yPosition, char *printText, uint printValue); //0x800578B0
extern void printStringUnsignedBinary(int xPosition, int yPosition, char *printText, uint printValue); //0x80057960

extern unsigned long* FillRect1ColorF(unsigned long *buf, int x1, int y1, int x2, int y2, int r, int g, int b, int a); //0x80098DF8

extern void textDrawPtr(int *x, int *y, const char *str, int spacing, float xScale, float yScale); //0x80093788
extern void textDraw(int x, int y, const char *str, int spacing, float xScale, float yScale); //0x800939FC
extern void DrawText(int x, int y, const char *str, int spacing, float xScale, float yScale); //0x800936EC

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                     2D: STRINGS                                                        //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern int GetWordLength(const char *str); //0x80093034

extern long g_StringTableCourseGP[20]; // 800E7524
extern long g_StringTableCourse[20]; // 800E7574

extern void SetObjBlock(int kind, int x, int y, char pri); //0x8009E650
extern void InitObjBlock(); //0x8009E620
extern void DoObjBlock(int pri_flag); //0x800A7A4C
extern void DOBPSelTurnIn(ObjBlock Target); //0x800AAB90
extern void DOBPSelTurnOut(ObjBlock Target); //0x800AAA9C

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                     2D: SPRITES                                                        //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern void TexBuffLoadP(void *texlist_ptr,int nocheck_flg); //0x800996BC
extern void GrayScaleTexBuf3(uint num, uint step); //0x8009B0A4
extern void GrayScaleTexBufRGB(uint num, int size, int r, int g, int b); //0x8009B538

extern void KWSprite(int cx,int cy,uint sizex,uint sizey,ushort *addr); //0x8004C364
extern void KWSpriteScale(int cx,int cy,float scale, ushort *addr, uint sizex,uint sizey); //0x8004CA58
extern void KWSpriteDiv(int cx,int cy,ushort *addr,uint sizex,uint sizey,uint cuty); //0x8004C91C
extern void KWSpriteTile32B(short cx,short cy,uchar *addr,uint sizex,uint sizey); //0x8004C6FC
extern void DrawLineHorizontal(short tx,short ty,short length,ushort r,ushort g,ushort b,ushort a); //0x8004C024
extern void DrawLineVertical(short tx,short ty,short length,ushort r,ushort g,ushort b,ushort a); //0x8004C148
extern void KWLoadTextureBlockI4b(uchar *texaddr,int cutx,int cuty); //0x80044DA0
extern void KWLoadTextureBlockRGBA16B(ushort *texaddr,int cutx,int cuty); //0x80043D50
extern void SPRDrawClip(int sx,int sy,int sizex,int sizey,int mode); //0x8004B97C
extern void SprDrawClipST(int sx,int sy,int sizex,int sizey,int ss,int tt,int mode); //0x8004BA98
extern ushort StockNumberSprites[]; //0x0D00C558
extern void DecodeMapImage1(uint romaddress,uint romsize,uint ramsize); //0x802A84F4 MR Tree (0x0F04F45C, 859, 2048)

extern void kwtexture2D_a4_xlu_pt(int x,int y,unsigned short ang ,float scale,uint r,uint g,uint b,uint a,uchar* texaddr,uint* vtxaddr,int sizex,int sizey,int cutx,int cuty); //0x8004A2F4
extern void kwtexture2D_a4_bl(int x,int y,ushort ang ,float scale,uchar* texaddr,uint* vtxaddr,int sizex,int sizey,int cutx,int cuty); //0x8004A258
extern void kwscale2D(float scale); //0x800420A8
extern void kwtexture2D_a4_xlu_bl(int x,int y,unsigned short ang ,float scale,uint r,uint g,uint b,uint a,uchar* texaddr,uint* vtxaddr,int sizex,int sizey,int cutx,int cuty); //0x8004A384
extern void kwdisplay_zanzou(int player); //0x8004EB38
extern void kwtexture2D_rgba_xl(int x,int y,unsigned short ang ,float scale,uint alpha,ushort *texaddr,uint* vtxaddr,int sizex,int sizey,int cutx,int cuty); //0x800465B8
extern void kwsprite_xlu (int cx,int cy,uint alpha,ushort *addr,uint sizex,uint sizey,uint cutx,uint cuty); //0x8004C9D8
extern void kwsprite_ci8_xlu_pt (int cx,int cy,uint alpha,ushort *paladdr,uchar *idxaddr,int sizex,int sizey,int cutx,int cuty); //0x8004E3F4
extern void spr_draw_ci8(int cx,int cy,uchar *idxaddr,int sizex,int sizey,int cuty); //0x8004DF5C
extern void kwsprite_ia8_xlu_pt	(int cx,int cy,uchar *texaddr,uint r,uint g,uint b,uint a,int sizex,int sizey,int cutx,int cuty); //0x8004D044
extern void kwtexture2D_ci8_xlu_pt (int x,int y,unsigned short ang ,float scale,uint alpha,ushort *paladdr,uchar *idxaddr,uint* vtxaddr,int sizex,int sizey,int cutx,int cuty); //0x80047B9C
extern void kwsprite_sub (int cx,int cy,ushort *addr,uint sizex,uint sizey,uint cuty,int mode); //0x8004C268

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                  3D: DRAWING STUFF                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern void CheckDMA(); //0x80020524
extern void CheckDMA2P(); //0x8002088C
extern void CheckDMA3P(); //0x80020BF4
extern void CheckDMA4P(); //0x80020F1C

extern void SmokeDisp(void* Car, char kno, char place); //0x8006E5AC
extern void SmokeDisp2P(void* Car, char kno, char place); //0x8006E634
extern void SmokeDisp3P(void* Car, char kno, char place); //0x8006E6BC
extern void SmokeDisp4P(void* Car, char kno, char place); //0x8006E744

extern SVector CaveFirePos[8]; //0x800E6788
extern void KWGetCaveFire(int objnum); //0x800770F0
extern int CaveFireColCheck; //0x800547CC
extern void KWSet2Color(uint prim_r,uint prim_g,uint prim_b,uint env_r,uint env_g,uint env_b,uint a); //0x8004B1C8
extern void KWDisplayFireParticleSub(int num,uchar color,void* Camera); //0x8005477C
extern int FireParticleAllocArray[64]; //0x8018C870
extern int FireParticleCounter; //0x80183E6C

extern int EffectAllocArray1[128]; //0x8018C1B0
extern int EffectAllocArray2[128]; //0x8018C3F0
extern int EffectAllocArray3[128]; //0x8018C630
extern void KWGetStar(Vector position,int type); //0x800773D8
extern void KWChartStar(void); //0x80077640
extern void KWDisplayStar(int player); //0x80054BE8

extern ushort RGBAFallingLeaf[]; //0x0D028DD8
extern ushort RGBAQuestionMark[]; //0x0D001EE8
extern ushort RGBALeaf[]; //0x0D0291D8
extern int FallingRockGFX_U; //0x8029CBE8 default 0x3C0F0600
extern int FallingRockGFX_L; //0x8029CBEC default 0x25EF6FE0
extern int FallingRockShadowGFX_U; //0x8029CB9C default 0x3C0C0600
extern int FallingRockShadowGFX_L; //0x8029CBA8 default 0x258C6F88
extern int ShadowModel; //0x0D007B98
extern int HoleModel; //0x0D007C10
extern void MoveFallingRock(Object *obj); //0x8029D188

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                   3D: LAKITU & RELATED                                                 //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern long OoBCheck(ushort pointer); //0x802ABDF4

extern void SetFastOoB(void *Car,char PlayerID); //0x80090868
extern void CallLakitu(void *Car); //0x80090868
extern void SetLakitu(void *Car); //0x80090778
extern void LakituCheck(void *Car,char PlayerID); //0x8002C17C
extern void HangLakitu(void *Car,char PlayerID); //0x80090970
extern long LakituIceBehavior; //0x800797E8

extern float CheckWaterLevel(void *Car); //0x802AAB4C
extern void CheckSplash(void *Car,int PlayerIndex); //0x8002C4F8

extern long CheckSplashJAL1; //0x8002E4A8
extern long CheckSplashJAL2; //0x8002F340
extern long CheckSplashJAL3; //0x8003939C

extern char g_lakituStatus; // 0x80165DCE
extern struct Lakitu g_lakituStatusPlayer1; // 0x80165DCE
extern struct Lakitu g_lakituStatusPlayer2; // 0x80165EAE
extern struct Lakitu g_lakituStatusPlayer3; // 0x80165F8E
extern struct Lakitu g_lakituStatusPlayer4; // 0x8016606E
extern short g_lakituSurface; // 0x80163316

void KWDisplayIceBlock(int player); //0x80052C60
void KWDisplayIceBlockShadow(int player); //0x80052E30
void KWDisplayBombKartBT(int player); //0x80056AC0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   TITLESCREEN                                          //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern long g_NintendoLogoOffset; //0x8019F88C
extern long g_NintendoLogoBorder; //0x800944AC

extern long titleDemo; //0x8018EE00
extern long titleProgressButton; // 0x8018EE04 Button timer

extern long g_mlogoY;// 0x8018D9F0
extern long g_mflagID;// 0x8018DA30
extern long g_mpressstartID;// 0x8018DA58
extern long g_mracewayTime;// 0x8018DA80

extern short titleBackX; //0x8019BE9C
extern short titleBackY; //0x8019BE9E
extern char titleBackAnim; //0x8019BE9B
extern int titleLogoX; //0x8018D9E0
extern int titleLogoY; //0x8018D9F2
extern int titleCopyToggle; //0x8018D9EC //F1
extern short titleCopyX; //0x8019BEC4
extern short titleCopyY; //0x8019BEC6
extern long titleCopyChange; //0x8018DA50 //long F0 darker 04 show message
extern int titlePushToggle; //0x8018DA64
extern short titlePushX; //0x8019BEEC
extern short titlePushY; //0x8019BEEE
extern int titlePushBlink; // 0x8019BED0 // setting != 0 puts static texture in front of blinking one

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   MENU                                                 //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern char menuScreenC; //0x8018EDEE
extern char menuScreenA; //0x8018EDEC
extern char menuScreenB; //0x8018EDED
extern long currentMenu; //0x8018D9E0  //23 main 24 character 25 course 0 ingame

//Gsel
extern short menuExtra; //0x8018ED12 //0xFF00 on (RAM trophy 150cc)

extern char g_menuUpdateTimer1; //0x8018DEEB
extern char g_menuUpdateTimer2; //0x8018DF03
extern char g_menuUpdateTimer3; //0x8018DF1B
extern char g_menuUpdateTimer4; //0x8018DF33

extern char g_menuPreviewValue1; //0x8018DBB7
extern char g_menuPreviewValue2; //0x8018DBDF
extern char g_menuPreviewValue3; //0x8018DC07
extern char g_menuPreviewValue4; //0x8018DC2F

//Psel
extern char PlayerOK[]; //0x8018EDE8
extern char player1OK; //0x8018EDE8
extern char player2OK; //0x8018EDE9
extern char player3OK; //0x8018EDEA
extern char player4OK; //0x8018EDEB

extern char g_CharacterSelections[]; //0x800E86A8
extern char g_player1Character; //0x8018EDE4 // 1 = Mario, 2 = Luigi, etc.
extern char g_player2Character; //0x8018EDE5
extern char g_player3Character; //0x8018EDE6
extern char g_player4Character; //0x8018EDE7

extern struct PlayerTextureTable TBSeq_psel; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_return; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p0; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p1; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p2; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p3; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p4; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p5; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p6; //0x800E8340

//Msel
extern long g_bannerTexture; //0x801F2750
extern long g_previewTexture; //0x8020E460


extern long g_CupArray; //0x800F2BB4
extern short g_cupArray0[4]; //0x800F2BB4
extern short g_cupArray1[4]; //0x800F2BBC
extern short g_cupArray2[4]; //0x800F2BC4
extern short g_cupArray3[4]; //0x800F2BCC
extern short g_cupArrayB[4]; //0x800F2BD4

extern long r_CoursePreviewOffsets; // 0x12C750
extern long g_CoursePreviewOffsets; // 0x80199540
extern long g_CourseBannerOffsets; //0x801FA860
extern long g_cup0preview0; // 0x80199540
extern long g_cup0preview1; // 0x80199568
extern long g_cup0preview2; // 0x801994F0
extern long g_cup0preview3; // 0x801995B8
extern long g_cup1preview0; // 0x80199590
extern long g_cup1preview1; // 0x801994C8
extern long g_cup1preview2; // 0x80199428
extern long g_cup1preview3; // 0x80199400
extern long g_cup2preview0; // 0x80199630
extern long g_cup2preview1; // 0x801995E0
extern long g_cup2preview2; // 0x80199518
extern long g_cup2preview3; // 0x80199450
extern long g_cup3preview0; // 0x801996D0
extern long g_cup3preview1; // 0x801994A0
extern long g_cup3preview2; // 0x80199478
extern long g_cup3preview3; // 0x80199608

//Data

//Option


///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   COURSE: Settings / Conditionals                      //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern char g_cupSelect; //8018EE09
extern char g_courseSelect; //8018EE0B
extern char g_InGameTT; //0x8018EDFB
extern char g_InGame; //0x8018EDFC
extern short asm_CupCount; //0x8028E3C6

extern char raceBombs1;// 0x8000985B // 5 disable
extern char raceBombs2;// 0x8001C40B 

extern char g_menuMultiplayerSelection; //0x8018EDF3 // 1 to 4 players
extern char g_gamePausedFlag; //0x800EA16C
extern char g_gamePausedFlagPlayer;// 0x800DC5FD // 00 - 03

extern short g_demoFlag;// 0x800DC51C
extern uchar g_cupLevel; // 0x8018EE0B circuit_select 00 - 03

extern char g_ReplayFlag; //0x8015F891 
extern long g_resetToggle; //0x800DC50C
extern long g_startingIndicator; //0-Level Start 1-Demo Camera 2-Countdown 3-Racing 4-Finish Waiting 5-Race Finish 6-Fade Out 7-No Operation
extern long g_NewSequenceMode; //0x800DC524
extern long g_NextSequenceMode; //0x800DC528
extern long g_playerCount; //0x800DC538
extern long g_raceClass; //0x800DC548
extern float g_gameTimer; //0x800DC598
extern short g_courseID; //0x800DC5A0
extern short g_loadedcourseFlag; //0x800DC5A4
extern long g_gameMode; //0x800DC53C 0 = gp 1 = time trials 2 = vs 3 =battle

extern void loadCourse(int courseID); //0x802AA918
extern long g_courseTable; //0x802B8D80

extern void ScrollMapImage(int ObjectAddress,int ScrollS,int ScrollT); //0x802AF7B4
extern void MakeWaterVertex(int ObjectAddress, char alpha, char red, char green, char blue); //0x802AF8BC

extern short CheckArea(ushort pointer); //0x802ABD40

extern float g_mirrorValue; //0x8015F784
extern long g_mirrorMode; //0x800DC604

extern long g_courseFaceStructPtr; //0x8015F580
extern ushort g_courseFaceMaxIndex; //0x8015F588

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   COURSE: Path stuff                                   //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern uint PathTable[20][4]; //0x800DC8D0
extern ushort g_courseTotalPathPoints[4]; //0x801645C8
extern struct CenterPathStruct *g_pathPointPointer; //0x80164490

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   COURSE: Skybox / Environment                         //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

extern long CloudTypeMapCheck1; //0x80070560
extern long CloudTypeMapCheck2; //0x80070564
extern long CloudAmountMapCheck1; //0x80078DD8
extern long CloudAmountMapCheck2; //0x80078DE0
extern char g_cloudsToggle; // 0x801657C8 //00 on 01 off
extern long *g_MRCloudTexPtr; //0x8016D6FC Set of four I4 cloud images, 0x400 length each.

extern short g_skyToggle; // 0x800DC5BC 
extern char g_skyboxToggle; // 0x800DC5B4 
extern short g_daytimeToggle; // 0x800DC518 

extern long g_SnowParticleTex[50]; //0x801C8D10
extern float g_skySnowScale; //0x800EEB3C
extern float g_skySnowVelocity; //0x800EEB40
extern long g_skySnowSpawnHeight; //0x80077FD8
extern long g_skySnowSpawnRadiusDensity; //0x80077FA4
extern long g_skySnowSpawnCenterOffset; //0x80077FE8
extern long g_skySnowHitGoal; //0x800780A0

extern long g_3DSnowSpawnHeight; //0x8007833C
extern long g_3DSnowSpawnDistance; //0x80078348
extern long g_3DSnowSpawnCone; //0x8007830C
extern long g_3DSnowSpawnRadius; //0x80078354
extern long g_3DSnowSwayVelocity; //0x80078430
extern long g_3DSnowSwayDistance; //0x8007843C
extern float g_3DSnowSwayMovement; //0x800EEB50
extern float g_3DSnowScale; //0x800EEB48
extern float g_3DSnowVelocityUpLim; //0x800EEB58
extern float g_3DSnowVelocityLowLim; //0x800EEB60

extern void KWChartSnow(); //0x80078838
extern void KWChartIceBlock(); //0x80079D44

extern long Snow3DAllocMapCheck1; //0x80070784
extern long Snow3DAllocMapCheck2; //0x80070788
extern long Snow3DDisplayAfterMapCheck1; //0x80058B58
extern long Snow3DDisplayAfterMapCheck2; //0x80058B5C

extern char g_fogToggleBanshee; // 0x800DC5BD
extern char g_fogR; //0x801625EF
extern char g_fogG; //0x801625F3
extern char g_fogB; //0x801625F7
extern short fogLevelA;// 0x802B87B0
extern short fogLevelB;//0x802B87B4

/* NO ARRAY POSSIBLE */
extern long g_skyColorTopTable; //0x802B8AD0
extern long g_skyColorBotTable; //0x802B8BCC
extern struct Skycolor g_skyColorTop00; // 0x802B8AD0
extern struct Skycolor g_skyColorTop01; // 0x802B8ADC   
extern struct Skycolor g_skyColorTop02; // 0x802B8AE8   
extern struct Skycolor g_skyColorTop03; // 0x802B8AF4   
extern struct Skycolor g_skyColorTop04; // 0x802B8B00   
extern struct Skycolor g_skyColorTop05; // 0x802B8B0C   
extern struct Skycolor g_skyColorTop06; // 0x802B8B18   
extern struct Skycolor g_skyColorTop07; // 0x802B8B24    
extern struct Skycolor g_skyColorTop08; // 0x802B8B30   
extern struct Skycolor g_skyColorTop09; // 0x802B8B3C    
extern struct Skycolor g_skyColorTop0A; // 0x802B8B48   
extern struct Skycolor g_skyColorTop0B; // 0x802B8B54   
extern struct Skycolor g_skyColorTop0C; // 0x802B8B60   
extern struct Skycolor g_skyColorTop0D; // 0x802B8B6C  
extern struct Skycolor g_skyColorTop0E; // 0x802B8B78
extern struct Skycolor g_skyColorTop0F; // 0x802B8B84
extern struct Skycolor g_skyColorTop10; // 0x802B8B90
extern struct Skycolor g_skyColorTop11; // 0x802B8B9C
extern struct Skycolor g_skyColorTop12; // 0x802B8BA9
extern struct Skycolor g_skyColorTop13; // 0x802B8BB4

extern short g_koopaWaves;// 0x8015F8E8 // if equals BDCC then 3FF0 = super fast

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   COURSE: Special Positions                            //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern Vector g_goalBannerPos; //0x8015F8D0

extern short g_mooSoundCounter; //0x8015F700
extern short g_mooSoundPointer; //0x8015F702
extern float g_mooSoundLastDistance; //0x8015F704
extern Vector g_mooSoundPosition;  //0x8015F708
extern Vector g_crowdSoundPos1; //0x8015F748
extern Vector g_crowdSoundPos2; //0x8015F758
extern Vector g_crowdSoundPos3; //0x8015F768
extern Vector g_crowdSoundPos4; //0x8015F778
extern Vector g_waterfallSoundPos; //0x8015F738

extern float g_waterHeight; //0x8015F8E4
extern float g_waterVelocity; //0x8015F8E8

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   COURSE: Win Points                                   //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern uchar g_kartGPpoints[8]; //0x8018D9C8 name to num: Mario, Luigi, Yoshi, Toad, D.K., Wario, Peach, Bowser

//multiplayer points
extern uchar g_2PRacePoints[2]; //0x8000031C
extern uchar g_3PRacePoints[3]; //0x8000031E
extern uchar g_4PRacePoints[4]; //0x80000321
extern uchar g_2PBattlePoints[2]; //0x80000333
extern uchar g_3PBattlePoints[3]; //0x80000335
extern uchar g_4PBattlePoints[4]; //0x80000338

extern short g_battleBalloonCt[4];// 0x8018D8C0

extern uchar g_kartGPrank[8];// 0x8018D9D0
extern char g_placedBadGPadvance; //0x8028EFF0 // 0x10 = Retry; 0x00 = Advance

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   HUD                                                  //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern struct Hud g_hudStruct[4]; //0x8018CA70 | 0x8018CAF4 | 0x8018CB78 | 0x8018CBFC               

extern char g_debugScreenLines; // 0x801657B2

//p1 p2 only
extern char g_hudToggleFlag; // 0x80165808
extern short g_hudToggleFlagP2; // 0x80165832
extern short g_hudMapToggle; // 0x80165800
extern char g_hudMapToggle2; //801657E8 //shows with speed
extern char g_hudSpeedToggle; // 0x80165810
extern char g_hudSpeedToggle2; //801657E6 //shows with map
extern char g_hudLapToggle; //801657E4 //00/01 show lap 02 don't show lap/speed

//hud all players
extern char g_hudToggle; // 0x800DC5B9 
extern char g_mapPlayers; // 0x8018D15B
extern char g_blueLineRankToggle; // 0x801657F0

//hud p1 only
extern char g_hudCharpicRankToggle; // 0x8018D2BF
extern char g_hudCharpicRankA; // 0x8018D3E3
extern float g_hudCharpicRankX[8]; // 0x8018D028
extern float g_hudCharpicRankY[8]; // 0x8018D050 

extern short asm_DisableHUD; //0x80059D08

extern long g_mapTexture; //0x8018D240
extern long g_mapStartToggle; //0x8004F150 //0C0132B4
extern float g_mapScale; //0x8018D2A0
extern short g_mapX; //0x8018D2C0
extern short g_mapY; //0x8018D2D8
extern short g_startX; //0x8018D2E0
extern short g_startY; //0x8018D2E8
extern short g_map2X; //0x8018D2C0
extern short g_map2Y; //0x8018D2D8
extern short g_mapHeight; //0x8018D2E0
extern short g_mapWidth; //0x8018D2E8
extern short g_mapR; //0x8018D230
extern short g_mapG; //0x8018D308
extern short g_mapB; //0x8018D310

extern void kwdisplay_totaltime (int player); //0x8004FA78
extern void kwprintlaptime (int tx,int ty,int timer); //0x8004F7F4
extern void kwdisplay_enemycar (void); //0x800514BC
extern void kwdisplay_kaopanel (void); //0x80050320
extern void kwdisplay_radarmap (int screen); //0x8004EE54
extern void kwdisplay_radarsline (int screen); //0x8004F020
extern void kwdisplay_radarplayer (int screen); //0x8004F3E4
extern void kwdisplay_itemboxs(int player); //0x8004E6C4
extern void kwdisplay_ranks(void); //0x800590D4

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   PLAYER FLAGS                                         //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern char g_lightningFlag; // 0x800EA168
extern char g_playerFlagLightning[8]; // 0x800E9F24
extern short lightningTime; // 0x8008E302 //default 01cc
extern short g_playerFlagOffroad[8]; // 0x80165330
extern float g_waterlevelPlayer[8]; // 0x801652A0
extern short g_playerFlagWrongway[8]; // 0x80163270 
extern char g_playerFlagShadow[8]; //0x800F6B87
extern float g_timeLapChange[8]; //0x8015F898
extern short g_playerPathPointTable[8]; // 80164438
extern long g_playerPathPointTotalTable[8]; // 80164450
extern short g_playerPathPointCopy[8]; // 80165320
extern short g_rivalOvertakeAllowFlag[10]; //0x801634C0
extern short g_rankUpdateFinishFlag; //0x8016348C

extern char g_2PweaponModifierP1;// 0x80165F5D
extern char g_2PweaponModifierP2;// 0x8016603D
extern char g_2PweaponModifierP3;// 0x8016611D
extern char g_2PweaponModifierP4;// 0x801661FD
extern char g_2PweaponModifierP5;// 0x801662DD
extern char g_2PweaponModifierP6;// 0x801663BD
extern char g_2PweaponModifierP7;// 0x8016649D
extern char g_2PweaponModifierP8;// 0x8016657D

extern char g_4PweaponModifierP1; // 0x8016611D
extern char g_4PweaponModifierP2; // 0x801661FD
extern char g_4PweaponModifierP3; // 0x801662DD
extern char g_4PweaponModifierP4; // 0x801663BD

/* NO ARRAY POSSIBLE */
extern struct Playercolor g_colorPlayer0R; //0x80164B10
extern struct Playercolor g_colorPlayer1R; //0x80164B12
extern struct Playercolor g_colorPlayer2R; //0x80164B14
extern struct Playercolor g_colorPlayer3R; //0x80164B16
extern struct Playercolor g_colorPlayer4R; //0x80164B18
extern struct Playercolor g_colorPlayer5R; //0x80164B1A
extern struct Playercolor g_colorPlayer6R; //0x80164B1C
extern struct Playercolor g_colorPlayer7R; //0x80164B1E

extern short g_noSimpleKartFlag[8]; // 801633F8
extern float g_charRadiusTbl[8]; //0x800E26B0

extern void MakeBodyColor(void* Car, char Player, int Color, float Speed); //0x80022F14
extern void MakeBodyColorAdjust(void* Car, char Player, int Color, float Speed); //0x80023038

extern long g_GameLapTable[8];    //0x80164390 0x8  0164390

extern long g_playerPosition[8];// 801643B8

extern float gravity[8]; //0x800E2650

/* MAKE ARRAY? */extern long g_PlayerInputTable; //0x800F6910
extern struct Controller g_Controller1; //0x800F6910
extern struct Controller g_Controller2; //0x800F6920
extern struct Controller g_Controller3; //0x800F6930
extern struct Controller g_Controller4; //0x800F6940
extern struct Controller g_ControllerMenu; //0x800F6950

/* MAKE ARRAY AND NAME IT GlobalPlayer?*/ extern struct Player g_PlayerStructTable; //0x800F6990 | 0x800F7768 | 0x800F8540 | 0x800F9318 | 0x800FA0F0 | 0x800FAEC8 | 0x800FBCA0 | 0x800FCA78
extern struct Player g_PlayerStruct1;
extern struct Player g_PlayerStruct2; 
extern struct Player g_PlayerStruct3; 
extern struct Player g_PlayerStruct4; 
extern struct Player g_PlayerStruct5;
extern struct Player g_PlayerStruct6;
extern struct Player g_PlayerStruct7;
extern struct Player g_PlayerStruct8;

extern char g_playerEcho; // 0x800E9F90

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   OBJECTS & COLLISION                                  //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern struct Object g_SimpleObjectArray[100]; //0x8015F9B8

extern short addObjectBuffer(Vector position, SVector angle, Vector velocity, short objectID); //0x8029EC88
extern short deleteObjectBuffer(void *Object); //0x8029E854

extern short g_simpleObjectCount; //0x80150110
extern short g_simpleObjectScreenCount; //0x80150112

// extern long g_DynamicObjects; //0x80165C18

extern int CollisionCylinder(void *Car, Vector Position, float Radius, float Height, float Parameter); //0x8029EEB8
extern int CollisionSphere(void *Car, void *Object); //0x8029FB80

extern ushort CheckBump(Bump *bump,float Radius,float PositionX,float PositionY,float PositionZ); //0x802ADDC8
extern ushort CheckBump2(Bump *bump,float Radius,float PositionX,float PositionY,float PositionZ,float LastX, float LastY,float LastZ); //0x802AD950
extern void BumpVelocity(Vector Bump,float Distance ,Vector Velocity,float co); //0x802AC114
extern void CalcBumpVelocity(Bump InputBump, float Velocity); //0x802AC098
extern void BumpObject(Object* InputObject); //0x802B4E30

extern void reset_shadow_flag (Player *player); //0x802977E4
extern void collision_check_routin (Player *player,Object *obj); //0x802A0450
extern void collision_egg (Player *player,Object *obj); //8029F408
extern void collision_tree(Player *player,Object *obj); // 0x8029F69C
extern void collision_pakkun(Player *player,Object *obj); // 0x8029F2FC
extern void collision_mkanban(Player *player,Object *obj); // 0x8029F1F8
extern void kill_object (Object *obj); //0x8029FDC8
extern void set_broken (Player *player, char number);// 0x8008DABC
extern void set_shadow_flag (Player *player);// 0x802977B0
extern void kwhit_tree(FVector pos,int type);// 0x80077AB0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   ITEMS & ITEMBOX                                      //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern void RouletteStart(int Player, int SpecialItem); //0x8007ABFC

extern long SetStar(void *Car, int PlayerIndex); //0x8008F778
extern void ResetStar (void *Car, char PlayerIndex); //0x8008F86C
extern long SetTurbo(void *Car, int PlayerIndex); //0x8008D3C4
extern long SetWing(void *Car, int PlayerIndex); //0x8008D570
extern long SetStorm(void *Car, int PlayerIndex); //0x8008D7B0
extern long SetThunder(void *Car, int PlayerIndex); //0x8008DF98
extern void ThunderWorld(); //0x8009E5BC

extern long g_StarUseCounter[8]; // 8018D930
extern long g_GhostUseCounter[8]; // 8018D950
extern long g_GhostUseTimer[8]; // 8018D970

extern int ItemBoxModel; //0x0D003288

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   SOUNDS & MUSIC                                       //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern short songID[12]; //0-Raceways 1-Toad 2-Country 3-Battle1 4-Kalamari 5-Koopa 6-Bowser 7-Banshee 8-Snowy 9-Rainbow 10-DK 11-Battle2
/* DELETE */ extern short g_musicIDRaceways; // 0x8028ECE6 //use array extern short songID[12]; 
/* DELETE */ extern short g_musicIDToad; // 0x8028ECF6
/* DELETE */ extern short g_musicIDCountry; // 0x8028ED06
/* DELETE */ extern short g_musicIDBattle1; // 0x8028ED16
/* DELETE */ extern short g_musicIDKalamari; // 0x8028ED26
/* DELETE */ extern short g_musicIDKoopa; // 0x8028ED36
/* DELETE */ extern short g_musicIDBowser; // 0x8028ED46
/* DELETE */ extern short g_musicIDBanshee; // 0x8028ED56
/* DELETE */ extern short g_musicIDSnowy; // 0x8028ED66
/* DELETE */ extern short g_musicIDRainbow; // 0x8028ED76
/* DELETE */ extern short g_musicIDDK; // 0x8028ED86
/* DELETE */ extern short g_musicIDBattle2; // 0x8028ED96

extern long asm_SongA;// 0x8028EC9C
extern long asm_SongB;// 0x8028F9C4
extern short asm_DisableEngineSound; //0x800E9F74

extern long g_sfxPointer; //803B7080

extern char g_sfxPause; //0x803B17A3 // 20 - paused; 00 playing
extern long g_SequenceTable; //0x803B8FB0
extern long g_InstrumentTable; //0x803B90B0
extern long g_RawAudio; //0x803B9260

extern long CheckFinalLapFanfareJAL; //0x8028F344
extern long CheckPlayStarBGMJAL; //0x8008F820

extern void playSound(int soundID); //0x800C8E10
extern void NAMusicVolume(unsigned char volume); //0x800C8F44 0-Mute 75-Half 127 Full
extern void NAPlyTrgStart(char playerID, int soundID); //0x800C9060
extern void NAPlyVoiceStart(char playerID, int soundID); //0x800C90F4
extern void NAEnmTrgStart(Vector ObjectPosition, Vector ObjectVelocity, int soundID); //0x800C98B8
extern void NAEnmTrgStop(Vector ObjectPosition, int soundID); //0x800C99E0
extern void NaSeqStart(int musicID); //0x800C8EAC
extern void NaFanStart(int musicID); //0x800C8EF8
extern void NaPlyLevelStart(char playerID, int soundID); //0x800C8F80
extern void NaPlyLevelStop(char playerID, int soundID); //0x800C9018
extern void NaSceneLevelStart(Vector ObjectPosition, Vector ObjectVelocity, int soundID); //0x800C9D80
extern void NaSceneLevelStop(Vector ObjectPosition, int soundID); //0x800C9EF4

extern short g_musicUserVolumeFlag; // 0x800DC5A8 //char 00=full; // 01=half; // 02=off  04=disable L button
extern ushort g_musicTempo; //0x803B1518
extern ushort g_fanfareTempo; //0x803B1660
extern SeqPlayerStruct SeqPlayer[4]; //0x803B1510

extern void NAISeqFlagEntry(uint entry); //0x800C2A2C
extern ushort NAIGetPlayingSeqFlag(uchar seq); //0x800C3508
extern void NAIFxFlagEntry(uint A, float B[3], uchar C, float *D, float *E, char *F); //0x800C4148


///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   MATH, RNG, COUNTERS                                  //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
extern unsigned short g_RNG; //0x802BA290

extern float Sqrtf(float Input); //0x800CE140
extern int CalcDisplayPosition(Screen *screen,Vector origin,float x,float y); //0x802B4F60
extern void BrkProgram(); //0x802B4FEC
extern int SetMatrix(AffineMtx Matrix, int Mode); //0x802B4FF8
extern float CalcDistance(Vector origin,Vector object); //0x802B51E8
extern ushort CalcDirection(Vector origin,Vector object); //0x802B5224
extern ushort CalcDirectionS(Vector origin,SVector object); //0x802B5258
extern void SetFVector(Vector vct,float a,float b,float c); //0x802B529C
extern void SetSVector(SVector vct,short a,short b,short c); //0x802B52BC
extern Vector *CopyVector(Vector destination, Vector source); //0x802B52D8
extern void CopySVector(SVector destination, SVector source); //0x802B5304
extern Vector *SetVector(Vector vector, float vecx, float vecy, float vecz); //0x802B531C
extern void CopyAffine(AffineMtx source,AffineMtx object); //0x802B5350
extern void CopyLongArray(long *destination, long *source, int count); //0x802B5398
extern void LoadIdentAffineMtx(AffineMtx Matrix); //0x802B53C8
extern void TranslateMatrix(AffineMtx Matrix,AffineMtx Matrix2,Vector vect); //0x802B5450
extern void TranslateMatrix2(AffineMtx Matrix,AffineMtx Matrix2,Vector vect); //0x802B54EC
extern void CreateTransAffineMtx(AffineMtx Matrix,Vector position); //0x802B5520
extern void MakeGuPerspective(AffineMtx Matrix, ushort *perspNorm, float fovy, float aspect, float near, float far, float scale); //0x802B5564
extern void MakeGuLookAt(AffineMtx Matrix, Vector eye, Vector look); //0x802B5794
extern void CreateMtxRotateX(AffineMtx Matrix, short angle); //0x802B59DC
extern void CreateMtxRotateY(AffineMtx Matrix, short angle); //0x802B5A44
extern void CreateMtxRotateZ(AffineMtx Matrix, short angle); //0x802B5AAC
extern void RotateVector(Vector vector,SVector angle); //0x802B5B14
extern void InitialLight(short yaw,short pitch,Vector light); //0x802B5CAC
extern void MakeMapLight(short yaw,short pitch,int count); //0x802B5D30
extern void MakeLight(uint lpointer,short yaw,short pitch,int count); //0x802B5D64
extern void ScalingMatrix(AffineMtx Matrix, float scale); //0x802B5F00
extern void CreateModelingMatrix(AffineMtx Matrix, Vector Position, SVector Angle); //0x802B5F74
extern void CreateCameraAffineMtx(AffineMtx Matrix, SVector Position, SVector Angle); //0x802B60B4
extern void CreateCameraAffineMtx2(AffineMtx Matrix, SVector Position, SVector Angle); //0x802B6214
extern void NomralizeVector(Vector vector); //0x802B6374
extern void MultipleMatrixByVector(Vector vector, Matrix matrix); //0x802B63B8
extern void MultipleAffineMtxByVector(Vector vector, AffineMtx Matrix); //0x802B6434
extern void MakeTopMatrix(Matrix mf,float a, float x, float y, float z); //0x802B64B0
extern void MakeAlignVector(Vector Vector,short OriginAngle); //0x802B64C4
extern void MakeAlignMatrix(Matrix mf, float x, float y, float z ,short roty); //0x802B6540
extern void MakeTopAlign(Matrix mf, float x, float y, float z); //0x802B68F8
extern void MakeRotate(Matrix mf, short theta, float x, float y, float z); //0x802B6A84
extern void MakeAlign(Matrix mf, short theta, float x, float y, float z); //0x802B6BC0
extern void CreateModelAffineMtx(AffineMtx matrix, Vector position, Vector angle); //0x802B6D58
extern void MultiAffineMtx(AffineMtx mtx, AffineMtx ma, AffineMtx mb); //0x802B71CC
extern void AffineToMtx(void *matrix, AffineMtx affine); //0x802B75F8
extern ushort GetAtanTable(float a, float b); //0x802B7790
extern ushort Atan2t(float y, float x); //0x802B7830
extern float Atan2f(float x, float y); //0x802B79B8
extern float Atan2fx(float x, float y); //0x802B79F0
extern ushort Atan2tx(float x, float y); //0x802B7B50
extern float Atanf(float x); //0x802B7C18
extern short Atant(float x); //0x802B7C40
extern float Asinf(float x); //0x802B7C6C
extern short Asint(float x); //0x802B7CA8
extern float Acosf(float x); //0x802B7CE8
extern short Acost(float x); //0x802B7D28
extern ushort MakeRandom(void); //0x802B7D94
extern ushort MakeRandomLimmit(ushort limit); //0x802B7E34
extern short MakeDirection(float x1,float y1,float x2,float y2); //0x802B7F34
extern void MakeDirection3D(Vector camera,Vector lookat,SVector ans); //0x802B7F7C
extern float sinT(ushort inputAngle); //0x802B8018
extern float cosT(ushort inputAngle); //0x802B8038
extern float sinF(float inputAngle); //0x800D60F0
extern float cosF(float inputAngle); //0x800D62B0
extern int CheckCone(ushort left,ushort right,ushort direction); //0x802B8058
extern float CheckDisplayRange(Vector basepos, Vector markpos, ushort camera_direction, float radius, float angle2, float limmit_distance); //0x802B80D0
extern void RotateLightMatrix(uint lpointer,AffineMtx m,short yaw,short pitch,int count); //0x802B8414
extern void SetUpVector(void *Car); //0x802B8614
extern double Ipower(double x,int n); //0x80091750
extern double Power(double x,double y); //0x800917B0
extern double Llog(double x); //0x8009186C
extern double Lexp(double x); //0x8009195C
extern double Lldexp(double x,int k); //0x80091A6C
extern double Ffrexp(double x,int *exp); //0x80091AC0
extern void SwapUint(uint *a,uint *b); //0x80091B64
