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


void DrawBox(int X, int Y, int SizeX, int SizeY, int R, int G, int B, int A)
{
	GraphPtr = FillRect1ColorF(GraphPtr, X, Y, X + SizeX, Y + SizeY, R, G, B, A);
}

void printFloat(int X, int Y, float Value)
{

	int PrintOffset;

     int wholeNumber = (int) Value;
     int decimalNumber = (int) ((Value - wholeNumber) * 100);


     if (decimalNumber < 0)
     {
          decimalNumber = decimalNumber * -1;
     }

     if (wholeNumber >= 10)
     {
          if (wholeNumber >= 100)
          {
               if (wholeNumber >= 1000)
               {

                    PrintOffset = 48;
               }
               else
               {
                    PrintOffset = 40;
               }
          }
          else
          {
               PrintOffset = 32;
          }
     }
     else
     {
          PrintOffset = 24;
     }




     loadFont();


     printString(X + PrintOffset, Y, ".");
     PrintOffset = PrintOffset + 8;
     if (decimalNumber < 10)
     {
          printStringNumber(X+PrintOffset,Y,"",0);
          PrintOffset = PrintOffset + 8;
     }




     printStringNumber(X,Y,"",wholeNumber);
     printStringNumber(X+PrintOffset,Y,"",decimalNumber);



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

int numPlaces (int n) 
{
    if (n < 0) return 0;
    if (n < 10) return 1;
    if (n < 100) return 2;
    if (n < 1000) return 3;
    if (n < 10000) return 4;
    if (n < 100000) return 5;
    if (n < 1000000) return 6;
    if (n < 10000000) return 7;
    if (n < 100000000) return 8;
    return 9;
}

void DrawNumberSprite(int x, int y, int number)
{
	SprDrawClipST(x,y,8,16,number*8,0,1);
}

//Prints a value with right-handed number sprites
void printNumberSprite(int X, int Y, int Value)
{
	KWSprite(1000,1000,104,16,StockNumberSprites);

	char negativeVal = 0;

	if (Value < 0)
	{
		Value = Value*-1;
		negativeVal = 1;
	}

	int digit[9] = {
	((Value%10)),
	((Value%100)/10),
	((Value%1000)/100),
	((Value%10000)/1000),
	((Value%100000)/10000),
	((Value%1000000)/100000),
	((Value%10000000)/1000000),
	((Value%100000000)/10000000),
	((Value%1000000000)/100000000)
	};

	for (int index = 0; index < numPlaces(Value); index++)
	{
		DrawNumberSprite(X-9*index, Y, digit[index]);
		if (negativeVal == 1)
		{
			DrawNumberSprite(X-9*(numPlaces(Value)), Y+4, 11);
			DrawNumberSprite(X-9*(numPlaces(Value)), Y+4, 10);
			negativeVal = 0;
		}
	}
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
					    	//x,0,1,2,3,4,5,6,7
char CharacterConvert[9] = 	{-1,0,1,6,3,2,4,5,7};
char CharacterUnconvert[9] = 	{-1,0,1,4,3,5,6,2,7};