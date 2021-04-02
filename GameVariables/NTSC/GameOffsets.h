
#include "../../Struct.h"





extern long SYSTEM_Region;


extern void InitMKCode();



extern long spriteKillA;
extern long spriteKillC;
extern short spriteKillB;
extern short spriteKillD;



extern void decodeMIO0(long input, long output);
extern void DMA(int output, int input, long Length);
extern void decodeTKMK(int input, long *temp, int output, int transparent);

extern void GetFramebuffer(int PixelX,int PixelY,int Width,int Height,unsigned short *Source,unsigned short *Destination);


extern void loadCourse(int courseID);
extern void ScrollMapImage(int ObjectAddress,int ScrollS,int ScrollT);
extern void MakeWaterVertex(int ObjectAddress, char alpha, char red, char green, char blue);
extern void ramCopy(long output, long input, long Length);


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

extern short deleteObjectBuffer(void *Object);
extern short addObjectBuffer(float position[], short angle[], float velocity[], short objectID);


//float radius,float hight,float param
extern int CollisionCylinder(void *Car, float Position[], float Radius, float Height, float Parameter); //0x8029EEB8
extern int CollisionSphere(void *Car, void *Object); //0x8029FB80


extern void RouletteStart(int Player, int SpecialItem);

extern void RouletteStart(int Player, int SpecialItem); //0x8007ABFC


extern void *SegmentToVirtual(void *RSPAddress);

extern void printNumber(int *xPosition, int *yPosition, int num, int base);
extern void printString(int xPosition, int yPosition, char *printText);
extern void printStringNumber(int xPosition, int yPosition, char *printText, int printValue);
extern unsigned long* drawBox(unsigned long *buf, int x1, int y1, int x2, int y2, int r, int g, int b, int a);

extern long SegmentTable[];

extern void *g_CfbPtrs[3];

extern long SetStar(void *CarPointer, int PlayerIndex);
extern void ResetStar (void *CarPointer, char PlayerIndex);
extern long SetWing(void *CarPointer, int PlayerIndex);
extern long SetStorm(void *CarPointer, int PlayerIndex);
extern long SetThunder(void *CarPointer, int PlayerIndex);
extern void VSGhost(void *Car,char PlayerID);
extern void SetVSGhost(void *Car,char PlayerID);
extern void ResetVSGhost(void *Car,char PlayerID);
extern void SetFastOoB(void *Car,char PlayerID);


extern unsigned long* GraphPtr;
extern long GraphPtrOffset;
extern void KWSprite(int cx,int cy,int sizex,int sizey,short *addr);
extern void KWSpriteScale(int cx,int cy,float scale, short *addr, int sizex,int sizey);

extern int SetMatrix(float Matrix[][4], int Mode);
extern void CreateModelingMatrix(float Matrix[][4], float Position[], short Angle[]);
extern void ScalingMatrix(float Matrix[][4], float scale);

extern float sinT(short inputAngle);
extern float cosT(short inputAngle);
extern float sinF(float inputAngle);
extern float cosF(float inputAngle);

extern void SetSegment(int number, int cpuAddr);

extern void initializePlayer(int playerStructure, int characterID, float deltaX, float deltaZ, int characterID2, int unknown0xB000);

extern long asm_itemJump1A;// 0x8007B084  //3C058016
extern long asm_itemJump1B;// 0x8007B098  //84A543BA

extern long asm_itemJump2A;// 0x8007AFC0  //3C058016
extern long asm_itemJump2B;// 0x8007AFD4  //84A543BA

extern void playSound(int soundID);
extern void NAPlyTrgStart(char playerID, int soundID);
extern void NAPlyVoiceStart(char playerID, int soundID);
extern void NAEnmTrgStart(float ObjectPosition[], float ObjectVelocity[], int soundID);

extern void colorFont(int color);
extern void loadFont();

extern long g_SegmentA;
//
//


extern long g_resetToggle; //
extern long g_startingIndicator;
extern short g_DebugSection;
extern short g_DebugMode;
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


extern short g_mirrorMode;
extern short g_DebugBars;

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

extern long g_PlayerStateTable;
extern char g_player1State; //
extern char g_player2State; //
extern char g_player3State; //
extern char g_player4State; //
extern char g_player5State; //
extern char g_player6State; //
extern char g_player7State; //

extern float g_aspectRatio;
extern float g_farClip;

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

extern long g_SimpleObjectArray; //0x8015F9B8

extern float g_waterHeight;

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

extern long g_GameLapTable;    // 0x8  0164390
extern long g_gameLapPlayer1;    // 0x8  0164390
extern long g_gameLapPlayer2;    // 0x8  0164394
extern long g_gameLapPlayer3;    // 0x8  0164398
extern long g_gameLapPlayer4;    // 0x8  016439C
extern long g_gameLapPlayer5;    // 0x8  01643A0
extern long g_gameLapPlayer6;    // 0x8  01643A4
extern long g_gameLapPlayer7;    // 0x8  01643A8
extern long g_gameLapPlayer8;    // 0x8  01643AC

extern long g_CameraTable; //0x801646F0
extern long g_DynamicObjects; //0x80165C18


extern char g_itemBoolean; //0x80165F5F
extern char g_itemA;
extern char g_itemB;
extern char g_itemC;

extern long g_TimeLapTable; //0x8018CA70

extern char g_lapCheckA; //
extern char g_lapCheckB; //

extern short asm_DisableEngineSound;
extern short asm_DisableHUD; //0x80059D08
extern short g_GhostHUDID; //0x8018DAAA

extern long g_mlogoY;// 0x8018D9F0
extern long g_mflagID;// 0x8018DA30
extern long g_mpressstartID;// 0x8018DA58
extern long g_mracewayTime;// 0x8018DA80

extern long backButton;  //
extern char menuScreenC; //
extern char menuScreenA; //
extern char menuScreenB; //
extern long currentMenu;

extern long titleDemo; //

extern char g_cupSelect; //8018EE09
extern char g_courseSelect; //8018EE0B
extern char g_InGame; //0x8018EDFC

extern short asm_CupCount;
extern short songID; //
extern long asm_SongA;// 0x8028EC9C
extern long asm_SongB;// 0x8028F9C4

extern long g_skyColorTop;
extern long g_skyColorBot;
extern long g_courseTable;


extern char player2OK; //
extern char player3OK; //
extern char player4OK; //

extern void textSetColor(int col);
extern void textDrawPtr(int *x, int *y, const char *str, int spacing, float xScale, float yScale);
extern void textDraw(int x, int y, const char *str, int spacing, float xScale, float yScale);
extern void DrawText(int x, int y, const char *str, int spacing, float xScale, float yScale);
extern void PrintText0(int x, int y, const char *str, int spacing, float xScale, float yScale);
extern void PrintText1(int x, int y, const char *str, int spacing, float xScale, float yScale);

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

extern char g_sfxPause;



extern long g_SequenceTable; //0x803B8FB0
extern long g_InstrumentTable; //0x803B90B0
extern long g_RawAudio; //0x803B9260

extern short g_surfaceCheckP1;

extern char g_gamePausedFlag;

extern void MakeBodyColor(void* Car, char Player, int Color, float Speed);
extern void MakeBodyColorAdjust(void* Car, char Player, int Color, float Speed);

extern short g_playerPathPointTable; // 80164438
extern long g_playerPathPointTotalTable; // 80164450

extern void SetEnemyProcessOffscreen(void* Car, void* Camera, int place, int playerID);
extern char g_playerEcho;

extern long g_ItemUseCounter;

