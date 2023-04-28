#ifndef CustomSurfaceH
#define CustomSurfaceH
#include "../MainInclude.h"
//extern void GetSurfaceID();

extern void LavaFloorRecoil();
extern void InteractLavaFloor(Bump* bump, ushort pointer);
extern float absFloat(float value);
extern int LavaFloorBumpCount[8];
extern bool LavaFloorRecoiling[8];
#endif