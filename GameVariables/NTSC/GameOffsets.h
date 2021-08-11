
#include "../../Struct.h"



extern long SYSTEM_Region;


extern void InitMKCode();



extern long spriteKillA;
extern long spriteKillC;
extern short spriteKillB;
extern short spriteKillD;



extern void decodeMIO0(long input, long output);
extern void DMA(int output, int input, long Length);
extern void decodeTKMK(int input, int *temp, int output, int transparent);

extern void GetFramebuffer(int PixelX,int PixelY,int Width,int Height,unsigned short *Source,unsigned short *Destination);
extern ushort CheckBump(Bump *bump,float Radius,float PositionX,float PositionY,float PositionZ);
extern ushort CheckBump2(Bump *bump,float Radius,float PositionX,float PositionY,float PositionZ,float LastX, float LastY,float LastZ);

extern void LoadMap(int courseID);
extern void InitialRaceSequence();
extern void BumpVelocity(Vector Bump,float Distance ,Vector Velocity,float co);
extern void CalcBumpVelocity(Bump InputBump, float Velocity);
extern void ScrollMapImage(int ObjectAddress,int ScrollS,int ScrollT);
extern void MakeWaterVertex(int ObjectAddress, char alpha, char red, char green, char blue);
extern void ramCopy(long output, long input, long Length);
extern short CheckArea(ushort pointer);

extern void InitControllers();
extern void readControllers();

extern void DMABuffer(void* Car, void* Camera, char kno, char place); //0x80020000
extern void DrawBuffer(void* Car, char kno, char place); //0x80021244

extern void CheckDMA(); //0x80020524
extern void CheckDMA2P(); //0x8002088C
extern void CheckDMA3P(); //0x80020BF4
extern void CheckDMA4P(); //0x80020F1C

extern void SmokeDisp(void* Car, char kno, char place); //0x8006E5AC
extern void SmokeDisp2P(void* Car, char kno, char place); //0x8006E634
extern void SmokeDisp3P(void* Car, char kno, char place); //0x8006E6BC
extern void SmokeDisp4P(void* Car, char kno, char place); //0x8006E744

extern float CheckHight(float X_value, float Y_value, float Z_value);
extern int KWCheckRadiusXZ(float x1,float y1,float x2,float y2,float radius);

extern void MoveIWA(Object *ObjectPointer);
extern short deleteObjectBuffer(void *Object);
extern short addObjectBuffer(Vector position, SVector angle, Vector velocity, short objectID);


//float radius,float hight,float param
extern int CollisionCylinder(void *Car, Vector Position, float Radius, float Height, float Parameter); //0x8029EEB8
extern int CollisionSphere(void *Car, void *Object); //0x8029FB80


extern void RouletteStart(int Player, int SpecialItem); //0x8007ABFC

//math
extern int CalcDisplayPosition(Screen *screen,Vector origin,float x,float y);
extern void BrkProgram();
extern int SetMatrix(AffineMtx Matrix, int Mode);
extern float CalcDistance(Vector origin,Vector object);
extern ushort CalcDirection(Vector origin,Vector object);
extern ushort CalcDirectionS(Vector origin,SVector object);
extern void SetFVector(Vector vct,float a,float b,float c);
extern void SetSVector(SVector vct,short a,short b,short c);
extern Vector *CopyVector(Vector destination, Vector source);
extern void CopySVector(SVector destination, SVector source);
extern Vector *SetVector(Vector vector, float vecx, float vecy, float vecz);
extern void CopyAffine(AffineMtx source,AffineMtx object);
extern void CopyLongArray(long *destination, long *source, int count);
extern void LoadIdentAffineMtx(AffineMtx Matrix);
extern void TranslateMatrix(AffineMtx Matrix,AffineMtx Matrix2,Vector vect);
extern void TranslateMatrix2(AffineMtx Matrix,AffineMtx Matrix2,Vector vect);
extern void CreateTransAffineMtx(AffineMtx Matrix,Vector position);
extern void MakeGuPerspective(AffineMtx Matrix, ushort *perspNorm, float fovy, float aspect, float near, float far, float scale);
extern void MakeGuLookAt(AffineMtx Matrix, Vector eye, Vector look);
extern void CreateMtxRotateX(AffineMtx Matrix, short angle);
extern void CreateMtxRotateY(AffineMtx Matrix, short angle);
extern void CreateMtxRotateZ(AffineMtx Matrix, short angle);
extern void RotateVector(Vector vector,SVector angle);
extern void InitialLight(short yaw,short pitch,Vector light);
extern void MakeMapLight(short yaw,short pitch,int count);
extern void MakeLight(uint lpointer,short yaw,short pitch,int count);
extern void ScalingMatrix(AffineMtx Matrix, float scale);
extern void CreateModelingMatrix(AffineMtx Matrix, Vector Position, SVector Angle);
extern void CreateCameraAffineMtx(AffineMtx Matrix, SVector Position, SVector Angle);
extern void CreateCameraAffineMtx2(AffineMtx Matrix, SVector Position, SVector Angle);
extern void NomralizeVector(Vector vector);
extern void MultipleMatrixByVector(Vector vector, Matrix matrix);
extern void MultipleAffineMtxByVector(Vector vector, AffineMtx Matrix);
extern void MakeTopMatrix(Matrix mf,float a, float x, float y, float z);
extern void MakeAlignVector(Vector Vector,short OriginAngle);
extern void MakeAlignMatrix(Matrix mf, float x, float y, float z ,short roty);
extern void MakeTopAlign(Matrix mf, float x, float y, float z);
extern void MakeRotate(Matrix mf, short theta, float x, float y, float z);
extern void MakeAlign(Matrix mf, short theta, float x, float y, float z);
extern void CreateModelAffineMtx(AffineMtx matrix, Vector position, Vector angle);
extern void MultiAffineMtx(AffineMtx mtx, AffineMtx ma, AffineMtx mb);
extern void AffineToMtx(void *matrix, AffineMtx affine); 
extern ushort GetAtanTable(float a, float b);
extern ushort Atan2t(float y, float x);
extern float Atan2f(float x, float y);
extern float Atan2fx(float x, float y);
extern ushort Atan2tx(float x, float y);
extern float Atanf(float x);
extern short Atant(float x);
extern float Asinf(float x);
extern short Asint(float x);
extern float Acosf(float x);
extern short Acost(float x);
extern ushort MakeRandom(void);
extern ushort MakeRandomLimmit(ushort limit);
extern short MakeDirection(float x1,float y1,float x2,float y2);
extern void MakeDirection3D(Vector camera,Vector lookat,SVector ans);
extern float sinT(ushort inputAngle);
extern float cosT(ushort inputAngle);
extern float sinF(float inputAngle);
extern float cosF(float inputAngle);
extern int CheckCone(ushort left,ushort right,ushort direction);
extern float CheckDisplayRange(Vector basepos, Vector markpos, ushort camera_direction, float radius, float angle2, float limmit_distance);
extern void RotateLightMatrix(uint lpointer,AffineMtx m,short yaw,short pitch,int count);
extern void SetUpVector(void *Car);
extern double Ipower(double x,int n);
extern double Power(double x,double y);
extern double Llog(double x);
extern double Lexp(double x);
extern double Lldexp(double x,int k);
extern double Ffrexp(double x,int *exp);
extern void SwapUint(uint *a,uint *b);

extern void *SegmentToVirtual(uint *RSPAddress);

extern void SetPalette(int palette_number);
extern void SetWord(int x,int y,char *printText);
extern void SetWord2(int x,int y,char *printText);
extern void SetWord2A(int x,int y,char *printText,int interval,float mulx,float muly,int type);
extern void SetWord2AP(int x,int y,char *printText,int interval,float mulx,float muly);
extern void SetWord3(int x,int y,char *printText,int interval,float mulx,float muly,int type);
extern void SetWord3A(int x,int y,char *printText,int interval,float mulx,float muly);
extern void SetWord3AC(int x,int y,char *printText,int interval,float mulx,float muly);
extern void SetWord3AP(int x,int y,char *printText,int interval,float mulx,float muly);
extern void SetWord3ACP(int x,int y,char *printText,int interval,float mulx,float muly);
extern void SetWord4(int x,int y,char *printText,int interval,float mulx,float muly,int type);
extern void SetWord4A(int x,int y,char *printText,int interval,float mulx,float muly);
extern void SetWord4AP(int x,int y,char *printText,int interval,float mulx,float muly);

extern void printNumber(int *xPosition, int *yPosition, int num, int base);
extern void printString(int xPosition, int yPosition, char *printText);
extern void printStringBinary(int xPosition, int yPosition, char *printText, int printValue);
extern void printStringNumber(int xPosition, int yPosition, char *printText, int printValue);
extern void printStringUnsignedNumber(int xPosition, int yPosition, char *printText, uint printValue); //0x80057814
extern void printStringHex(int xPosition, int yPosition, char *printText, int printValue); //0x80057858
extern void printStringUnsignedHex(int xPosition, int yPosition, char *printText, uint printValue); //0x800578B0
extern void printStringUnsignedBinary(int xPosition, int yPosition, char *printText, uint printValue); //0x80057960
extern unsigned long* FillRect1ColorF(unsigned long *buf, int x1, int y1, int x2, int y2, int r, int g, int b, int a);
extern void SetFadeOutB();
extern void SetObjBlock(int kind, int x, int y, char pri);
extern void InitObjBlock();
extern void DoObjBlock(int pri_flag);


extern unsigned long long  SaveFunc800B45E0; //0x800B45E0
extern unsigned long long  SaveFunc800B4670; //0x800B4670
extern unsigned long long  SaveFunc800B4CB4; //0x800B4CB4
extern unsigned long long  SaveFunc800B559C; //0x800B559C
extern unsigned long long  SaveFunc800B5948; //0x800B5948

extern unsigned long long  LoadFunc800B4A10; //0x800B4A10

extern void DOBPSelTurnIn(ObjBlock Target); //0x800AAB90
extern void DOBPSelTurnOut(ObjBlock Target); //0x800AAA9C

extern long SegmentTable[];
extern void *g_CfbPtrs[3];

extern long OoBCheck(ushort pointer);


extern long SetStar(void *Car, int PlayerIndex);
extern void ResetStar (void *Car, char PlayerIndex);
extern long SetTurbo(void *Car, int PlayerIndex);
extern long SetWing(void *Car, int PlayerIndex);
extern long SetStorm(void *Car, int PlayerIndex);
extern long SetThunder(void *Car, int PlayerIndex);
extern void ThunderWorld();
extern void VSGhost(void *Car,char PlayerID);
extern void SetVSGhost(void *Car,char PlayerID);
extern void ResetVSGhost(void *Car,char PlayerID);

extern void SetFastOoB(void *Car,char PlayerID);
extern void CallLakitu(void *Car);
extern void SetLakitu(void *Car);
extern void LakituCheck(void *Car,char PlayerID);
extern void HangLakitu(void *Car,char PlayerID);
extern long LakituIceBehavior;
extern void ShakeCamera(Camera *camera);
extern void ShakeHitCamera(Player *Car,float speed);

extern float CheckWaterLevel(void *Car);
extern void CheckSplash(void *Car,int PlayerIndex);

extern long CheckSplashJAL1;
extern long CheckSplashJAL2;
extern long CheckSplashJAL3;

extern long CheckFinalLapFanfareJAL;
extern long CheckPlayStarBGMJAL;

extern long CloudTypeMapCheck1;
extern long CloudTypeMapCheck2;
extern long CloudAmountMapCheck1;
extern long CloudAmountMapCheck2;
extern long Snow3DAllocMapCheck1;
extern long Snow3DAllocMapCheck2;
extern long Snow3DDisplayAfterMapCheck1;
extern long Snow3DDisplayAfterMapCheck2;

extern void TexBuffLoadP(void *texlist_ptr,int nocheck_flg);
extern void GrayScaleTexBuf3(uint num, uint step);
extern void GrayScaleTexBufRGB(uint num, int size, int r, int g, int b);
extern void FadeMain();
extern void FadeMain2(int i);
extern void SetFadeOut(int Fade);
extern short PutPylon(Vector pos,short number);
extern short PutObject(Vector pos,int category);


extern int osEepromLongRead(void *Queue, uchar Address, uchar *Destination, int Length);
extern int osEepromLongWrite(void *Queue, uchar Address, uchar *Destination, int Length);
extern short g_fadeOutFlag;
extern short g_fadeOutCounter;

extern unsigned long* GraphPtr;
extern long GraphPtrOffset;
extern ushort KWLookCamera(float x,float z,Camera *camera);
extern ushort KWLookCameraPitch(float y,float z,Camera *camera);
extern void KWSprite(int cx,int cy,uint sizex,uint sizey,ushort *addr);
extern void KWSpriteScale(int cx,int cy,float scale, ushort *addr, uint sizex,uint sizey);
extern void KWSpriteDiv(int cx,int cy,ushort *addr,uint sizex,uint sizey,uint cuty);
extern void KWSpriteTile32B(short cx,short cy,uchar *addr,uint sizex,uint sizey);
extern void DrawLineHorizontal(short tx,short ty,short length,ushort r,ushort g,ushort b,ushort a);
extern void DrawLineVertical(short tx,short ty,short length,ushort r,ushort g,ushort b,ushort a);
extern void KWLoadTextureBlockI4b(uchar *texaddr,int cutx,int cuty);
extern void KWLoadTextureBlockRGBA16B(ushort *texaddr,int cutx,int cuty);
extern void SPRDrawClip(int sx,int sy,int sizex,int sizey,int mode);
extern void SprDrawClipST(int sx,int sy,int sizex,int sizey,int ss,int tt,int mode);
extern ushort StockNumberSprites[];
extern void DecodeMapImage1(uint romaddress,uint romsize,uint ramsize); //MR Tree (0x0F04F45C, 859, 2048)

extern void BumpObject(Object* InputObject);
extern void SetSegment(int number, int cpuAddr);

extern void initializePlayer(int playerStructure, int characterID, float deltaX, float deltaZ, int characterID2, int unknown0xB000);
extern void DelayInitialMap();

extern long asm_itemJump1A;// 0x8007B084  //3C058016
extern long asm_itemJump1B;// 0x8007B098  //84A543BA

extern long asm_itemJump2A;// 0x8007AFC0  //3C058016
extern long asm_itemJump2B;// 0x8007AFD4  //84A543BA

extern float Sqrtf(float Input);

extern void colorFont(int color);
extern void loadFont();

extern long g_SegmentA;
extern long gIntMesgQueue;
//
//


extern long g_resetToggle; //
extern long g_startingIndicator; //0-Level Start 1-Demo Camera 2-Countdown 3-Racing 4-Finish Waiting 5-Race Finish 6-Fade Out 7-No Operation
extern short g_DebugSection;
extern short g_DebugMode;
extern long g_SequenceMode;
extern long g_NewSequenceMode;
extern long g_NextSequenceMode;
extern long g_screenSplitA;
extern long g_ScreenSplitB;
extern long g_playerCount; //
extern long g_gameType;
extern long g_raceClass;
extern float g_gameTimer;
extern short g_courseID;
extern short g_loadedcourseFlag;
extern long g_gameMode; //0 = gp 1 = time trials 2 = vs 3 =battle
extern unsigned short g_DispFrame;
extern long g_mirrorMode;
extern short g_DebugBars;

extern uint PathTable[20][4];

extern long g_courseFaceStructPtr;
extern ushort g_courseFaceMaxIndex;

extern long antialiasToggle;
extern long antialiasToggleB;


extern long g_CupArray;
extern short g_cup0Array0;
extern short g_cup0Array1;
extern short g_cup0Array2;
extern short g_cup0Array3;
extern short g_cup1Array0;
extern short g_cup1Array1;
extern short g_cup1Array2;
extern short g_cup1Array3;
extern short g_cup2Array0;
extern short g_cup2Array1;
extern short g_cup2Array2;
extern short g_cup2Array3;
extern short g_cup3Array0;
extern short g_cup3Array1;
extern short g_cup3Array2;
extern short g_cup3Array3;
extern short g_cupBArray0;
extern short g_cupBArray1;
extern short g_cupBArray2;
extern short g_cupBArray3;

extern uint64 g_DebugTextPalette;

extern long g_bannerTexture;
extern long g_previewTexture;
extern long g_mapTexture; //0x8018D240
extern long g_mapStartToggle;
extern float g_mapScale;
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


extern long g_DEBUG;

extern long r_CoursePreviewOffsets; // 0x12C750
extern long g_CoursePreviewOffsets; // 0x80199540
extern long g_CourseBannerOffsets;
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

extern long g_NintendoLogoOffset; //0x8019F88C
extern long g_NintendoLogoBorder;

extern char g_lakituStatus; // 0x80165DCE
extern struct Lakitu g_lakituStatusPlayer1; // 0x80165DCE
extern struct Lakitu g_lakituStatusPlayer2; // 0x80165EAE
extern struct Lakitu g_lakituStatusPlayer3; // 0x80165F8E
extern struct Lakitu g_lakituStatusPlayer4; // 0x8016606E
extern short g_lakituSurface; // 0x80163316



extern short p_Input; //
extern char d_Input; //
extern char c_Input;

extern long g_PlayerInputTable;

extern struct Controller g_Controller1; //0x800F6910
extern struct Controller g_Controller2; //0x800F6920
extern struct Controller g_Controller3; //0x800F6930
extern struct Controller g_Controller4; //0x800F6940
extern struct Controller g_ControllerMenu; //0x800F6950

extern short player1inputX;
extern short player1inputY;
extern short p1Button;


extern float g_player1LocationX;
extern float g_player1LocationY;
extern float g_player1LocationZ;
extern float g_player1LastLocationX;
extern float g_player1LastLocationY;
extern float g_player1LastLocationZ;
extern long g_player1LocationA;
extern float g_player1SpeedX;
extern float g_player1SpeedY;
extern float g_player1SpeedZ;
extern float g_player1SpeedA;
extern float g_player1SpeedU1;
extern float g_player1SpeedU2;
extern long g_playerStatus;

extern float g_player1CameraX;
extern float g_player1CameraY;
extern float g_player1CameraZ;
extern float g_playerSpriteSize;

extern float player2X;
extern float player2Y;
extern float player2Z;
extern float player3X;
extern float player3Y;
extern float player3Z;
extern float player4X;
extern float player4Y;
extern float player4Z;

extern long cpu2Speed;
extern long cpu3Speed;
extern long cpu4Speed;

extern char boost1;
extern char boost2;
extern char boost3;
extern char boost4;

extern struct Player g_PlayerStructTable;
extern struct Player g_PlayerStruct1;
extern struct Player g_PlayerStruct2;
extern struct Player g_PlayerStruct3;
extern struct Player g_PlayerStruct4;
extern struct Player g_PlayerStruct5;
extern struct Player g_PlayerStruct6;
extern struct Player g_PlayerStruct7;
extern struct Player g_PlayerStruct8;


extern float g_aspectRatio;
extern float g_farClip;

extern struct Screen g_ScreenStruct;
extern struct Screen g_Screen1;
extern struct Screen g_Screen2;
extern struct Screen g_Screen3;
extern struct Screen g_Screen4;

extern short g_player1ScreenWidth; //0x8015F4AC
extern short g_player1ScreenHeight; //0x8015F4AE
extern short g_player1ScreenX; //0x8015F4B0
extern short g_player1ScreenY; //0x8015F4B2
extern short g_player1View; //0x8015F4B4
extern short g_player1Section; //0x8015F4B8

extern short g_player2ScreenWidth; //0x8015F4AC
extern short g_player2ScreenHeight; //0x8015F4AE
extern short g_player2ScreenX; //0x8015F4B0
extern short g_player2ScreenY; //0x8015F4B2
extern short g_player2View; //0x8015F4B4
extern short g_player2Section; //0x8015F4B8

extern short g_player3ScreenWidth; //0x8015F4EC
extern short g_player3ScreenHeight; //0x8015F4EE
extern short g_player3ScreenX; //0x8015F4F0
extern short g_player3ScreenY; //0x8015F4F2
extern short g_player3View; //0x8015F4F4
extern short g_player3Section; //0x8015F4F8

extern short g_player4ScreenWidth; //0x8015F42C
extern short g_player4ScreenHeight; //0x8015F42E
extern short g_player4ScreenX; //0x8015F430
extern short g_player4ScreenY; //0x8015F432
extern short g_player4View; //0x8015F434
extern short g_player4Section; //0x8015F438

extern float g_TrialTime;
extern float g_lap2Time;
extern float g_lap3Time;

extern struct Object g_SimpleObjectArray[100]; //0x8015F9B8

extern short g_progressValue;

extern long g_CourseObstacle; //0x8016359C

extern long g_playerPosition1;// 801643B8
extern long g_playerPosition2;//, 801643BC
extern long g_playerPosition3;//, 801643C0
extern long g_playerPosition4;//, 801643C4
extern long g_playerPosition5;//, 801643C8
extern long g_playerPosition6;//, 801643CC
extern long g_playerPosition7;//, 801643D0
extern long g_playerPosition8;//, 801643D4

extern float gravity_1;
extern float gravity_2;
extern float gravity_3;
extern float gravity_4;
extern float gravity_5;
extern float gravity_6;
extern float gravity_7;
extern float gravity_8;

extern short surface_p0;

extern long g_GameLapTable[8];    // 0x8  0164390
extern long g_gameLapPlayer1;    // 0x8  0164390
extern long g_gameLapPlayer2;    // 0x8  0164394
extern long g_gameLapPlayer3;    // 0x8  0164398
extern long g_gameLapPlayer4;    // 0x8  016439C
extern long g_gameLapPlayer5;    // 0x8  01643A0
extern long g_gameLapPlayer6;    // 0x8  01643A4
extern long g_gameLapPlayer7;    // 0x8  01643A8
extern long g_gameLapPlayer8;    // 0x8  01643AC

extern struct Camera g_CameraTable; //0x801646F0
extern struct Camera g_Camera1; //0x801646F0
extern struct Camera g_Camera2; //0x801647A8
extern struct Camera g_Camera3; //0x80164860
extern struct Camera g_Camera4; //0x80164918

// extern long g_DynamicObjects; //0x80165C18
extern void KWAnmNext(int num); //0x80086FD4

void KWDisplayEvent(int player);
void KWDisplayEvent_After(int player);
void KWGameEventCommon_VF();
void KWGameEventCommon();

void KWDisplayIceBlock(int player);
void KWDisplayIceBlockShadow(int player);
void KWDisplayBombKartBT(int player);


extern char g_itemBoolean; //0x80165F5F
extern char g_itemA;
extern char g_itemB;
extern char g_itemC;

//extern long g_TimeLapTable; //0x8018CA70          !!! renamed to g_hudStruct !!!
//extern char g_lapCheckA;                          !!! removed inside HUD struct now: finlineAnim2 !!! U use this in MarioKartPractice.c
//extern char g_lapCheckB;                          !!! removed inside HUD struct now: lapCount !!! U use this in MarioKartPractice.c
extern long g_hudStruct; //0x8018CA70              
extern struct Hud g_hudPlayer1;
extern struct Hud g_hudPlayer2;
extern struct Hud g_hudPlayer3;
extern struct Hud g_hudPlayer4;

//hud p1 p2
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
extern float g_hudCharpicRankX1; // 0x8018D027 //float
extern float g_hudCharpicRankX2; // 0x8018D02B
extern float g_hudCharpicRankX3; // 0x8018D02F 
extern float g_hudCharpicRankX4; // 0x8018D033 
extern float g_hudCharpicRankY1; // 0x8018D050 
extern float g_hudCharpicRankY2; // 0x8018D054 
extern char g_hudCharpicRankY3; // 0x8018D058 
extern float g_hudCharpicRankY4; // 0x8018D05C 


extern short asm_DisableEngineSound;
extern short asm_DisableHUD; //0x80059D08
extern short g_GhostHUDID; //0x8018DAAA

extern long g_mlogoY;// 0x8018D9F0
extern long g_mflagID;// 0x8018DA30
extern long g_mpressstartID;// 0x8018DA58
extern long g_mracewayTime;// 0x8018DA80

extern long KBGNumberNext;  //
extern char menuScreenC; //
extern char menuScreenA; //
extern char menuScreenB; //
extern long currentMenu;

extern long titleDemo; //

extern char g_cupSelect; //8018EE09
extern char g_courseSelect; //8018EE0B
extern char g_InGameTT; //0x8018EDFB
extern char g_InGame; //0x8018EDFC

extern short asm_CupCount;
extern short songID; //
extern long asm_SongA;// 0x8028EC9C
extern long asm_SongB;// 0x8028F9C4

extern long g_courseTable;

extern char PlayerOK[];
extern char player1OK; //
extern char player2OK; //
extern char player3OK; //
extern char player4OK; //

extern void textDrawPtr(int *x, int *y, const char *str, int spacing, float xScale, float yScale);
extern void textDraw(int x, int y, const char *str, int spacing, float xScale, float yScale);
extern void DrawText(int x, int y, const char *str, int spacing, float xScale, float yScale);

extern int GetWordLength(const char *str);

extern char g_CharacterSelections[];
extern char g_player1Character;
extern char g_player2Character;
extern char g_player3Character;
extern char g_player4Character;

extern unsigned short g_RNG;

extern char g_menuMultiplayerSelection;

extern char g_placedBadGPadvance;
extern short g_P1TopSpeed;

extern char g_menuUpdateTimer1;
extern char g_menuUpdateTimer2;
extern char g_menuUpdateTimer3;
extern char g_menuUpdateTimer4;

extern char g_menuPreviewValue1;
extern char g_menuPreviewValue2;
extern char g_menuPreviewValue3;
extern char g_menuPreviewValue4;

extern char g_zoomFOVPlayer1;
extern char g_zoomFOVPlayer2;
extern char g_zoomFOVPlayer3;
extern char g_zoomFOVPlayer4;

extern char g_zoomLevelPlayer1;
extern char g_zoomLevelPlayer2;
extern char g_zoomLevelPlayer3;
extern char g_zoomLevelPlayer4;

extern char g_ReplayFlag;
extern float g_screenViewAngle[4];

extern char g_sfxPause;


extern long g_SequenceTable; //0x803B8FB0
extern long g_InstrumentTable; //0x803B90B0
extern long g_RawAudio; //0x803B9260

extern short g_surfaceCheckP1;

extern char g_gamePausedFlag;

extern void MakeBodyColor(void* Car, char Player, int Color, float Speed);
extern void MakeBodyColorAdjust(void* Car, char Player, int Color, float Speed);

extern void RunKart(void* Car, void* Camera, int place, int playerID); // 8002D268
extern void RunKartSimple(void* Car, void* Camera, int place, int playerID); // 8002F35C
extern char g_playerEcho; // 0x800E9F90

extern long g_StarUseCounter[8]; // 8018D930
extern long g_GhostUseCounter[8]; // 8018D950
extern long g_GhostUseTimer[8]; // 8018D970
extern long g_sfxPointer; //  803B7080
extern short g_noSimpleKartFlag[8]; // 801633F8
extern float g_charRadiusTbl[8];

extern long g_StringTableCourseGP[20]; // 800E7524
extern long g_StringTableCourse[20]; // 800E7574

extern struct PlayerTextureTable TBSeq_psel; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_return; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p0; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p1; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p2; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p3; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p4; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p5; //0x800E8340
extern struct PlayerTextureTable TBSeq_psel_p6; //0x800E8340

//menu
extern short menuExtra;

//title
extern short titleBackX;
extern short titleBackY;
extern char titleBackAnim;
extern int titleLogoX; //0x8018D9E0
extern int titleLogoY; //0x8018D9F2
extern int titleCopyToggle; //0x8018D9EC //F1
extern short titleCopyX; 
extern short titleCopyY; 
extern long titleCopyChange; //0x8018DA50 //long F0 darker 04 show message
extern int titlePushToggle; //0x8018DA64
extern short titlePushX; 
extern short titlePushY; 
extern int titlePushBlink; // long/int?

//sky & clouds
extern char g_cloudsToggle; // 0x801657C8 //00 on 01 off
extern short g_skyToggle; // 0x800DC5BC 
extern char g_skyboxToggle; // 0x800DC5B4 
extern short g_daytimeToggle; // 0x800DC518 

extern int g_BombTable;

extern long g_skyColorTopTable;
extern long g_skyColorBotTable;

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

extern long g_SnowParticleTex[50];
extern long *g_MRCloudTexPtr; // Set of four I4 cloud images, 0x400 length each.

extern float g_skySnowScale;
extern float g_skySnowVelocity;
extern long g_skySnowSpawnHeight;
extern long g_skySnowSpawnRadiusDensity;
extern long g_skySnowSpawnCenterOffset;
extern long g_skySnowHitGoal;

extern long g_3DSnowSpawnHeight;
extern long g_3DSnowSpawnDistance;
extern long g_3DSnowSpawnCone;
extern long g_3DSnowSpawnRadius;
extern long g_3DSnowSwayVelocity;
extern long g_3DSnowSwayDistance;
extern float g_3DSnowSwayMovement;
extern float g_3DSnowScale;
extern float g_3DSnowVelocityUpLim;
extern float g_3DSnowVelocityLowLim;

extern void KWChartSnow();
extern void KWChartIceBlock();

//racer values
extern float g_timeLapChange[8];
extern short g_playerPathPointTable[8]; // 80164438
extern short g_PathPointPlayer1; // 80164438
extern short g_PathPointPlayer2;
extern short g_PathPointPlayer3;
extern short g_PathPointPlayer4;
extern short g_PathPointPlayer5;
extern short g_PathPointPlayer6;
extern short g_PathPointPlayer7;
extern short g_PathPointPlayer8;
extern long g_playerPathPointTotalTable[8]; // 80164450
extern short g_playerPathPointCopy[8]; // 80165320
extern short g_rivalOvertakeAllowFlag[10];
extern short g_rankUpdateFinishFlag;

//fog
extern char g_fogToggleBanshee; // 0x800DC5BD
extern char g_fogR;
extern char g_fogG;
extern char g_fogB;

extern long KBGNumber;
extern long KBGChange;

//lightning flags
extern char g_lightningFlag; // 0x800EA168
extern char g_lightningFlagPlayer1; // 0x800E9F24
extern char g_lightningFlagPlayer2; // 0x800E9F25
extern char g_lightningFlagPlayer3; // 0x800E9F26
extern char g_lightningFlagPlayer4; // 0x800E9F27
extern char g_lightningFlagPlayer5; // 0x800E9F28
extern char g_lightningFlagPlayer6; // 0x800E9F29
extern char g_lightningFlagPlayer7; // 0x800E9F2A
extern char g_lightningFlagPlayer8; // 0x800E9F2B

//offroad flags
extern short g_offroadFlagPlayer1; // 0x80165330 
extern short g_offroadFlagPlayer2; // 0x80165332 
extern short g_offroadFlagPlayer3; // 0x80165334 
extern short g_offroadFlagPlayer4; // 0x80165336 

//waterlevel checks
extern float g_waterlevelPlayer[8]; // 0x801652A0

//wrongway flags 
extern short g_wrongwayFlagPlayer1; // 0x80163270 
extern short g_wrongwayFlagPlayer2; // 0x80163272 
extern short g_wrongwayFlagPlayer3; // 0x80163274 
extern short g_wrongwayFlagPlayer4; // 0x80163276 

//player shadow flags
extern char g_ShadowflagPlayer0; //0x800F6B87
extern char g_ShadowflagPlayer1; //0x800F795F
extern char g_ShadowflagPlayer2;
extern char g_ShadowflagPlayer3;

//GP points
extern uchar g_playerGPpoints[8]; //name to num: Mario, Luigi, Yoshi, Toad, D.K., Wario, Peach, Bowser

//multiplayer points
extern uchar g_2PRacePoints[2];
extern uchar g_3PRacePoints[3];
extern uchar g_4PRacePoints[4];
extern uchar g_2PBattlePoints[2];
extern uchar g_3PBattlePoints[3];
extern uchar g_4PBattlePoints[4];

//course
extern float g_mirrorValue;
extern Vector g_goalBannerPos;
extern short g_mooSoundCounter;
extern short g_mooSoundPointer;
extern float g_mooSoundLastDistance;
extern Vector g_mooSoundPosition; 
extern Vector g_crowdSoundPos1;
extern Vector g_crowdSoundPos2;
extern Vector g_crowdSoundPos3;
extern Vector g_crowdSoundPos4;
extern Vector g_waterfallSoundPos;
extern float g_waterHeight;
extern float g_waterVelocity;
extern short g_monitorCounter;
extern short g_simpleObjectCount;
extern short g_simpleObjectScreenCount;
extern ushort g_courseTotalPathPoints[4];
extern struct CenterPathStruct *g_pathPointPointer;

//player color timers
extern struct Playercolor g_colorPlayer0R;
extern struct Playercolor g_colorPlayer1R;
extern struct Playercolor g_colorPlayer2R;
extern struct Playercolor g_colorPlayer3R;
extern struct Playercolor g_colorPlayer4R;
extern struct Playercolor g_colorPlayer5R;
extern struct Playercolor g_colorPlayer6R;
extern struct Playercolor g_colorPlayer7R;

//sound and music
extern void playSound(int soundID);
extern void NAMusicVolume(unsigned char volume); //0-Mute 75-Half 127 Full
extern void NAPlyTrgStart(char playerID, int soundID);
extern void NAPlyVoiceStart(char playerID, int soundID);
extern void NAEnmTrgStart(Vector ObjectPosition, Vector ObjectVelocity, int soundID);
extern void NAEnmTrgStop(Vector ObjectPosition, int soundID);
extern void playMusic(int musicID);
extern void playMusic2(int musicID);
extern void NaPlyLevelStart(char playerID, int soundID); 
extern void NaPlyLevelStop(char playerID, int soundID); 
extern void NaSceneLevelStart(Vector ObjectPosition, Vector ObjectVelocity, int soundID);
extern void NaSceneLevelStop(Vector ObjectPosition, int soundID);

extern short g_musicUserVolumeFlag; // 0x800DC5A8 //char 00=full; // 01=half; // 02=off  04=disable L button
extern short g_musicIDRaceways; // 0x8028ECE6 
extern short g_musicIDToad; // 0x8028ECF6
extern short g_musicIDCountry; // 0x8028ED06
extern short g_musicIDBattle1; // 0x8028ED16
extern short g_musicIDKalamari; // 0x8028ED26
extern short g_musicIDKoopa; // 0x8028ED36
extern short g_musicIDBowser; // 0x8028ED46
extern short g_musicIDBanshee; // 0x8028ED56
extern short g_musicIDSnowy; // 0x8028ED66
extern short g_musicIDRainbow; // 0x8028ED76
extern short g_musicIDDK; // 0x8028ED86
extern short g_musicIDBattle2; // 0x8028ED96
extern ushort g_musicTempo;
extern ushort g_fanfareTempo;
extern SeqPlayerStruct SeqPlayer[4];

extern void NAISeqFlagEntry(uint entry);
extern ushort NAIGetPlayingSeqFlag(uchar seq);
extern void NAIFxFlagEntry(uint A, float B[3], uchar C, float *D, float *E, char *F);

//Cave Fire Particle Stuff
extern SVector CaveFirePos[8];
extern void KWGetCaveFire(int objnum);
extern int CaveFireColCheck;
extern void KWSet2Color(uint prim_r,uint prim_g,uint prim_b,uint env_r,uint env_g,uint env_b,uint a);
extern void KWDisplayFireParticleSub(int num,uchar color,void* Camera);
extern int FireParticleAllocArray[64];
extern int FireParticleCounter;

extern int EffectAllocArray1[128];
extern int EffectAllocArray2[128];
extern int EffectAllocArray3[128];
extern void KWGetStar(Vector position,int type);
extern void KWChartStar(void);
extern void KWDisplayStar(int player);

extern ushort RGBAFallingLeaf[];
extern ushort RGBAQuestionMark[];
extern ushort RGBALeaf[];
extern int FallingRockGFX_U; //default 0x3C0F0600
extern int FallingRockGFX_L; //default 0x25EF6FE0
extern int FallingRockShadowGFX_U; //default 0x3C0C0600
extern int FallingRockShadowGFX_L; //default 0x258C6F88
extern int ShadowModel;
extern int HoleModel;
extern int ItemBoxModel;
extern void MoveFallingRock(Object *obj);