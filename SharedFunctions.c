#include <sys/types.h>
#include <math.h>
#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "LibraryVariables.h"
#include "SubProgram.h"




void runDMA()
{
	DMA(*targetAddress, *sourceAddress, dataLength);
}
void runRAM()
{
	ramCopy(*targetAddress, *sourceAddress, dataLength);
}
void runMIO()
{
	decodeMIO0(*sourceAddress, *targetAddress);
}
void runTKM()
{
	decodeTKMK(*sourceAddress, tkmPoint, *targetAddress, 0xBE);
}


int GetRealAddress(int RSPAddress)
{
	RSPNumber = SegmentNumber(RSPAddress);
	RSPOffset = SegmentOffset(RSPAddress);
	return(PhysToK0(SegmentTable[RSPNumber] + RSPOffset));
}


void ResetObject()
{
	/*
	for(int thisLoop = 0; thisLoop < 4; thisLoop++)
	{
		for(int subLoop = 0; subLoop < 4; subLoop++)
		{
			AffineMatrix[thisLoop][subLoop] = 0;
		}
	}
	*/
	for(int thisLoop = 0; thisLoop < 3; thisLoop++)
	{
		objectPosition[thisLoop] = 0;
		objectAngle[thisLoop] = 0;
		objectVelocity[thisLoop] = 0;
	}
}




char* printHex(char *buf, int num, int nDigits) {
    //print hex number into buffer.
    //will zero-pad to specified number of digits.
    //will truncate numbers larger than specified length.
    //returns pointer to null terminator.
    char *bufEnd = &buf[nDigits];
    *bufEnd = 0;
    while(nDigits--) {
        buf[nDigits] = hex[num & 0xF];
        num >>= 4;
    }
    return bufEnd;
}
