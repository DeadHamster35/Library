#ifndef MarioKart3DH
#define MarioKart3DH
#include "MainInclude.h"
extern void DrawGeometryScale(float objectPosition[], short objectAngle[], int F3DEXAddress, float Scale);
extern void DrawGeometry(float objectPosition[], short objectAngle[], int F3DEXAddress);

extern void DrawPaths(long pathOffset);
#endif