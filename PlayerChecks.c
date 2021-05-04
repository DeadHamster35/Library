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

	for (char playerID = 0; playerID < 8; playerID++)						// Loop for each racer
	{
		char SurfaceID = (char)(GlobalPlayer[(int)playerID]->bump_status);
		if ((GlobalPlayer[(int)playerID]->flag & 32768) != 0)				// Only run for existing racers
		{
			if (g_startingIndicator < 3)									// Reset at race start
			{
				SurfaceID = 0;
				EffectActive[(int)playerID] = 0;
				continue;
			}

///////////////////////////////TELESA!!!///////////////////////////////

			if (SurfaceID == Boo)
			{
				EffectActive[(int)playerID] = SurfaceID;
				SetGhostEffect(playerID, true);
				continue;
			}
			if ((SurfaceID != Boo) && (EffectActive[(int)playerID] == Boo))
			{
				SetGhostEffect(playerID, false);
			}

///////////////////////////////ENEMY JUGEMU!!!///////////////////////////////

			if (SurfaceID == FastOoB)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetFastOoB((void*)GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////STARMAN!!!///////////////////////////////

			if (SurfaceID == StarMan)
			{
				EffectActive[(int)playerID] = SurfaceID;
				SetStarMan(playerID, true);
				continue;
			}
			if ((SurfaceID != StarMan) && (EffectActive[(int)playerID] == StarMan))
			{
				SetStarMan(playerID, false);
			}

///////////////////////////////TORNADO JAMP!!!///////////////////////////////

			if ((SurfaceID == TornadoJump))
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetStorm((void*)GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////WING JUMP!!!///////////////////////////////

			if (SurfaceID == FeatherJump)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetWing((void*)GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////THUNDERRR!!!///////////////////////////////

			if (SurfaceID == Shrunken)
			{
				EffectActive[(int)playerID] = SurfaceID;
				SetShrunken(playerID, true);
				continue;
			}
			if ((SurfaceID != Shrunken) && (EffectActive[(int)playerID] == Shrunken))
			{
				SetShrunken(playerID, false);
			}

///////////////////////////////KINOP BOOST!!!///////////////////////////////

			if (SurfaceID == MushroomBoost)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetTurbo((void*)GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////SPIN PHEW!!!///////////////////////////////

			if (SurfaceID == SpinOutSaveable)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetSpinOutSaveable(playerID);
				}
				continue;
			}

///////////////////////////////SPIN OUT!!!///////////////////////////////

			if (SurfaceID == SpinOut)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetSpinOut(playerID);
				}
				continue;
			}

///////////////////////////////SPIIIIN!!!///////////////////////////////

			if (SurfaceID == FailedStart)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetFailedStart(playerID);
				}
				continue;
			}

///////////////////////////////SHELL HIT!!!///////////////////////////////

			if (SurfaceID == GreenShellHit)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetGreenShellHit(playerID);
				}
				continue;
			}

///////////////////////////////OBJECTS HIT!!!///////////////////////////////

			if (SurfaceID == ObjectHit)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetMapObjectHit(playerID);
				}
				continue;
			}

///////////////////////////////REDSHELL HIT!!!///////////////////////////////

			if (SurfaceID == RedShellHit)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetRedShellHit(playerID);
				}
				continue;
			}

///////////////////////////////ITEM GET!!!///////////////////////////////

			if (SurfaceID == GetItem)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID]->jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					RouletteStart(playerID,0);
				}
				continue;
			}

//FIN//		
			else
			{
				EffectActive[(int)playerID] = 0;	
			}
		}
	}
}

void PathEchoTrigger()
{
	char pEchoArraySize = 2;									// Array size for the total amount of echo sections used. Pull from course data

	if (pEchoArraySize != 0)
	{
		char Echo[pEchoArraySize];
		short pEchoTrStart[pEchoArraySize];
		short pEchoTrEnd[pEchoArraySize];

		for (char playerID = 0; playerID < 4; playerID++)					// Loop for each racer		
		{
			if ((GlobalPlayer[(int)playerID]->flag & 32768) != 0)			// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pEchoArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					Echo[LoopVal] = 185;
					pEchoTrStart[LoopVal] = 10;
					pEchoTrEnd[LoopVal] = 35;

					if ((g_playerPathPointTable[(int)playerID] >= pEchoTrStart[LoopVal]) && (g_playerPathPointTable[(int)playerID] <= pEchoTrEnd[LoopVal]))		// Path range check
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
	char pColArraySize = 2;								// Array size for the total amount of color sections used. Pull from course data

	if (pColArraySize != 0)
	{
		int BodyColors[pColArraySize];
		int BodyColorsAdj[pColArraySize];
		short pColTrStart[pColArraySize];
		short pColTrEnd[pColArraySize];

		for (char playerID = 0; playerID < 8; playerID++)					// Loop for each racer		
		{
			if ((GlobalPlayer[(int)playerID]->flag & 32768) != 0)			// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pColArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					BodyColors[LoopVal] = 0x007F0030;		
					BodyColorsAdj[LoopVal] = 0x0000A0D0;		
					pColTrStart[LoopVal] = 5;
					pColTrEnd[LoopVal] = 35;

					if ((g_playerPathPointTable[(int)playerID] >= pColTrStart[LoopVal]) && (g_playerPathPointTable[(int)playerID] <= pColTrEnd[LoopVal]))	// Path range check
					{
						MakeBodyColor((void*)GlobalPlayer[(int)playerID], playerID, BodyColors[LoopVal], 1);
						MakeBodyColorAdjust((void*)GlobalPlayer[(int)playerID], playerID, BodyColorsAdj[LoopVal], 1);
					}
				}
			}
		}	
	} 
}

void PathCamShiftTrigger()
{
	char pCamArraySize = 2;									// Array size for the total amount of camera sections used. Pull from course data

	if (pCamArraySize != 0)
	{
		short pCamTrStart[pCamArraySize];
		short pCamTrEnd[pCamArraySize];

		for (char playerID = 0; playerID < 4; playerID++)						// Loop for each racer		
		{
			if ((GlobalPlayer[(int)playerID]->flag & 32768) != 0)				// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pCamArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					pCamTrStart[LoopVal] = 40;
					pCamTrEnd[LoopVal] = 85;


					if ((g_playerPathPointTable[(int)playerID] >= pCamTrStart[LoopVal]) && (g_playerPathPointTable[(int)playerID] <= pCamTrEnd[LoopVal]))		// Path range check
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

void PathNoSimpleKartTrigger()
{
	char pSArraySize = 2;									// Array size for the total amount of CPU process sections used. Pull from course data

	if (pSArraySize != 0)
	{
		short pSTrStart[pSArraySize];
		short pSTrEnd[pSArraySize];

		for (char playerID = 0; playerID < 8; playerID++)						// Loop for each racer		
		{
			if ((GlobalPlayer[(int)playerID]->flag & 32768) != 0)				// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pSArraySize; LoopVal++)
				{
				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
					pSTrStart[LoopVal] = 40;
					pSTrEnd[LoopVal] = 150;


					if ((g_playerPathPointTable[(int)playerID] >= pSTrStart[LoopVal]) && (g_playerPathPointTable[(int)playerID] <= pSTrEnd[LoopVal]))		// Path range check
					{
						g_noSimpleKartFlag[(int)playerID] = 1;
						break;
					}
						g_noSimpleKartFlag[(int)playerID] = 0;
				}
			}
		}	
	}
}

void PathLakituRescue()
{
	for (int playerID = 0; playerID < 8; playerID++)										// Loop for each racer		
	{

		if(((GlobalPlayer[(int)playerID]->jumpcount) == 0) && ((char)((GlobalPlayer[(int)playerID]->jugemu_flag) == 0))) // Grounded? Lakitu?
		{
			if((unsigned char)(GlobalPlayer[(int)playerID]->bump_status) != 0xFE) 					// RR Boost?
			{
				if((unsigned char)(GlobalPlayer[(int)playerID]->bump_status) != 0xFC) 				// DKJP Boost?
				{
					g_playerPathPointCopy[playerID] = g_playerPathPointTable[playerID]; 			// Make copy of current path point
				}
			}
		}
		if((char)((GlobalPlayer[(int)playerID]->jugemu_flag) != 0)) 						// Lakitu picks you up?
		{																					// Copy back to real path point
			if(g_playerPathPointTable[playerID] < (g_playerPathPointCopy[playerID]))
			{
				g_playerPathPointTable[playerID] = (g_playerPathPointCopy[playerID] + 1);
				continue;
			}
			if(g_playerPathPointTable[playerID] > (g_playerPathPointCopy[playerID]))
			{
				g_playerPathPointTable[playerID] = (g_playerPathPointCopy[playerID] - 2);
				continue;
			}
			else
			{
				g_playerPathPointTable[playerID] = (g_playerPathPointCopy[playerID]);
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
		PathNoSimpleKartTrigger();
		PathLakituRescue();
	}
}