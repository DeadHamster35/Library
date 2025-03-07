#ifndef PlayerCheckH
#define PlayerCheckH
extern void SetLapIndex();
extern void CheckPaths();
extern void SetWaterType(char WaterType);
extern void NopSplashCheckCode();
extern void EffectBGMReplace();
extern void NopPlayEffectBGMCode();
extern void SetBalloonColor(int PlayerIndex, int R, int G, int B, int AdjR, int AdjG, int AdjB);
extern void SetBalloonTeams();
extern void CheckJugemuMarker();
#endif