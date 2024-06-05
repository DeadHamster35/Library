#ifndef CustomLebelsH
#define CustomLevelsH
#include "../MainInclude.h"

extern char ScaleXMode, ScaleYMode, ScaleZMode, ScalePad;
extern short ZFLIP;
extern short YFLIP;
extern void FPS_Check();
extern void DynamicTempo();
extern void StaticTempo(int Tempo);
extern void stockASM();
extern void overkartASM();
extern void runTextureScroll();
extern void runWaterVertex();

extern void DecodeSP1Triangle_OK(Gfx *gfx,unsigned char *pp,char code );
extern void DecodeSP2Triangle_OK(Gfx *gfx,unsigned char *pp,char code );
extern void DecodeSP1Quadrangle_OK(Gfx *gfx,unsigned char *pp,char code );
extern void DecodeVertex2_OK(char *ramaddress, uint number);

extern void CheckFinishFix();
extern void runDisplayScreen();
extern void runKillDisplayObjects();
extern void loadTextureScrollTranslucent();
extern void copyCourseTable();
extern void hsTableSet();
extern void stockTableSet();
extern void setSong();
extern void setPath();
extern void setEcho();
extern void setSky();
extern void setWater();
extern void loadHeaderOffsets();
extern void LoadCustomHeader(int inputID);
extern void SetCustomData();
extern void loadMinimap();
extern void loadOKObjects();
extern void setOKObjects();
extern void SetGhostData();
extern void setBanners();
extern void setPreviews();
extern void swapHS();
extern void previewRefresh();
extern void SetCourseNames(bool custom);
extern void initFireParticles(long PathOffset);
extern void DisplayFireParticleSub(int num,uchar color,void* Camera);
extern void SetWeatherType(char WeatherType);
extern void SetCloudType(char CloudType);
extern void SetWeather3D(bool Weather3DEnable);
extern void Snow3DCameralook(int num, void* Camera);
extern void EventDisplay(int player);
extern void EventDisplay_After(int player);
extern void CommonGameEventChart();
extern void EmptyActionData(); 
extern short RadarLineX, RadarLineY;
#endif