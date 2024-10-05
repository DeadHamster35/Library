#ifndef CustomSurfaceH
#define CustomSurfaceH
#include "../MainInclude.h"
//extern void GetSurfaceID();

extern void LavaFloorRecoil();
extern void InteractLavaFloor(Bump* bump, ushort pointer, int FlagAxis);
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


#define TRICK_GRAVITY				4000.0f
#define TRICK_TRIGGER_SPEED_MIN		30

#define GAP_GRAVITY				2000.0f

#define IS_BROKEN (IS_SPINNING_OUT|SPINOUT_LEFT|SPINOUT_RIGHT|IS_MOMENTUM_HIT|IS_VERTICAL_HIT|IS_TUMBLING|IS_WALL_TUMBLING)



#define NOTHING 		0
#define ASPHALT 		1
#define DIRT			2
#define SAND			3
#define STONE			4
#define SNOW                    5
#define WOOD			6
#define SAND_TRAP		7
#define GRASS			8
#define ICE  			9
#define WET_SAND		10
#define WET_SNOW                11
#define ROCK                    12
#define DIRT_TRAP               13
#define RAILWAY                 14
#define CAVE                    15
#define BRIDGE                  16   //rickety
#define KIBASHI                 17




#define DASHMARK2		252	    //for JUNGLE
#define JUMPMARK		253	    //for JUNGLE
#define DASHMARK		254	    //for PEACH CIRCUIT
#define OTHER 			255



#define FastOoB			251
#define Water			250
#define MushroomBoost	249
#define FeatherJump		248
#define TornadoJump		247
#define SpinOutSaveable	246
#define SpinOut			245
#define FailedStart		244
#define GreenShellHit	243
#define RedShellHit		242
#define ObjectHit		241
#define Shrunken		240
#define StarMan			239
#define BooSurface    	238
#define GetItem			237
#define TrickJump		236
#define GapJump			235
#define LavaSurface		234
#define ForceJump		233

#define Mud				18

#define STORE_NONE 	0
#define STORE_TRICK 1
#define	STORE_GAP	2




#endif