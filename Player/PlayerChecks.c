#include "../MainInclude.h"





//bool IceSoundPlayed[8];

void SetLapIndex()
{
    short LapMax = 3;

    if (HotSwapID > 0)
    {
        LapMax = OverKartHeader.LapCount;
    }
    if ((LapMax > 9) || (LapMax < 1))
    {
        LapMax = 3;
        OverKartHeader.LapCount = 3;
    }


    int Players = g_playerCount;
    if (g_gameMode == GAMEMODE_GP)
    {
        Players = 8;
    }
    for (int ThisPlayer = 0; ThisPlayer < Players; ThisPlayer++)
    {
        *GlobalLap[ThisPlayer] = 2 - LapMax;
    }
}
void CheckSplashRepl(char WaterType)
{	
	for (char playerID = 0; playerID < 8; playerID++)
	{
		if (((GlobalPlayer[(int)playerID].flag & EXISTS)) && (g_gamePausedFlag == 0x00))
		{
			if(!CustomWaterHeight[(int)playerID])
			{
				g_waterlevelPlayer[(int)playerID] = CheckWaterLevel((void*)&GlobalPlayer[(int)playerID]);
			}
			if(WaterType != ZVOID || (HotSwapID == 0))
			{
				if(g_waterlevelPlayer[(int)playerID] >= (GlobalPlayer[(int)playerID].position[1]))
				{
					SET_FLAG(GlobalPlayer[(int)playerID].water_flag,HALF_SUBMERGED);
				}

				else
				{
					CLR_FLAG(GlobalPlayer[(int)playerID].water_flag,HALF_SUBMERGED);
				}

				if((g_waterlevelPlayer[(int)playerID]-(GlobalPlayer[(int)playerID].position[1])) > (GlobalPlayer[(int)playerID].radius))
				{
					SET_FLAG(GlobalPlayer[(int)playerID].water_flag,SUBMERGED);
					CLR_FLAG(GlobalPlayer[(int)playerID].water_flag,HALF_SUBMERGED);
				}

				else
				{
					CLR_FLAG(GlobalPlayer[(int)playerID].water_flag,SUBMERGED);
				}

				if((g_waterlevelPlayer[(int)playerID] - (GlobalPlayer[(int)playerID].position[1])) > (GlobalPlayer[(int)playerID].radius))
				{
					if(!(GlobalPlayer[(int)playerID].water_flag&SPLASH_START))
					{
						SET_FLAG(GlobalPlayer[(int)playerID].water_flag,SPLASH_DIVE);
						SET_FLAG(GlobalPlayer[(int)playerID].water_flag,SPLASH_START);

						if((g_courseID != 6) && (g_courseID != 16) && (g_courseID != 13) && ((GlobalPlayer[(int)playerID].flag&IS_PLAYER)))
						{
							if(((g_courseID == 2) && (g_courseID == 19)) || WaterType == ZLAVA)
							{
								NAPlyTrgStart(playerID, 0x1900801c);
							}
							else if (WaterType != ZVOID)
							{
								NAPlyTrgStart(playerID, 0x19008008);
							}
							if(HotSwapID > 0 && ((GlobalPlayer[(int)playerID].flag&IS_PLAYER)))
							{
								NAPlyTrgStart(playerID, 0x29008004 + (GlobalPlayer[(int)playerID].kart * 0x10));
							}
						}
					}
				}

				if((g_courseID == 6) || ((g_courseID == 16) && (g_courseID == 13)))
				{
					CLR_FLAG(GlobalPlayer[(int)playerID].water_flag,SPLASH_DIVE);
					CLR_FLAG(GlobalPlayer[(int)playerID].water_flag,SPLASH_START);
				}
			}

			if((g_waterlevelPlayer[(int)playerID] - (GlobalPlayer[(int)playerID].position[1])) > (GlobalPlayer[(int)playerID].radius) && ((GlobalPlayer[(int)playerID].bump.distance_zx) >= 600))
			{	
				SET_FLAG(GlobalPlayer[(int)playerID].jugemu_flag,IS_IN_WATER);
			}

			if(GlobalPlayer[(int)playerID].bump.distance_zx >= 600)
			{
				SET_FLAG(GlobalPlayer[(int)playerID].jugemu_flag,LAKITU_CAMERA);
			}

			else if(!(GlobalPlayer[(int)playerID].slip_flag&IS_IN_AIR))
			{
				CLR_FLAG(GlobalPlayer[(int)playerID].jugemu_flag,LAKITU_CAMERA);
			}

			if((GlobalPlayer[(int)playerID].flag&IS_CPU_PLAYER) && (OoBCheck(GlobalPlayer[(int)playerID].bump.last_zx) || (GlobalPlayer[(int)playerID].jugemu_flag&IS_IN_WATER)) && !(GlobalPlayer[(int)playerID].jugemu_flag&ON_LAKITU_ROD) && !(GlobalPlayer[(int)playerID].jugemu_flag&OUT_OF_BOUNDS) && !(GlobalPlayer[(int)playerID].slip_flag&ON_CENTER_LINE))
			{
				SetLakitu((void*)&GlobalPlayer[(int)playerID]);
				CallLakitu((void*)&GlobalPlayer[(int)playerID]);
			}

			if((GlobalPlayer[(int)playerID].flag&IS_CPU_PLAYER) && GlobalPlayer[(int)playerID].bump_status == 253 && !(GlobalPlayer[(int)playerID].slip_flag&IS_IN_AIR))
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

	if (WaterType == ZICE && HotSwapID != 0)
	{
		LakituIceBehavior = (LakituIceBehavior & 0xFFFF0000) + (0 & 0x0000FFFF);
	}
	else
	{
		LakituIceBehavior = (LakituIceBehavior & 0xFFFF0000) + (12 & 0x0000FFFF);
	}
	
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
						case ZVOID:
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

						case ZLAVA:
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
							}
						break;
						}
/* Using stock function instead
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
*/
						case ZHOTSTUFF:
						{
							if((g_waterlevelPlayer[(int)playerID] - GlobalPlayer[(int)playerID].position[1]) > 0 - (GlobalPlayer[(int)playerID].radius))
							{
								GlobalPlayer[(int)playerID].position[1] = g_waterlevelPlayer[(int)playerID] + (GlobalPlayer[(int)playerID].radius) + 1;
								GlobalPlayer[(int)playerID].jugemu_flag |= LAVA_EFFECT;
								LavaFloorBumpCount[(int)playerID]++;
								LavaFloorRecoilRequired[(int)playerID] = true;
							}
							
							if (LavaFloorBumpCount[(int)playerID] >= 4)
							{
								CallLakitu(&GlobalPlayer[(int)playerID]);
							}

							
							//LavaFloorBumpCount[PlayerIndex] += 1;



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
	if (g_gameMode == GAMEMODE_BATTLE && g_playerCount >= 3 && g_startingIndicator == 5)
	{
		NAMusicVolume(0);
	}	
}

void NopPlayEffectBGMCode() //Run at custom code init
{
	CheckFinalLapFanfareJAL = 0;
	CheckPlayStarBGMJAL = 0;
}

void CheckJugemuMarker()
{
    //this sucks.
	//timing issue.
	//duplicate loops
    if (HotSwapID == 0)
    {
        return;
    }

	if (OverKartRAMHeader.EchoOffset != 0)
	{
		GlobalIntA = *(int*)OverKartRAMHeader.EchoOffset;
		if (GlobalIntA != 0)
		{
			GlobalAddressA = OverKartRAMHeader.EchoOffset + 4;
			OKPathStruct* PathValues = (OKPathStruct*)GlobalAddressA;	
			for (int playerID = 0; playerID < 8; playerID++)					// Loop for each racer		
			{
				if (!(GlobalPlayer[(int)playerID].flag&EXISTS))					// Only run for existing racers
				{
					continue;
				}
				if (GlobalPlayer[0].jugemu_flag == 0)
				{
					continue;
				}

				for (int ThisValue = 0; ThisValue < GlobalIntA; ThisValue++)
				{		
					if (PathValues[ThisValue].Type == PATH_JUMP)
					{	
						if ((g_playerPathPointTable[(int)playerID] >= PathValues[ThisValue].PathStart) && (g_playerPathPointTable[(int)playerID] <= PathValues[ThisValue].PathStop))		// Path range check
						{		
							g_playerPathPointTable[playerID] = PathValues[ThisValue].PathStart;					
						}
					}
				}
			}
	
		}
	}	
}

short LastAIPath = 0;
void CheckPaths()
{	
	
	Toggle3DSnow = 1; // set to 0 by default.

	if (OverKartRAMHeader.EchoOffset != 0)
	{
		GlobalIntA = *(int*)OverKartRAMHeader.EchoOffset;
		if (GlobalIntA != 0)
		{
			GlobalAddressA = OverKartRAMHeader.EchoOffset + 4;
			OKPathStruct* PathValues = (OKPathStruct*)GlobalAddressA;		
			for (int playerID = 0; playerID < 8; playerID++)					// Loop for each racer		
			{	
				if (!(GlobalPlayer[(int)playerID].flag&EXISTS))					// Only run for existing racers
				{
					continue;
				}
						
				SetPlayerEcho(playerID, 0);
				SetCamShiftUp(playerID, 0);
				g_noSimpleKartFlag[(int)playerID] = 0;
				GlobalPlayer[(int)playerID].talk &= ~0x2; // Unused talk flag
				for (int ThisValue = 0; ThisValue < GlobalIntA; ThisValue++)
				{				
					if ((g_playerPathPointTable[(int)playerID] >= PathValues[ThisValue].PathStart) && (g_playerPathPointTable[(int)playerID] <= PathValues[ThisValue].PathStop))		// Path range check
					{		
						switch (PathValues[ThisValue].Type)
						{
							case (PATH_ECHO):
							{	
								SetPlayerEcho(playerID, PathValues[ThisValue].Power);
								break;
							}
							case (PATH_COLOR):
							{	
								uint BodyColor = GetRGB32(PathValues[ThisValue].ColorR,PathValues[ThisValue].ColorG,PathValues[ThisValue].ColorB);
								uint AdjColor = GetRGB32(PathValues[ThisValue].AdjColorR,PathValues[ThisValue].AdjColorG,PathValues[ThisValue].AdjColorB);
								MakeBodyColor((void*)&GlobalPlayer[(int)playerID], playerID, BodyColor , 1);
								MakeBodyColorAdjust((void*)&GlobalPlayer[(int)playerID], playerID, AdjColor, 1);
								break;
							}
							case (PATH_CAMERA):
							{
								SetCamShiftUp(playerID, PathValues[ThisValue].Power);
								break;
							}
							case (PATH_NOSIMPLE):
							{							
								g_noSimpleKartFlag[(int)playerID] = 1;
								break;
							}
							case (PATH_AIRCONTROL):
							{							
								GlobalPlayer[(int)playerID].talk |= 0x2; // Unused talk flag
								break;
							}
							case (PATH_WEATHER):
							{
								if (playerID == 0)
								{
									Toggle3DSnow = 1;
								}
								
								break;
							}
						}
					}
				}	
			}
		}
	}

	
	if (OverKartHeader.PathCount > 1)
	{
		//Check Player Lap
		for (int ThisPlayer = 0; ThisPlayer < 8; ThisPlayer++)
		{
			if (GlobalPlayer[ThisPlayer].flag & IS_CPU_PLAYER)
			{	
				if (CPUPaths[ThisPlayer].LastLap != GlobalPlayer[ThisPlayer].rap)
				{
					CPUPaths[ThisPlayer].LastLap = GlobalPlayer[ThisPlayer].rap;
					CPUPaths[ThisPlayer].LastPath = CPUPaths[ThisPlayer].CurrentPath;
					GlobalBoolA = false;

					//Loop until valid path. Max 100 checks.
					for (int This = 0; This < 100; This++)
					{
						GlobalShortA = MakeRandomLimmit(OverKartHeader.PathCount);

						if (GlobalShortA > OverKartHeader.PathCount)
						{
							GlobalShortA = OverKartHeader.PathCount;
						}

						if (OverKartHeader.PathSplit != 1)
						{
							break;
						}
						
						if (GlobalShortA != LastAIPath)
						{
							LastAIPath = GlobalShortA;
							break;
						}
					}
					//Assign new path. 
					CPUPaths[ThisPlayer].CurrentPath = GlobalShortA;
					
				}
				if (CPUPaths[ThisPlayer].CurrentPath == -1)
				{
					CPUPaths[ThisPlayer].CurrentPath = 0;
				}
				CurrentPathID[ThisPlayer] = CPUPaths[ThisPlayer].CurrentPath;
			}
			else
			{
				//human player
				//check surface and assign path.
				if (CPUPaths[ThisPlayer].LastLap != GlobalPlayer[ThisPlayer].rap)
				{
					CPUPaths[ThisPlayer].LastLap = GlobalPlayer[ThisPlayer].rap;
					CurrentPathID[ThisPlayer] = 0;
				}

			}
		}
	}

}


short CalcOGAAreaSubBP_Wrapper(float mx, float my, float mz, ushort t_group, int *b_num_ptr)
{
    if (HotSwapID == 0)
    {
        return CalcOGAAreaSubBP(mx, my, mz, t_group, b_num_ptr);
    }

    short       ClosestMarker = -1, BestMarker = -1;
    float       BestDistance = 9999999.0f;
    float       ClosestDistance = 9999999.0f;
    short       ClosestPath = 0, BestPath = 0;
    float       Work = 0.0f;

    short LocalPathCount = OverKartHeader.PathCount;        
    short* PathLengths = (short*)&PathLengthTable[0];
    

    for (int ThisPath = 0; ThisPath < LocalPathCount; ThisPath++)
    {
        Marker* Point = (Marker*)GetRealAddress(PathTable[0][ThisPath]);
        for (int ThisMark = 0; ThisMark < PathLengths[ThisPath]; ThisMark++)
        {
            Work = 
            (
                (mx - Point[ThisMark].Position[0]) * (mx - Point[ThisMark].Position[0]) + 
                (my - Point[ThisMark].Position[1]) * (my - Point[ThisMark].Position[1]) + 
                (mz - Point[ThisMark].Position[2]) * (mz - Point[ThisMark].Position[2])
            );
            if (Work < ClosestDistance)
            {
                ClosestDistance = Work;
                ClosestPath = ThisPath;
                ClosestMarker = ThisMark;
            }
            
            if ((Point[ThisMark].Group == t_group) && (Work < BestDistance))
            {
                BestDistance = Work;
                BestPath = ThisPath;
                BestMarker = ThisMark;
            }
        }
    }

    if (BestMarker == -1)
    {
        *b_num_ptr = ClosestPath;
        return ClosestMarker;
    }
    *b_num_ptr = BestPath;
    return BestMarker;
}


void SetBalloonColor(int PlayerIndex, int R, int G, int B, int AdjR, int AdjG, int AdjB)
{
	
	BalloonColorArray[GlobalPlayer[PlayerIndex].kart].R = R;
	BalloonColorArray[GlobalPlayer[PlayerIndex].kart].G = G;
	BalloonColorArray[GlobalPlayer[PlayerIndex].kart].B = B;
	BalloonAdjustArray[GlobalPlayer[PlayerIndex].kart].R = AdjR;
	BalloonAdjustArray[GlobalPlayer[PlayerIndex].kart].G = AdjG;
	BalloonAdjustArray[GlobalPlayer[PlayerIndex].kart].B = AdjB;

	BalloonColorArrayB[GlobalPlayer[PlayerIndex].kart].R = R;
	BalloonColorArrayB[GlobalPlayer[PlayerIndex].kart].G = G;
	BalloonColorArrayB[GlobalPlayer[PlayerIndex].kart].B = B;
	BalloonAdjustArrayB[GlobalPlayer[PlayerIndex].kart].R = AdjR;
	BalloonAdjustArrayB[GlobalPlayer[PlayerIndex].kart].G = AdjG;
	BalloonAdjustArrayB[GlobalPlayer[PlayerIndex].kart].B = AdjB;

}


void SetBalloonDefaults()
{
	
	for (int ThisPlayer = 0; ThisPlayer < 8; ThisPlayer++)
	{
		BalloonColorArray[ThisPlayer].R = stockBalloonColors[ThisPlayer].R;
		BalloonColorArray[ThisPlayer].G = stockBalloonColors[ThisPlayer].G;
		BalloonColorArray[ThisPlayer].B = stockBalloonColors[ThisPlayer].B;
		BalloonAdjustArray[ThisPlayer].R = stockAdjustColors[ThisPlayer].R;
		BalloonAdjustArray[ThisPlayer].G = stockAdjustColors[ThisPlayer].G;
		BalloonAdjustArray[ThisPlayer].B = stockAdjustColors[ThisPlayer].B;

		BalloonColorArrayB[ThisPlayer].R = stockBalloonColors[ThisPlayer].R;
		BalloonColorArrayB[ThisPlayer].G = stockBalloonColors[ThisPlayer].G;
		BalloonColorArrayB[ThisPlayer].B = stockBalloonColors[ThisPlayer].B;
		BalloonAdjustArrayB[ThisPlayer].R = stockAdjustColors[ThisPlayer].R;
		BalloonAdjustArrayB[ThisPlayer].G = stockAdjustColors[ThisPlayer].G;
		BalloonAdjustArrayB[ThisPlayer].B = stockAdjustColors[ThisPlayer].B;
	}

}


void SetBalloonTeams()
{
	if (TeamMode == 0)
	{
		SetBalloonDefaults();
		return;
	}
	for (int ThisPlayer = 0; ThisPlayer < g_playerCount; ThisPlayer++)
	{
		if (Objectives[ThisPlayer].TeamIndex == 0)
		{
			//Red
			SetBalloonColor(ThisPlayer, 225, 0, 0, 30, 0, 0);
		}
		else
		{
			//Blue
			SetBalloonColor(ThisPlayer, 0, 0, 225, 0, 0, 30);
		}

	}
}

void LakituSpawnBypass(Player *Kart, char PlayerID, float *SpawnVector, float *FacingVector)
{
	if (g_gameMode != GAMEMODE_BATTLE)
	{
		GetLakituSpawnPoint(Kart, PlayerID, SpawnVector, FacingVector);
	}
	else
	{
		FacingVector[0] = 0;
		FacingVector[1] = 0;
		FacingVector[2] = 0;

		SpawnVector[0] = SpawnPoint[(int)PlayerID][0];
		SpawnVector[1] = SpawnPoint[(int)PlayerID][1];
		SpawnVector[2] = SpawnPoint[(int)PlayerID][2];
	}
	
}