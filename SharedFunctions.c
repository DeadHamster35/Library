#include "MainInclude.h"



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

void loadEEPROM(uint Destination)
{
	osEepromLongRead((void*)(0x8014F0B8), 0, (uchar*)(Destination), 512);
}
void saveEEPROM(uint Source)
{
	osEepromLongWrite((void*)(0x8014F0B8), 0, (uchar*)Source, 512);
}

ushort GetRGBA16(int R, int G, int B, int A)
{

	return (R & 0x1F)<<11 | (G & 0x1F)<<6 | (B & 0x1F)<<1 | (A & 0x01);
}

uint GetRGB32(int R, int G, int B)
{
	return ( (R << 16) | (G << 8) | (B));
}

void SetFontColor(int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB)
{
	ushort *ColorValues = (ushort*)&g_DebugTextPalette;
	ColorValues[0] = 0; //0000 transparent
	ColorValues[1] = GetRGBA16(FontR,FontG,FontB,1);
	ColorValues[2] = GetRGBA16(ShadowR,ShadowG,ShadowB,1);
	ColorValues[3] = 1; //0001 black
}



int LoadData (int SourceInput, int SizeData)
{
	*sourceAddress = SourceInput;
	*targetAddress = FreeSpaceAddress;
	dataLength = SizeData;
	GlobalShortA = 16 - (SizeData % 16);
	FreeSpaceAddress = FreeSpaceAddress + SizeData + GlobalShortA;
	runDMA();	
	return *targetAddress;
}

/* Get Status Timer */

uint getStarTimer(uchar playerID)
{
    return (int)g_gameTimer-g_StarUseCounter[playerID];
}

uint getBooTimer(uchar playerID)
{
    return (int)g_gameTimer-g_GhostUseCounter[playerID];
}

//Returns custom course number
short CustomLevelID()
{
    if (HotSwapID == 0)
    {
        return -1;
    }
    else
    {
		switch (g_cupSelect)
		{
		case 0:
			return (g_courseSelect + (16 * (HotSwapID-1)));
			break;
		case 1:
			return ((g_courseSelect+4) + (16 * (HotSwapID-1)));
			break;
		case 2:
			return ((g_courseSelect+8) + (16 * (HotSwapID-1)));
			break;
		case 3:
			return ((g_courseSelect+12) + (16 * (HotSwapID-1)));
			break;
		default:
			return -1;
			break;
		}
        
    }
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


bool CheckEmulator()
{
	// This is an abuse of the memory quirks between Console and Emulator.

	// We're unsure of yet the exact cause
	// Emulators have extremely fast memory access and no latency, that may be the cause.
	// Either way, this can detect if a legitimate console is running and return TRUE if so.
	
	
	
	*sourceAddress = 0xBFFFFC;
	*targetAddress = 0x80744000;
	dataLength = 8;
	runDMA();
	*sourceAddress = *(uint*)0x80744000;

	*targetAddress = 0x80744010;
	dataLength = 0x8;
	runDMA();
	
	if (*(int*)(0x80744010) == 0)
	{
		return false;    //MUPEN
	}
	else
	{
		return true;    //PROJECT64
	}
}


void loadNiceFont()
{
	*sourceAddress = (int)(&NiceFontROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x5000;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&nicefont);
	runMIO();
}

void loadBigFont()
{
	*sourceAddress = (int)(&BigFontROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x5000;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&nicefont);
	runMIO();
}

void ShiftVertColor(uint address,uint counter,uint v_buff,char alpha,char red,char green,char blue)
{
	uint number= SegmentNumber(address);
	uint offset= SegmentOffset(address);
	Vtx_t  *vt=(Vtx_t *)GetRealAddress(SegmentTable[number]+offset);
	int i;
	for(i=0;i<counter;i++)
	{
		vt->cn[0]+=red;
		vt->cn[1]+=green;
		vt->cn[2]+=blue;		
		vt->cn[3]+=alpha;
		++vt;
	}	
}

int GetRealAddress(int RSPAddress)
{
	RSPNumber = SegmentNumber(RSPAddress);
	RSPOffset = SegmentOffset(RSPAddress);
	return(PhysToK0(SegmentTable[RSPNumber] + RSPOffset));
}


void DrawBox(int X, int Y, int SizeX, int SizeY, int R, int G, int B, int A)
{
	GraphPtr = FillRect1ColorF(GraphPtr, X, Y, X + SizeX, Y + SizeY, R, G, B, A);
}

void printFloat(int X, int Y, float Value)
{

	int PrintOffset;

	wholeNumber = (int) Value;
	decimalNumber = (int) ((Value - wholeNumber) * 100);
	
	PrintOffset = 8;


	GlobalIntA = wholeNumber;
	if (GlobalIntA < 0)
	{
		GlobalIntA *= -1;
	}
     if (GlobalIntA > 10)
	{
		PrintOffset = 16;
		if (GlobalIntA > 100)
		{
			PrintOffset = 24;
			if (GlobalIntA > 1000)
			{
				PrintOffset = 32;
			}			
		}
	}
	if (decimalNumber < 0)
	{
		decimalNumber *= -1;
	}
	

     loadFont();


	if (wholeNumber < 0)
	{
     	X -= 8;
		PrintOffset += 8;
	}

	printStringNumber(X,Y,"",wholeNumber);
		
	printString(X + PrintOffset + 10, Y, ".");		
	if (decimalNumber < 10)
	{
		printStringNumber(X+PrintOffset + 8,Y,"",0);
		PrintOffset += 8;
	}
	printStringNumber(X+PrintOffset + 8,Y,"",decimalNumber);
     



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

					    	//x,0,1,2,3,4,5,6,7
char CharacterConvert[9] = 	{-1,0,1,6,3,2,4,5,7};
char CharacterUnconvert[9] = 	{-1,0,1,4,3,5,6,2,7};