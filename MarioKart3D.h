#ifndef MarioKart3DH
#define MarioKart3DH
#include "MainInclude.h"



extern Vtx_t V64[];
extern Vtx_t V6432B[];
extern Vtx_t V6432BMirror[];
extern Vtx_t V12832B[];
extern Vtx_t V128[];
extern Vtx_t V256x32[];
extern Vtx_t V128Mirror[];
extern Vtx_t V256[];
extern Vtx_t V25632B[];
extern Vtx_t V256x12832B[];
extern Vtx_t V512x24032B[];
extern Vtx_t V352x24032B[];

extern void ScaleMatrixXYZFixed(AffineMtx Matrix, SVector Vector);
extern void ScaleMatrixXYZ(AffineMtx Matrix, Vector Vector);
extern void DrawGeometryScale(float objectPosition[], short objectAngle[], int F3DEXAddress, float Scale);
extern void DrawGeometry(float objectPosition[], short objectAngle[], int F3DEXAddress);

extern void DrawPaths(long pathOffset);
#endif