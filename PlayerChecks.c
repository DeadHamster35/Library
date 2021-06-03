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



#define Water_Water		(char)0
#define Water_Void		(char)1
#define Water_Lava		(char)2
#define Water_Ice		(char)3

bool IceSoundPlayed[8];

void CheckSplashRepl(char WaterType)
{	
	for (char playerID = 0; playerID < 8; playerID++)						// Loop for each racer
	{
		if (((GlobalPlayer[(int)playerID].flag & EXISTS) != 0) && (g_gamePausedFlag == 0x00))
		{
			if(!CustomWaterHeight)
			{
				g_waterlevelPlayer[(int)playerID] = CheckWaterLevel((void*)&GlobalPlayer[(int)playerID]);
			}
			if(WaterType != Water_Void || (HotSwapID == 0))
			{
				if(g_waterlevelPlayer[(int)playerID] >= (GlobalPlayer[(int)playerID].position[1]))
				{
					GlobalPlayer[(int)playerID].water_flag |= HALF_SUBMERGED;
				}

				else
				{
					GlobalPlayer[(int)playerID].water_flag &=~ HALF_SUBMERGED;
				}

				if((g_waterlevelPlayer[(int)playerID]-(GlobalPlayer[(int)playerID].position[1])) > (GlobalPlayer[(int)playerID].radius))
				{
					GlobalPlayer[(int)playerID].water_flag |= SUBMERGED;
					GlobalPlayer[(int)playerID].water_flag &=~ HALF_SUBMERGED;
				}

				else
				{
					GlobalPlayer[(int)playerID].water_flag &=~ SUBMERGED;
				}

				if((g_waterlevelPlayer[(int)playerID] - (GlobalPlayer[(int)playerID].position[1])) > (GlobalPlayer[(int)playerID].radius))
				{
					if((GlobalPlayer[(int)playerID].water_flag & SPLASH_START) != SPLASH_START)
					{
						GlobalPlayer[(int)playerID].water_flag |= SPLASH_DIVE;
						GlobalPlayer[(int)playerID].water_flag |= SPLASH_START;

						if((g_courseID != 6) && (g_courseID != 16) && (g_courseID != 13) && ((GlobalPlayer[(int)playerID].flag& EXISTS) != 0))
						{
							if(((g_courseID == 2) && (g_courseID == 19)) || WaterType == Water_Lava)
							{
								NAPlyTrgStart(playerID, 0x1900801c);
							}
							else
							{
								NAPlyTrgStart(playerID, 0x19008008);
							}
							if(HotSwapID > 0)
							{
								NAPlyTrgStart(playerID, 0x29008004 + (GlobalPlayer[(int)playerID].kart * 0x10));
							}
						}
					}
				}

				if((g_courseID == 6) || ((g_courseID == 16) && (g_courseID == 13)))
				{
					GlobalPlayer[(int)playerID].water_flag &=~ SPLASH_DIVE|SPLASH_START;
				}
			}

			if((g_waterlevelPlayer[(int)playerID] - (GlobalPlayer[(int)playerID].position[1])) > (GlobalPlayer[(int)playerID].radius) && ((GlobalPlayer[(int)playerID].bump.distance_zx) >= 600))
			{	
				GlobalPlayer[(int)playerID].jugemu_flag |= IS_IN_WATER;
			}

			if(GlobalPlayer[(int)playerID].bump.distance_zx >= 600)
			{
				GlobalPlayer[(int)playerID].jugemu_flag |= LAKITU_CAMERA;
			}

			else if((GlobalPlayer[(int)playerID].slip_flag & IS_IN_AIR) != 0)
			{
				GlobalPlayer[(int)playerID].jugemu_flag &=~ LAKITU_CAMERA;
			}

			if((GlobalPlayer[(int)playerID].flag & IS_CPU_PLAYER) && (OoBCheck(GlobalPlayer[(int)playerID].bump.last_zx) || (GlobalPlayer[(int)playerID].jugemu_flag & IS_IN_WATER)) && !(GlobalPlayer[(int)playerID].jugemu_flag & ON_LAKITU_ROD) && !(GlobalPlayer[(int)playerID].jugemu_flag & OUT_OF_BOUNDS) && !(GlobalPlayer[(int)playerID].slip_flag & ON_CENTER_LINE))
			{
				SetLakitu((void*)&GlobalPlayer[(int)playerID]);
				CallLakitu((void*)&GlobalPlayer[(int)playerID]);
			}

			if((GlobalPlayer[(int)playerID].flag & IS_CPU_PLAYER) && GlobalPlayer[(int)playerID].bump_status == 253 && !(GlobalPlayer[(int)playerID].slip_flag & IS_IN_AIR))
			{
				SetLakitu((void*)&GlobalPlayer[(int)playerID]);
				CallLakitu((void*)&GlobalPlayer[(int)playerID]);
			}

			LakituCheck((void*)&GlobalPlayer[(int)playerID], playerID);
		}
	}
}

void SetWaterType(char WaterType)
{
	if (g_startingIndicator >= 0x01 && g_startingIndicator <= 0x06)
	{
		CheckSplashRepl(WaterType);

		if(WaterType != 0 && HotSwapID != 0)
		{
			for (char playerID = 0; playerID < 8; playerID++)						// Loop for each racer
			{
				if (((GlobalPlayer[(int)playerID].flag & EXISTS) != 0) && (g_gamePausedFlag == 0x00))
				{
					switch (WaterType)
					{
						case Water_Void:
						{	
							if((g_waterlevelPlayer[(int)playerID] - GlobalPlayer[(int)playerID].position[1]) > (GlobalPlayer[(int)playerID].radius))
							{
								for (int i = 0; i < 10; i++)
								{
									GlobalPlayer[(int)playerID].gass[i].flag = 0;
									GlobalPlayer[(int)playerID].letter[i].flag = 0;
									GlobalPlayer[(int)playerID].smoke[i].flag = 0;
									GlobalPlayer[(int)playerID].spark[i].flag = 0;
								}
							}
							if((GlobalPlayer[0].jugemu_flag & ON_LAKITU_ROD) != 0)
							{
								SetAnimWaterDrip(0,0);
							}
							break;
						}

						case Water_Lava:
						{
							if(((GlobalPlayer[(int)playerID].jugemu_flag & LAKITU_CAMERA) != 0))
							{
								if(((GlobalPlayer[(int)playerID].jugemu_flag & IS_IN_WATER) == 0) && ((GlobalPlayer[(int)playerID].jugemu_flag & ON_LAKITU_ROD) == 0) && ((GlobalPlayer[(int)playerID].slip_flag & IS_STAR) == 0))
								{
									SetPlayerColor(playerID,0x00340000,0x00004040,1.5);
								}
							}
							if(((GlobalPlayer[(int)playerID].water_flag & SUBMERGED) != 0) || ((GlobalPlayer[(int)playerID].water_flag & HALF_SUBMERGED) != 0))
							{
								SetAnimSmoking(playerID,1);
							}
							if((GlobalPlayer[(int)playerID].water_flag & SPLASH_START) != 0)
							{
								for (int i = 0; i < 10; i++)
								{
									if(GlobalPlayer[(int)playerID].gass[i].number == 5)
									{
										GlobalPlayer[(int)playerID].gass[i].swork1 = 0xFF;
										GlobalPlayer[(int)playerID].gass[i].swork2 = 0;
										GlobalPlayer[(int)playerID].gass[i].swork3 = 0;
										GlobalPlayer[(int)playerID].gass[i].swork4 = 0xFF;
									}
									if(GlobalPlayer[(int)playerID].gass[i].number == 3)
									{
										GlobalPlayer[(int)playerID].gass[i].swork1 = 0xFF;
										GlobalPlayer[(int)playerID].gass[i].swork2 = 0x3F;
										GlobalPlayer[(int)playerID].gass[i].swork3 = 0x3F;
										GlobalPlayer[(int)playerID].gass[i].swork4 = 0xFF;
									}
								}
							} //8018D430 Sprite Mempointer
						break;
						}

						case Water_Ice:
						{
							if(((GlobalPlayer[(int)playerID].water_flag & SUBMERGED) != 0) && ((GlobalPlayer[(int)playerID].jugemu_flag & ON_LAKITU_ROD) != 0))
							{
								GlobalPlayer[(int)playerID].jugemu_flag |= IS_FROZEN;
								SetAnimWaterDrip(playerID,0);
							}

							if(((GlobalPlayer[(int)playerID].jugemu_flag & ON_LAKITU_ROD) != 0) && ((GlobalPlayer[(int)playerID].water_flag & SUBMERGED) != 0) && !IceSoundPlayed[(int)playerID])
							{
								IceSoundPlayed[(int)playerID] = true;
								GlobalPlayer[(int)playerID].jugemu_flag |= HAS_ICE_CUBE;
								NAPlyTrgStart(playerID, 0x1900a055);
							}

							if((GlobalPlayer[(int)playerID].jugemu_timer >= 125) && ((GlobalPlayer[(int)playerID].jugemu_flag & OUT_OF_BOUNDS) != 0) && ((GlobalPlayer[(int)playerID].jugemu_flag & HAS_ICE_CUBE) != 0))
							{
								NAPlyTrgStart(playerID, 0x1900a056);

								GlobalPlayer[(int)playerID].jugemu_flag ^= OUT_OF_BOUNDS;
								GlobalPlayer[(int)playerID].jugemu_flag ^= HAS_ICE_CUBE;
								IceSoundPlayed[(int)playerID] = false;
							}

							if(((GlobalPlayer[(int)playerID].jugemu_flag & IS_FROZEN) != 0) && ((GlobalPlayer[(int)playerID].accelcount) > 270))
							{
								GlobalPlayer[(int)playerID].jugemu_flag ^= IS_FROZEN;
							}
						break;
						}

						default:
						{				
							break;
						}
					}	
				}
			}
		}
	}
}

void NopSplashCheckCode() //Run at custom code init
{
	CheckSplashJAL1 = 0;
	CheckSplashJAL2 = 0;
	CheckSplashJAL3 = 0;
}

bool EffectStarBGM[4];
bool EffectFinalLapBGM[4];
bool FinalLapActive;
bool FinalLapAnim[4];

void EffectBGMReplace()
{
	if (g_startingIndicator < 0x03)
	{
		for (int EfL = 0; EfL < 4; EfL++)
		{
			EffectStarBGM[EfL] = false;
			EffectFinalLapBGM[EfL] = false;
			FinalLapActive = false;
			FinalLapAnim[EfL] = false;
		}
	}

	if (g_startingIndicator == 0x03)
	{
		if (EffectStarBGM[0] || EffectStarBGM[1] || EffectStarBGM[2] || EffectStarBGM[3] || FinalLapAnim[0] || FinalLapAnim[1] || FinalLapAnim[2] || FinalLapAnim[3])
		{
			switch (g_musicUserVolumeFlag)
			{
				case 0:
				case 1:
				{
					NAMusicVolume(75);
					break;
				}
				case 2:
				{
					NAMusicVolume(0);
					break;
				}
				default:
				{				
					break;
				}	
			}
		}
		else if (!EffectStarBGM[0] || !EffectStarBGM[1] || !EffectStarBGM[2] || !EffectStarBGM[3] || !FinalLapAnim[0] || !FinalLapAnim[1] || !FinalLapAnim[2] || !FinalLapAnim[3])
		{
			switch (g_musicUserVolumeFlag)
			{
				case 0:
				{
					NAMusicVolume(127);
					break;
				}
				case 1:
				{
					NAMusicVolume(75);
					break;
				}
				case 2:
				{
					NAMusicVolume(0);
					break;
				}
				default:
				{				
					break;
				}	
			}
		}

		for (char playerID = 0; playerID < g_playerCount; playerID++)
		{
			if (((GlobalPlayer[(int)playerID].flag & IS_PLAYER) != 0) && ((GlobalPlayer[(int)playerID].flag & IS_GHOST) == 0) && (g_gamePausedFlag == 0x00))
			{
				if ((g_GameLapTable[(int)playerID] == 2) && (!FinalLapActive))
				{
					FinalLapActive = true;
					g_musicTempo = g_musicTempo * 1.25;
				}
				if ((AnimatedLakituStruct[(int)playerID].event_flag == LAKITU_LAPFINAL))
				{
					FinalLapAnim[(int)playerID] = true;
				}
				if ((AnimatedLakituStruct[(int)playerID].event_flag != LAKITU_LAPFINAL))
				{
					FinalLapAnim[(int)playerID] = false;
				}
			}
		}

		for (char playerID = 0; playerID < 4; playerID++)
		{
			if (((GlobalPlayer[(int)playerID].flag & IS_PLAYER) != 0) && (g_gamePausedFlag == 0x00))
			{
				if ((GlobalPlayer[(int)playerID].slip_flag & IS_STAR) != 0)
				{
					if (!EffectStarBGM[(int)playerID])
					{
						EffectStarBGM[(int)playerID] = true;
						NaPlyLevelStart(playerID,0x0100ff2c);
					}
					continue;
				}
				if (((GlobalPlayer[(int)playerID].slip_flag & IS_STAR) == 0) && EffectStarBGM[(int)playerID])
				{
					EffectStarBGM[(int)playerID] = false;
					NaPlyLevelStop(playerID,0x0100ff2c);
					NAPlyVoiceStart(playerID, 0x29008008 + (GlobalPlayer[(int)playerID].kart * 0x10));
					continue;
				}
			}

			if (((GlobalPlayer[(int)playerID].flag & IS_PLAYER) != 0) && ((GlobalPlayer[(int)playerID].flag & IS_GHOST) == 0) && (g_gamePausedFlag == 0x00))
			{
				if ((g_GameLapTable[(int)playerID] == 2))
				{
					if (!EffectFinalLapBGM[(int)playerID])
					{
						EffectFinalLapBGM[(int)playerID] = true;
						NaPlyLevelStart(playerID,0x1900ff3a);
					}
					continue;
				}
			}
		}
	}
	if (g_gameMode == 3 && g_playerCount >= 3 && g_startingIndicator == 5)
	{
		NAMusicVolume(0);
	}	
}

void NopPlayEffectBGMCode() //Run at custom code init
{
	CheckFinalLapFanfareJAL = 0;
	CheckPlayStarBGMJAL = 0;
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
			if(((GlobalPlayer[(int)playerID].flag & IS_PLAYER) != 0) && ((GlobalPlayer[(int)playerID].flag & IS_GHOST) == 0))			// Only run for existing racers
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
			if (((GlobalPlayer[(int)playerID].flag & EXISTS) != 0) && ((GlobalPlayer[(int)playerID].slip_flag & IS_STAR) == 0))			// Only run for existing racers
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
						MakeBodyColor((void*)&GlobalPlayer[(int)playerID], playerID, BodyColors[LoopVal], 1);
						MakeBodyColorAdjust((void*)&GlobalPlayer[(int)playerID], playerID, BodyColorsAdj[LoopVal], 1);
					}
				}
			}
		}	
	} 
}

void PathCamShiftTrigger()
{
	#define pCamArraySize 2									// Array size for the total amount of camera sections used. Pull from course data

	short pCamTrStart[pCamArraySize];
	short pCamTrEnd[pCamArraySize];

	for (char playerID = 0; playerID < 4; playerID++)						// Loop for each racer		
	{
		if ((GlobalPlayer[(int)playerID].flag & EXISTS) != 0)				// Only run for existing racers
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

void PathNoSimpleKartTrigger()
{
	#define pSArraySize 2									// Array size for the total amount of CPU process sections used. Pull from course data

	short pSTrStart[pSArraySize];
	short pSTrEnd[pSArraySize];

	for (char playerID = 0; playerID < 8; playerID++)						// Loop for each racer		
	{
		if ((GlobalPlayer[(int)playerID].flag & EXISTS) != 0)				// Only run for existing racers
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

void PathLakituRescue()
{
	for (int playerID = 0; playerID < 4; playerID++)										// Loop for each racer		
	{
		if(((GlobalPlayer[(int)playerID].flag & IS_PLAYER) != 0) && ((GlobalPlayer[(int)playerID].flag & IS_GHOST) == 0) && (g_gamePausedFlag == 0x00))
		{
			if(((GlobalPlayer[(int)playerID].jumpcount) == 0) && ((char)((GlobalPlayer[(int)playerID].jugemu_flag) == 0))) // Grounded? Lakitu?
			{
				if((unsigned char)(GlobalPlayer[(int)playerID].bump_status) != 0xFE) 					// RR Boost?
				{
					if((unsigned char)(GlobalPlayer[(int)playerID].bump_status) != 0xFC) 				// DKJP Boost?
					{
						g_playerPathPointCopy[playerID] = g_playerPathPointTable[playerID]; 			// Make copy of current path point
					}
				}
			}
			if((char)((GlobalPlayer[(int)playerID].jugemu_flag) != 0)) 						// Lakitu picks you up?
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