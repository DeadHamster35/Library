#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "OKHeader.h"
#include "GameVariables/NTSC/OKassembly.h"
#include "SharedFunctions.h"
#include "LibraryVariables.h"
#include "Struct.h"


unsigned short CheckBump2Simple(Object *InputObject)
{
	return CheckBump2((Bump*)&InputObject->bump, InputObject->radius, InputObject->position[0], InputObject->position[1], InputObject->position[2], InputObject->position[0] - InputObject->velocity[0], InputObject->position[1] - InputObject->velocity[1], InputObject->position[2] - InputObject->velocity[2] );
}


short CreateObjectRotation(float localPosition[], short localRotation[], short localID)
{
	GlobalShortA = addObjectBuffer(localPosition,localRotation,objectVelocity,localID);
	GlobalAddressA = (long)(&g_SimpleObjectArray);
	*(short*)(GlobalAddressA + (0x70 * GlobalShortA) + 2) = 0xC000;
	return GlobalShortA;
}

short CreateObjectRadius(float localPosition[], short localRotation[], short localID, float radius)
{
	GlobalShortA = CreateObjectRotation(localPosition,localRotation,localID);	
	*(float*)(GlobalAddressA + (0x70 * GlobalShortA) + 12) = radius;
	return GlobalShortA;
}

short CreateObject(float localPosition[], short localID, float radius)
{
	return CreateObjectRadius(localPosition, objectAngle, localID, radius);
}

short CreateObjectSimple(int XPosition, int YPosition, int ZPosition, int localRotation, int localID)
{
	
	objectPosition[0] = (float)XPosition;
	objectPosition[1] = (float)YPosition;
	objectPosition[2] = (float)ZPosition;;
	objectAngle[0] = (short)localRotation;
	return CreateObjectRotation(objectPosition, objectAngle, (short)localID);
}

void UpdateObjectVelocity(void* InputObject)
{
	GlobalObjectA = (Object*)&InputObject;
	GlobalObjectA->position[0] += GlobalObjectA->velocity[0];
	GlobalObjectA->position[1] += GlobalObjectA->velocity[1];
	GlobalObjectA->position[2] += GlobalObjectA->velocity[2];
}



void UpdateObjectGravity(void* InputObject)
{
	if (GlobalObjectA->velocity[1] > -2)
	{
		GlobalObjectA->velocity[1] -= 0.5;
	}
	else
	{
		GlobalObjectA->velocity[1] = -2;
	}
}

	
	
