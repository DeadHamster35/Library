#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"
#include "../library/OKExternal.h"
#include "../library/LibraryVariables.h"
#include "../library/MarioKartObjects.h"
#include "../library/MarioKart3D.h"
#include "../library/Struct.h"
#include "../library/OKStruct.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"





void ObjectBehaviorWalk(OKObject* InputObject)
{
	objectVelocity[0] = 0;
	objectVelocity[1] = InputObject->ObjectData.velocity[1];
	objectVelocity[2] = 0.6;
	MakeAlignVector(objectVelocity, InputObject->ObjectData.angle[1]);
	InputObject->ObjectData.velocity[0] = objectVelocity[0];
	InputObject->ObjectData.velocity[1] = objectVelocity[1];
	InputObject->ObjectData.velocity[2] = objectVelocity[2];

	UpdateObjectGravity((Object*)&InputObject->ObjectData);
	UpdateObjectVelocity((Object*)&InputObject->ObjectData);	
	UpdateObjectBump((Object*)&InputObject->ObjectData);	
	if(InputObject->ObjectData.bump.distance_zx < 0)
	{
		InputObject->ObjectData.velocity[1] = 0;
	}	
}

void ObjectBehaviorWander(OKObject* InputObject)
{
	GlobalFloatA = (float)InputObject->InputParameter[0];
	GlobalFloatB = GlobalFloatA * 0.6;
	
	GlobalIntA = (InputObject->ObjectData.position[0] - InputObject->OriginPosition[0]);
	GlobalIntB = (InputObject->ObjectData.position[2] - InputObject->OriginPosition[2]);
	

	if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) < (GlobalFloatB * GlobalFloatB))
	{
		 InputObject->ProgramParameter[0] = 0;
	}
	
	
	if (InputObject->ProgramParameter[0] >= 1)
	{		
		objectPosition[0] = (float)InputObject->OriginPosition[0];
		objectPosition[1] = (float)InputObject->OriginPosition[1];
		objectPosition[2] = (float)InputObject->OriginPosition[2];
		GlobalShortA = (short)(CalcDirection(InputObject->ObjectData.position, objectPosition) * -1);
		
		
		
		GlobalShortA -= InputObject->ObjectData.angle[1];
		
		if (GlobalShortA > (DEG1 * 2))
		{
			InputObject->ObjectData.angle[1] += DEG1 * 2;
		}
		else if (GlobalShortA < -(DEG1 * 2))
		{
			InputObject->ObjectData.angle[1] -= DEG1 * 2;
		}


	}
	else
	{
		if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) > (GlobalFloatA * GlobalFloatA))
		{
			InputObject->ProgramParameter[0] = 1;
		}
		else
		{
			if (InputObject->ObjectData.counter > 0)
			{
				InputObject->ObjectData.counter--;
				loadFont();
				printStringNumber(10,GlobalShortD,"",InputObject->ObjectData.counter);
				
				switch (GlobalShortA)
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
				GlobalShortA = MakeRandomLimmit(4);
				InputObject->ObjectData.counter = MakeRandomLimmit(60) + 15;
			}
		}

	}
	ObjectBehaviorWalk(InputObject);
	
}



void ObjectBehaviorSearch(OKObject* InputObject)
{
	GlobalFloatA = InputObject->InputParameter[0];	
	GlobalIntA = (InputObject->ObjectData.position[0] - InputObject->OriginPosition[0]);
	GlobalIntB = (InputObject->ObjectData.position[2] - InputObject->OriginPosition[2]);
	
	switch (InputObject->ProgramParameter[1])
	{
		case(SUBBEHAVIOR_DOCILE):
		{
			if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) < (GlobalFloatA * GlobalFloatA))
			{
				GlobalShortA = (short)(CalcDirection(InputObject->ObjectData.position, objectPosition) * -1);
				GlobalShortA -= InputObject->ObjectData.angle[1];
				
				if ((GlobalShortA > (DEG1 * 45)) && (GlobalShortA < -(DEG1 * 45)))
				{
					InputObject->ProgramParameter[1] = SUBBEHAVIOR_SURPRISE;
					InputObject->Counter[0] = 30;
					InputObject->ObjectData.velocity[1] += 2;
				}
				else
				{
					ObjectBehaviorWander(InputObject);
				}
			}
			break;
		}
		case(SUBBEHAVIOR_SURPRISE):
		{
			InputObject->Counter[0]--;
			if (InputObject->Counter == 0)
			{
				InputObject->ProgramParameter[1] = SUBBEHAVIOR_CHASE;
			}
			break;
		}
		case(SUBBEHAVIOR_CHASE)
		{
			GlobalFloatA += GlobalFloatA * 0.5;
			if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) > (GlobalFloatA * GlobalFloatA))
			{
				InputObject->ProgramParameter[1] = SUBBEHAVIOR_DOCILE
			}
		}
	}

}

void Misbehave(OKObject* InputObject)
{
	
	switch (InputObject->BehaviorClass)
	{
		case BEHAVIOR_WANDER:
		{
			
			ObjectBehaviorWander(InputObject);
			break;
		}
	}
}
