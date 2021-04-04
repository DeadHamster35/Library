#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "OKHeader.h"
#include "GameVariables/NTSC/OKassembly.h"
#include "SharedFunctions.h"
#include "LibraryVariables.h"
#include "Struct.h"





void CreateObjectRotation(float localPosition[], short localRotation[], short localID)
{
	GlobalShortA = addObjectBuffer(localPosition,localRotation,objectVelocity,localID);
	GlobalAddressA = (long)(&g_SimpleObjectArray);
	*(short*)(GlobalAddressA + (0x70 * GlobalShortA) + 2) = 0xC000;
}

void CreateObjectRadius(float localPosition[], short localRotation[], short localID, float radius)
{
	CreateObjectRotation(localPosition,localRotation,localID);
	*(float*)(GlobalAddressA + (0x70 * GlobalShortA) + 12) = radius;
}

void CreateObject(float localPosition[], short localID, float radius)
{
	CreateObjectRadius(localPosition, objectAngle, localID, radius);
}

void CreateObjectSimple(int XPosition, int YPosition, int ZPosition, int localRotation, int localID)
{
	
	objectPosition[0] = (float)XPosition;
	objectPosition[1] = (float)YPosition;
	objectPosition[2] = (float)ZPosition;;
	objectAngle[0] = (short)localRotation;
	CreateObjectRotation(objectPosition, objectAngle, (short)localID);
}

void UpdateObjectVelocity(void* InputObject)
{
	GlobalObjectA = (Object*)&InputObject;
	
	GlobalObjectA->position[0] += GlobalObjectA->velocity[0];
	GlobalObjectA->position[1] += GlobalObjectA->velocity[1];
	GlobalObjectA->position[2] += GlobalObjectA->velocity[2];
}
