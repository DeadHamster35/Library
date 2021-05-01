#include "SubProgram.h"
#include "SharedFunctions.h"
#include "OKHeader.h"
#include "OKExternal.h"
#include "LibraryVariables.h"
#include "PlayerEffects.h"
#include "MarioKartObjects.h"
#include "MarioKart3D.h"
#include "Struct.h"
#include "OKStruct.h"
#include "OKBehaviors.h"
#include "GameVariables/NTSC/OKassembly.h"
#include "GameVariables/NTSC/GameOffsets.h"



/*
81020000 03E0
81020002 0008
81020004 2400
81021244 03E0
81021246 0008
81021248 2400*/




void Draw3DRacer()
{
	/*
	if (renderMode[2] == 0)
	{
		spriteKillA = 0x27BDFFA0;
		spriteKillB = 0xAFBF;
		spriteKillC = 0x27BDFFE8;
		spriteKillD = 0xAFBF;
	}
	else
	{
		
		spriteKillA = 0x03E00008;
		spriteKillB = 0x2400;
		spriteKillC = 0x03E00008;
		spriteKillD = 0x2400;
		




		GlobalAddressB = (long)&bowserLOD0;
		GlobalAddressA = (long)(&g_PlayerStructTable);

		baseTurn = *(short*)(GlobalAddressA + 46);
		addTurn = *(short*)(GlobalAddressA + 192);

		objectPosition[0] = *(float*)(GlobalAddressA + 20);
		objectPosition[1] = *(float*)(GlobalAddressA + 24) - 5;
		objectPosition[2] = *(float*)(GlobalAddressA + 28);
		objectAngle[2] = baseTurn + addTurn;
		objectAngle[0] = 0x3FFF - *(short*)(GlobalAddressA + 518) * 2;
		objectAngle[1] = *(short*)(GlobalAddressA + 80) * -2;

		DrawGeometryScale(objectPosition,objectAngle,GlobalAddressB, 0.08);
	}

	*/
}

int RedCoinCollide(void *Car, void *Coin)
{
	GlobalAddressA = *(long*)(&Coin);
	objectPosition[0] = *(float*)(GlobalAddressA + 24);
	objectPosition[1] = *(float*)(GlobalAddressA + 28);
	objectPosition[2] = *(float*)(GlobalAddressA + 32);
	int playerID = (*(long*)&Car - (long)&g_PlayerStructTable) / 0xDD8;
	if ((CollisionSphere(Car,Coin) == 1) && (playerID == 0))
	{
		*targetAddress = 0x353500FF;
		deleteObjectBuffer(Coin);
		NAPlyTrgStart(playerID, 0x49008017);  //coin sfx
		CoinCount++;
		if (CoinCount != 8)
		{
			playrandmCharacterSFX(playerID);
		}
		SetAnimMusicNote(playerID);
		ChangeMaxSpeed(playerID, 2);
	}
	if (CoinCount == 8)
	{
		SetStar(Car,playerID);
		NAPlyTrgStart(playerID, 0x1900F103);  //goal in sfx
		CoinCount++;
	}

	return(0);
}



void CollideObject(void *Camera, void *Object)
{
	objectIndex = (short)((*(long*)(*(long*)(&Object)) >> 16) & 0x0000FFFF);
	switch (objectIndex)
	{
		case 47:
		{
			RedCoinCollide(Camera,Object);

			break;
		}
		default:
		{
			break;
		}
	}
}

void DisplayCoinSprite()
{

			for(int currentSprite = 1; (currentSprite <= CoinCount) & (currentSprite <= 8); currentSprite++)
			{
				KWSprite((currentSprite* 4) + 30,220,16,16,(ushort*)&ok_RedCoinSprite);
			}

			if ((CoinCount != 0) && (CoinCount < 8))
			{
				KWSprite(21,219,16,16,(ushort*)&lit_numberSpriteX);
				KWSprite(11,219,16,16,(ushort*)&lit_numberSprite+(CoinCount*0x100));
				return;
			}
			if (CoinCount >= 8)
			{
				KWSprite(21,219,16,16,(ushort*)&lit_numberSpriteX);
				KWSprite(11,219,16,16,(ushort*)&lit_numberSprite8);
			}
 
}

void DisplayObject(void *Camera, Object *InputObject)
{
	return;
}



void DrawOKObject(OKObject* InputHeader)
{
	InputHeader->ObjectData.angle[1] *= -1;
	DrawGeometryScale(InputHeader->ObjectData.position,InputHeader->ObjectData.angle,InputHeader->ModelAddress,InputHeader->ModelScale);
	InputHeader->ObjectData.angle[1] *= -1;
	
}


short FindOKObject()
{
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{
		
		if(OKObjectHeaders[CurrentObject].BehaviorClass == BEHAVIOR_DEAD)
		{
			return (short)CurrentObject;
		}
	}
	return -1;
}

void ClearOKObject(short ObjectID)
{
	OKObjectHeaders[ObjectID].Range = 0;
	OKObjectHeaders[ObjectID].Sight = 0;
	OKObjectHeaders[ObjectID].Viewcone = 0;
	OKObjectHeaders[ObjectID].PlayerTarget = 0;
	OKObjectHeaders[ObjectID].PathTarget = 0;
	OKObjectHeaders[ObjectID].TargetDistance = 0;
	OKObjectHeaders[ObjectID].TurnStatus = 0;
	OKObjectHeaders[ObjectID].SearchStatus = 0;
	OKObjectHeaders[ObjectID].WanderStatus = 0;
	OKObjectHeaders[ObjectID].EMPTYSTATUS = 0;
	OKObjectHeaders[ObjectID].ModelScale = 0;
	OKObjectHeaders[ObjectID].ModelAddress = 0;
	OKObjectHeaders[ObjectID].BehaviorClass = BEHAVIOR_DEAD;
	OKObjectHeaders[ObjectID].BehaviorClass = SUBBEHAVIOR_DOCILE;
	OKObjectHeaders[ObjectID].OriginPosition[0] = 0;
	OKObjectHeaders[ObjectID].OriginPosition[1] = 0;
	OKObjectHeaders[ObjectID].OriginPosition[2] = 0;
	OKObjectHeaders[ObjectID].ObjectData.position[0] = 0;
	OKObjectHeaders[ObjectID].ObjectData.position[1] = 0;
	OKObjectHeaders[ObjectID].ObjectData.position[2] = 0;	
	OKObjectHeaders[ObjectID].ObjectData.angle[0] = 0;
	OKObjectHeaders[ObjectID].ObjectData.angle[1] = 0;
	OKObjectHeaders[ObjectID].ObjectData.angle[2] = 0;
	OKObjectHeaders[ObjectID].ObjectData.velocity[0] = 0;
	OKObjectHeaders[ObjectID].ObjectData.velocity[1] = 0;
	OKObjectHeaders[ObjectID].ObjectData.velocity[2] = 0;
	OKObjectHeaders[ObjectID].ObjectData.radius = 0;
	OKObjectHeaders[ObjectID].ObjectData.sparam = 0;
	OKObjectHeaders[ObjectID].ObjectData.fparam = 0;
	OKObjectHeaders[ObjectID].ObjectData.flag = 0;
	OKObjectHeaders[ObjectID].ObjectData.counter = 0;
	OKObjectHeaders[ObjectID].ObjectData.category = 0;
}

bool TestCollideSphere(float SourcePosition[], float SourceRadius, float TargetPosition[], float TargetRadius)
{
	
	GlobalFloatA = SourceRadius + TargetRadius;
	
	GlobalFloatB = SourcePosition[0] - TargetPosition[0];
	GlobalFloatC = SourcePosition[2] - TargetPosition[2];
	if ((GlobalFloatB * GlobalFloatB) + (GlobalFloatC * GlobalFloatC) > (GlobalFloatA * GlobalFloatA))
	{
		return false;
	}
	
	return true; 
}

bool TestCollideBox(float SourcePosition[], short SourceSize[], float TargetPosition[], float TargetRadius)
{

	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		GlobalFloatA = (SourceSize[CurrentVector] / 2) + TargetRadius;
		GlobalFloatB = SourcePosition[CurrentVector] - TargetPosition[CurrentVector];
		if ((GlobalFloatB > GlobalFloatA) || (GlobalFloatB < GlobalFloatA * -1))
		{
			return false;
		}
	}
	return true;
}

void OKObjectCollision(OKObject *InputObject)
{
	GlobalAddressA = InputObject->CollisionAddress;
	if (g_gameMode == 0)
	{
		GlobalShortA = 8;
	}
	else
	{
		GlobalShortA = g_playerCount;
	}
	OKCollisionSphere *CurrentSphere = (OKCollisionSphere*)(GlobalAddressA);

	for (int CurrentPlayer = 0; CurrentPlayer < GlobalShortA; CurrentPlayer++)
	{
		for (int CurrentCount = 0; CurrentCount < InputObject->CollisionCount; CurrentCount++)
		{
			
			objectPosition[0] = CurrentSphere[CurrentCount].Position[0];
			objectPosition[1] = CurrentSphere[CurrentCount].Position[1];
			objectPosition[2] = CurrentSphere[CurrentCount].Position[2];

			//rotate the relative position of the sphere to the model based on the model angle.

			RotateVector(objectPosition,InputObject->ObjectData.angle);

			//apply the global position of the object to the relative position of the rotated sphere center.

			objectPosition[0] = (objectPosition[0] * InputObject->ModelScale) + InputObject->ObjectData.position[0];
			objectPosition[1] = (objectPosition[1] * InputObject->ModelScale) +  InputObject->ObjectData.position[1];
			objectPosition[2] = (objectPosition[2] * InputObject->ModelScale) +  InputObject->ObjectData.position[2];
			

			
			//Test the collision
			if (CurrentSphere[CurrentCount].Radius < 0)
			{
				if(TestCollideBox(objectPosition, CurrentSphere[CurrentCount].BoxSize ,GlobalPlayer[CurrentPlayer]->position, GlobalPlayer[CurrentPlayer]->radius))
				{
					MasterStatus(CurrentPlayer,CurrentSphere[CurrentCount].CollisionType);
					MasterEffect(CurrentPlayer,CurrentSphere[CurrentCount].EffectType);
				}		
			}
			else
			{
				if(TestCollideSphere(objectPosition, CurrentSphere[CurrentCount].Radius ,GlobalPlayer[CurrentPlayer]->position, GlobalPlayer[CurrentPlayer]->radius))
				{
					MasterStatus(CurrentPlayer,CurrentSphere[CurrentCount].CollisionType);
					MasterEffect(CurrentPlayer,CurrentSphere[CurrentCount].EffectType);
				}
			}
			
			

			
		}
	}
}

void DrawOKObjects()
{
	GlobalShortD = 10;
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{
		if(OKObjectHeaders[CurrentObject].BehaviorClass != BEHAVIOR_DEAD)
		{
			
			DrawOKObject((OKObject*)&OKObjectHeaders[CurrentObject]);		
			
		}
	}
}

void CheckOKObjects()
{
	
	GlobalShortD = 30;
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{
		if(OKObjectHeaders[CurrentObject].BehaviorClass != BEHAVIOR_DEAD)
		{
			Misbehave((OKObject*)&OKObjectHeaders[CurrentObject]);
			OKObjectCollision((OKObject*)&OKObjectHeaders[CurrentObject]);

			/*
			objectVelocity[0] = 0;
			objectVelocity[1] = OKObjectHeaders[CurrentObject].ObjectData.velocity[1];
			objectVelocity[2] = 1.0;
			MakeAlignVector(objectVelocity, OKObjectHeaders[CurrentObject].ObjectData.angle[1]);
			OKObjectHeaders[CurrentObject].ObjectData.velocity[0] = objectVelocity[0];
			OKObjectHeaders[CurrentObject].ObjectData.velocity[1] = objectVelocity[1];
			OKObjectHeaders[CurrentObject].ObjectData.velocity[2] = objectVelocity[2];

			UpdateObjectGravity((Object*)&OKObjectHeaders[CurrentObject].ObjectData);
			UpdateObjectVelocity((Object*)&OKObjectHeaders[CurrentObject].ObjectData);	
			UpdateObjectBump((Object*)&OKObjectHeaders[CurrentObject].ObjectData);	
			if(OKObjectHeaders[CurrentObject].ObjectData.bump.distance_zx < 0)
			{
				OKObjectHeaders[CurrentObject].ObjectData.velocity[1] = 0;
			}
			*/
			GlobalShortD += 10;
			

		}
	}
}