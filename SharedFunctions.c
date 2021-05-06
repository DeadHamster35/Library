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

ushort GetRGBA16(int R, int G, int B, int A)
{

	return (R & 0x1F)<<11 | (G & 0x1F)<<6 | (B & 0x1F)<<1 | (A & 0x01);
}

void SetFontColor(int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB)
{
	ushort *ColorValues = (ushort*)&g_DebugTextPalette;
	ColorValues[0] = 0; //0000 transparent
	ColorValues[1] = GetRGBA16(FontR,FontG,FontB,1);
	ColorValues[2] = GetRGBA16(ShadowR,ShadowG,ShadowB,1);
	ColorValues[3] = 1; //0001 black
}


bool CheckPlatform()
{
	// This is an abuse of the memory quirks between Console and Emulator.

	// We're unsure of yet the exact cause
	// Emulators have extremely fast memory access and no latency, that may be the cause.
	// Either way, this can detect if a legitimate console is running and return TRUE if so.
	
	*targetAddress = 0x80744000;
	*sourceAddress = 0x30;
	dataLength = 0xC;
	runDMA();
	*targetAddress = 0x8074400C;
	*sourceAddress = *sourceAddress + 0xC;
	runDMA(); 


	
	if (*(long*)(0x80744014) == 0x40804800)
	{
		return false;    //EMULATOR
	}
	else
	{
		return true;    //CONSOLE
	}
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


char ReturnStringLength(long stringAddress)
{
	GlobalCharE = 0;
	GlobalCharA = *(char*)stringAddress;
	if(GlobalCharA != 0)
	{
		do
		{
			++GlobalCharE;
			GlobalCharA = (*(char*)(stringAddress + GlobalCharE));
		}
		while (GlobalCharA != 0);
	}
	return(GlobalCharE);
}

char CharacterConvert[9] = {-1,0,1,6,3,2,4,5,7};