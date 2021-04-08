#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"
#include "../library/OKExternal.h"
#include "../library/LibraryVariables.h"
#include "../library/PlayerEffects.h"
#include "../library/MarioKartObjects.h"
#include "../library/MarioKart3D.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"
#include "../RawAssets/ModelData/ModelData.h"
#include "../OverKart/OverKartVariables.h"

char EffectActive[8];

#define FastOoB			(char)251
#define MushroomBoost	(char)250
#define FeatherJump		(char)249
#define TornadoJump		(char)248
#define SpinOutSaveable	(char)247
#define SpinOut			(char)246
#define FailedStart		(char)245
#define GreenShellHit	(char)244
#define RedShellHit		(char)243
#define ObjectHit		(char)242
#define Shrunken		(char)241
#define StarMan			(char)240
#define Boo		    	(char)239
#define GetItem			(char)238



void GetSurfaceID()
{

	for (char playerID = 0; playerID < 8; playerID++)								// Loop for each racer
	{

		GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
		char SurfaceID = *(char*)(GlobalAddressA + 0xF9);
		int Index = playerID;
		if (*(char*)(GlobalAddressA) != 0x30)									// Only run for existing racers
		{

///////////////////////////////TELESA!!!///////////////////////////////

			if (SurfaceID == Boo)
			{
				EffectActive[Index] = SurfaceID;
				SetVSGhost((void*)(GlobalAddressA), playerID);
				continue;
			}
			if ((SurfaceID != Boo) && (EffectActive[Index] == Boo))
			{
				ResetVSGhost((void*)(GlobalAddressA), playerID);
			}

///////////////////////////////ENEMY JUGEMU!!!///////////////////////////////

			if (SurfaceID == FastOoB)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetFastOoB((void*)(GlobalAddressA), playerID);
				}
				continue;
			}

///////////////////////////////STARMAN!!!///////////////////////////////

			if (SurfaceID == StarMan)
			{
				EffectActive[Index] = SurfaceID;
				SetStarMan(playerID, true);
				continue;
			}
			if ((SurfaceID != StarMan) && (EffectActive[Index] == StarMan))
			{
				SetStarMan(playerID, false);
			}

///////////////////////////////TORNADO JAMP!!!///////////////////////////////

			if ((SurfaceID == TornadoJump))
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetStorm((void*)(GlobalAddressA), playerID);
				}
				continue;
			}

///////////////////////////////WING JUMP!!!///////////////////////////////

			if (SurfaceID == FeatherJump)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetWing((void*)(GlobalAddressA), playerID);
				}
				continue;
			}

///////////////////////////////THUNDERRR!!!///////////////////////////////

			if (SurfaceID == Shrunken)
			{
				EffectActive[Index] = SurfaceID;
				SetShrunken(playerID, true);
				continue;
			}
			if ((SurfaceID != Shrunken) && (EffectActive[Index] == Shrunken))
			{
				SetShrunken(playerID, false);
			}

///////////////////////////////KINOP BOOST!!!///////////////////////////////

			if (SurfaceID == MushroomBoost)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetTurbo((void*)(GlobalAddressA), playerID);
				}
				continue;
			}

///////////////////////////////SPIN PHEW!!!///////////////////////////////

			if (SurfaceID == SpinOutSaveable)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					SetSpinOutSaveable(playerID);
				}
				continue;
			}

///////////////////////////////SPIN OUT!!!///////////////////////////////

			if (SurfaceID == SpinOut)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					SetSpinOut(playerID);
				}
				continue;
			}

///////////////////////////////SPIIIIN!!!///////////////////////////////

			if (SurfaceID == FailedStart)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					SetFailedStart(playerID);
				}
				continue;
			}

///////////////////////////////SHELL HIT!!!///////////////////////////////

			if (SurfaceID == GreenShellHit)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					SetGreenShellHit(playerID);
				}
				continue;
			}

///////////////////////////////OBJECTS HIT!!!///////////////////////////////

			if (SurfaceID == ObjectHit)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					SetMapObjectHit(playerID);
				}
				continue;
			}

///////////////////////////////REDSHELL HIT!!!///////////////////////////////

			if (SurfaceID == RedShellHit)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					SetRedShellHit(playerID);
				}
				continue;
			}

///////////////////////////////ITEM GET!!!///////////////////////////////

			if (SurfaceID == GetItem)
			{
				if ((EffectActive[Index] != SurfaceID) && (*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xC2) == 0))
				{
					EffectActive[Index] = SurfaceID;
					RouletteStart(playerID,0);
				}
				continue;
			}

//FIN//		
			else
			{
				EffectActive[Index] = 0;	
			}
		}
	}
}

void PathEchoTrigger()
{
	#define pEchoArraySize  2											// Array size for the total amount of echo sections used.

	if (pEchoArraySize != 0)
	{
		char Echo[pEchoArraySize];
		short pEchoTrStart[pEchoArraySize];
		short pEchoTrEnd[pEchoArraySize];

		for (char playerID = 0; playerID < 4; playerID++)					// Loop for each racer		
		{
			GlobalAddressA = (long)(&g_playerPathPointTable) + (0x2 * playerID);
			short curEchoPoint = *(short*)(GlobalAddressA);

			GlobalAddressB = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
			if (*(char*)(GlobalAddressB) != 0x30)							// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pEchoArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					Echo[LoopVal] = 185;
					pEchoTrStart[LoopVal] = 10;
					pEchoTrEnd[LoopVal] = 35;

					if ((curEchoPoint >= pEchoTrStart[LoopVal]) && (curEchoPoint <= pEchoTrEnd[LoopVal]))			// Path range check
					{
						SetPlayerEcho(playerID, Echo[LoopVal]);
						break;
					}

					SetPlayerEcho(playerID, 0);	
				}
			}
		}	
	}
}

void PathColorTrigger()
{
	#define pColArraySize 2										// Array size for the total amount of color sections used.

	if (pColArraySize != 0)
	{
		int BodyColors[pColArraySize];
		short pColTrStart[pColArraySize];
		short pColTrEnd[pColArraySize];

		for (char playerID = 0; playerID < 8; playerID++)					// Loop for each racer		
		{
			GlobalAddressA = (long)(&g_playerPathPointTable) + (0x2 * playerID);
			short curPPoint = *(short*)(GlobalAddressA);

			GlobalAddressB = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);

			if (*(char*)(GlobalAddressB) != 0x30)							// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pColArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					BodyColors[LoopVal] = 0x007F0030;		
					pColTrStart[LoopVal] = 5;
					pColTrEnd[LoopVal] = 35;

					if ((curPPoint >= pColTrStart[LoopVal]) && (curPPoint <= pColTrEnd[LoopVal]))		// Path range check
					{
						GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
						MakeBodyColor( (void*)(GlobalAddressA), playerID, BodyColors[LoopVal], 1);
					}
				}
			}
		}	
	} 
}

void PathCamShiftTrigger()
{
	#define pCamArraySize 2											// Array size for the total amount of camera sections used.

	if (pCamArraySize != 0)
	{
		short pCamTrStart[pCamArraySize];
		short pCamTrEnd[pCamArraySize];

		for (char playerID = 0; playerID < 4; playerID++)						// Loop for each racer		
		{
			GlobalAddressA = (long)(&g_playerPathPointTable) + (0x2 * playerID);
			short curCamPoint = *(short*)(GlobalAddressA);

			GlobalAddressB = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
			if (*(char*)(GlobalAddressB) != 0x30)								// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pCamArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					pCamTrStart[LoopVal] = 40;
					pCamTrEnd[LoopVal] = 85;


					if ((curCamPoint >= pCamTrStart[LoopVal]) && (curCamPoint <= pCamTrEnd[LoopVal]))			// Path range check
					{
						SetCamShiftUp(playerID, 6);
						break;
					}

					SetCamShiftUp(playerID, 0);
				}
			}
		}	
	}
}

void GetPathPoints()
{
	if (g_gamePausedFlag == 0x00)
	{
		PathEchoTrigger();
		PathColorTrigger();
		PathCamShiftTrigger();
	}
}