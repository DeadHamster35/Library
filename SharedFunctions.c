#include <sys/types.h>
#include <math.h>
#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "../library/OKHeader.h"
#include "../library/OKExternal.h"
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

char ReturnStringLength(char *stringAddress)
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


///////////////Nice Font///////////////

void loadNiceFont()
{
	*sourceAddress = (int)(&NiceFontROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x4400;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&nicefont);
	runMIO();
}



void PrintNiceText(int posx, int posy, float scale, char *text)
{
	char *FontString = text;


	for (int i = 0; i < ReturnStringLength(text); i++)
	{
		if (text[i] < 33)
		{
			continue;
		}

		if (text[i] > 127)
		{
			continue;
		}
		if (text[i] >= 97 && text[i] <= 122)
		{
			if (scale == 1 || scale == 0)
			{
				KWSprite(posx+i*7,posy,8,16,(nicefont+0x80*(FontString[i]-64)-0x80));
			}
			else
			{
				KWSprite(0,0,0,0,nicefont);
				KWSpriteScale(posx+i*8*scale,posy,scale,(nicefont+0x80*(FontString[i]-64)-0x80),8,16);
			}
			continue;
		}
		if (text[i] >= 123 && text[i] <= 127)
		{
			if (scale == 1 || scale == 0)
			{
				KWSprite(posx+i*7,posy,8,16,(nicefont+0x80*(FontString[i]-58)-0x80));
			}
			else
			{
				KWSprite(0,0,0,0,nicefont);
				KWSpriteScale(posx+i*8*scale,posy,scale,(nicefont+0x80*(FontString[i]-58)-0x80),8,16);
			}
			continue;
		}			
		else
		{
			if (scale == 1 || scale == 0)
			{
				KWSprite(posx+i*7,posy,8,16,(nicefont+0x80*(FontString[i]-32)-0x80));
			}
			else
			{
				KWSprite(0,0,0,0,nicefont);
				KWSpriteScale(posx+i*8*scale,posy,scale,(nicefont+0x80*(FontString[i]-32)-0x80),8,16);
			}
		}
	}
}



void PrintNiceTextNumber(int posx, int posy, float scale, char *text, int value)
{
	PrintNiceText(posx, posy, scale, text);

	char negativeVal = 0;

	if (value < 0)
	{
		value = value*-1;
		negativeVal = 1;
	}

	int digit[9] = {
	((value%10)),
	((value%100)/10),
	((value%1000)/100),
	((value%10000)/1000),
	((value%100000)/10000),
	((value%1000000)/100000),
	((value%10000000)/1000000),
	((value%100000000)/10000000),
	((value%1000000000)/100000000)
	};




	char valstring[50];
	for (int a = 0; a < 50; a++)
	{
		valstring[a] = 32;
	}
	
	for (int i = 0; i < numPlaces(value); i++)
	{
		if (i > 9)
		{
			continue;
		}
		valstring[i] = (digit[numPlaces(value)-1-i] + 48);
	}

	PrintNiceText((scale*14)+posx+(ReturnStringLength(text))*7*scale, posy, scale, valstring);		

	if (negativeVal == 1)
	{
		PrintNiceText((scale*7)+posx+(ReturnStringLength(text))*7*scale, posy, scale, "-");
		negativeVal = 0;
	}
}


///////////////HUD Buttons///////////////

void loadHudButtons()
{
	*sourceAddress = (int)(&HudButtonsROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x4400;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&hud_buttons);
	runMIO();
}


void SpriteBtnA(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x100));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x100),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,hud_buttons);
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,hud_buttons,16,16);
		}
		break;
	}
}

void SpriteBtnB(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x300));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x300),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x200));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x200),16,16);
		}
		break;
	}
}

void SpriteBtnStart(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x500));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x500),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x400));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x400),16,16);
		}
		break;
	}
}

void SpriteBtnCUp(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x700));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x700),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x600));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x600),16,16);
		}
		break;
	}
}

void SpriteBtnCDown(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x900));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x900),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x800));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x800),16,16);
		}
		break;
	}
}

void SpriteBtnCLeft(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0xB00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0xB00),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0xA00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0xA00),16,16);
		}
		break;
	}
}

void SpriteBtnCRight(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0xD00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0xD00),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0xC00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0xC00),16,16);
		}
		break;
	}
}

void SpriteBtnL(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0xF00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0xF00),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0xE00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0xE00),16,16);
		}
		break;
	}
}

void SpriteBtnR(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1100));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1100),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1000));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1000),16,16);
		}
		break;
	}
}

void SpriteBtnZ(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1300));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1300),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1200));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1200),16,16);
		}
		break;
	}
}


void SpriteBtnDUp(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1500));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1500),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1400));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1400),16,16);
		}
		break;
	}
}

void SpriteBtnDDown(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1700));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1700),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1600));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1600),16,16);
		}
		break;
	}
}

void SpriteBtnDLeft(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1900));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1900),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1800));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1800),16,16);
		}
		break;
	}
}

void SpriteBtnDRight(int posx, int posy, float scale, bool pressed)
{
	switch (pressed)
	{
	case true:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1B00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1B00),16,16);
		}
		break;
	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1A00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1A00),16,16);
		}
		break;
	}
}

void SpriteBtnDMid(int posx, int posy, float scale)
{

	if (scale == 1 || scale == 0)
	{
		KWSprite(posx,posy,16,16,(hud_buttons+0x1C00));
	}
	else
	{
		KWSprite(0,0,0,0,hud_buttons);
		KWSpriteScale(posx,posy,scale,(hud_buttons+0x1C00),16,16);
	}
}

//Direction: 0-Mid; 1-Up; 2-Down; 3-Left; 4-Right
void SpriteAnalogStick(int posx, int posy, float scale, char direction)
{
	switch (direction)
	{
	case 1: //UP
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1E00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1E00),16,16);
		}
		break;
	case 2: //DOWN
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1F00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1F00),16,16);
		}
		break;
	case 3: //LEFT
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x2000));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x2000),16,16);
		}
		break;
	case 4: //RIGHT
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x2100));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x2100),16,16);
		}
		break;	
	default:
		if (scale == 1 || scale == 0)
		{
			KWSprite(posx,posy,16,16,(hud_buttons+0x1D00));
		}
		else
		{
			KWSprite(0,0,0,0,hud_buttons);
			KWSpriteScale(posx,posy,scale,(hud_buttons+0x1D00),16,16);
		}
		break;
	}
}

					    	//x,0,1,2,3,4,5,6,7
char CharacterConvert[9] = 	{-1,0,1,6,3,2,4,5,7};
char CharacterUnconvert[9] = 	{-1,0,1,4,3,5,6,2,7};