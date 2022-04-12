#ifndef OKGameTypeH
#define OKGameTypeH
extern void PlaceFlags();
extern void CaptureFlag();
extern void DropFlag(int PlayerIndex);
extern void DrawGameFlags();


extern char      FlagCount, TeamMode;
extern char      ScoreToWin, ObjectiveCount;
extern short     SpawnTime, HitstunTime;
extern short     TeamScore[2];
#endif