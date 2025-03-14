#ifndef MarioKartObjectsH
#define MarioKartObjectsH
#include "MainInclude.h"

extern short MasterCreateObject(float localPosition[], short localRotation[], float localVelocity[], short localID, float radius);
extern short CreateObjectRadius(float localPosition[], short localRotation[], short localID, float radius);
extern short CreateObjectRotation(float localPosition[], short localRotation[], short objectID);
extern short CreateObject(float localPosition[], short objectID);
extern short CreateObjectSimple(int XPosition, int YPosition, int ZPosition, int Rotation, int objectID);
extern void UpdateObjectVelocity(Object* InputObject);
extern void UpdateObjectAngle(Object* InputObject, short InputAngle[]);
extern void UpdateObjectGravity(Object* InputObject);
extern void ManualBump(Bump* BumpData, Vector Position );
extern void ManualBounce(Vector BumpDistance, Vector Velocity);
extern void UpdateObjectBump(Object* InputObject);
extern void UpdateObjectFriction(Object* InputObject, float Friction);
extern void UpdateObjectFrictionScale(Object* InputObject, float FrictionScale);
extern void ItemboxCollideCheckDefault(Player* Car, Object* Target);
extern unsigned short CheckBump2Simple2(uint BumpAddress, float Radius, Vector InputPosition);
extern unsigned short CheckBump2Simple(Object *InputObject);
#endif