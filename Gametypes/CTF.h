#include "..\MainInclude.h"
#ifndef OKCTFH
#define OKCTFH
extern void DrawGameFlags(Camera* LocalCamera);
extern void DrawGameBase(Camera* LocalCamera);
extern void PlaceFlags();
extern void CaptureFlag();
extern void DropFlag(int PlayerIndex);
#endif