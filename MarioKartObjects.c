#include "MainInclude.h"


unsigned short CheckBump2Simple(Object *InputObject)
{
	return CheckBump2((Bump*)&InputObject->bump, InputObject->radius, InputObject->position[0], InputObject->position[1], InputObject->position[2], InputObject->position[0] - InputObject->velocity[0], InputObject->position[1] - InputObject->velocity[1], InputObject->position[2] - InputObject->velocity[2] );
}

short MasterCreateObject(float localPosition[], short localRotation[], float localVelocity[], short localID, float radius)
{
	GlobalShortA = addObjectBuffer(localPosition,localRotation,objectVelocity,localID);
	
	GlobalAddressA = (long)(&g_SimpleObjectArray) + (GlobalShortA * 0x70);

	GlobalObjectA = (Object*)(GlobalAddressA);
	GlobalObjectA->flag = 0xC000;
	GlobalObjectA->radius = radius;
	
	return GlobalShortA;
}




short CreateObjectRotation(float localPosition[], short localRotation[], short localID)
{
	objectVelocity[0] = 0;
	objectVelocity[1] = 0;
	objectVelocity[2] = 0;

	GlobalShortA = MasterCreateObject(localPosition,localRotation,objectVelocity,localID, 5);
	
	return GlobalShortA;
}

short CreateObjectRadius(float localPosition[], short localRotation[], short localID, float localRadius)
{
	objectVelocity[0] = 0;
	objectVelocity[1] = 0;
	objectVelocity[2] = 0;
	GlobalShortA = MasterCreateObject(localPosition,localRotation,objectVelocity,localID, localRadius);
	
	return GlobalShortA;
}

short CreateObject(float localPosition[], short localID)
{
	objectAngle[0] = 0;
	objectAngle[1] = 0;
	objectAngle[2] = 0;

	objectVelocity[0] = 0;
	objectVelocity[1] = 0;
	objectVelocity[2] = 0;

	return MasterCreateObject(localPosition,objectAngle,objectVelocity,localID, 5);
}

short CreateObjectSimple(int XPosition, int YPosition, int ZPosition, int localRotation, int localID)
{
	
	objectPosition[0] = (float)XPosition;
	objectPosition[1] = (float)YPosition;
	objectPosition[2] = (float)ZPosition;
	objectAngle[0] = 0;
	objectAngle[1] = (short)localRotation;
	objectAngle[2] = 0;
	objectVelocity[0] = 0;
	objectVelocity[1] = 0;
	objectVelocity[2] = 0;

	return MasterCreateObject(objectPosition,objectAngle,objectVelocity,localID, 5);
}

void UpdateObjectVelocity(Object* InputObject)
{
	InputObject->position[0] += InputObject->velocity[0];
	InputObject->position[1] += InputObject->velocity[1];
	InputObject->position[2] += InputObject->velocity[2];
}
void UpdateObjectAngle(Object* InputObject, short InputAngle[])
{
	InputObject->angle[0] += InputAngle[0];
	InputObject->angle[1] += InputAngle[1];
	InputObject->angle[2] += InputAngle[2];
}



void UpdateObjectGravity(Object* InputObject)
{
	InputObject->velocity[1] -= 0.5;
	/*
	if (InputObject->velocity[1] > -2)
	{
		InputObject->velocity[1] -= 0.5;
	}
	else
	{
		InputObject->velocity[1] = -2;
	}
	*/
}

void UpdateObjectBump(Object* InputObject)
{
	CheckBump2Simple(InputObject);
	BumpObject(InputObject);
}
	
void UpdateObjectFriction(Object* InputObject, float Friction)
{
	InputObject->velocity[0] -= Friction;
	InputObject->velocity[1] -= Friction;
	InputObject->velocity[2] -= Friction;
}

void UpdateObjectFrictionScale(Object* InputObject, float FrictionScale)
{
	InputObject->velocity[0] *= (1.0 - (FrictionScale / 30));
	InputObject->velocity[1] *= (1.0 - (FrictionScale / 30));
	InputObject->velocity[2] *= (1.0 - (FrictionScale / 30));
}

