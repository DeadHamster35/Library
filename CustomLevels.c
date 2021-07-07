#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"
#include "../Library/PlayerChecks.h"
#include "../library/OKExternal.h"
#include "../Library/OKCustomObjects.h"
#include "../library/LibraryVariables.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"










void previewRefresh()
{
	g_menuPreviewValue1 = 9;
	g_menuPreviewValue2 = 9;
	g_menuPreviewValue3 = 9;
	g_menuPreviewValue4 = 9;
}

void copyCourseTable(int copyMode)
{
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

	battleItemBoxesA = 0x24840038;

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
	itemboxesB = 0x24841910; //8029DBDC

	battleItemBoxesA = 0x24841938;

	//8029E0D8

	treeslistA = 0x3C040600; //8029DBBC
	treeslistB = 0x24841B18; //8029DBC4

	treesdisplayA = 0x3C180600; //802992C8
	treesdisplayB = 0x27182288; //802992E0

	piranhalistA = 0x3C040600; //8029DBC8
	piranhalistB = 0x24841D20; //8029DBD0

	piranhadisplayA = 0x3C0F0600; //80298668
	piranhadisplayB = 0x25EF21B0; //8029866C


	sectionviewA = 0x3C040600;   //3C040900
	sectionviewB = 0x24842328;   //248401F0

	battleDisplayA = 0x3C0F0600;
	battleDisplayB = 0x35EF0008;
	battleSurfaceA = 0x3C040600;
	battleSurfaceB = 0x34840008;

	surfacemapA = 0x3C040600;   //3C040601
	surfacemapB = 0x24842538;  //24849650


	unknownA1 = 0x3C190600; //0x802927FC   ;;3C190601 -> 3C190600
	unknownB1 = 0x3C040600; //0x802927FC   ;;3C190601 -> 3C190600
	unknownC1 = 0x3C040600; //0x802927FC   ;;3C190601 -> 3C190600
	unknownD1 = 0x3C040600; //0x802927FC   ;;3C190601 -> 3C190600

	unknownA2 = 0x27390000; //0x80292810   ;;27399348 -> 27390000

	unknownB = 0x34840000; //0x802927FC   ;;34841140 -> 34840000
	unknownC = 0x34840000; //0x80292810   ;;348408E8 -> 34840000
	unknownD = 0x34840000; //0x80295E70   ;;34842D68 -> 34840000

	g_pathLength = 0x320;
	pathOffset = 0x06000008;
	pathOffsetB = 0x06000008;


	g_mapStartToggle = 0x00000000;

	//ok_RedCoinList = 0x06001F28;



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
	asm_GPLevelSelect = 0xA420C5A0;
}


void setSong()
{
	if ((HotSwapID > 0))
	{
		
		if (OverKartHeader.MusicID < 0x50)
		{
			songID = (short)OverKartHeader.MusicID;
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
	}
}



void setTempo(void)
{
	if (SystemType == 0)
	{
		if (HotSwapID > 0)
		{

			GlobalIntA = *(long*)(&OverKartHeader.Tempo1);
			GlobalIntB = 0;
			dataLength = 0xC;
			switch(g_playerCount)
			{
				case 1:
				asm_tempo1A = 0x240F0000;
				asm_tempo1B = 0x240F0000;
				GlobalIntB = GlobalIntA >> 24;
				asm_tempo1ASpeed = (short)OverKartHeader.Tempo1;
				asm_tempo1BSpeed = (short)OverKartHeader.Tempo1;
				break;
				case 2:
				asm_tempo2A = 0x24090000;
				asm_tempo2B = 0x24090000;
				GlobalIntB = (GlobalIntA >> 16) & (0x00FF);
				asm_tempo2ASpeed = (short)OverKartHeader.Tempo2;
				asm_tempo2BSpeed = (short)OverKartHeader.Tempo2;
				break;
				case 3:
				asm_tempo3A = 0x240A0000;
				asm_tempo3B = 0x240A0000;
				GlobalIntB = (GlobalIntA >> 8) & (0x00FF);
				asm_tempo3ASpeed = (short)OverKartHeader.Tempo3;
				asm_tempo3BSpeed = (short)OverKartHeader.Tempo3;
				break;
				case 4:
				asm_tempo3A = 0x240A0000;
				asm_tempo3B = 0x240A0000;
				GlobalIntB = GlobalIntA & 0x00FF;
				asm_tempo3ASpeed = (short)OverKartHeader.Tempo4;
				asm_tempo3BSpeed = (short)OverKartHeader.Tempo4;
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
		asm_tempo1ASpeed = 2;
		asm_tempo1BSpeed = 2;

		asm_tempo2A = 0x24090000;
		asm_tempo2B = 0x24090000;
		asm_tempo2ASpeed = 2;
		asm_tempo2BSpeed = 2;

		asm_tempo3A = 0x240A0000;
		asm_tempo3B = 0x240A0000;
		asm_tempo3ASpeed = 2;
		asm_tempo3BSpeed = 2;
	}
	


}
void setPath()
{

	if (HotSwapID > 0)
	{
		g_pathLength =(short)(OverKartHeader.PathLength) + 10;

	}
	else
	{
		g_pathLength = 0x0258;
	}
}

void setWater()
{

	if (HotSwapID > 0)
	{
		g_waterHeight = OverKartHeader.WaterLevel;
		SetWaterType(OverKartHeader.WaterType);
	}
}

void CheckEcho()
{	
	
}



void setEcho()
{
	if (HotSwapID > 0)
	{		
		GlobalIntA = OverKartHeader.EchoEnd - OverKartHeader.EchoStart;
		OverKartRAMHeader.EchoOffset = LoadData(OverKartHeader.EchoStart, GlobalIntA);
	}
	else
	{
		g_EchoStart = 0x19B;
		g_EchoStop = 0x1B9;
	}
	
}
void setSky()
{

	if (HotSwapID > 0)
	{

		*targetAddress = (long)&g_skyColorTop00;
		*sourceAddress = OverKartHeader.Sky;
		dataLength = 0xC;
		runDMA();
		*targetAddress = (long)&g_skyColorBotTable;
		*sourceAddress = *sourceAddress + 0xC;
		GlobalIntD = dataLength;
		runDMA();
	}
	else
	{
		*targetAddress = (long)&g_skyColorTop00;
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
		*sourceAddress = OverKartHeader.ScrollOffset;
		if (*sourceAddress != 0)
		{
			*targetAddress = (long)&ok_scrolltranslucent;
			dataLength = OverKartHeader.ScrollEnd - *sourceAddress;
			dataLength += 4;
			runDMA();
		}
	}
}


void runTextureScroll()
{
	GlobalAddressA = (long)(&ok_scrolltranslucent);
	LoopValue = *(long*)(&ok_scrolltranslucent);
	if (LoopValue == 0xFFFFFFFF)
	{
		return;
	}
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
	LoopValue = *(long*)(&ok_scrolltranslucent);
    if (LoopValue == 0xFFFFFFFF)
    {
        return;
    }
	GlobalAddressA = (long)(&ok_scrolltranslucent) + (LoopValue * 8) + 4;
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



void setText()
{
	
	*sourceAddress = OverKartHeader.Credits;
	*targetAddress = (long)&ok_Credits;
	dataLength = 0x18;
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


void runDisplayScreen()
{
	LoopValue = *(long*)(&ok_scrolltranslucent);
    if (LoopValue == 0xFFFFFFFF)
    {
        return;
    }
	GlobalAddressA = (long)(&ok_scrolltranslucent) + (LoopValue * 8) + 4;
	LoopValue = *(long*)GlobalAddressA;
    if (LoopValue == 0xFFFFFFFF)
    {
        return;
    }
    	GlobalAddressB = GlobalAddressA + (LoopValue * 8) + 4;
	LoopValue = *(long*)GlobalAddressB;
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

		*tempPointer = 0x00D100D3;
		*sourceAddress = PhysToK0((int)g_CfbPtrs[GlobalShortA]);
		*targetAddress = (GetRealAddress(GlobalAddressC));

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

void loadOKObjects()
{
	/*
	for (int This = 0; This < 100; This++)
	{
		ClearOKObject(This);
	}
	GlobalIntA = OverKartHeader.ObjectDataEnd - OverKartHeader.ObjectModelStart;
	SetSegment(0xA,LoadData(OverKartHeader.ObjectModelStart, GlobalIntA));
	GlobalIntA = OverKartHeader.ObjectModelStart - OverKartHeader.ObjectDataStart;
	GlobalAddressA = LoadData(OverKartHeader.ObjectDataStart, GlobalIntA);
	OverKartHeader.ObjectDataStart = GlobalAddressA;
	
	
	OverKartRAMHeader.ObjectHeader.ObjectTypeCount = *(int*)(GlobalAddressA);
	GlobalAddressC = GlobalAddressA + 4;
	OverKartRAMHeader.ObjectHeader.ObjectTypeList = (OKObjectType*)(GlobalAddressC);

	
	GlobalAddressB = GlobalAddressA + 4 + (OverKartRAMHeader.ObjectHeader.ObjectTypeCount * 24);
	OverKartRAMHeader.ObjectHeader.ObjectCount = *(int*)(GlobalAddressB);
	GlobalAddressD = GlobalAddressB + 4;
	OverKartRAMHeader.ObjectHeader.ObjectList = (OKObjectList*)(GlobalAddressD);	
	
	for (int This = 0; This < OverKartRAMHeader.ObjectHeader.ObjectCount; This++)
	{
		OKObjectArray[This].ListIndex = This;
		OKObjectArray[This].SubBehaviorClass = SUBBEHAVIOR_DOCILE;

		OKObjectArray[This].ObjectData.flag = 0xC000;
		OKObjectArray[This].ObjectData.radius = OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[This].ObjectIndex].CollisionRadius;
		
		OKObjectArray[This].ObjectData.position[0] = (float)OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginPosition[0];
		OKObjectArray[This].ObjectData.position[1] = (float)OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginPosition[1];
		OKObjectArray[This].ObjectData.position[2] = (float)OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginPosition[2];

		OKObjectArray[This].ObjectData.angle[0] = OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginAngle[0] * DEG1;
		OKObjectArray[This].ObjectData.angle[1] = OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginAngle[1] * DEG1;
		OKObjectArray[This].ObjectData.angle[2] = OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginAngle[2] * DEG1;

		OKObjectArray[This].ObjectData.velocity[0] = (float)(OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginVelocity[0] * 100);
		OKObjectArray[This].ObjectData.velocity[1] = (float)(OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginVelocity[1] * 100);
		OKObjectArray[This].ObjectData.velocity[2] = (float)(OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginVelocity[2] * 100);

		OKObjectArray[This].AngularVelocity[0] = OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginAngle[0] * DEG1;
		OKObjectArray[This].AngularVelocity[1] = OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginAngle[1] * DEG1;
		OKObjectArray[This].AngularVelocity[2] = OverKartRAMHeader.ObjectHeader.ObjectList[This].OriginAngle[2] * DEG1;
	}
	*/
}



void loadHeaderOffsets()
{
	*targetAddress = (long)&ok_HeaderOffsets;
	*sourceAddress = 0xBE9178;
	dataLength = 0x3C00;
	runDMA();
}


void loadHotSwap(int inputID)
{
	//version 4
	if (HotSwapID > 0)
	{

		//version 4
		//first load the entire OverKart header into expansion RAM
		*targetAddress = (long)&ok_CourseHeader;
		*sourceAddress = *(long*)(&ok_HeaderOffsets + ((inputID) * 1) + ((HotSwapID-1) * 0x14));
		dataLength = 0x74;
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
		}

	}
	else
	{
		*sourceAddress = 0x122390;
		*targetAddress = (long)&g_courseTable;
		dataLength = 0x30;
		runDMA();
	}

	
	setTempo();
	
	setEcho();
	setPath();
	setSong();


	if (VersionNumber > 3)
	{
		loadTextureScrollTranslucent();
		
		if (VersionNumber > 4)
		{
			loadOKObjects();
			setText();
		}
	}
	

}

void setLabel(void)
{
	*targetAddress = (long)&g_bannerTexture;

	switch (HotSwapID)
	{
		case 0:
		{
			*sourceAddress = (long)&set0;
			break;
		}
		case 1:
		{
			*sourceAddress = (long)&set1;
			break;
		}
		case 2:
		{
			*sourceAddress = (long)&set2;
			break;
		}
		case 3:
		{
			*sourceAddress = (long)&set3;
			break;
		}
		case 4:
		{
			*sourceAddress = (long)&set4;
			break;
		}
	}
	runMIO();
}


void setBanners()
{

	//1F40

	//2F80
	if (HotSwapID > 0)
	{
		for(int currentCourse = 0; currentCourse < 16; currentCourse++)
		{


			*sourceAddress = *(long*)(&ok_MenuOffsets + (currentCourse * 2) + ((HotSwapID-1) * 0x28));
			if ((*sourceAddress != 0x00000000) && (*sourceAddress != 0xFFFFFFFF))
			{
				*targetAddress = (long)&ok_FreeSpace;
				dataLength = (*(long*)(&ok_MenuOffsets + (currentCourse * 2) + ((HotSwapID-1) * 0x28) + 1) - *sourceAddress);
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

			*targetAddress = (long)(&g_CourseBannerOffsets + (currentCourse * 0x4F0));
			runMIO();

		}
	}
	else
	{
		/*
		7FEFC0
		7FF3C0
		7fe6c0
		7ffcc0

		7ff7c0
		7fe1c0
		7fcdc0
		7fc8c0

		8008c0
		8000c0
		7febc0
		7fd2c0

		8018c0
		7fddc0
		7fd7c0
		8004c0
		*/
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
		//
		//


	}

}



void setPreviews()
{

	//1F40

	//2F80
	if (HotSwapID > 0)
	{
		for(int currentCourse = 0; currentCourse < 16; currentCourse++)
		{
			*sourceAddress = *(long*)(&ok_MenuOffsets + (currentCourse * 2) + ((HotSwapID-1) * 0x28) + 1);

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
	if (direction == 0)
	{
		if  (HotSwapID > 0)
		{
			if (HotSwapID == 1)
			{
				stockASM();
			}
			HotSwapID = HotSwapID - 1;
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
			HotSwapID = HotSwapID + 1;
		}
	}
	setLabel();


	setPreviews();
	previewRefresh();
	setBanners();
	courseValue = -1;
//	playSound(0x4900801A);
}


void loadMinimap()
{
	*sourceAddress = OverKartHeader.Maps;

	if (*sourceAddress != 0x00000000)
	{
		*targetAddress = (long)&ok_FreeSpace;
		dataLength = 0x1000;
		runDMA();
		//
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


		*sourceAddress = (long)(&ok_FreeSpace + 0x6);
		*targetAddress = (long)&ok_MapTextureData;
		runMIO();
		g_mapTexture = (long)&ok_MapTextureData;

	}

}

void SetCourseNames(bool custom)
{
		*sourceAddress = *(long*)(&ok_CourseHeader + 0xE);
		*targetAddress = (long)&ok_Credits;
		dataLength = 0x36;

		int strtbl;

		if ((custom == true) && (*sourceAddress != 0x00000000))
		{
			runDMA();
			for (strtbl = 0; strtbl < 20; strtbl++)
			{
				g_StringTableCourse[strtbl] = (long)&ok_Credits + 0x4;
				g_StringTableCourseGP[strtbl] = (long)&ok_Credits + 0x4;
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





//Snow
long A4Snow[50]={
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
};

//Rain
long A4Rain[50]={
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


void SetWeatherType(char WeatherType) // 0 = Snow // 1 = Rain
{
	if (currentMenu == 0x25 || g_fadeOutCounter == 1)
	{
		if	(HotSwapID > 0)
		{
			switch (WeatherType)
			{	
				case 1:
				{
					for (int texarr = 0; texarr < 50; texarr++)
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

				default:
				{
					for (int texarr = 0; texarr < 50; texarr++)
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
			for (int texarr = 0; texarr < 50; texarr++)
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
		if	(HotSwapID > 0)
		{
			CloudTypeMapCheck1 = (CloudTypeMapCheck1 & 0xFFFF0000) + ((long)&CloudCourseID >> 16 & 0x0000FFFF) +1;
			CloudTypeMapCheck2 = (CloudTypeMapCheck2 & 0xFFFF0000) + ((long)&CloudCourseID & 0x0000FFFF);
			CloudAmountMapCheck1 = (CloudAmountMapCheck1 & 0xFFFF0000) + ((long)&CloudCourseID >> 16 & 0x0000FFFF) +1;
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
		}

		switch (CloudType)
		{
			case 0:
			{
				CloudCourseID = 2;
				break;
			}
			case 1:
			{
				CloudCourseID = 0;
				break;
			}
			case 2:
			{
				CloudCourseID = 14;
				break;
			}
			case 3:
			{
				CloudCourseID = 5;
				break;
			}
			default:
			{
				CloudCourseID = 0;
				break;
			}
		}
	}
}

void Snow3DTrigger()						// Used to disable 3D snow on certain pathmarker ranges 
{
	#define S3DArraySize 2					// Array size for the total amount of 3DSnow Disable sections used. Pull from course data

	short S3DTrStart[S3DArraySize];
	short S3DTrEnd[S3DArraySize];

	if (Snow3DCourseID == 5)				// Only run for existing racers
	{
		for (int LoopVal = 0; LoopVal < S3DArraySize; LoopVal++)
		{
		// Fill out each index of the arrays with data from course. Loop value as offset multiplicator//
			S3DTrStart[LoopVal] = 140;
			S3DTrEnd[LoopVal] = 200;


			if ((g_playerPathPointTable[0] >= S3DTrStart[LoopVal]) && (g_playerPathPointTable[0] <= S3DTrEnd[LoopVal]))		// Path range check
			{
				g_3DSnowSpawnHeight = (g_3DSnowSpawnHeight & 0xFFFF0000) + (0x602D & 0x0000FFFF);
				break;
			}
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
			Snow3DAllocMapCheck1 = (Snow3DAllocMapCheck1 & 0xFFFF0000) + ((long)&Snow3DCourseID >> 16 & 0x0000FFFF) +1;
			Snow3DAllocMapCheck2 = (Snow3DAllocMapCheck2 & 0xFFFF0000) + ((long)&Snow3DCourseID & 0x0000FFFF);
			Snow3DDisplayAfterMapCheck1 = (Snow3DDisplayAfterMapCheck1 & 0xFFFF0000) + ((long)&Snow3DCourseID >> 16 & 0x0000FFFF) +1;
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
		Snow3DCourseID = 0;
	}
}

void SnowCustomCheck(int SnowIndex)
{
	if (g_DynamicObjects[SnowIndex].pos[1] <= GlobalPlayer[0].position[1] - 5.0 || g_DynamicObjects[SnowIndex].pos[1] >= GlobalPlayer[0].position[1] + 60.0)
	{
		g_DynamicObjects[SnowIndex].anmptr = 1;
//		KWAnmNext(SnowIndex);
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
}

void CommonGameEventChart()
{
<<<<<<< HEAD
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
=======
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
>>>>>>> f43cfd8... Path and Object Code
}