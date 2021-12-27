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

	GlobalShortA = MasterCreateObject(localPosition,localRotation,objectVelocity,localID, 5.0);
	
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

	return MasterCreateObject(localPosition,objectAngle,objectVelocity,localID, 5.0);
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

	return MasterCreateObject(objectPosition,objectAngle,objectVelocity,localID, 5.0);
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


void ManualBump(Bump* BumpData, Vector Position )
{
     float dist;
     dist = BumpData->distance_zx;
     if ((BumpData->distance_zx < 0) && (BumpData->flag_zx == TRUE))     
     {
          Position[0] -= BumpData->bump_zx[0] * dist;
          Position[1] -= BumpData->bump_zx[1] * dist;
          Position[2] -= BumpData->bump_zx[2] * dist;
     }
     
     dist = BumpData->distance_xy;
     if ((BumpData->distance_xy < 0) && (BumpData->flag_xy == TRUE))
     {
          Position[0] -= BumpData->bump_xy[0] * dist;
          Position[1] -= BumpData->bump_xy[1] * dist;
          Position[2] -= BumpData->bump_xy[2] * dist;
     }
     
     dist = BumpData->distance_yz;
     if ((BumpData->distance_yz < 0) && (BumpData->flag_yz == TRUE))
     {
          Position[0] -= BumpData->bump_yz[0] * dist;
          Position[1] -= BumpData->bump_yz[1] * dist;
          Position[2] -= BumpData->bump_yz[2] * dist;
     }
}
void ManualBounce(Vector BumpDistance, Vector Velocity)
{
     float fx, fy, fz;
     float vx, vy, vz;
     float m, LocalVelo, vv, LocalVelo2;

     vx = Velocity[0];
     vy = Velocity[1];
     vz = Velocity[2];
     LocalVelo = sqrtf(vx * vx + vy * vy + vz * vz);

     m = BumpDistance[0] * vx + BumpDistance[1] * vy + BumpDistance[2] * vz;
     fx = vx - m * BumpDistance[0];
     fy = vy - m * BumpDistance[1];
     fz = vz - m * BumpDistance[2];
     vx = fx - m * BumpDistance[0];
     vy = fy - m * BumpDistance[1];
     vz = fz - m * BumpDistance[2];

     LocalVelo2 = sqrtf(vx * vx + vy * vy + vz * vz);
     vv = 1 / LocalVelo2 * LocalVelo;
     Velocity[0] = vx * vv;
     Velocity[1] = vy * vv;
     Velocity[2] = vz * vv;
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

