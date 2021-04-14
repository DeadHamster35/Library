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


void ObjectBehaviorWander(OKObject* InputObject)
{
	GlobalFloatA = InputObject->Parameter * 0.65;
	Object *ObjectData = (Object*)(&InputObject->ObjectData);
	GlobalIntA = (ObjectData->position[0] - InputObject->OriginPosition[0]);
	GlobalIntB = (ObjectData->position[2] - InputObject->OriginPosition[2]);
	

	if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) < (GlobalFloatA * GlobalFloatA))
	{
		ObjectData->fparam = 0;
	}
	
	
	if (ObjectData->fparam >= 100)
	{		
		objectPosition[0] = (float)InputObject->OriginPosition[0];
		objectPosition[1] = (float)InputObject->OriginPosition[1];
		objectPosition[2] = (float)InputObject->OriginPosition[2];
		GlobalUShortA = CalcDirection(ObjectData->position, objectPosition) * -1;
		
		printStringNumber(0,GlobalShortD + 10,"",GlobalUShortA);
		
		GlobalUShortA -= (unsigned short)ObjectData->angle[1];
		


		
		printStringNumber(75,GlobalShortD,"",ObjectData->angle[1]);
		
		printStringNumber(75,GlobalShortD + 10,"",GlobalUShortA);
		if (GlobalUShortA > 0x8000)
		{
			ObjectData->angle[1] -= DEG1 * 2;
		}
		else
		{
			ObjectData->angle[1] += DEG1 * 2;
		}


	}
	else
	{
		if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) > (InputObject->Parameter * InputObject->Parameter))
		{
			ObjectData->fparam = 100;
		}
		/*
		if (InputObject->ObjectData.counter == 0)
		{
			InputObject->ObjectData.sparam = MakeRandomLimmit(3);
			InputObject->ObjectData.counter = MakeRandomLimmit(90);
		}
		else
		{
			InputObject->ObjectData.counter --;
		}

		switch(InputObject->ObjectData.sparam)
		{
			case 0:
			{
				
				break;
			}
			case 1:
			{
				GlobalUShortA = MakeRandomLimmit(3);				
				if (GlobalUShortA > 1)
				{
					InputObject->ObjectData.angle[1] += (short)(DEG1 / 10);
				}
				break;
			}
			case 2:
			{
				GlobalUShortA = MakeRandomLimmit(3);				
				if (GlobalUShortA > 1)
				{
					InputObject->ObjectData.angle[1] -= (short)(DEG1 / 10);
				}
				break;
			}
		}
		*/

	}
	
	
	
	objectVelocity[0] = 0;
	objectVelocity[1] = ObjectData->velocity[1];
	objectVelocity[2] = 1.0;
	MakeAlignVector(objectVelocity, ObjectData->angle[1]);
	ObjectData->velocity[0] = objectVelocity[0];
	ObjectData->velocity[1] = objectVelocity[1];
	ObjectData->velocity[2] = objectVelocity[2];

	UpdateObjectGravity(ObjectData);
	UpdateObjectVelocity(ObjectData);	
	UpdateObjectBump(ObjectData);	
	if(ObjectData->bump.distance_zx < 0)
	{
		ObjectData->velocity[1] = 0;
	}
	
	
}

void Misbehave(OKObject* InputObject)
{
	
	switch (InputObject->BehvaiorClass)
	{
		case BEHAVIOR_WANDER:
		{
			
			ObjectBehaviorWander(InputObject);
			break;
		}
	}
}
