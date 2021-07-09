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
	/*
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
	*/
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




short FindOKObject()
{
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{		
		if(OKObjectArray[CurrentObject].SubBehaviorClass == SUBBEHAVIOR_DEAD)
		{
			return (short)CurrentObject;
		}
	}
	return -1;
}

void ClearOKObject(short ObjectID)
{	
	OKObjectArray[ObjectID].PlayerTarget = 0;
	OKObjectArray[ObjectID].PathTarget = 0;
	OKObjectArray[ObjectID].TargetDistance = 0;
	OKObjectArray[ObjectID].TurnStatus = 0;
	OKObjectArray[ObjectID].SearchStatus = 0;
	OKObjectArray[ObjectID].WanderStatus = 0;
	OKObjectArray[ObjectID].EMPTYSTATUS = 0;
	OKObjectArray[ObjectID].SubBehaviorClass = SUBBEHAVIOR_DEAD;
	OKObjectArray[ObjectID].ObjectData.position[0] = 0;
	OKObjectArray[ObjectID].ObjectData.position[1] = 0;
	OKObjectArray[ObjectID].ObjectData.position[2] = 0;	
	OKObjectArray[ObjectID].ObjectData.angle[0] = 0;
	OKObjectArray[ObjectID].ObjectData.angle[1] = 0;
	OKObjectArray[ObjectID].ObjectData.angle[2] = 0;
	OKObjectArray[ObjectID].ObjectData.velocity[0] = 0;
	OKObjectArray[ObjectID].ObjectData.velocity[1] = 0;
	OKObjectArray[ObjectID].ObjectData.velocity[2] = 0;
	OKObjectArray[ObjectID].ObjectData.radius = 0;
	OKObjectArray[ObjectID].ObjectData.sparam = 0;
	OKObjectArray[ObjectID].ObjectData.fparam = 0;
	OKObjectArray[ObjectID].ObjectData.flag = 0;
	OKObjectArray[ObjectID].ObjectData.counter = 0;
	OKObjectArray[ObjectID].ObjectData.category = 0;
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

bool TestCollideBox(float SourcePosition[], short SourceSize[], short SourceAngle[], float TargetPosition[], float TargetRadius)
{
	
	float TempPosition[3];
	short TempAngle[3];

	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		TempPosition[CurrentVector] = TargetPosition[CurrentVector] - SourcePosition[CurrentVector];

		
		if (CurrentVector == 1)
		{
			TempAngle[CurrentVector] = SourceAngle[CurrentVector] * -1;
		}
		else
		{
			TempAngle[CurrentVector] = SourceAngle[CurrentVector];
		}
	}	
	RotateVector(TempPosition,TempAngle);
	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		GlobalFloatA = (SourceSize[CurrentVector] / 2) + TargetRadius;
		GlobalFloatB = TempPosition[CurrentVector];
		if ((GlobalFloatB > GlobalFloatA) || (GlobalFloatB < GlobalFloatA * -1))
		{
			return false;
		}
	}
	return true;
}

void OKObjectCollision(OKObject *InputObject)
{
	if (g_gameMode == 0)
	{
		GlobalShortA = 8;
	}
	else
	{
		GlobalShortA = g_playerCount;
	}
	for (int CurrentPlayer = 0; CurrentPlayer < GlobalShortA; CurrentPlayer++)
	{		
		//Test the collision
		objectPosition[0] = InputObject->ObjectData.position[0];
		objectPosition[1] = InputObject->ObjectData.position[1];
		objectPosition[2] = InputObject->ObjectData.position[2];
		if(TestCollideSphere(objectPosition, OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].CollisionRadius ,GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
		{
			MasterStatus(CurrentPlayer,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].StatusClass);
			MasterEffect(CurrentPlayer,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].EffectClass);
		}
		
		/*
		for (int CurrentCount = 0; CurrentCount < InputObject->CollisionCount; CurrentCount++)
		{
			
			objectPosition[0] = InputObject->CollisionSphere[CurrentCount].Position[0];
			objectPosition[1] = InputObject->CollisionSphere[CurrentCount].Position[1];
			objectPosition[2] = InputObject->CollisionSphere[CurrentCount].Position[2];

			//rotate the relative position of the sphere to the model based on the model angle.

			RotateVector(objectPosition,InputObject->ObjectData.angle);

			//apply the global position of the object to the relative position of the rotated sphere center.

			objectPosition[0] = (objectPosition[0] * InputObject->CollisionSphere->Scale) + InputObject->ObjectData.position[0];
			objectPosition[1] = (objectPosition[1] * InputObject->CollisionSphere->Scale) +  InputObject->ObjectData.position[1];
			objectPosition[2] = (objectPosition[2] * InputObject->CollisionSphere->Scale) +  InputObject->ObjectData.position[2];
			

			
			//Test the collision
			if (InputObject->CollisionSphere[CurrentCount].Radius < 0)
			{
				objectAngle[0] = InputObject->CollisionSphere[CurrentCount].Angle[0] + InputObject->ObjectData.angle[0];
				objectAngle[1] = InputObject->CollisionSphere[CurrentCount].Angle[1] + InputObject->ObjectData.angle[1];
				objectAngle[2] = InputObject->CollisionSphere[CurrentCount].Angle[2] + InputObject->ObjectData.angle[2];
				if(TestCollideBox(objectPosition, InputObject->CollisionSphere[CurrentCount].BoxSize, objectAngle, GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
				{
					MasterStatus(CurrentPlayer,InputObject->CollisionSphere[CurrentCount].CollisionType);
					MasterEffect(CurrentPlayer,InputObject->CollisionSphere[CurrentCount].EffectType);
				}		
			}
			else
			{
				if(TestCollideSphere(objectPosition, InputObject->CollisionSphere[CurrentCount].Radius ,GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
				{
					MasterStatus(CurrentPlayer,InputObject->CollisionSphere[CurrentCount].CollisionType);
					MasterEffect(CurrentPlayer,InputObject->CollisionSphere[CurrentCount].EffectType);
				}
			}
			
			

			
		}
		*/
	}
}

void DrawOKObjects(Camera* LocalCamera)
{
	
	for (int CurrentType = 0; CurrentType < OverKartRAMHeader.ObjectHeader.ObjectTypeCount; CurrentType++)
	{
		for (int CurrentModel = 0; CurrentModel < OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].OKModelCount; CurrentModel++)
		{
			OKModel* ThisModel = (OKModel*)GetRealAddress(0x0A000000 | (int)&OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray->ListIndex].ObjectIndex].ObjectModel[CurrentModel]);
			
			*(long*)*graphPointer = (long)(0xBB000001);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(0x07C007C0);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(0xB900031D);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(0x00552078);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(0xFCFFFFFF);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(0xFFFCF87C);
			*graphPointer = *graphPointer + 4;

			*(long*)*graphPointer = (long)(0x06000000);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(0x0A000000 | ThisModel->TextureAddress);
			*graphPointer = *graphPointer + 4;
			for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectHeader.ObjectCount; CurrentObject++)
			{
				
				if((OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD) && (OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray[CurrentObject].ListIndex].ObjectIndex == CurrentType))
				{		
					
					objectPosition[0] = (float)OKObjectArray[CurrentObject].ObjectData.position[0];
					objectPosition[1] = (float)OKObjectArray[CurrentObject].ObjectData.position[1];
					objectPosition[2] = (float)OKObjectArray[CurrentObject].ObjectData.position[2];

					objectAngle[0] = (short)OKObjectArray[CurrentObject].ObjectData.angle[0];
					objectAngle[1] = (short)(OKObjectArray[CurrentObject].ObjectData.angle[1] * -1);
					objectAngle[2] = (short)OKObjectArray[CurrentObject].ObjectData.angle[2];	

					
					
					uint* MeshAddress = (uint*)GetRealAddress(0x0A000000 |ThisModel->MeshAddress);

					CreateModelingMatrix(AffineMatrix,objectPosition,objectAngle);

					
					/*
					AffineMatrix[0][0] =  cosB;
					AffineMatrix[1][0] =  0.0f;
					AffineMatrix[2][0] =  sinB;
					AffineMatrix[0][1] =  0.0f;
					AffineMatrix[1][1] =  1.0f;
					AffineMatrix[2][1] =  0.0f;
					AffineMatrix[0][2] = -sinB;
					AffineMatrix[1][2] =  0.0f;
					AffineMatrix[2][2] =  cosB;
					AffineMatrix[0][3] =  0.0f;
					AffineMatrix[1][3] =  0.0f;
					AffineMatrix[2][3] =  0.0f;
					AffineMatrix[3][3] =  1.0f; 

					AffineMatrix[3][0] = (float)objectPosition[0];
					AffineMatrix[3][1] = (float)objectPosition[1];
					AffineMatrix[3][2] = (float)objectPosition[2];
					*/
					
					
					ScalingMatrix(AffineMatrix,0.10);

					if(SetMatrix(AffineMatrix,0) != 0)
					{
						for (int CurrentMesh = 0; CurrentMesh < ThisModel->MeshCount; CurrentMesh++)
						{
							*(long*)*graphPointer = (long)(0x06000000);
							*graphPointer = *graphPointer + 4;
							*(long*)*graphPointer = (long)(0x0A000000 | MeshAddress[CurrentMesh]);
							*graphPointer = *graphPointer + 4;
						}	
					}		


				}
				
			}
		}
	}
}

void CheckOKObjects()
{	
	for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectHeader.ObjectCount; CurrentObject++)
	{
		if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
		{
			Misbehave((OKObject*)&OKObjectArray[CurrentObject]);
			OKObjectCollision((OKObject*)&OKObjectArray[CurrentObject]);	
		}
	}
}