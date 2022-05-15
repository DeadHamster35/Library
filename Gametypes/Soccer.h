#include "..\MainInclude.h"
#ifndef OKSoccerH
#define OKSoccerH
extern void PlaceBalls();
extern void CaptureBalls();
extern void DropBalls(int PlayerIndex);
extern void ShootBall(int PlayerIndex);
extern void DrawGameBalls(Camera* LocalCamera);
#endif