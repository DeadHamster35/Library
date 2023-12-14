#ifndef CustomSurfaceH
#define CustomSurfaceH
#include "../MainInclude.h"
//extern void GetSurfaceID();

extern void LavaFloorRecoil();
extern void InteractLavaFloor(Bump* bump, ushort pointer);
extern float absFloat(float value);
extern int LavaFloorBumpCount[8];
extern bool LavaFloorRecoiling[8];
void CheckDirectionFunc(int Null, Screen *display);
void ExplorerSetJugemu(Player* Target);
void ExplorerCallJugemu(Player* Target);
void ExplorerHangJugemu(Player* Target, char Index);
extern void custom_SpinKart(Player* Car, Camera* camera, char place, char kno);
extern void custom_RunKart(Player* car, Camera* camera, char place, char kno);



extern int LavaFloorBumpCount[];
extern bool LavaFloorRecoilRequired[];
extern bool LavaFloorRecoiling[];
#endif