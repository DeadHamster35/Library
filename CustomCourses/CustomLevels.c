#include "../MainInclude.h"









void previewRefresh()
{
	//This value will cause the game to try to reload preview images
	//Used on the Map Select screen when we swap to a new set of custom levels.
	if (g_gameMode != 3)
	{
		g_menuPreviewValue1 = 9;
		g_menuPreviewValue2 = 9;
		g_menuPreviewValue3 = 9;
		g_menuPreviewValue4 = 9;
	}
	else
	{
		g_BattlePreviewValue1 = 9;
		g_BattlePreviewValue2 = 9;
		g_BattlePreviewValue3 = 9;
		g_BattlePreviewValue4 = 9;
	}
}

void copyCourseTable(int copyMode)
{
	//This saves the course table to RAM as a backup copy
	//Or reloads the backup copy back over the table.

	//We need to switch the table for GP mode and Custom Sets.
	//0 to load 1 to save.
	dataLength = 0x28;
	if (copyMode == 0)
	{
		*sourceAddress = (long)&ok_CourseTable;
		*targetAddress = (long)&g_CupArray;
	}
	else
	{
		*sourceAddress = (long)&g_CupArray;
		*targetAddress = (long)&ok_CourseTable;
	}
	runRAM();
}

void hsTableSet()
{
	g_cup0Array0 = 0;
	g_cup0Array1 = 0;
	g_cup0Array2 = 0;
	g_cup0Array3 = 0;
	g_cup1Array0 = 0;
	g_cup1Array1 = 0;
	g_cup1Array2 = 0;
	g_cup1Array3 = 0;
	g_cup2Array0 = 0;
	g_cup2Array1 = 0;
	g_cup2Array2 = 0;
	g_cup2Array3 = 0;
	g_cup3Array0 = 0;
	g_cup3Array1 = 0;
	g_cup3Array2 = 0;
	g_cup3Array3 = 0;
	g_cupBArray0 = 15;
	g_cupBArray1 = 15;
	g_cupBArray2 = 15;
	g_cupBArray3 = 15;
}

/*
void stockTableSet()
{
	g_cup0Array0 = 8;
	g_cup0Array1 = 9;
	g_cup0Array2 = 6;
	g_cup0Array3 = 11;
	g_cup1Array0 = 10;
	g_cup1Array1 = 5;
	g_cup1Array2 = 1;
	g_cup1Array3 = 0;
	g_cup2Array0 = 14;
	g_cup2Array1 = 12;
	g_cup2Array2 = 7;
	g_cup2Array3 = 2;
	g_cup3Array0 = 18;
	g_cup3Array1 = 4;
	g_cup3Array2 = 3;
	g_cup3Array3 = 13;
}
*/




void stockASM(void)
{
	//these functions will swap the ASM routines that load Mario's Raceway.
	//they will point to the custom setup we've implemented for HotSwap courses.
	//this does not swap in the course header table, only the ASM instructions.


	highpolypipeA= 0x3C190700;   //3C190700
	highpolypipeB= 0x373908E8;   //373908E8

	lowpolypipeA= 0x3C0A0700;   //3C0A0700
	lowpolypipeB= 0x354A2D68;   //354A2D68

	uraGrpA = 0x3C0E0700;
	uraGrpB = 0x35CE3050;

	bigmushroomA= 0x3C180700;   //3C180700
	bigmushroomB= 0x37181140;   //37181140

	bigmushroomsurfaceA= 0x3C040700;   //3C040700
	bigmushroomsurfaceB= 0x34841140;   //34841140

	audienceA= 0x3C0F0700;   //3C0F0700
	audienceB= 0x35EF14A0;   //35EF14A0

	audienceflagsA= 0x3C0D0700;   //3C0D0700
	audienceflagsB= 0x35AD0160;   //35AD0160

	billboard1A= 0x3C0C0700;   //3C0C0700
	billboard1B= 0x358C3240;   //358C3240

	billboard2A= 0x3C0F0700;   //3C0E0700
	billboard2B= 0x35EF3508;   //35CE0450

	billboardpost1A= 0x3C190700;   //3C190700
	billboardpost1B= 0x37390240;   //37390240

	billboardpost2A= 0x3C0E0700;   //3C190700
	billboardpost2B= 0x35CE0450;   //37390240

	fencesA= 0x3C180700;   //3C180700
	fencesB= 0x371800E0;   //371800E0

	bigsignA= 0x3C0A0601;   //3C0A0601
	bigsignB= 0x254A9330;   //254A9330

	itemboxesA = 0x3C040601; //8029DBD4
	itemboxesB = 0x24849498; //8029DBDC

	treeslistA = 0x3C040601; //8029DBBC
	treeslistB = 0x24849570; //8029DBC4

	treesdisplayA = 0x3C180600; //802992C8
	treesdisplayB = 0x27186A68; //802992E0

	piranhalistA = 0x3C040601; //8029DBC8
	piranhalistB = 0x24849518; //8029DBD0

	piranhadisplayA = 0x3C0F0600; //80298668
	piranhadisplayB = 0x25EF6990; //8029866C

	sectionviewA = 0x3C040900;   //3C040900
	sectionviewB = 0x248401F0;   //248401F0

	battleDisplayA = 0x3C0F0700;
	battleDisplayB = 0x35EF15C0;
	battleSurfaceA = 0x3C040700;
	battleSurfaceB = 0x348415C0;

	surfacemapA = 0x3C040601;   //3C040601
	surfacemapB = 0x24849650;   //24849650

	unknownA1 = 0x3C190601; //0x802927FC   ;;3C190601 -> 3C190600
	unknownB1 = 0x3C040700; //0x802927FC   ;;3C190601 -> 3C190600
	unknownC1 = 0x3C040700; //0x802927FC   ;;3C190601 -> 3C190600
	unknownD1 = 0x3C040700; //0x802927FC   ;;3C190601 -> 3C190600

	unknownA2 = 0x27399348; //0x80292810   ;;24849348 -> 24840000

	unknownB = 0x34841140; //0x802927FC   ;;34841140 -> 34840000
	unknownC = 0x348408E8; //0x80292810   ;;348408E8 -> 34840000
	unknownD = 0x34842D68; //0x80295E70   ;;34842D68 -> 34840000

	g_pathLength = 0x0258;
	pathOffset = 0x060057B0;
	pathOffsetB = 0x06005568;

	g_mapStartToggle = 0x0C0132B4;
	asm_GPLevelSelect = 0xA42DC5A0;

	copyCourseTable(0);
}
void overkartASM(void)
{
	//these functions will swap the ASM routines that load Mario's Raceway.
	//they will point to the custom setup we've implemented for custom courses.
	//this does not swap in the course header table, only the ASM instructions.

	highpolypipeA= 0x3C190600;  //3C190700
	highpolypipeB= 0x37390000;   //373908E8

	lowpolypipeA= 0x3C0A0600;   //3C0A0700
	lowpolypipeB= 0x354A0000;   //354A2D68

	uraGrpA = 0x3C0E0600;
	uraGrpB = 0x35CE0000;


	bigmushroomA= 0x3C180600;   //3C180700
	bigmushroomB= 0x37180000;   //37181140

	bigmushroomsurfaceA= 0x3C040600;   //3C040700
	bigmushroomsurfaceB= 0x34840000;   //34841140

	audienceA= 0x3C0F0600;   //3C0F0700
	audienceB= 0x35EF0000;   //35EF14A0

	audienceflagsA= 0x3C0D0600;   //3C0D0700
	audienceflagsB= 0x35AD0000;   //35AD0160

	billboard1A= 0x3C0C0600;   //
	billboard1B= 0x358C0000;   //

	billboard2A= 0x3C0F0600;   //
	billboard2B= 0x35EF0000;   //

	billboardpost1A= 0x3C190600;   //
	billboardpost1B= 0x37390000;   //

	billboardpost2A= 0x3C0E0600;   //
	billboardpost2B= 0x35CE0000;   //

	fencesA= 0x3C180600;   //3C180700
	fencesB= 0x37180000;   //371800E0

	bigsignA= 0x3C0A0600;   //3C0A0601
	bigsignB= 0x254A0000;   //254A9330

	itemboxesA = 0x3C040600; //8029DBD4
	itemboxesB = 0x248403C0; //8029DBDC

	battleItemBoxesA = 0x24840258;

	//8029E0D8

	treeslistA = 0x3C040600; //8029DBBC
	treeslistB = 0x248405C8; //8029DBC4

	treesdisplayA = 0x3C180600; //802992C8
	treesdisplayB = 0x27180320; //802992E0

	piranhalistA = 0x3C040600; //8029DBC8
	piranhalistB = 0x248407D0; //8029DBD0

	piranhadisplayA = 0x3C0F0600; //80298668
	piranhadisplayB = 0x25EF0248; //8029866C

	unknownA1 = 0x3C190600; //0x802927FC   ;;3C190601 -> 3C190600
	unknownB1 = 0x3C040600; //0x802927FC   ;;3C190601 -> 3C190600
	unknownC1 = 0x3C040600; //0x802927FC   ;;3C190601 -> 3C190600
	unknownD1 = 0x3C040600; //0x802927FC   ;;3C190601 -> 3C190600

	unknownA2 = 0x27390000; //0x80292810   ;;27399348 -> 27390000

	unknownB = 0x34840000; //0x802927FC   ;;34841140 -> 34840000
	unknownC = 0x34840000; //0x80292810   ;;348408E8 -> 34840000
	unknownD = 0x34840000; //0x80295E70   ;;34842D68 -> 34840000

	


	g_mapStartToggle = 0x00000000;




	copyCourseTable(1);
	g_cup0Array0 = 0;
	g_cup0Array1 = 1;
	g_cup0Array2 = 2;
	g_cup0Array3 = 3;
	g_cup1Array0 = 4;
	g_cup1Array1 = 5;
	g_cup1Array2 = 6;
	g_cup1Array3 = 7;
	g_cup2Array0 = 8;
	g_cup2Array1 = 9;
	g_cup2Array2 = 10;
	g_cup2Array3 = 11;
	g_cup3Array0 = 12;
	g_cup3Array1 = 13;
	g_cup3Array2 = 14;
	g_cup3Array3 = 15;
	g_cupBArray0 = 16;
	g_cupBArray1 = 17;
	g_cupBArray2 = 18;
	g_cupBArray3 = 19;
	asm_GPLevelSelect = 0xA420C5A0;
}



void setSong()
{
	//If a custom level, set the Song ID.
	//If the SongID is greater than >0x50 it's a pointer to custom song data.

	//If not a custom level, restore the standard Mario Raceway song code. 
	if ((HotSwapID > 0) && (OverKartHeader.Version != 0xFFFFFFFF))
	{
		
		if (OverKartHeader.MusicID < 0x50)
		{
			songID = (short)OverKartHeader.MusicID;

			dataLength = 8;
			*sourceAddress = (long)&ok_Sequence;
			*targetAddress = (long)((long)(&g_SequenceTable) + (3 * 8) + 4);
			runRAM();
			*sourceAddress = (long)&ok_Instrument;
			*targetAddress = (long)((long)(&g_InstrumentTable) + (3 * 8) + 4);
			runRAM();
		}
		else
		{
			songID = 0x03;

			*sourceAddress = OverKartHeader.MusicID;
			dataLength = 8;
			*targetAddress = (long)((long)(&g_SequenceTable) + (3 * 8) + 4);
			runDMA();
			*sourceAddress += 8;
			*targetAddress = (long)((long)(&g_InstrumentTable) + (3 * 8) + 4);
			runDMA();
		}
		
	}
	else
	{
		songID = 0x03;

		*sourceAddress = (long)&ok_Sequence;
		dataLength = 8;
		*targetAddress = (long)((long)(&g_SequenceTable) + (3 * 8) + 4);
		runRAM();
		*sourceAddress = (long)&ok_Instrument;
		*targetAddress = (long)((long)(&g_InstrumentTable) + (3 * 8) + 4);
		runRAM();
	}
}



void setTempo()
{
	//Set the game tempo.
	//tempo is used to handle lagging on console.


	if (TempoBool)
	{
		if (HotSwapID > 0)
		{
			switch(g_playerCount)
			{
				case 1:
				asm_tempo1A = 0x240F0000;
				asm_tempo1B = 0x240F0000;
				asm_tempo1ASpeed = (short)OverKartHeader.Tempo[0];
				asm_tempo1BSpeed = (short)OverKartHeader.Tempo[0];
				break;
				case 2:
				asm_tempo2A = 0x24090000;
				asm_tempo2B = 0x24090000;
				asm_tempo2ASpeed = (short)OverKartHeader.Tempo[1];
				asm_tempo2BSpeed = (short)OverKartHeader.Tempo[1];
				break;
				case 3:
				asm_tempo3A = 0x240A0000;
				asm_tempo3B = 0x240A0000;
				asm_tempo3ASpeed = (short)OverKartHeader.Tempo[2];
				asm_tempo3BSpeed = (short)OverKartHeader.Tempo[2];
				break;
				case 4:
				asm_tempo3A = 0x240A0000;
				asm_tempo3B = 0x240A0000;
				asm_tempo3ASpeed = (short)OverKartHeader.Tempo[3];
				asm_tempo3BSpeed = (short)OverKartHeader.Tempo[3];
				break;
			}
		}
		else
		{
			asm_tempo1A = 0x3C0F8015;
			asm_tempo1B = 0x8DEF0114;

			asm_tempo2A = 0x3C098015;
			asm_tempo2B = 0x8D290114;

			asm_tempo3A = 0x3C0A8015;
			asm_tempo3B = 0x8D4A0114;
		}
	}
	else
	{
		asm_tempo1A = 0x240F0000;
		asm_tempo1B = 0x240F0000;
		asm_tempo1ASpeed = (short)2;
		asm_tempo1BSpeed = (short)2;

		asm_tempo2A = 0x24090000;
		asm_tempo2B = 0x24090000;
		asm_tempo2ASpeed = (short)2;
		asm_tempo2BSpeed = (short)2;

		asm_tempo3A = 0x240A0000;
		asm_tempo3B = 0x240A0000;
		asm_tempo3ASpeed = (short)2;
		asm_tempo3BSpeed = (short)2;
	}
	


}
void SetGhostData()
{
	*(uint*)(0x80650000) = 0x35353535;
	if ((HotSwapID > 0) && (OverKartHeader.Version != 0xFFFFFFFF))
	{
		*(uint*)(0x80650004) = 0x35353535;
		if (g_gameMode == 1)
		{
			*(uint*)(0x80650008) = 0x35353535;
			if (OverKartHeader.Ghost != 0)
			{
				*sourceAddress = OverKartHeader.Ghost;
				*targetAddress = (uint)(&ok_FreeSpace);
				dataLength = 0x3C00;
				runDMA();
				*sourceAddress = (uint)(&ok_FreeSpace);
				*targetAddress = (uint)(&KeystockBuffer);
				GlobalUIntB = runMIO();
				KeystockCounter = KeystockBuffer & 0x00FF0000;
			}
			else
			{
				uint* KeystockData = (uint*)(&KeystockBuffer);
				for (int ThisPass = 0; ThisPass < 64; ThisPass++)
				{
					KeystockData[ThisPass] = 0x00FF0000;
				}

				//Should be 9 minutes of idle.
			
			}
		}
	}
}
void setPath()
{
	short* PathLengths = (short*)(&g_pathLength);
	uint* PathOffsets = (uint*)&pathOffset;

	if ((HotSwapID > 0) && (OverKartHeader.Version != 0xFFFFFFFF))
	{
		

		PathLengths[0] =(short)(OverKartHeader.PathLength[0]);
		PathLengths[1] =(short)(OverKartHeader.PathLength[1]);
		PathLengths[2] =(short)(OverKartHeader.PathLength[2]);
		PathLengths[3] =(short)(OverKartHeader.PathLength[3]);

		PathLengths = (short*)(&g_pathBLength);

		PathLengths[0] =(short)(OverKartHeader.PathLength[0]);
		
		*sourceAddress = OverKartHeader.PathOffset;
		dataLength = 16;
		if (g_gameMode != 3)
		{
			*targetAddress = (uint)(&pathOffset);			
			runDMA();
			pathOffsetB = pathOffset + ((OverKartHeader.PathLength[0] + 1) * 8);		
		}
		else
		{
			*targetAddress = (uint)(&pathOffsetBlock);			
			runDMA();
			
		}
		
	}
	else
	{
		g_pathLength = 0x0258;
		*sourceAddress = 0xDD380;
		*targetAddress = (uint)(&pathOffsetB);
		dataLength = 16;
		runDMA();
		if (g_gameMode !=3)
		{
			*sourceAddress = 0xDD4D0;
			*targetAddress = (uint)(&pathOffset);
		}
		else
		{
			*sourceAddress = 0xDD5C0;
			*targetAddress = (uint)(&pathOffsetBlock);
		}
		runDMA();
	}

	
	for (int ThisPath = 1; ThisPath < OverKartHeader.PathCount; ThisPath++)
	{		
		MakeAlternativePath((Marker*)GetRealAddress(PathOffsets[ThisPath]),PathLengths[ThisPath],ThisPath);
	}

}

void setWater()
{

	if (HotSwapID > 0)
	{
		g_waterHeight = OverKartHeader.WaterLevel;		
	}
}

void CheckEcho()
{	
	
}



void setEcho()
{
	if ((HotSwapID > 0) && (OverKartHeader.Version != 0xFFFFFFFF))
	{		
		OverKartRAMHeader.EchoOffset = 0;
		GlobalUIntA = OverKartHeader.EchoEnd - OverKartHeader.EchoStart;
		OverKartRAMHeader.EchoOffset = LoadData(OverKartHeader.EchoStart, GlobalUIntA);
		g_EchoStart = 0;
		g_EchoStop = 0;
	}
	else
	{
		OverKartRAMHeader.EchoOffset = 0;
		g_EchoStart = 0x19B;
		g_EchoStop = 0x1B9;
	}
	

}





//Snow
long A4Snow[]={
	0x00000000,0x00000000,
	0x00000000,0x00000000,
	0x00000111,0x11100000,
	0x00011223,0x32211000,
	0x00112345,0x54321100,
	0x00124578,0x87542100,
	0x0123589B,0xBA853210,
	0x012479CD,0xDC974210,
	0x01358BDF,0xFDB85310,
	0x01358BDF,0xFDB85310,
	0x012479CD,0xDCA74210,
	0x0123589B,0xBA853210,
	0x00124578,0x87542100,
	0x00112345,0x54321100,
	0x00011223,0x32211000,
	0x00000111,0x11100000,
	0x00000000,0x00000000,
	0x00000000,0x00000000,
};

//Rain
long A4Rain[]={
     0x00000000,0x00000000,
     0x00000000,0x00000000,
     0x00000000,0x00000000,
     0x00000001,0x00000000,
     0x00000002,0x00000000,
     0x00000004,0x00000000,
     0x00000006,0x00000000,
     0x00000008,0x00000000,
     0x00000008,0x00000000,
     0x0000000A,0x00000000,
     0x0000000C,0x00000000,
     0x0000000B,0x00000000,
     0x0000000A,0x00000000,
     0x00000009,0x00000000,
     0x00000008,0x00000000,
     0x00000006,0x00000000,
     0x00000000,0x00000000,
     0x00000000,0x00000000,
};



void SetWeatherType(int WeatherType) // 0 = Snow // 1 = Rain
{
	if (currentMenu == 0x25 || g_fadeOutCounter == 1)
	{
		if	(HotSwapID > 0)
		{
			switch (WeatherType)
			{	
				case WEATHER_RAIN:
				{
					for (int texarr = 0; texarr < 36; texarr++)
					{
						g_SnowParticleTex[texarr] = A4Rain[texarr];
					}						
					g_skySnowVelocity = 1.75;
					g_3DSnowScale = 0.4;
					g_3DSnowVelocityUpLim = 1.5;
					g_3DSnowVelocityLowLim = -2.5;
					g_3DSnowSwayMovement = -2.75;
					g_3DSnowSpawnCone = (g_3DSnowSpawnCone & 0xFFFF0000) + (0x6000 & 0x0000FFFF);
					break;
				}

				case WEATHER_SNOW:
				default:
				{
					for (int texarr = 0; texarr < 36; texarr++)
					{
						g_SnowParticleTex[texarr] = A4Snow[texarr];
					}
					g_skySnowVelocity = 1.035;
					g_3DSnowScale = 0.15;
					g_3DSnowVelocityUpLim = 1.035;
					g_3DSnowVelocityLowLim = -1.65;
					g_3DSnowSwayMovement = 1.24;
					g_3DSnowSpawnCone = (g_3DSnowSpawnCone & 0xFFFF0000) + (0x4000 & 0x0000FFFF);
					break;
				}
			}
		}
		else
		{
			for (int texarr = 0; texarr < 36; texarr++)
			{
				g_SnowParticleTex[texarr] = A4Snow[texarr];
			}
			g_skySnowVelocity = 1.035;
			g_3DSnowScale = 0.15;
			g_3DSnowVelocityUpLim = 1.035;
			g_3DSnowVelocityLowLim = -1.65;
			g_3DSnowSwayMovement = 1.24;
		}
	}
}

void SetCloudType(char CloudType)  // 0 = None // 1 = MR Clouds // 2 = Stars // 3 = Snow/Rain
{

	if (currentMenu == 0x25 || g_fadeOutCounter == 1)
	{
		
		switch (CloudType)
		{
			case SKY_CLEAR:
			{
				CloudCourseID = 2;
				break;
			}
			case SKY_STAR:
			{
				CloudCourseID = 14;
				break;
			}
			case SKY_WEATHER:
			{
				CloudCourseID = 5;
				break;
			}
			case SKY_CLOUD:
			default:
			{
				CloudCourseID = 0;
				break;
			}
		}
		if	(HotSwapID > 0)
		{
			CloudTypeMapCheck1 = (CloudTypeMapCheck1 & 0xFFFF0000) + ((long)&CloudCourseID >> 16 & 0x0000FFFF);
			CloudTypeMapCheck2 = (CloudTypeMapCheck2 & 0xFFFF0000) + ((long)&CloudCourseID & 0x0000FFFF);
			CloudAmountMapCheck1 = (CloudAmountMapCheck1 & 0xFFFF0000) + ((long)&CloudCourseID >> 16 & 0x0000FFFF);
			CloudAmountMapCheck2 = (CloudAmountMapCheck2 & 0xFFFF0000) + ((long)&CloudCourseID & 0x0000FFFF);

			g_skySnowSpawnHeight = (g_skySnowSpawnHeight & 0xFFFF0000) + (0x65 & 0x0000FFFF);
			g_skySnowSpawnRadiusDensity = (g_skySnowSpawnRadiusDensity & 0xFFFF0000) + (0x8000 & 0x0000FFFF);
			g_skySnowSpawnCenterOffset = (g_skySnowSpawnCenterOffset & 0xFFFF0000) + (0xC000 & 0x0000FFFF);
			g_skySnowScale = 0.25;
		}
		else
		{
			CloudTypeMapCheck1 = (CloudTypeMapCheck1 & 0xFFFF0000) + ((long)&g_courseID >> 16 & 0x0000FFFF) +1;
			CloudTypeMapCheck2 = (CloudTypeMapCheck2 & 0xFFFF0000) + ((long)&g_courseID & 0x0000FFFF);
			CloudAmountMapCheck1 = (CloudAmountMapCheck1 & 0xFFFF0000) + ((long)&g_courseID >> 16 & 0x0000FFFF) +1;
			CloudAmountMapCheck2 = (CloudAmountMapCheck2 & 0xFFFF0000) + ((long)&g_courseID & 0x0000FFFF);

			g_skySnowSpawnHeight = (g_skySnowSpawnHeight & 0xFFFF0000) + (0xB4 & 0x0000FFFF);
			g_skySnowSpawnRadiusDensity = (g_skySnowSpawnRadiusDensity & 0xFFFF0000) + (0x4000 & 0x0000FFFF);
			g_skySnowSpawnCenterOffset = (g_skySnowSpawnCenterOffset & 0xFFFF0000) + (0xE000 & 0x0000FFFF);
			g_skySnowScale = 0.15;
			CloudCourseID = g_courseID;
		}

	}
}

void Snow3DTrigger()						// Used to disable 3D snow on certain pathmarker ranges 
{
	#define S3DArraySize 2					// Array size for the total amount of 3DSnow Disable sections used. Pull from course data
/*
	short S3DTrStart[S3DArraySize];
	short S3DTrEnd[S3DArraySize];
*/
	if (Snow3DCourseID == 5)				// Only run for existing racers
	{
		for (int LoopVal = 0; LoopVal < S3DArraySize; LoopVal++)
		{
		// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
			/*
			S3DTrStart[LoopVal] = 140;
			S3DTrEnd[LoopVal] = 200;

			
			if ((g_playerPathPointTable[0] >= S3DTrStart[LoopVal]) && (g_playerPathPointTable[0] <= S3DTrEnd[LoopVal]))		// Path range check
			{
				g_3DSnowSpawnHeight = (g_3DSnowSpawnHeight & 0xFFFF0000) + (0x602D & 0x0000FFFF);
				break;
			}
			*/
			g_3DSnowSpawnHeight = (g_3DSnowSpawnHeight & 0xFFFF0000) + (0x002D & 0x0000FFFF);
		}
	}
}

void SetWeather3D(bool Weather3DEnable) // Enables 3D weather effects (snow/rain) for Singleplayer
{
	if (currentMenu == 0x25 || g_fadeOutCounter == 1)
	{
		if	(HotSwapID > 0)
		{
			Snow3DAllocMapCheck1 = (Snow3DAllocMapCheck1 & 0xFFFF0000) + ((long)&Snow3DCourseID >> 16 & 0x0000FFFF);
			Snow3DAllocMapCheck2 = (Snow3DAllocMapCheck2 & 0xFFFF0000) + ((long)&Snow3DCourseID & 0x0000FFFF);
			Snow3DDisplayAfterMapCheck1 = (Snow3DDisplayAfterMapCheck1 & 0xFFFF0000) + ((long)&Snow3DCourseID >> 16 & 0x0000FFFF);
			Snow3DDisplayAfterMapCheck2 = (Snow3DDisplayAfterMapCheck2 & 0xFFFF0000) + ((long)&Snow3DCourseID & 0x0000FFFF);
			g_skySnowHitGoal = 0x0C021B9C;

		}
		else
		{
			Snow3DAllocMapCheck1 = (Snow3DAllocMapCheck1 & 0xFFFF0000) + ((long)&g_courseID >> 16 & 0x0000FFFF) +1;
			Snow3DAllocMapCheck2 = (Snow3DAllocMapCheck2 & 0xFFFF0000) + ((long)&g_courseID & 0x0000FFFF);
			Snow3DDisplayAfterMapCheck1 = (Snow3DDisplayAfterMapCheck1 & 0xFFFF0000) + ((long)&g_courseID >> 16 & 0x0000FFFF) +1;
			Snow3DDisplayAfterMapCheck2 = (Snow3DDisplayAfterMapCheck2 & 0xFFFF0000) + ((long)&g_courseID & 0x0000FFFF);
			g_skySnowHitGoal = 0x0C021BF5;
		}
	}
	if(Weather3DEnable && HotSwapID > 0)
	{
		if (g_startingIndicator >= 0 && g_startingIndicator < 5 && g_gamePausedFlag == 0x00 && g_playerCount == 1)
		{
			KWChartSnow();
			Snow3DTrigger();
		}
		Snow3DCourseID = 5;
	}
	else
	{
		Snow3DCourseID = g_courseID;
	}
}

void SnowCustomCheck(int SnowIndex)
{
	if (g_DynamicObjects[SnowIndex].pos[1] <= GlobalPlayer[0].position[1] - 5.0 || g_DynamicObjects[SnowIndex].pos[1] >= GlobalPlayer[0].position[1] + 60.0)
	{
		g_DynamicObjects[SnowIndex].anmptr = 1;
	}
}

void EventDisplay(int player)
{
	if (HotSwapID == 0)
	{
		KWDisplayEvent(player);
	}
	else
	{
		KWDisplayIceBlockShadow(player);
		KWDisplayBombKartBT(player);
		KWDisplayEvent(player);
	}
}

void EventDisplay_After(int player)
{
	if (HotSwapID == 0)
	{
		KWDisplayEvent_After(player);
	}
	else
	{
		KWDisplayIceBlock(player);
		KWDisplayEvent_After(player);
	}

	DrawCustomParticle(player);
}

void CommonGameEventChart()
{
	if (HotSwapID == 0)
	{
		KWGameEventCommon();
	}
	else
	{
		if (g_resetToggle != 4)
		{
			KWChartIceBlock();
		}
		KWGameEventCommon();
	}

	MoveCustomParticle();
}
void setSky()
{

	if (HotSwapID > 0)
	{
		

		
	
		*targetAddress = (long)&g_skyColorTopTable;
		*sourceAddress = OverKartHeader.Sky;
		dataLength = 0xC;
		runDMA();
		*targetAddress = (long)&g_skyColorBotTable;
		*sourceAddress = *sourceAddress + 0xC;
		runDMA();
	}
	else
	{
		*targetAddress = (long)&g_skyColorTopTable;
		*sourceAddress = 0x1220E0;
		dataLength = 0xC;
		runDMA();
		*targetAddress = (long)&g_skyColorBotTable;
		*sourceAddress = 0x1221DC;
		runDMA();
	}

}

void loadTextureScrollTranslucent()
{
	*(long*)(&ok_scrolltranslucent) = 0xFFFFFFFF;
	if (HotSwapID > 0)
	{		
		*sourceAddress = OverKartHeader.ScrollROM;
		if (*sourceAddress != 0)
		{
			*targetAddress = (long)&ok_scrolltranslucent;
			dataLength = OverKartHeader.ScrollSize;
			dataLength += 4;
			runDMA();
		}
	}
}


void runTextureScroll()
{
	//Handle Texture Scrolling for custom levels.

	//Check a header for the scroll data.
	//Scroll Data contains the count followed by the texture loads.
	//Loop through a byte until it overlaps. 

	GlobalAddressA = (long)(&ok_scrolltranslucent);
	LoopValue = *(long*)(&ok_scrolltranslucent);
	for (int CurrentScroll = 0; CurrentScroll < LoopValue; CurrentScroll++)
	{
		GlobalAddressB = *(long*)(GlobalAddressA + (CurrentScroll * 8) + 4);   //address of the texture command to scroll.
		GlobalIntA = *(long*)(GlobalAddressA + (CurrentScroll * 8) + 8);
		ScrollValues[CurrentScroll][0] += (GlobalIntA >> 16) & (0xFFFF);
		ScrollValues[CurrentScroll][1] += GlobalIntA & 0xFFFF;


		if (ScrollValues[CurrentScroll][0] > 255)
		{
			ScrollValues[CurrentScroll][0] -= 255;
		}
		if (ScrollValues[CurrentScroll][0] < 0)
		{
			ScrollValues[CurrentScroll][0] += 255;
		}
		if (ScrollValues[CurrentScroll][1] > 255)
		{
			ScrollValues[CurrentScroll][1] -= 255;
		}
		if (ScrollValues[CurrentScroll][1] < 0)
		{
			ScrollValues[CurrentScroll][1] += 255;
		}


		ScrollMapImage(GlobalAddressB,ScrollValues[CurrentScroll][0],ScrollValues[CurrentScroll][1]);

	}
}

void runWaterVertex()
{
	//This handles translucency by setting vertex alpha.
	//Outdated; vertex alpha can be loaded directly now.
	GlobalAddressA = (long)(&ok_scrolltranslucent) + OverKartHeader.WVOffset;
	LoopValue = *(long*)GlobalAddressA;
	if (LoopValue == 0xFFFFFFFF)
	{
		return;
	}
	for (int CurrentWater = 0; CurrentWater < LoopValue; CurrentWater++)
	{
		GlobalAddressB = *(long*)(GlobalAddressA + (CurrentWater * 8) + 4);
		GlobalCharA = (char)*(long*)(GlobalAddressA + (CurrentWater * 8) + 8);
		MakeWaterVertex(GlobalAddressB,GlobalCharA,0,0,0);
	}
}


void runDisplayScreen()
{
	//Handles the display of the buffer copy to texture.
	//Allows for rendering the screen to a set of 6 textures.
	GlobalAddressA = (long)(&ok_scrolltranslucent) + OverKartHeader.ScreenOffset;   ////Parse WaterVertex List
	LoopValue = *(long*)GlobalAddressA;
    if (LoopValue != 6)
    {
        return;
    }

	for (int CurrentScreen = 0; CurrentScreen < 6; CurrentScreen++)
	{
		GlobalAddressC = *(long*)(GlobalAddressB + (CurrentScreen * 4) + 4);
		
		

		GlobalIntA = 88;
		GlobalIntB = 72;

		GlobalShortA=(short)(g_DispFrame)-1;
       	if(GlobalShortA<0)   GlobalShortA=2;
       	else if(GlobalShortA>2)   GlobalShortA=0;

       	switch(CurrentScreen)
		{
			case 0:
			{
			GetFramebuffer(GlobalIntA,GlobalIntB,64,32,(unsigned short *)PhysToK0((int)g_CfbPtrs[GlobalShortA]),(unsigned short *)(GetRealAddress(GlobalAddressC)));
			break;
			}			
			case 1:
			{
			GetFramebuffer(GlobalIntA + 64,GlobalIntB,64,32,(unsigned short *)PhysToK0((int)g_CfbPtrs[GlobalShortA]),(unsigned short *)(GetRealAddress(GlobalAddressC)));
			break;
			}
			case 2:
			{
			GetFramebuffer(GlobalIntA,GlobalIntB + 32,64,32,(unsigned short *)PhysToK0((int)g_CfbPtrs[GlobalShortA]),(unsigned short *)(GetRealAddress(GlobalAddressC)));
			break;
			}
			case 3:
			{
			GetFramebuffer(GlobalIntA + 64,GlobalIntB + 32,64,32,(unsigned short *)PhysToK0((int)g_CfbPtrs[GlobalShortA]),(unsigned short *)(GetRealAddress(GlobalAddressC)));
			break;
			}
			case 4:
			{
			GetFramebuffer(GlobalIntA,GlobalIntB + 64,64,32,(unsigned short *)PhysToK0((int)g_CfbPtrs[GlobalShortA]),(unsigned short *)(GetRealAddress(GlobalAddressC)));
			break;
			}
			case 5:
			{
			GetFramebuffer(GlobalIntA + 64,GlobalIntB + 64,64,32,(unsigned short *)PhysToK0((int)g_CfbPtrs[GlobalShortA]),(unsigned short *)(GetRealAddress(GlobalAddressC)));
			break;
			}			
			default:
			{
				break;
			}
			
		}
	}
}




void runKillDisplayObjects()
{
	//Handles the display of the buffer copy to texture.
	//Allows for rendering the screen to a set of 6 textures. 

	
	GlobalAddressA = ((uint)(&ok_scrolltranslucent)) + OverKartHeader.KDOffset;
	LoopValue = *(int*)GlobalAddressA;	
	GlobalAddressA += 4; //Pass Loop Count
	
	for (int CurrentKD = 0; CurrentKD < LoopValue; CurrentKD++)
	{
		KDKill *DisplayKill = (KDKill*)(GlobalAddressA);
		
		uint* MeshList = (uint*)(GlobalAddressA + 12);
		switch (g_gameMode)
		{
			case 0:
			{
				//GP
				if (DisplayKill->GP != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
			case 1:
			{
				//TIME TRIAL
				if (DisplayKill->TT != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
			case 2:
			{
				//TIME VS
				if (DisplayKill->VS != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
			case 3:
			{
				//BATTLE
				if (DisplayKill->Battle != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
		}


		switch (g_raceClass)
		{
			case 0:
			{
				//50
				if (DisplayKill->Fifty != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
			case 1:
			{
				//100
				if (DisplayKill->Hundred != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
			case 2:
			{
				//150
				if (DisplayKill->HundredFifty != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
			case 3:
			{
				//EXTRA
				if (DisplayKill->Extra != 0)
				{
					for (int ThisMesh= 0; ThisMesh < DisplayKill->MeshCount; ThisMesh++)
					{
						KillDisplayList(0x07000000 | MeshList[ThisMesh]);
					}
				}
				break;
			}
		}
		

		//Setup next Loop
		GlobalAddressA = GlobalAddressA + 12 + (DisplayKill->MeshCount * 4);
	}
	
}






void setText()
{
	
	*sourceAddress = OverKartHeader.Credits;
	*targetAddress = (long)&ok_Credits;
	dataLength = 0x20;
	if ((HotSwapID > 0) && (*sourceAddress != 0x00000000))
	{
		runDMA();
	}
	else
	{
		*(long*)(&ok_Credits) = 0;
	}

	*sourceAddress = OverKartHeader.CourseName;
	*targetAddress = (long)&ok_CourseName;
	dataLength = 0x40;
	if ((HotSwapID > 0) && (*sourceAddress != 0x00000000))
	{
		runDMA();
	}
	else
	{
		*(long*)(&ok_CourseName) = 0;
	}

	*sourceAddress = OverKartHeader.SerialKey;
	*targetAddress = (long)&ok_SerialKey;
	dataLength = 0x40;
	if ((HotSwapID > 0) && (*sourceAddress != 0x00000000))
	{
		runDMA();
	}
	else
	{
		*(long*)(&ok_SerialKey) = 0;
	}
}
void SetCourseNames(bool custom)
{
	int strtbl;

	if ((custom == true) && (*sourceAddress != 0x00000000))
	{
		for (strtbl = 0; strtbl < 20; strtbl++)
		{
			g_StringTableCourse[strtbl] = (long)&ok_CourseName + 0x4;
			g_StringTableCourseGP[strtbl] = (long)&ok_CourseName + 0x4;
		}
	}
	else
	{
		for (strtbl = 0; strtbl < 20; strtbl++)
		{	
			g_StringTableCourse[strtbl] = (long)stockCourseNames[strtbl];
			g_StringTableCourseGP[strtbl] = (long)stockCourseNames[strtbl];
		}
	}
}

void setOKObjects()
{
	//This loads the Custom OK Objects from the header.

	//If in mirror mode, we use this value to invert the X value.
	GlobalShortA = 1;
	if (g_mirrorMode == 1)
	{
		GlobalShortA = -1;
	}
	
	for (int This = 0; This < 100; This++)
	{
		//Clear all the existing objects.
		ClearOKObject(This);
	}
	//Load data from the course header. 
	OverKartRAMHeader.ObjectTypeCount = *(int*)(OverKartRAMHeader.ObjectDataStart);
	GlobalAddressC = OverKartRAMHeader.ObjectDataStart + 4;
	OverKartRAMHeader.ObjectTypeList = (OKObjectType*)(GlobalAddressC);

	
	GlobalAddressB = OverKartRAMHeader.ObjectDataStart + 4 + (OverKartRAMHeader.ObjectTypeCount * sizeof(OKObjectType)); //32 bytes size of ObjectType
	OverKartRAMHeader.ObjectCount = *(int*)(GlobalAddressB);
	GlobalAddressD = GlobalAddressB + 4;
	OverKartRAMHeader.ObjectList = (OKObjectList*)(GlobalAddressD);	
	
	for (int This = 0; This < OverKartRAMHeader.ObjectCount; This++)
	{
		//Loop through the object count and set each individual object in the array.

		OKObjectArray[This].ListIndex = This;
		OKObjectArray[This].TypeIndex = OverKartRAMHeader.ObjectList[This].TypeIndex;
		
		OKObjectArray[This].SubBehaviorClass = SUBBEHAVIOR_DOCILE;

		OKObjectType ThisType = OverKartRAMHeader.ObjectTypeList[OKObjectArray[This].TypeIndex];
		

		OKObjectArray[This].ObjectData.flag = 0xC000;
		OKObjectArray[This].ObjectData.radius = ThisType.BumpRadius / 100;  //used for level calcs BUMP
		
		OverKartRAMHeader.ObjectList[This].OriginPosition[0] *= GlobalShortA;
		
		
		OKObjectArray[This].ObjectData.position[0] = (float)OverKartRAMHeader.ObjectList[This].OriginPosition[0];
		OKObjectArray[This].ObjectData.position[1] = (float)OverKartRAMHeader.ObjectList[This].OriginPosition[1];
		OKObjectArray[This].ObjectData.position[2] = (float)OverKartRAMHeader.ObjectList[This].OriginPosition[2];

		OKObjectArray[This].ObjectData.angle[0] = OverKartRAMHeader.ObjectList[This].OriginAngle[0] * DEG1;
		OKObjectArray[This].ObjectData.angle[1] = OverKartRAMHeader.ObjectList[This].OriginAngle[2] * DEG1;
		OKObjectArray[This].ObjectData.angle[2] = OverKartRAMHeader.ObjectList[This].OriginAngle[1] * DEG1;

		OKObjectArray[This].ObjectData.velocity[0] = (float)(OverKartRAMHeader.ObjectList[This].OriginVelocity[0] * 100);
		OKObjectArray[This].ObjectData.velocity[1] = (float)(OverKartRAMHeader.ObjectList[This].OriginVelocity[1] * 100);
		OKObjectArray[This].ObjectData.velocity[2] = (float)(OverKartRAMHeader.ObjectList[This].OriginVelocity[2] * 100);

		OKObjectArray[This].AngularVelocity[0] = OverKartRAMHeader.ObjectList[This].OriginAngularVelocity[0] * DEG1;
		OKObjectArray[This].AngularVelocity[1] = OverKartRAMHeader.ObjectList[This].OriginAngularVelocity[2] * DEG1;
		OKObjectArray[This].AngularVelocity[2] = OverKartRAMHeader.ObjectList[This].OriginAngularVelocity[1] * DEG1;


		OKObjectArray[This].PathTarget = -1;
		if (ThisType.ObjectAnimations != 0xFFFFFFFF)
		{
			uint* AnimationOffsets = (uint*)(GetRealAddress( ObjectSegment | ThisType.ObjectAnimations));
			GlobalAddressA = GetRealAddress ( ObjectSegment | AnimationOffsets[0]);
			OKObjectArray[This].AnimationMax = (uchar)*(int*)(GlobalAddressA);
			//OKObjectArray[This].AnimationFrame = MakeRandomLimmit((ushort)(OKObjectArray[This].AnimationMax));
		}
	}
	
}

void MapStartup(short InputID) 
{
	LoadCustomHeader(courseValue + gpCourseIndex);
	SetCustomData();
	LoadMapData(InputID);
	setPath();
	
	if (HotSwapID > 0)
	{
		loadTextureScrollTranslucent();
		runKillDisplayObjects();
	}
}
void InitialMapCode()
{
	

	
	InitialMap();
	
	if ((HotSwapID > 0) && (g_gameMode == 3))
	{
		SearchListFile(0x06000000 | OverKartHeader.SurfaceMapPosition);
		MakeCollision();
	}
}

void loadOKObjects()
{
	//Load all the OKObject data from the Course Header.
	GlobalUIntA = OverKartHeader.ObjectDataEnd - OverKartHeader.ObjectModelStart;
	SetSegment(0xA,LoadData(OverKartHeader.ObjectModelStart, GlobalUIntA));
	GlobalUIntA = OverKartHeader.ObjectModelStart - OverKartHeader.ObjectDataStart;
	GlobalAddressA = LoadData(OverKartHeader.ObjectDataStart, GlobalUIntA);
	OverKartRAMHeader.ObjectDataStart = GlobalAddressA;
}



void loadHeaderOffsets()
{
	// Load the offsets to the custom course headers.
	*targetAddress = (long)&ok_HeaderOffsets;
	*sourceAddress = 0xBE9178;
	dataLength = 0x3C00;
	runDMA();
}


void LoadBomb()
{
	if (HotSwapID > 0)
	{
		*sourceAddress = OverKartHeader.BombOffset;
	}
	else
	{
		*sourceAddress = (long)&ok_Bomb;
	}
	*targetAddress = (int)&g_BombTable;
	dataLength = 0xA8;
	runDMA();
}

void LoadCustomHeader(int inputID)
{
	//version 5? 6?
	if ((HotSwapID > 0) && (inputID != -1))
	{
		
		
		//first load the entire OverKart header into expansion RAM
		*targetAddress = (long)&ok_CourseHeader;
		*sourceAddress = *(long*)(&ok_HeaderOffsets + ((inputID) * 1) + ((HotSwapID-1) * 0x14));
		dataLength = (sizeof(OKHeader));
		if (*sourceAddress != 0xFFFFFFFF)
		{
			runDMA();
			VersionNumber = OverKartHeader.Version;

			//load the standard course loadHeaderOffsets
			*targetAddress = (long)&g_courseTable;
			
			if (g_gameMode == 3)
			{
				*targetAddress += 0x2D0;
			}

			*sourceAddress = (long)(&OverKartHeader.MapHeader);
			dataLength = 0x30;
			runRAM();

			surfacemapA = 0x3C040600;   //3C040601
			surfacemapB = 0x24840000  | (OverKartHeader.SurfaceMapPosition & 0xFFFF);
			sectionviewA = 0x3C040600;   //3C040601
			sectionviewB = 0x24840000 | (OverKartHeader.SectionViewPosition & 0xFFFF);  //24849650

			
			battleDisplayA = 0x3C0F0600;
			battleDisplayB = 0x35EF0000 | (OverKartHeader.SectionViewPosition & 0xFFFF); 
			battleSurfaceA = 0x3C040600;
			battleSurfaceB = 0x34840000; 

			pathOffset = 0x06000A20;

		}
		else
		{
			OverKartHeader.Version = 0xFFFFFFFF;
		}
		
	}
	else
	{
		OverKartHeader.Version = 0xFFFFFFFF;
		VersionNumber = 0;
		*sourceAddress = 0x122390;
		*targetAddress = (long)&g_courseTable;
		dataLength = 0x30;
		runDMA();
	}
}

void SetCustomData()
{
	

	setTempo();
	setText();
	setEcho();
	setSong();
	LoadBomb();

	if ((OverKartHeader.Version != 0xFFFFFFFF) && (HotSwapID > 0))
	{
		SetCourseNames(true);		
	}
	else
	{
		SetCourseNames(false);
	}
	
	

}


void setBanners()
{
	if (HotSwapID > 0)
	{
		if (g_gameMode != 3)
		{
			for(int currentCourse = 0; currentCourse < 16; currentCourse++)
			{
				GlobalAddressA = ((long)(&ok_MenuOffsets) + (currentCourse * 8) + ((HotSwapID-1) * 160) );
				*sourceAddress = *(long*)(GlobalAddressA);
				if ((*sourceAddress != 0x00000000) && (*sourceAddress != 0xFFFFFFFF))
				{
					*targetAddress = (long)&ok_FreeSpace;
					GlobalAddressB = (GlobalAddressA + 4);
					dataLength = (*(long*)(GlobalAddressB) - *sourceAddress ) + 16;
					runDMA();
					*sourceAddress = (long)&ok_FreeSpace;
				}
				if (*sourceAddress == 0x00000000)
				{
					*sourceAddress = (long)&bannerU;
				}
				if (*sourceAddress == 0xFFFFFFFF)
				{
					*sourceAddress = (long)&bannerN;
				}
				GlobalAddressA = ((long)(&g_CourseBannerOffsets) + (currentCourse * 5056));
				*targetAddress = GlobalAddressA;
				runMIO();

			}
		}
		else
		{
			for(int currentCourse = 0; currentCourse < 4; currentCourse++)
			{
				GlobalAddressA = ((long)(&ok_MenuOffsets) + 128 + (currentCourse * 8) + ((HotSwapID-1) * 160) );
				*sourceAddress = *(long*)(GlobalAddressA);
				if ((*sourceAddress != 0x00000000) && (*sourceAddress != 0xFFFFFFFF))
				{
					*targetAddress = (long)&ok_FreeSpace;
					GlobalAddressB = (GlobalAddressA + 4);
					dataLength = (*(long*)(GlobalAddressB) - *sourceAddress ) + 16;
					runDMA();
					*sourceAddress = (long)&ok_FreeSpace;
				}
				if (*sourceAddress == 0x00000000)
				{
					*sourceAddress = (long)&bannerU;
				}
				if (*sourceAddress == 0xFFFFFFFF)
				{
					*sourceAddress = (long)&bannerN;
				}
				GlobalAddressA = ((long)(&g_BattleBannerOffsets) + (currentCourse * 5056));
				*targetAddress = GlobalAddressA;
				runMIO();

			}
		}
	}
	else
	{
		if (g_gameMode != 3)
			{
			dataLength = 0x1000;
			GlobalAddressA = (long)&g_CourseBannerOffsets;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7FEFC0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7FF3C0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fe6c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7ffcc0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;
			//
			//
			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7ff7c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fe1c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fcdc0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fc8c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;
			//
			//
			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x8008c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x8000c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7febc0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fd2c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;
			//
			//
			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x8018c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fddc0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x7fd7c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;

			*targetAddress = (long)&ok_FreeSpace;
			*sourceAddress = 0x8004c0;
			runDMA();
			*targetAddress =  GlobalAddressA;
			*sourceAddress = (long)&ok_FreeSpace;
			runTKM();
			GlobalAddressA = GlobalAddressA + 0x13C0;
		}
	}

}



void setPreviews()
{
	if (HotSwapID > 0)
	{
		for(int currentCourse = 0; currentCourse < 20; currentCourse++)
		{
			GlobalAddressA = (long)(&ok_MenuOffsets) + 4 + (currentCourse * 8) + ((HotSwapID-1) * 160);
			*sourceAddress = *(long*)(GlobalAddressA);
			if (*sourceAddress == 0x00000000)
			{
				*sourceAddress = (long)&previewU;
			}
			if (*sourceAddress == 0xFFFFFFFF)
			{
				*sourceAddress = (long)&previewN;
			}
			*sourceAddress += 0x98D65D0;
			*(long*)(&g_CoursePreviewOffsets + 1 + (0xA * currentCourse)) = *sourceAddress;
		}
		
	}
	else
	{

		*targetAddress = (long)&g_CoursePreviewOffsets;
		*sourceAddress = (long)&r_CoursePreviewOffsets;
		dataLength = 0x320;
		runDMA();
	}
}


void swapHS(int direction)
{
	//This function will swap to a new set of custom levels.
	if (direction == 0)
	{
		if  (HotSwapID > 0)
		{
			if (HotSwapID == 1)
			{
				stockASM();
			}
			HotSwapID--;
			
			playSound(0x4900801A);
		}
	}
	else
	{
		if  (HotSwapID < 4)
		{
			if (HotSwapID == 0)
			{
				overkartASM();
			}
			HotSwapID++;
			
			playSound(0x4900801A);
		}
	}
	
	setPreviews();
	previewRefresh();
	setBanners();
	courseValue = -1;
}


void loadMinimap()
{
	*sourceAddress = OverKartHeader.Maps;

	if (*sourceAddress != 0x00000000)
	{
		*targetAddress = (long)&ok_FreeSpace;
		dataLength = 0x1000;
		runDMA();
		
		

		g_mapX = (short)(*(long*)(&ok_FreeSpace) >> 16 & 0x0000FFFF);
		g_mapY = (short)(*(long*)(&ok_FreeSpace) & 0x0000FFFF);
		g_startX = (short)(*(long*)(&ok_FreeSpace + 0x1) >> 16 & 0x0000FFFF);
		g_startY = (short)(*(long*)(&ok_FreeSpace + 0x1) & 0x0000FFFF);
		g_mapHeight = (short)(*(long*)(&ok_FreeSpace + 0x2) >> 16 & 0x0000FFFF);
		g_mapWidth = (short)(*(long*)(&ok_FreeSpace + 0x2) & 0x0000FFFF);
		g_mapR = (short)(*(long*)(&ok_FreeSpace + 0x3) >> 16 & 0x0000FFFF);
		g_mapG = (short)(*(long*)(&ok_FreeSpace + 0x3) & 0x0000FFFF);
		g_mapB = (short)(*(long*)(&ok_FreeSpace + 0x4) >> 16 & 0x0000FFFF);
		g_mapScale = (*(float*)(&ok_FreeSpace + 0x5) / 100);

		if (g_mirrorMode == 1)
		{
			g_startX = g_mapWidth - g_startX;
		}


		*sourceAddress = (long)(&ok_FreeSpace + 0x6);
		*targetAddress = (long)&ok_MapTextureData;
		runMIO();
		g_mapTexture = (long)&ok_MapTextureData;

	}

}



int tempFireParticleMax = 8;


void initFireParticles(long PathOffset)
{
	*tempPointer = PathOffset;
	*sourceAddress = (long)&FireParticlePositions;
	*targetAddress = (long)&objectPosition;
	for (int currentFire = 0; currentFire < tempFireParticleMax; currentFire++)
	{


		FireParticlePositions[currentFire][0] = *(short*)(PathOffset);
		FireParticlePositions[currentFire][1] = *(short*)(PathOffset + 2);
		FireParticlePositions[currentFire][2] = *(short*)(PathOffset + 4);
		
		if (FireParticlePositions[currentFire][0] == 0xFFFF8000)
		{
			if (currentFire < tempFireParticleMax-1)
			{
				return;
			}
			else
			{
				break;
			}
		}
		PathOffset = PathOffset + 8;
	}
	for (int currentFire = 0; currentFire < tempFireParticleMax; currentFire++)
	{
		KWGetCaveFire(currentFire);

		g_DynamicObjects[FireParticleAllocArray[currentFire]].pos_start[0] = (float)FireParticlePositions[currentFire][0];		
		g_DynamicObjects[FireParticleAllocArray[currentFire]].pos_start[1] = (float)FireParticlePositions[currentFire][1]+10;
		g_DynamicObjects[FireParticleAllocArray[currentFire]].pos_start[2] = (float)FireParticlePositions[currentFire][2];
		
		g_DynamicObjects[FireParticleAllocArray[currentFire]].scale = 0.8;
	}
}


char FireRGBA[8][4] = {{150,0,25,255}, {150,20,55,255}, {50,50,255,255}, {50,255,50,255}, {150,90,255,255}, {250,55,55,155}, {100,255,25,255}, {250,105,55,255}};
//8 = tempFireParticleMax

void DisplayFireParticleSub(int num,uchar color,void* Camera)
{
int realindex = num - FireParticleAllocArray[0];

	if (HotSwapID > 0)
	{
		CaveFireColCheck = 0x24010004;
	}
	else
	{
		CaveFireColCheck = 0x24010003;
	}

	switch (color)
	{
	case 3:
		KWSet2Color(FireRGBA[realindex][0],FireRGBA[realindex][1],FireRGBA[realindex][2],FireRGBA[realindex][0]/3,FireRGBA[realindex][1]/3,FireRGBA[realindex][2]/3,FireRGBA[realindex][3]);
		break;
	}
	KWDisplayFireParticleSub(num,color,Camera);

}




void EmptyActionData()
{
    GlobalAddressA = ActionData_Pointer[19];
    ActionData_Pointer[0] = ActionData_Pointer[19];

    *(ushort*)(GlobalAddressA) = 1;
    *(ushort*)(GlobalAddressA + (0x2)) = (ushort)MaxPathPoints[0];
    *(ushort*)(GlobalAddressA + (0x6)) = 6;
}





void DisplayKT1Hook(Screen* Display)
{	
	if (HotSwapID > 0)
	{	
		if (OverKartHeader.FogStart > 0)
		{
			gDPSetCycleType(GraphPtrOffset++, G_CYC_2CYCLE);
			gDPSetFogColor(GraphPtrOffset++, (uint)OverKartHeader.FogRGBA[0],(uint)OverKartHeader.FogRGBA[1],(uint)OverKartHeader.FogRGBA[2],(uint)OverKartHeader.FogRGBA[3]);
			gSPFogPosition(GraphPtrOffset++, OverKartHeader.FogStart, OverKartHeader.FogStop);
			gDPSetRenderMode(GraphPtrOffset++, G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2);
			gSPSetGeometryMode(GraphPtrOffset++, (G_FOG | G_SHADING_SMOOTH));
		}
		
		DisplayGroupmap(SegmentAddress(6,OverKartHeader.SectionViewPosition), Display);
		//DisplayKT1(Display);
		
		if (OverKartHeader.FogStart > 0)
		{
			gDPSetCycleType(GraphPtrOffset++, G_CYC_1CYCLE);
			gSPClearGeometryMode(GraphPtrOffset++, G_FOG);
		}		
	}
	else
	{
		DisplayKT1(Display);
	}
}

void XLUDisplay(Screen* Display)
{	
	return;
	if ((OverKartHeader.Version > 4) && (HotSwapID > 0))
	{	
		/*
		if (OverKartHeader.FogStart > 0)
		{
			gDPSetCycleType(GraphPtrOffset++, G_CYC_2CYCLE);
			gDPSetFogColor(GraphPtrOffset++, (uint)OverKartHeader.FogRGBA[0],(uint)OverKartHeader.FogRGBA[1],(uint)OverKartHeader.FogRGBA[2],(uint)OverKartHeader.FogRGBA[3]);
			gSPFogPosition(GraphPtrOffset++, OverKartHeader.FogStart, OverKartHeader.FogStop);
			gSPSetGeometryMode(GraphPtrOffset++, G_FOG);
		}
		*/
		if (g_gameMode != 3)
		{
			DisplayGroupmap(SegmentAddress(6,OverKartHeader.XLUSectionViewPosition), Display);
		}
		else
		{
			*(long*)*graphPointer = (long)(0x06000000);
			*graphPointer = *graphPointer + 4;
			*(long*)*graphPointer = (long)(SegmentAddress(6,OverKartHeader.XLUSectionViewPosition));
			*graphPointer = *graphPointer + 4;
		}
		/*
		if (OverKartHeader.FogStart > 0)
		{
			gDPSetCycleType(GraphPtrOffset++, G_CYC_1CYCLE);
			gSPClearGeometryMode(GraphPtrOffset++, G_FOG);
		}
		*/
	}
}