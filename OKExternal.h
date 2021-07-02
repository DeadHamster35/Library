//for OverKart's BUILD.ASM

void KWDisplayEvent(int player);
void KWDisplayEvent_After(int player);
void KWGameEventCommon_VF();
void KWGameEventCommon();

void KWDisplayIceBlock(int player);
void KWDisplayIceBlockShadow(int player);
void KWDisplayBombKartBT(int player);

extern void KWChartIceBlock();


extern long StartRAMData;
extern long EndRAMData;
extern long ModelDataStart;
extern long bannerN;
extern long bannerU;
extern long previewN;
extern long previewU;
extern long set0;
extern long set1;
extern long set2;
extern long set3;
extern long set4;
extern long set0end;
extern long set1end;
extern long set2end;
extern long set3end;
extern long set4end;
extern long IceModel;

extern long LogoROM;
extern long RCSpriteROM;
extern long ArrowsSpriteROM;
extern long NumbersSpriteROM;
extern long AlpacaSpriteROM;
extern long HeartSpriteROM;
extern long TitleMenuFrameROM;

extern long NiceFontROM;
extern long HudButtonsROM;

extern long TestTexture;

extern long JP_Audio;
extern long JP_Bank;

extern long itemChanceHi;
extern long itemChanceLo;
