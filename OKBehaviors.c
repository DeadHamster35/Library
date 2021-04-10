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


void ObjectBehaviorWander(Object* InputObject, float OriginPoint[3], short radius)
{
	GlobalIntA = (OriginPoint[0] - InputObject->position[0]);
	GlobalIntB = (OriginPoint[2] - InputObject->position[2]);
	if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) > (radius * radius))
	{
		InputObject->counter = 1;
	}
	if ((GlobalIntA * GlobalIntA) + (GlobalIntB * GlobalIntB) < ((radius * 0.65) * (radius * 0.65)))
	{
		InputObject->counter = 0;
	}
	

	if (InputObject->counter == 1)
	{		
		GlobalShortA = CalcDirection(InputObject->position, OriginPoint);
		if (InputObject->angle[1] > GlobalShortA)
		{
			InputObject->angle[1] -= DEG1 * 3;
		}
		else if (InputObject->angle[1] < GlobalShortA)
		{
			InputObject->angle[1] += DEG1 * 3;
		}
	}
	else
	{
		GlobalUShortA = MakeRandomLimmit(3);
		switch(GlobalUShortA)
		{
			case 1:
			{
				break;
			}
			case 2:
			{
				GlobalUShortA = MakeRandomLimmit(3);				
				InputObject->angle[1] += DEG1 * GlobalUShortA;
				break;
			}
			case 3:
			{
				GlobalUShortA = MakeRandomLimmit(3);				
				InputObject->angle[1] -= DEG1 * GlobalUShortA;
				break;
			}
		}
	}
}
