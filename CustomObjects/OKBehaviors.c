#include "../MainInclude.h"


short ObjectSubBehaviorTurnTarget(float InputPosition[3], short InputAngle, float TargetPosition[3], short ToleranceAngle)
{
	GlobalShortA = (short)(MakeDirection(InputPosition[0],InputPosition[2], TargetPosition[0], TargetPosition[2]) * -1);
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
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	
	GlobalFloatA = (float)ThisType->Sight;	
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

float ObjectSubBehaviorLookedAt(OKObject* InputObject, int PlayerIndex, short LookAngle)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	Player ThisPlayer = GlobalPlayer[PlayerIndex];
	GlobalFloatA = (float)ThisType->Range;	
	GlobalFloatB = (ThisPlayer.position[0] - InputObject->ObjectData.position[0]);
	GlobalFloatC = (ThisPlayer.position[2] - InputObject->ObjectData.position[2]);
	GlobalFloatD = (((GlobalFloatB * GlobalFloatB) + (GlobalFloatC * GlobalFloatC)) / (GlobalFloatA * GlobalFloatA));

	GlobalShortA = (short)(CalcDirection(ThisPlayer.position, InputObject->ObjectData.position) * -1);
	GlobalShortA -= ThisPlayer.direction[1];
	
	
	if ((GlobalShortA < (DEG1 * (LookAngle/2))) && (GlobalShortA > (DEG1 * (LookAngle/-2))))
	{	
		return GlobalFloatD;
		
	}
	
	return 35000;
	
	
}


void ObjectBehaviorExist(OKObject* InputObject)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	if (ThisType->GravityToggle == 1)
	{
		UpdateObjectGravity((Object*)&InputObject->ObjectData);
	}

	UpdateObjectVelocity((Object*)&InputObject->ObjectData);	

	if (ThisType->BumpRadius != 0)
	{
		UpdateObjectBump((Object*)&InputObject->ObjectData);		
	
		if(InputObject->ObjectData.bump.distance_zx < 0)
		{
			InputObject->ObjectData.velocity[1] = 0;
		}
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

void ObjectBehaviorStrafe(OKObject* InputObject)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	OKObjectList *ThisList = (OKObjectList*)&(OverKartRAMHeader.ObjectList[InputObject->ListIndex]);
	GlobalShortA = 1;
	if (ThisList->Flag != 0)
	{
		GlobalShortA = -1;
	}
	
	switch (InputObject->Status[1])
	{
		case 0:
		{
			InputObject->ObjectData.velocity[0] = (float)(ThisType->MaxSpeed / 100) * GlobalShortA;
			InputObject->ObjectData.velocity[1] = 0;
			InputObject->ObjectData.velocity[2] = 0;

			InputObject->Counter[0] += InputObject->ObjectData.velocity[0] * GlobalShortA;
			if (InputObject->Counter[0] > ThisType->Range)
			{
				InputObject->Status[1] = 1;
			}
			break;
		}
		case 1:
		{
			InputObject->ObjectData.velocity[0] -= (float)(ThisType->MaxSpeed / 3000) * GlobalShortA;
			InputObject->ObjectData.velocity[1] = 0;
			InputObject->ObjectData.velocity[2] = 0;

			InputObject->Counter[0] += InputObject->ObjectData.velocity[0] * GlobalShortA;
			if (InputObject->ObjectData.velocity[0] <= (float)(ThisType->MaxSpeed / -100))
			{
				InputObject->Status[1] = 2;
			}
		}
		case 2:
		{
			InputObject->ObjectData.velocity[0] = (float)(ThisType->MaxSpeed / -100) * GlobalShortA;
			InputObject->ObjectData.velocity[1] = 0;
			InputObject->ObjectData.velocity[2] = 0;

			InputObject->Counter[0] += InputObject->ObjectData.velocity[0] * GlobalShortA;
			if (InputObject->Counter[0]<= 0)
			{
				InputObject->Status[1] = 3;
			}
			break;
		}
		case 3:
		{
			InputObject->ObjectData.velocity[0] = (float)(ThisType->MaxSpeed / -100) * GlobalShortA;
			InputObject->ObjectData.velocity[1] = 0;
			InputObject->ObjectData.velocity[2] = 0;

			InputObject->Counter[0] += InputObject->ObjectData.velocity[0] * GlobalShortA;
			if (InputObject->Counter[0] < (ThisType->Range * -1))
			{
				InputObject->Status[1] = 4;
			}
			break;
		}
		case 4:
		{
			InputObject->ObjectData.velocity[0] += (float)(ThisType->MaxSpeed / 3000) * GlobalShortA;
			InputObject->ObjectData.velocity[1] = 0;
			InputObject->ObjectData.velocity[2] = 0;

			InputObject->Counter[0] += InputObject->ObjectData.velocity[0] * GlobalShortA;
			if (InputObject->ObjectData.velocity[0] >= (float)(ThisType->MaxSpeed / 100))
			{
				InputObject->Status[1] = 5;
			}
		}
		case 5:
		{	
			InputObject->ObjectData.velocity[0] = (float)(ThisType->MaxSpeed / 100) * GlobalShortA;
			InputObject->ObjectData.velocity[1] = 0;
			InputObject->ObjectData.velocity[2] = 0;

			InputObject->Counter[0] += InputObject->ObjectData.velocity[0] * GlobalShortA;
			if (InputObject->Counter[0]>= 0)
			{
				InputObject->Status[1] = 0;
			}
			break;
		}
	}
		
	MakeAlignVector(InputObject->ObjectData.velocity, InputObject->ObjectData.angle[1]);
	ObjectBehaviorExist(InputObject);
	
}

void ObjectBehaviorWander(OKObject* InputObject)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	OKObjectList *ThisList = (OKObjectList*)&(OverKartRAMHeader.ObjectList[InputObject->ListIndex]);
	GlobalFloatA = (float)ThisType->Range;
	GlobalFloatB = GlobalFloatA * 0.6;
	
	GlobalIntA = (InputObject->ObjectData.position[0] - ThisList->OriginPosition[0]);
	GlobalIntB = (InputObject->ObjectData.position[2] - ThisList->OriginPosition[2]);
	

	if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) < (GlobalFloatB * GlobalFloatB))
	{
		 InputObject->Status[1] = 0;
	}
	
	
	if (InputObject->Status[1] >= 1)
	{		
		objectPosition[0] = (float)ThisList->OriginPosition[0];
		objectPosition[1] = (float)ThisList->OriginPosition[1];
		objectPosition[2] = (float)ThisList->OriginPosition[2];

		InputObject->ObjectData.angle[1] += (DEG1 * 2 * ObjectSubBehaviorTurnTarget(InputObject->ObjectData.position, InputObject->ObjectData.angle[1], objectPosition, 3));
	}
	else
	{
		if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) > (GlobalFloatA * GlobalFloatA))
		{
			InputObject->Status[1] = 1;
		}
		else
		{
			if (InputObject->Counter[0] > 0)
			{
				InputObject->Counter[0]--;
				
				switch (InputObject->Status[0])
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
				InputObject->Status[0] = MakeRandomLimmit(4);
				InputObject->Counter[0] = MakeRandomLimmit(60) + 15;
			}
		}

	}
	ObjectBehaviorWalk(InputObject, (ThisType->MaxSpeed / 100.0f));
	
}




void ObjectBehaviorFlee(OKObject* InputObject)
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
				GlobalFloatD = ObjectSubBehaviorLookedAt(InputObject, CurrentPlayer, 90);
				if ((GlobalFloatD < 1) && (GlobalFloatD < InputObject->TargetDistance))
				{

					InputObject->SubBehaviorClass = SUBBEHAVIOR_SURPRISE;
					InputObject->TargetDistance = GlobalFloatD;
					GlobalFloatD = 2.01 - GlobalFloatD;
					InputObject->PlayerTarget = (short)CurrentPlayer;
					InputObject->Counter[1] = 15 * GlobalFloatD; 
					
					InputObject->ObjectData.velocity[0] = 0;
					InputObject->ObjectData.velocity[1] += 2 * GlobalFloatD;
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
				InputObject->ObjectData.angle[1] += (DEG1 * -4 * GlobalShortC);
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

void ObjectBehaviorSearch(OKObject* InputObject)
{	
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
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
					InputObject->Counter[1] = 15 * GlobalFloatD; 
					
					InputObject->ObjectData.velocity[0] = 0;
					InputObject->ObjectData.velocity[1] += 2 * GlobalFloatD;
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
				GlobalFloatB = (ThisType->MaxSpeed / 100.0f);

				//get speed from max speed and not just the value 2.0 wtf was that
				if (GlobalFloatA < (GlobalFloatB * GlobalFloatB))
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
					GlobalFloatA = GlobalFloatB;
				}


				if (GlobalShortC != 0)
				{
					ObjectBehaviorWalk(InputObject,GlobalFloatA * 0.75f);
					//slow on turns
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
				(ObjectPostion[2] - (float)PathData[CurrentMarker].Position[2]) * (ObjectPostion[2] - (float)PathData[CurrentMarker].Position[2])
			);
			

			if(GlobalFloatA < GlobalFloatB)
			{
				GlobalShortB = (short)CurrentMarker;
				GlobalFloatB = GlobalFloatA;
			}
		}
	}
	
	
}


void ObjectBehaviorFollowPath(OKObject* InputObject)
{
	uint* PathOffsets = (uint*)&pathOffset; 
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	Marker* PathData = (Marker*)(GetRealAddress(PathOffsets[ThisType->Range]));
	short ThisPoint = InputObject->PathTarget;
	short NextPoint = ThisPoint + 1;

	
	if (InputObject->PathTarget == -1)
	{
		InputObject->PathTarget = 1 + ObjectSearchClosestMarker(InputObject->ObjectData.position,PathData);

		if (PathData[InputObject->PathTarget].Position[0] == (short)0x8000)
		{
			InputObject->PathTarget  = 0;
		}

		objectPosition[0] = (float)PathData[InputObject->PathTarget].Position[0];
		objectPosition[1] = (float)PathData[InputObject->PathTarget].Position[1];
		objectPosition[2] = (float)PathData[InputObject->PathTarget].Position[2];
		InputObject->ObjectData.angle[1] = (-1 * CalcDirection(InputObject->ObjectData.position, objectPosition));

		if (InputObject->PathTarget > 0)
		{
			InputObject->PlayerTarget = InputObject->PathTarget - 1;
		}
		else
		{
			InputObject->PlayerTarget = 0;
		}

		
		objectPosition[0] = (float)PathData[InputObject->PlayerTarget].Position[0];
		objectPosition[1] = (float)PathData[InputObject->PlayerTarget].Position[1];
		objectPosition[2] = (float)PathData[InputObject->PlayerTarget].Position[2];

		InputObject->ObjectData.position[0] = objectPosition[0];
		InputObject->ObjectData.position[1] = objectPosition[1];
		InputObject->ObjectData.position[2] = objectPosition[2];
	}
	else if (InputObject->PathTarget >= 0)
	{
		if (PathData[NextPoint].Position[0] == (short)0x8000)
		{
			NextPoint = 0;
		}

		objectPosition[0] = (float)PathData[NextPoint].Position[0];
		objectPosition[1] = (float)PathData[NextPoint].Position[1];
		objectPosition[2] = (float)PathData[NextPoint].Position[2];
		
		GlobalFloatA = (objectPosition[0] - InputObject->ObjectData.position[0]) + (objectPosition[2] - InputObject->ObjectData.position[2]);


		
		
		objectPosition[0] = (float)PathData[ThisPoint].Position[0];
		objectPosition[2] = (float)PathData[ThisPoint].Position[2];
		GlobalFloatB = (objectPosition[0] - InputObject->ObjectData.position[0]) + (objectPosition[2] - InputObject->ObjectData.position[2]);
		
		GlobalFloatA *= GlobalFloatA;
		GlobalFloatB *= GlobalFloatB;

		if (GlobalFloatA < GlobalFloatB)
		{
			InputObject->PathTarget = NextPoint + 1;
			InputObject->PlayerTarget = NextPoint; //use PlayerTarget for Last Point.


			Vector Origin =
			{
				InputObject->ObjectData.position[0],
				InputObject->ObjectData.position[1],
				InputObject->ObjectData.position[2],
			};
			MakeAlignVector(Origin,InputObject->ObjectData.angle[1]);

			Vector Rear = 
			{
				Origin[0],
				Origin[1] + 10,
				Origin[2] - 30
			};

			Vector Front = 
			{
				Origin[0],
				Origin[1] + 10,
				Origin[2] + 30
			};
			Rear[1] = CalcHeight(Rear[0], Rear[1], Rear[2], InputObject->ObjectData.bump.last_zx);
			Front[1] = CalcHeight(Front[0], Front[1], Front[2], InputObject->ObjectData.bump.last_zx);
			InputObject->ObjectData.angle[0] = (DEG1 * -90) + CalcVerticalDirection(Rear, Front);
		}
		else
		{

			ChaseDir(&InputObject->ObjectData.angle[1],(-1 * MakeDirection(InputObject->ObjectData.position[0],InputObject->ObjectData.position[2],objectPosition[0],objectPosition[2])), (DEG1 * 5));
			ObjectBehaviorWalk(InputObject, (float)ThisType->MaxSpeed / 100);

			if (TestCollideSphere(InputObject->ObjectData.position,25,objectPosition, 25))
			{
				InputObject->PathTarget = NextPoint;
				InputObject->PlayerTarget = ThisPoint; //use PlayerTarget for Last Point.


				Vector Origin =
				{
					InputObject->ObjectData.position[0],
					InputObject->ObjectData.position[1],
					InputObject->ObjectData.position[2],
				};
				MakeAlignVector(Origin,InputObject->ObjectData.angle[1]);

				Vector Rear = 
				{
					Origin[0],
					Origin[1] + 10,
					Origin[2] - 30
				};

				Vector Front = 
				{
					Origin[0],
					Origin[1] + 10,
					Origin[2] + 30
				};
				Rear[1] = CalcHeight(Rear[0], Rear[1], Rear[2], InputObject->ObjectData.bump.last_zx);
				Front[1] = CalcHeight(Front[0], Front[1], Front[2], InputObject->ObjectData.bump.last_zx);
				InputObject->ObjectData.angle[0] = (DEG1 * -90) + CalcVerticalDirection(Rear, Front);
			}
		}

		
	}
	
}

void ObjectBehaviorWaterBob(OKObject* InputObject)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	OKObjectList *ThisList = (OKObjectList*)&(OverKartRAMHeader.ObjectList[InputObject->ListIndex]);

	InputObject->ObjectData.velocity[0] = 0;
	InputObject->ObjectData.velocity[2] = 0;

	switch (InputObject->Status[1])
	{
		case 0:
		{
			if (InputObject->ObjectData.position[1] > ThisList->OriginPosition[1] + ThisType->Range)
			{
				InputObject->Status[1] = 1;
			}
			else
			{
				InputObject->ObjectData.velocity[1] = (float)(ThisType->MaxSpeed / 100);
			}
	

			break;
		}
		case 1:
		{
			if (InputObject->ObjectData.velocity[1] <= (float)(ThisType->MaxSpeed / -100))
			{
				InputObject->Status[1] = 2;
			}
			else
			{
				InputObject->ObjectData.velocity[1] -= (float)(ThisType->MaxSpeed / 3000);
			}
		}
		case 2:
		{
			if (InputObject->ObjectData.position[1] < ThisList->OriginPosition[1] - ThisType->Range)
			{
				InputObject->Status[1] = 3;
			}
			else
			{
				InputObject->ObjectData.velocity[1] = (float)(ThisType->MaxSpeed / 100);
			}
			break;
		}
		case 3:
		{
			if (InputObject->ObjectData.velocity[1] >= (float)(ThisType->MaxSpeed / 100))
			{
				InputObject->Status[1] = 0;
			}
			else
			{
				InputObject->ObjectData.velocity[1] += (float)(ThisType->MaxSpeed / 3000);
			}
		}
	}
}

void ObjectBehaviorBounce(OKObject* InputObject)
{
	MoveIWA((Object*)&InputObject->ObjectData);
}


void ObjectBehavior2Point(OKObject* InputObject)
{
	OKObjectType *ThisType = (OKObjectType*)&(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex]);
	if (InputObject->Status[1] != 5)
    {
        //We need to set the initial direction and speed but only once!
        InputObject->Status[1] = 5;
        //Now this will never run again!
        InputObject->Status[0] = ThisType->Sight;	// Move direction
        InputObject->Counter[1] = ThisType->Range;	// Move Duration
        InputObject->Counter[0] = ThisType->Viewcone;	// Delay before move   
    }
    
	if (InputObject->Counter[0] > 0)
	{
		//Delay Timer
		InputObject->Counter[0]--;
		return;
	}

	//Action - 
	switch (InputObject->Status[0])
	{
	case 0: // Positive X
		InputObject->ObjectData.velocity[0] = (float)(ThisType->MaxSpeed / 100);
		InputObject->ObjectData.velocity[1] = 0;
		InputObject->ObjectData.velocity[2] = 0;		
		break;
	case 1: // Negative X
		InputObject->ObjectData.velocity[0] = -1.0f * (float)(ThisType->MaxSpeed / 100);
		InputObject->ObjectData.velocity[1] = 0;
		InputObject->ObjectData.velocity[2] = 0;
		break;
	case 2: // Positive Z		
		InputObject->ObjectData.velocity[0] = 0;
		InputObject->ObjectData.velocity[1] = 0;
		InputObject->ObjectData.velocity[2] = (float)(ThisType->MaxSpeed / 100);
		break;
	case 3: // Negative Z
		InputObject->ObjectData.velocity[0] = 0;
		InputObject->ObjectData.velocity[1] = 0;
		InputObject->ObjectData.velocity[2] = -1.0f * (float)(ThisType->MaxSpeed / 100);
		break;
	case 4: // Positive Y
		InputObject->ObjectData.velocity[0] = 0;		
		InputObject->ObjectData.velocity[1] = (float)(ThisType->MaxSpeed / 100);
		InputObject->ObjectData.velocity[2] = 0;
		break;
	case 5: // Negative Y
		InputObject->ObjectData.velocity[0] = 0;
		InputObject->ObjectData.velocity[1] = -1.0f * (float)(ThisType->MaxSpeed / 100); 
		InputObject->ObjectData.velocity[2] = 0;
		break;
	default:
		break;
	}
	if (InputObject->Counter[1] > 0)
	{
		//Duration Timer
		InputObject->Counter[1]--;
	}
	else
	{
		InputObject->ObjectData.velocity[0] = 0;
		InputObject->ObjectData.velocity[1] = 0;
		InputObject->ObjectData.velocity[2] = 0;
		//reset timer
		InputObject->Counter[0] = ThisType->Viewcone;  
		InputObject->Counter[1] = ThisType->Range; 
		switch (InputObject->Status[0])
		{
			case 0: // Positive X
			    InputObject->Status[0] = 1;
			break;
            case 1: // Negative X
                InputObject->Status[0] = 0;
                break;
            case 2: // Positive Z
                InputObject->Status[0] = 3;
                break;
            case 3: // Negative Z
                InputObject->Status[0] = 2;
                break;
            case 4: // Positive Y
                InputObject->Status[0] = 5;
                break;
            case 5: // Negative Y
                InputObject->Status[0] = 4;
			break;
		default:
			break;
		}
	}
	ObjectBehaviorExist(InputObject); 
}


void Misbehave(OKObject* InputObject)
{
	switch (OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].BehaviorClass)
	{
		case BEHAVIOR_STATIC:
		{
			
			Vector FAngle = {(float)InputObject->AngularVelocity[0],(float)InputObject->AngularVelocity[1],(float)InputObject->AngularVelocity[2] };
			MakeAlignVector(FAngle, OverKartRAMHeader.ObjectList[InputObject->ListIndex].OriginAngle[1]);
			SVector SAngle = {(short)FAngle[0],(short)FAngle[1],(short)FAngle[2]};
			UpdateObjectAngle((Object*)(&InputObject->ObjectData), SAngle);
			ObjectBehaviorExist(InputObject);
			break;
		}
		case BEHAVIOR_PATH:
		{	
			ObjectBehaviorFollowPath(InputObject);
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
		case BEHAVIOR_BOUNCE:
		{
			
			ObjectBehaviorBounce(InputObject);
			break;
		}
		case BEHAVIOR_STRAFE:
		{

			ObjectBehaviorStrafe(InputObject);
			break;
		}
        case 9:
		{
			ObjectBehavior2Point(InputObject);
			break;
		}
	}

	if (InputObject->ObjectData.position[1] < g_waterHeight)
	{
		InputObject->SubBehaviorClass = SUBBEHAVIOR_DEAD;
	}
	
}
