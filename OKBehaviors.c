#include <stdbool.h>
#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"

#include "../library/OKExternal.h"
#include "../library/LibraryVariables.h"
#include "../library/MarioKartObjects.h"
#include "../library/MarioKart3D.h"
#include "../library/Struct.h"
#include "../library/OKStruct.h"
#include "../library/OKCustomObjects.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"


short ObjectSubBehaviorTurnTarget(float InputPosition[3], short InputAngle, float TargetPosition[3], short ToleranceAngle)
{
	GlobalShortA = (short)(CalcDirection(InputPosition, TargetPosition) * -1);
	GlobalShortA -= InputAngle;
	if (GlobalShortA > (DEG1 * ToleranceAngle))
	{
		return 1;
	}
	else if (GlobalShortA < -(DEG1 * ToleranceAngle))
	{
		return -1;
	}
	return 0;
}

float ObjectSubBehaviorLookTarget(OKObject* InputObject, float TargetPosition[3])
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex]);
	
	GlobalFloatA = (float)ThisType->Range;	
	GlobalFloatB = (InputObject->ObjectData.position[0] - TargetPosition[0]);
	GlobalFloatC = (InputObject->ObjectData.position[2] - TargetPosition[2]);
	GlobalFloatD = (((GlobalFloatB * GlobalFloatB) + (GlobalFloatC * GlobalFloatC)) / (GlobalFloatA * GlobalFloatA));

	GlobalShortA = (short)(CalcDirection(InputObject->ObjectData.position, TargetPosition) * -1);
	GlobalShortA -= InputObject->ObjectData.angle[1];
	
	
	if ((GlobalShortA < (DEG1 * (ThisType->Viewcone/2))) && (GlobalShortA > (DEG1 * (ThisType->Viewcone/-2))))
	{	
		return GlobalFloatD;
		
	}
	
	return 35000;
	
	
}


void ObjectBehaviorExist(OKObject* InputObject)
{
	UpdateObjectGravity((Object*)&InputObject->ObjectData);
	UpdateObjectVelocity((Object*)&InputObject->ObjectData);	
	UpdateObjectBump((Object*)&InputObject->ObjectData);	
	if(InputObject->ObjectData.bump.distance_zx < 0)
	{
		InputObject->ObjectData.velocity[1] = 0;
	}
}

void ObjectBehaviorWalk(OKObject* InputObject, float Speed)
{
	objectVelocity[0] = 0;
	objectVelocity[1] = InputObject->ObjectData.velocity[1];
	objectVelocity[2] = Speed;
	MakeAlignVector(objectVelocity, InputObject->ObjectData.angle[1]);
	InputObject->ObjectData.velocity[0] = objectVelocity[0];
	InputObject->ObjectData.velocity[1] = objectVelocity[1];
	InputObject->ObjectData.velocity[2] = objectVelocity[2];

	ObjectBehaviorExist(InputObject);	
}

void ObjectBehaviorWander(OKObject* InputObject)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex]);
	OKObjectList *ThisList = (OKObjectList*)&(OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex]);
	GlobalFloatA = (float)ThisType->Range;
	GlobalFloatB = GlobalFloatA * 0.6;
	
	GlobalIntA = (InputObject->ObjectData.position[0] - ThisList->OriginPosition[0]);
	GlobalIntB = (InputObject->ObjectData.position[2] - ThisList->OriginPosition[2]);
	

	if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) < (GlobalFloatB * GlobalFloatB))
	{
		 InputObject->WanderStatus = 0;
	}
	
	
	if (InputObject->WanderStatus >= 1)
	{		
		objectPosition[0] = (float)ThisList->OriginPosition[0];
		objectPosition[1] = (float)ThisList->OriginPosition[1];
		objectPosition[2] = (float)ThisList->OriginPosition[2];

		InputObject->ObjectData.angle[1] += (DEG1 * 2 * ObjectSubBehaviorTurnTarget(InputObject->ObjectData.position, InputObject->ObjectData.angle[1], objectPosition, 2));


	}
	else
	{
		if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) > (GlobalFloatA * GlobalFloatA))
		{
			InputObject->WanderStatus = 1;
		}
		else
		{
			if (InputObject->Counter[0] > 0)
			{
				InputObject->Counter[0]--;
				
				switch (InputObject->TurnStatus)
				{
					case 0: 
					{
						break;				
					}
					case 1: 
					{
						InputObject->ObjectData.angle[1] += DEG1 * 2;
						break;					
					}
					case 2: 
					{
						InputObject->ObjectData.angle[1] -= DEG1 * 2;
						break;				
					}
					case 3: 
					{
						break;		
					}
				}
			}
			else
			{
				InputObject->TurnStatus = MakeRandomLimmit(4);
				InputObject->Counter[0] = MakeRandomLimmit(60) + 15;
			}
		}

	}
	ObjectBehaviorWalk(InputObject, 0.6);
	
}



void ObjectBehaviorSearch(OKObject* InputObject)
{	
	switch (InputObject->SubBehaviorClass)
	{
		case(SUBBEHAVIOR_DOCILE):
		{			
			InputObject->TargetDistance = 800;
			if (g_gameMode == 00)
			{
				GlobalIntA = 8;			
			}
			else
			{
				GlobalIntA = g_playerCount;
			}
			for (int CurrentPlayer = 0; CurrentPlayer < GlobalIntA; CurrentPlayer++)
			{
				GlobalFloatD = ObjectSubBehaviorLookTarget(InputObject, GlobalPlayer[CurrentPlayer].position);					
				if ((GlobalFloatD < 1) && (GlobalFloatD < InputObject->TargetDistance))
				{

					InputObject->SubBehaviorClass = SUBBEHAVIOR_SURPRISE;
					InputObject->TargetDistance = GlobalFloatD;
					GlobalFloatD = 2.01 - GlobalFloatD;
					InputObject->PlayerTarget = (short)CurrentPlayer;
					InputObject->Counter[1] = 30 * GlobalFloatD; 
					
					InputObject->ObjectData.velocity[0] = 0;
					InputObject->ObjectData.velocity[1] += 2.5 * GlobalFloatD;
					InputObject->ObjectData.velocity[2] = 0;
				}
			}
			if (InputObject->SubBehaviorClass == SUBBEHAVIOR_DOCILE)
			{
				ObjectBehaviorWander(InputObject);
			}
			break;
		}
		case(SUBBEHAVIOR_SURPRISE):
		{
			
			
			if (InputObject->Counter[1] <= 0)
			{
				InputObject->SubBehaviorClass = SUBBEHAVIOR_CHASE;
			}
			else
			{
				InputObject->Counter[1]--;
			}
			
			ObjectBehaviorExist(InputObject);
			break;
		}
		case(SUBBEHAVIOR_CHASE):
		{
			
			GlobalFloatD = ObjectSubBehaviorLookTarget(InputObject, GlobalPlayer[InputObject->PlayerTarget].position);
			if (GlobalFloatD < 2)
			{
				GlobalShortC = ObjectSubBehaviorTurnTarget(InputObject->ObjectData.position, InputObject->ObjectData.angle[1], GlobalPlayer[InputObject->PlayerTarget].position, 4);
				InputObject->ObjectData.angle[1] += (DEG1 * 4 * GlobalShortC);
				GlobalFloatA = (InputObject->ObjectData.velocity[0] * InputObject->ObjectData.velocity[0]) + (InputObject->ObjectData.velocity[2] * InputObject->ObjectData.velocity[2]);
				if (GlobalFloatA < (2 * 2))
				{
					if (GlobalFloatA == 0)
					{
						GlobalFloatA = 0.25;
					}
					else
					{
						GlobalFloatA = Sqrtf(GlobalFloatA) + 0.25;
					}
				}
				else
				{
					GlobalFloatA = 2;
				}


				if (GlobalShortC != 0)
				{
					GlobalFloatB = GlobalFloatA / 1.25;
					ObjectBehaviorWalk(InputObject,GlobalFloatB);
				}
				else
				{
					ObjectBehaviorWalk(InputObject,GlobalFloatA);
				}
				

			}
			else
			{
				InputObject->SubBehaviorClass = SUBBEHAVIOR_DOCILE;
				InputObject->Counter[1] = 0;
				ObjectBehaviorExist(InputObject);
			}
			
			break;
		}
	}
}

short ObjectSearchClosestMarker(float ObjectPostion[], Marker* PathData)
{
	GlobalShortB = 0;
	GlobalFloatB = 35000;
	for (int CurrentMarker = 0; ; CurrentMarker++)
	{		
		if (PathData[CurrentMarker].Position[0] == (short)0x8000)
		{
			return GlobalShortB;
		}
		else
		{
			GlobalFloatA = (
				(ObjectPostion[0] - (float)PathData[CurrentMarker].Position[0]) * (ObjectPostion[0] - (float)PathData[CurrentMarker].Position[0]) +
				(ObjectPostion[1] - (float)PathData[CurrentMarker].Position[1]) * (ObjectPostion[1] - (float)PathData[CurrentMarker].Position[1])
			);
			

			if(GlobalFloatA < GlobalFloatB)
			{
				GlobalShortB = (short)CurrentMarker;
				GlobalFloatB = GlobalFloatA;
			}
		}
	}
	
	
}


void ObjectBehaviorFollowPath(OKObject* InputObject, Marker* PathData)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex]);
	
	if (InputObject->PathTarget == -1)
	{
		InputObject->PathTarget = ObjectSearchClosestMarker(InputObject->ObjectData.position,PathData);
	}
	else if (InputObject->PathTarget > 0)
	{
		objectPosition[0] = (float)PathData[InputObject->PathTarget].Position[0];
		objectPosition[1] = (float)PathData[InputObject->PathTarget].Position[1];
		objectPosition[2] = (float)PathData[InputObject->PathTarget].Position[2];
		
		InputObject->ObjectData.angle[1] += (DEG1 * 5 * ObjectSubBehaviorTurnTarget(InputObject->ObjectData.position, InputObject->ObjectData.angle[1], objectPosition, 5));
		ObjectBehaviorWalk(InputObject, ThisType->MaxSpeed);

		if (TestCollideSphere(InputObject->ObjectData.position,6,objectPosition, 6))
		{
			InputObject->PathTarget++;
			if (PathData[InputObject->PathTarget].Position[0] == (short)0x8000)
			{
				InputObject->PathTarget = -2; //completed.
			}
		}
	}
	
}

void Misbehave(OKObject* InputObject)
{
	switch (OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].BehaviorClass)
	{
		case BEHAVIOR_STATIC:
		{
			ObjectBehaviorExist(InputObject);
			break;
		}
		case BEHAVIOR_ROTATE:
		{
			UpdateObjectAngle((Object*)(&InputObject->ObjectData), InputObject->AngularVelocity);
			ObjectBehaviorExist(InputObject);
			break;
		}		
		case BEHAVIOR_PATH:
		{
			
			ObjectBehaviorFollowPath(InputObject,(Marker*)(GetRealAddress(*(long*)&pathOffset)));
		}
		case BEHAVIOR_WANDER:
		{
			
			ObjectBehaviorWander(InputObject);
			break;
		}
		case BEHAVIOR_SEARCH:
		{
			
			ObjectBehaviorSearch(InputObject);
			break;
		}
	}
	
}
