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

char FastOoB = 251;
char MushroomBoost = 250;
char FeatherJump = 249;
char TornadoJump = 248;
char SpinOut = 247;
char GreenShellHit = 246;
char RedShellHit = 245;
char ObjectHit = 244;
char Lightning = 243;
char StarMan = 242;
char Boo = 241;


char Test = 8;



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
			}
			if ((SurfaceID != Boo) && (EffectActive[Index] == Boo))
			{
				ResetVSGhost((void*)(GlobalAddressA), playerID);
			}

///////////////////////////////ENEMY JUGEMU!!!///////////////////////////////

			if (SurfaceID == FastOoB)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetFastOoB((void*)(GlobalAddressA), playerID);
				}
			}

///////////////////////////////STARMAN!!!///////////////////////////////

			if (SurfaceID == StarMan)
			{
				EffectActive[Index] = SurfaceID;
				SetStarMan(playerID, true);
			}
			if ((SurfaceID != StarMan) && (EffectActive[Index] == StarMan))
			{
				SetStarMan(playerID, false);
			}

///////////////////////////////TORNADO JAMP!!!///////////////////////////////

			if (SurfaceID == TornadoJump)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetStorm((void*)(GlobalAddressA), playerID);
				}
			}

///////////////////////////////WING JUMP!!!///////////////////////////////

			if (SurfaceID == FeatherJump)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetWing((void*)(GlobalAddressA), playerID);
				}
			}

///////////////////////////////THUNDERRR!!!///////////////////////////////

			if (SurfaceID == Lightning)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
					SetThunder((void*)(GlobalAddressA), playerID);
				}
			}

///////////////////////////////KINOP BOOST!!!///////////////////////////////

			if (SurfaceID == MushroomBoost)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					SetMushroomBoost(playerID);
				}
			}

///////////////////////////////SPIN OUT!!!///////////////////////////////

			if (SurfaceID == SpinOut)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					SetSpinOut(playerID);
				}
			}

///////////////////////////////SHELL HIT!!!///////////////////////////////

			if (SurfaceID == GreenShellHit)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					SetGreenShellHit(playerID);
				}
			}

///////////////////////////////OBJECTS HIT!!!///////////////////////////////

			if (SurfaceID == ObjectHit)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					SetMapObjectHit(playerID);
				}
			}

///////////////////////////////REDSHELL HIT!!!///////////////////////////////

			if (SurfaceID == RedShellHit)
			{
				if ((EffectActive[Index] != SurfaceID))
				{
					EffectActive[Index] = SurfaceID;
					SetRedShellHit(playerID);
				}
			}

			EffectActive[Index] = SurfaceID;	
		}
	}
}

void PathEchoTrigger()
{
	char pEchoArraySize = 2;											// Array size for the total amount of echo sections used.

	if (pEchoArraySize != 0)
	{
		char Echo[pEchoArraySize];
		short pEchoTrStart[pEchoArraySize];
		short pEchoTrEnd[pEchoArraySize];
		bool EffectActive[8];

		for (char playerID = 0; playerID < 4; playerID++)					// Loop for each racer		
		{
			GlobalAddressA = (long)(&g_playerPathPointTable) + (0x2 * playerID);
			short curPPoint = *(short*)(GlobalAddressA);

			GlobalAddressB = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
			int Index = playerID;
			if (*(char*)(GlobalAddressB) != 0x30)							// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pEchoArraySize; LoopVal++)
				{
																			// Fill out each index of the arrays with data from course. Loop value as offset multiplicator
					Echo[LoopVal] = 185;
					pEchoTrStart[LoopVal] = 90;
					pEchoTrEnd[LoopVal] = 155;

					if ((curPPoint >= pEchoTrStart[LoopVal]) && (curPPoint <= pEchoTrEnd[LoopVal]))			// Path range check
					{
						SetPlayerEcho(playerID, Echo[LoopVal]);
						EffectActive[Index] = true;
						return;
					}
					else if ((EffectActive[Index] == true))					// Set inactive 
					{
						SetPlayerEcho(playerID, 0);
						EffectActive[Index] = false;	
					}	
				}
			}
		}	
	}
}

void PathColorTrigger()
{
	char pColArraySize = 2;											// Array size for the total amount of color sections used.

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
																			// Fill out each index of the arrays with data from course. Loop value as offset multiplicator
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
	char pCamArraySize = 2;											// Array size for the total amount of camera sections used.

	if (pCamArraySize != 0)
	{
		short pCamTrStart[pCamArraySize];
		short pCamTrEnd[pCamArraySize];
		bool EffectActive[8];

		for (char playerID = 0; playerID < 4; playerID++)						// Loop for each racer		
		{
			GlobalAddressA = (long)(&g_playerPathPointTable) + (0x2 * playerID);
			short curPPoint = *(short*)(GlobalAddressA);

			GlobalAddressB = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
			int Index = playerID;
			if (*(char*)(GlobalAddressB) != 0x30)								// Only run for existing racers
			{
				for (int LoopVal = 0; LoopVal < pCamArraySize; LoopVal++)
				{
																				// Fill out each index of the arrays with data from course. Loop value as offset multiplicator
					pCamTrStart[LoopVal] = 40;
					pCamTrEnd[LoopVal] = 85;

					if ((curPPoint >= pCamTrStart[LoopVal]) && (curPPoint <= pCamTrEnd[LoopVal]))		// Path range check
					{
						SetCamShiftUp(playerID, 5);
						EffectActive[Index] = true;	
						return;
					}
					else if ((EffectActive[Index] == true))					// Set inactive 
					{
						SetCamShiftUp(playerID, 0);
						EffectActive[Index] = false;	
					}			
				}
			}
		}	
	}
}

void GetPathPoints()
{
	if (g_gamePausedFlag == 0x00)
	{
		PathColorTrigger();
		PathCamShiftTrigger();
		PathEchoTrigger();

	}
}