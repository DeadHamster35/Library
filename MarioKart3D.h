#ifndef MarioKart3DH
#define MarioKart3DH
#include "MainInclude.h"


extern Vtx V64x32[];
extern Vtx V64[];
extern Vtx V1632[];
extern Vtx V6432B[];
extern Vtx V6432BMirror[];
extern Vtx V12832B[];
extern Vtx V128[];
extern Vtx V256x32[];
extern Vtx V128Mirror[];
extern Vtx V256[];
extern Vtx V25632B[];
extern Vtx V256x12832B[];
extern Vtx V512x24032B[];
extern Vtx V352x24032B[];
extern Vtx tree1_v[];

extern void WaveRace(Vtx_t *VertexBuffer, int Count, float Intensity);
extern short WaveTime, WaveDirection;


extern void DrawStereoscopic3D(short FocusValue);
extern void ScaleMatrixXYZFixed(AffineMtx Matrix, SVector Vector);
extern void ScaleMatrixXYZ(AffineMtx Matrix, Vector Vector);
extern void DrawGeometryScale(float objectPosition[], short objectAngle[], int F3DEXAddress, float Scale);
extern void DrawGeometrySVectorScale(SVector objectPosition, short objectAngle[], int F3DEXAddress, float Scale);
extern void DrawGeometry(float objectPosition[], short objectAngle[], int F3DEXAddress);

extern void DrawPaths(long pathOffset);
#endif