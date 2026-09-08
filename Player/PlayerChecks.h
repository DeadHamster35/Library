#ifndef PlayerCheckH
#define PlayerCheckH
extern short GetCourseLapMax();
extern short GetCourseLapIndex(int player);
extern Vector SprintStartBanner;
extern bool SprintFinishArmed;
extern void SetSprintFinish();
extern void WrapPathIndexAtFinishCheck(float posX, float posY, float posZ, short *wayPointIndex, int pathIndex);
extern void SprintLapCheck(int playerID, Player *car);
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