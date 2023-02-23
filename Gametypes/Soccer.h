#include "../MainInclude.h"
#ifndef OKSoccerH
#define OKSoccerH
extern void PlaceBalls(uint BattleFlagF3D, uint BattleBaseF3D, uint PlayerBaseF3D[], uint Difficulty);
extern void CaptureBalls();
extern void DropBalls(int PlayerIndex);
extern void ShootBall(int PlayerIndex);
#endif