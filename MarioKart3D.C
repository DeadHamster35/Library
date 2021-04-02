#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "SharedFunctions.h"
#include "LibraryVariables.h"


void DrawGeometryScale(float localPosition[], short localAngle[], int localAddress, float localScale)
{

	CreateModelingMatrix(AffineMatrix,localPosition,localAngle);
	ScalingMatrix(AffineMatrix,localScale);
	if(SetMatrix(AffineMatrix,0) == 0)
	{
		return;
	}
	{

		*(long*)*graphPointer = (long)(0xB7000000);
		*graphPointer = *graphPointer + 4;
		*(long*)*graphPointer = (long)(0x00000200);
		*graphPointer = *graphPointer + 4;
		*(long*)*graphPointer = (long)(0xB6000000);
		*graphPointer = *graphPointer + 4;
		*(long*)*graphPointer = (long)(0x00020000);
		*graphPointer = *graphPointer + 4;
		*(long*)*graphPointer = (long)(0x06000000);
		*graphPointer = *graphPointer + 4;
		*(long*)*graphPointer = (long)(localAddress);
		*graphPointer = *graphPointer + 4;
	}
}

void DrawGeometry(float objectPosition[], short objectAngle[], int F3DEXAddress)
{
	DrawGeometryScale(objectPosition,objectAngle,F3DEXAddress, 1.0);
}

void DrawPaths(long RSPInput)
{
	GlobalAddressA = GetRealAddress(RSPInput);
	GlobalAddressB = 0x0D001780;

	do
	{
		objectAngle[0] = *(short*)(GlobalAddressA);
		objectAngle[1] = *(short*)(GlobalAddressA + 2);
		objectAngle[2] = *(short*)(GlobalAddressA + 4);

		if (objectPosition[0] == 0xFFFF8000)
		{
			break;
		}
		else
		{
			objectPosition[0] = (float)objectAngle[0];
			objectPosition[1] = (float)objectAngle[1];
			objectPosition[2] = (float)objectAngle[2];
			DrawGeometry(objectPosition,objectAngle,GlobalAddressB);
		}
		GlobalAddressA = GlobalAddressA + 8;
	} while (true);

}
