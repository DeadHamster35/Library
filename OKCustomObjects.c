#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"
#include "../library/OKExternal.h"
#include "../library/LibraryVariables.h"
#include "../library/PlayerEffects.h"
#include "../library/MarioKartObjects.h"
#include "../library/MarioKart3D.h"
#include "../library/Struct.h"
#include "../library/OKStruct.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"
#include "../RawAssets/ModelData/ModelData.h"


/*
81020000 03E0
81020002 0008
81020004 2400
81021244 03E0
81021246 0008
81021248 2400*/




void Draw3DRacer()
{
	/*
	if (renderMode[2] == 0)
	{
		spriteKillA = 0x27BDFFA0;
		spriteKillB = 0xAFBF;
		spriteKillC = 0x27BDFFE8;
		spriteKillD = 0xAFBF;
	}
	else
	{
		
		spriteKillA = 0x03E00008;
		spriteKillB = 0x2400;
		spriteKillC = 0x03E00008;
		spriteKillD = 0x2400;
		




		GlobalAddressB = (long)&bowserLOD0;
		GlobalAddressA = (long)(&g_PlayerStateTable);

		baseTurn = *(short*)(GlobalAddressA + 46);
		addTurn = *(short*)(GlobalAddressA + 192);

		objectPosition[0] = *(float*)(GlobalAddressA + 20);
		objectPosition[1] = *(float*)(GlobalAddressA + 24) - 5;
		objectPosition[2] = *(float*)(GlobalAddressA + 28);
		objectAngle[2] = baseTurn + addTurn;
		objectAngle[0] = 0x3FFF - *(short*)(GlobalAddressA + 518) * 2;
		objectAngle[1] = *(short*)(GlobalAddressA + 80) * -2;

		DrawGeometryScale(objectPosition,objectAngle,GlobalAddressB, 0.08);
	}

	*/
}

int RedCoinCollide(void *Car, void *Coin)
{
	GlobalAddressA = *(long*)(&Coin);
	objectPosition[0] = *(float*)(GlobalAddressA + 24);
	objectPosition[1] = *(float*)(GlobalAddressA + 28);
	objectPosition[2] = *(float*)(GlobalAddressA + 32);
	int playerID = (*(long*)&Car - (long)&g_PlayerStateTable) / 0xDD8;
	if ((CollisionSphere(Car,Coin) == 1) && (playerID == 0))
	{
		*targetAddress = 0x353500FF;
		deleteObjectBuffer(Coin);
		NAPlyTrgStart(playerID, 0x49008017);  //coin sfx
		CoinCount++;
		if (CoinCount != 8)
		{
			playrandmCharacterSFX(playerID);
		}
		SetAnimMusicNote(playerID);
		ChangeMaxSpeed(playerID, 2);
	}
	if (CoinCount == 8)
	{
		SetStar(Car,playerID);
		NAPlyTrgStart(playerID, 0x1900F103);  //goal in sfx
		CoinCount++;
	}

	return(0);
}



void CollideObject(void *Camera, void *Object)
{
	objectIndex = (short)((*(long*)(*(long*)(&Object)) >> 16) & 0x0000FFFF);
	switch (objectIndex)
	{
		case 47:
		{
			RedCoinCollide(Camera,Object);

			break;
		}
		default:
		{
			break;
		}
	}
}

void DisplayCoinSprite()
{

			for(int currentSprite = 1; (currentSprite <= CoinCount) & (currentSprite <= 8); currentSprite++)
			{
				KWSprite((currentSprite* 4) + 30,220,16,16,(short*)&ok_RedCoinSprite);
			}

			if ((CoinCount != 0) && (CoinCount < 8))
			{
				KWSprite(21,219,16,16,(short*)&lit_numberSpriteX);
				KWSprite(11,219,16,16,(short*)&lit_numberSprite+(CoinCount*0x100));
				return;
			}
			if (CoinCount >= 8)
			{
				KWSprite(21,219,16,16,(short*)&lit_numberSpriteX);
				KWSprite(11,219,16,16,(short*)&lit_numberSprite8);
			}
 
}

void DisplayObject(void *Camera, Object *InputObject)
{
	return;
}


void loadCoin()
{
	SetSegment(8,(int)(&ok_ModelData));
	*sourceAddress = (int)(&ModelDataStart);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = (int)ModelData_CompressedSize;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&ok_ModelData);
	runMIO();
	//
	//
	*sourceAddress = (int)(&RCSpriteROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x204;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&ok_RedCoinSprite);
	runMIO();
}





void DrawOKObject(OKObject InputHeader)
{
	*targetAddress = (long)&InputHeader;
	*sourceAddress = InputHeader.ModelAddress;
	*tempPointer = InputHeader.Parameter;
	DrawGeometryScale(InputHeader.ObjectData.position,InputHeader.ObjectData.angle,InputHeader.ModelAddress,InputHeader.ModelScale);
}


short FindOKObject()
{
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{
		
		if(OKObjectHeaders[CurrentObject].Parameter == 0)
		{
			return (short)CurrentObject;
		}
	}
	return -1;
}

void ClearOKObject(short ObjectID)
{
	OKObjectHeaders[ObjectID].Parameter = 0;
	OKObjectHeaders[ObjectID].ModelScale = 0;
	OKObjectHeaders[ObjectID].ModelAddress = 0;
	OKObjectHeaders[ObjectID].BehvaiorClass = 0;
	OKObjectHeaders[ObjectID].OriginPosition[0] = 0;
	OKObjectHeaders[ObjectID].OriginPosition[1] = 0;
	OKObjectHeaders[ObjectID].OriginPosition[2] = 0;
	OKObjectHeaders[ObjectID].ObjectData.position[0] = 0;
	OKObjectHeaders[ObjectID].ObjectData.position[1] = 0;
	OKObjectHeaders[ObjectID].ObjectData.position[2] = 0;	
	OKObjectHeaders[ObjectID].ObjectData.angle[0] = 0;
	OKObjectHeaders[ObjectID].ObjectData.angle[1] = 0;
	OKObjectHeaders[ObjectID].ObjectData.angle[2] = 0;
	OKObjectHeaders[ObjectID].ObjectData.velocity[0] = 0;
	OKObjectHeaders[ObjectID].ObjectData.velocity[1] = 0;
	OKObjectHeaders[ObjectID].ObjectData.velocity[2] = 0;
	OKObjectHeaders[ObjectID].ObjectData.radius = 0;
	OKObjectHeaders[ObjectID].ObjectData.sparam = 0;
	OKObjectHeaders[ObjectID].ObjectData.fparam = 0;
	OKObjectHeaders[ObjectID].ObjectData.flag = 0;
	OKObjectHeaders[ObjectID].ObjectData.counter = 0;
	OKObjectHeaders[ObjectID].ObjectData.category = 0;
}


void RedCoinChallenge(long PathOffset)
{
	for (int currentCoin = 0; currentCoin < 8; currentCoin++)
	{		
		CoinPositions[currentCoin][0] = *(short*)(PathOffset);
		CoinPositions[currentCoin][1] = *(short*)(PathOffset + 2);
		CoinPositions[currentCoin][2] = *(short*)(PathOffset + 4);
		
		if (CoinPositions[currentCoin][0] == 0xFFFF8000)
		{
			if (currentCoin < 7)
			{
				return; //if there's not 8 coins don't run the function.
			}
			else
			{
				break;
			}
		}
		PathOffset = PathOffset + 8;
	}

	//two loops for above return; ensure 8 coins.

	for (int currentCoin = 0; currentCoin < 8; currentCoin++)
	{
		GlobalShortA = FindOKObject();
		ClearOKObject(GlobalShortA);
		OKObjectHeaders[GlobalShortA].Parameter = 1;
		OKObjectHeaders[GlobalShortA].ObjectData.position[0] = (float)CoinPositions[currentCoin][0];
		OKObjectHeaders[GlobalShortA].ObjectData.position[1] = (float)CoinPositions[currentCoin][1];
		OKObjectHeaders[GlobalShortA].ObjectData.position[2] = (float)CoinPositions[currentCoin][2];
		OKObjectHeaders[GlobalShortA].ObjectData.radius = 9;
		OKObjectHeaders[GlobalShortA].ObjectData.flag = 0xC000;
		OKObjectHeaders[GlobalShortA].ModelAddress = (unsigned long)&RedCoin;
		OKObjectHeaders[GlobalShortA].ModelScale = 0.10;		
	}


}





void CheckOKObjects()
{
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{
		if(OKObjectHeaders[CurrentObject].Parameter != 0)
		{
			DrawOKObject(OKObjectHeaders[CurrentObject]);
		}
	}
}