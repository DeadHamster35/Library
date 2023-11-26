#include "../MainInclude.h"

#define SPAWN_POINT      0
#define FLAG_POINT       1
#define BASE_POINT       2

extern int ObjectiveMapID;
extern void ResetFlag(int ThisFlag);
extern void DrawGameFlags(Camera* LocalCamera);
extern void DrawGameBase(Camera* LocalCamera);
extern void PlacePlayerSpawn(SVector Position, int PlayerID);
extern void PlaceFlagSpawn(SVector Position, int PlayerID);
extern void PlaceBaseSpawn(SVector Position, int PlayerID);
extern void DropFlag(int PlayerIndex);

extern bool CheckExecuteItem(int PlayerIndex);