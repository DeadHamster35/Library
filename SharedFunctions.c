#include "MainInclude.h"



void gameCodeDefault()
{	
	
};
void titleMenuDefault()
{
	
};

void title2Default()
{
	
};
void DisplayObjectDefault(void *Car, Object *InputObject)
{
	
};
void CollideObjectDefault(Player* Car, Object* Target)
{
	if (Target->category == IBOX)
	{
		ItemboxCollideCheck(Car, Target);		
	}

	return;
}
void DisplayCrashScreenDefault()
{

};
long RAMCheckDefault, RAMCheckEndDefault;
void PrintMenuFunctionDefault()
{

};
void DrawPerScreenDefault(Camera* LocalCamera)
{
	if (scrollLock)
	{
		if(HotSwapID > 0)
		{
			DrawOKObjects(LocalCamera, 0);
		}
	}
};


void DisplayFlagGateCheck(Camera* LocalCamera)
{
	
	if ( ((HotSwapID > 0) && (OverKartHeader.GoalBannerToggle != 0)) || (HotSwapID == 0) )
	{	
		DisplayFlagGate(LocalCamera);
	}

	if (HotSwapID > 0)
	{
		if (OverKartHeader.FogStart > 0)
		{
			g_fogToggleBanshee = 1;
			g_fogR = (uint)OverKartHeader.FogRGBA[0];
			g_fogG = (uint)OverKartHeader.FogRGBA[1];
			g_fogB = (uint)OverKartHeader.FogRGBA[2];
			gDPSetCycleType(GraphPtrOffset++, G_CYC_2CYCLE);
			gDPSetFogColor(GraphPtrOffset++, (uint)OverKartHeader.FogRGBA[0], (uint)OverKartHeader.FogRGBA[1], (uint)OverKartHeader.FogRGBA[2], (uint)OverKartHeader.FogRGBA[3]);
			gSPFogPosition(GraphPtrOffset++, OverKartHeader.FogStart, OverKartHeader.FogStop);
			gDPSetRenderMode(GraphPtrOffset++, G_RM_FOG_SHADE_A, G_RM_AA_ZB_XLU_SURF2);
			gSPSetGeometryMode(GraphPtrOffset++, (G_FOG | G_SHADING_SMOOTH));
		}
	}
}
void allRunDefault()
{
	gBackgroundFlag = 1;
}
void CheckHitDefault(int PlayerIndex, int HitType)
{

};
void ExecuteItemHookDefault(Player* Car)
{
	ExecuteItem(Car);
}

void MiniMapDrawDefault()
{
	KWReturnViewport();
	KawanoDrawFinal();
}

void BalloonCheckDefault(int Arg1, float Arg2, float Arg3, char Player, int Arg4, ushort Arg5)
{
	BalloonDisp(Arg1, Arg2, Arg3, Player, Arg4, Arg5);
}


//NEED OVERWRITE WITH OWN FUNCTIONS

extern void gameCodeDefault();
extern void titleMenuDefault();
extern void DisplayObjectDefault(void *Car, Object *InputObject);
extern void CollideObjectDefault(Player* Car, Object* Target);
extern void DisplayCrashScreenDefault();
extern long RAMCheckDefault, RAMCheckEndDefault;
extern void DrawPerScreenDefault(Camera* LocalCamera);
extern void allRunDefault();
extern void PrintMenuFunctionDefault();
extern void CheckHitDefault(int PlayerIndex, int HitType);
extern void ExecuteItemHookDefault(Player* Car);
extern void MiniMapDrawDefault();


//END OF OVERWRITE FUNCTIONS





#define	PHYS_TO_K1(x)	((u32)(x)|0xA0000000)	/* physical to kseg1 */
#define IO_READ(addr)       (*(vu32 *)PHYS_TO_K1(addr))
void DetectEmulator()
{
	uint buff;


	if (IO_READ(0xA4100010) == 0)
	{
		EmulatorPlatform = 1;
		CartridgeStatus = 1;
		return;
	} // DPC_CLOCK_REG in Libultra
		

	// Fallback, harder emulator check.
	// The VI has an interesting quirk where its values are mirrored every 0x40 bytes
	// It's unlikely that emulators handle this, so we'll write to the VI_TEST_ADDR register and readback 0x40 bytes from its address
	// If they don't match, we probably have an emulator
	buff = (*(uint*)0xA4400038);
	(*(uint*)0xA4400038) = 0x6ABCDEF9;
	if ((*(uint*)0xA4400038) != (*(u32*)0xA4400078))
	{
		(*(uint*)0xA4400038) = buff;
		EmulatorPlatform = 1;
		CartridgeStatus = 2;
		return;
	}

	(*(uint*)0xA4400038) = buff;
	EmulatorPlatform = 0;
	CartridgeStatus = 3;
	return;
}


void runDMA()
{
	DMA(*targetAddress, *sourceAddress, dataLength);
}

void DMA_Base729A30Bypass(int input, int length, long output)
{
	

	DMA_Base729A30(input, length, output);
	return;
	
	// To-Do
	// This doesn't work
	// figure out how to make it work
	// there's other functions using 729A30 magic number
	// get out your wizard kit potter.


	//used for loading preview textures.
	if (HotSwapID == 0)
	{
		if ((input & 0x0A000000) == 0x0A000000)
		{
			DMA_Base729A30(input, length, output);
		}
	}
	else
	{
		if ((input & 0x0A000000) == 0x0A000000)
		{
			DMA_Base729A30(input, length, output);
		}
		else
		{
			DMA(output, input, length);
		}
	}
}

void runRAM()
{
	ramCopy(*targetAddress, *sourceAddress, dataLength);
}
int runMIO()
{
	return decodeMIO0(*sourceAddress, *targetAddress);
}
void runTKM()
{
	decodeTKMK(*sourceAddress, tkmPoint, *targetAddress, 0xBE);
}

void loadEEPROM(uint Destination)
{
	osEepromLongRead((void*)(0x8014F0B8), 0, (uchar*)(Destination), 512);
}
void saveEEPROM(uint Source)
{
	osEepromLongWrite((void*)(0x8014F0B8), 0, (uchar*)Source, 512);
}



ushort GetRGBA16(int R, int G, int B, int A)
{
	return (R & 0x1F)<<11 | (G & 0x1F)<<6 | (B & 0x1F)<<1 | (A & 0x01);
}

uint GetRGB32(int R, int G, int B)
{
	return ( (R << 16) | (G << 8) | (B));
}

void SetFontColor(int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB)
{
	ushort *ColorValues = (ushort*)&g_DebugTextPalette;
	ColorValues[0] = 0; //0000 transparent
	ColorValues[1] = GetRGBA16(FontR,FontG,FontB,1);
	ColorValues[2] = GetRGBA16(ShadowR,ShadowG,ShadowB,1);
	ColorValues[3] = 1; //0001 black
}

void SetFontColorPalette(uint Address, int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB)
{
	ushort *ColorValues = (ushort*)Address;
	ColorValues[0] = 0; //0000 transparent
	ColorValues[1] = GetRGBA16(FontR,FontG,FontB,1);
	ColorValues[2] = GetRGBA16(ShadowR,ShadowG,ShadowB,1);
	ColorValues[3] = 1; //0001 black
}

void LoadFontF3D(uint Address)
{
	gSPDisplayList(GraphPtrOffset++, 0x0D008108);
	gSPDisplayList(GraphPtrOffset++, Address);
	gDPSetAlphaCompare	(GraphPtrOffset++ ,G_AC_THRESHOLD);
}

void SetupFontF3D()
{
	
	SetFontColorPalette((uint)&RedTextPalette, 31, 11, 11, 14, 5, 5);
	SetFontColorPalette((uint)&BlueTextPalette, 11, 11, 31, 5, 5, 14);
	SetFontColorPalette((uint)&GreenTextPalette, 11, 31, 11, 5, 14, 5);
	SetFontColorPalette((uint)&WhiteTextPalette, 30, 30, 30, 14, 14, 14);

	*sourceAddress = GetRealAddress(0x0D008080);	
	dataLength = 0xB8;

	*targetAddress = (uint)&RedPaletteF3D;
	runRAM();
	*targetAddress = (uint)&BluePaletteF3D;
	runRAM();
	*targetAddress = (uint)&GreenPaletteF3D;
	runRAM();
	*targetAddress = (uint)&WhitePaletteF3D;
	runRAM();
	
	GlobalAddressA = (uint)(&RedPaletteF3D) + 0x14;
	*(uint*)(GlobalAddressA) = (uint)&RedTextPalette;

	GlobalAddressA = (uint)(&BluePaletteF3D) + 0x14;
	*(uint*)(GlobalAddressA) = (uint)&BlueTextPalette;

	GlobalAddressA = (uint)(&GreenPaletteF3D) + 0x14;
	*(uint*)(GlobalAddressA) = (uint)&GreenTextPalette;

	GlobalAddressA = (uint)(&WhitePaletteF3D) + 0x14;
	*(uint*)(GlobalAddressA) = (uint)&WhiteTextPalette;
}


int LoadOKData (uint SourceInput, uint SizeData)
{
	*sourceAddress = SourceInput;
	*targetAddress = FreeSpaceAddress;
	dataLength = SizeData;
	GlobalShortA = 16 - (SizeData % 16);
	FreeSpaceAddress = FreeSpaceAddress + SizeData + GlobalShortA;
	runDMA();	
	return *targetAddress;
}

int LoadDataBypass(uint RomStart, uint RomEnd)
{
	if (g_gameMode == GAMEMODE_GP)
	{
		if ((gpCourseIndex > asm_CupCount) && (HotSwapID > 0))
		{
			HotSwapGP = HotSwapID;
			HotSwapID = 0;
		}
	}
	
	*sourceAddress = RomStart;	
	dataLength = RomEnd - RomStart  ;
	GlobalShortA = 64 - ((RomEnd - RomStart) % 64);
	dataLength += GlobalShortA;
	LastMemoryPointer -= dataLength;
	*targetAddress = LastMemoryPointer;
	runDMA();
	return LastMemoryPointer;
}

int LoadPressDataBypass(uint RomStart, uint RomEnd)
{
	if (g_gameMode == GAMEMODE_GP)
	{
		if ((gpCourseIndex > asm_CupCount) && (HotSwapID > 0))
		{
			HotSwapGP = HotSwapID;
			HotSwapID = 0;
		}
	}
	*sourceAddress = RomStart;	
	dataLength = RomEnd - RomStart;		
	GlobalShortA = 64 - (dataLength % 64);
	dataLength += GlobalShortA;
	*targetAddress = FreeMemoryPointer;
	runDMA();

	
	dataLength = *(uint*)(*targetAddress + 4);  //size of decompressed data stored in MIO0 header.	
	GlobalShortA = 64 - (dataLength % 64);
	dataLength += GlobalShortA;
	LastMemoryPointer -= dataLength;

	*sourceAddress = FreeMemoryPointer;
	*targetAddress = LastMemoryPointer;	
	runMIO();


	GlobalShortA = 64 - ((RomEnd - RomStart) % 64);
	FreeMemoryPointer += (RomEnd - RomStart) + GlobalShortA;
	return LastMemoryPointer;
}

/* Get Status Timer */

uint getStarTimer(uchar playerID)
{
    return (int)g_gameTimer-g_StarUseCounter[playerID];
}

uint getBooTimer(uchar playerID)
{
    return (int)g_gameTimer-g_GhostUseCounter[playerID];
}

//Returns custom course number
short CustomLevelID()
{
    if (HotSwapID == 0)
    {
        return -1;
    }
    else
    {
		switch (g_cupSelect)
		{
		case 0:
			return (g_courseSelect + (16 * (HotSwapID-1)));
			break;
		case 1:
			return ((g_courseSelect+4) + (16 * (HotSwapID-1)));
			break;
		case 2:
			return ((g_courseSelect+8) + (16 * (HotSwapID-1)));
			break;
		case 3:
			return ((g_courseSelect+12) + (16 * (HotSwapID-1)));
			break;
		default:
			return -1;
			break;
		}
        
    }
}




void loadBigFont()
{
	
	*sourceAddress = (int)(&BigFontROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x6000;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&nicefont);
	runMIO();
}

void ShiftVertColor(uint address,uint counter,uint v_buff,char alpha,char red,char green,char blue)
{
	uint number= SegmentNumber(address);
	uint offset= SegmentOffset(address);
	Vtx_t  *vt=(Vtx_t *)GetRealAddress(SegmentTable[number]+offset);
	int i;
	for(i=0;i<counter;i++)
	{
		vt->cn[0]+=red;
		vt->cn[1]+=green;
		vt->cn[2]+=blue;		
		vt->cn[3]+=alpha;
		++vt;
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



int GetIntLength(int Input)
{
	if (Input < 0)
	{
		Input *= -1;
	}
	if (Input < 10) return 1;
	if (Input < 100) return 2;
	if (Input < 1000) return 3;
	if (Input < 10000) return 4;
	if (Input < 100000) return 5;
	if (Input < 1000000) return 6;
	if (Input < 10000000) return 7;
	if (Input < 100000000) return 8;
	if (Input < 1000000000) return 9;
	return 0;
}
void printDecimal(int X, int Y, float Value, int Length)
{
	int PrintOffset = 0;
	int PrintLength = 10;
	for (int Loop = 1; Loop < Length; Loop++)
	{
		PrintLength *= 10;	
	}
	

	wholeNumber = (int) Value;
	decimalNumber = (int) ((Value - wholeNumber) * PrintLength);
	if (decimalNumber > (float)((Value - wholeNumber) * PrintLength))
	{
		decimalNumber--;
	}

	PrintOffset = 8 * GetIntLength(wholeNumber);

	if (Value < 0)
	{
     	X -= 8;
		PrintOffset += 8;
		decimalNumber *= -1;
	}
	printStringNumber(X,Y,"",wholeNumber);
	printString((X + PrintOffset + 10), Y, ".");		
	PrintOffset += 8;
	if ((decimalNumber < (PrintLength / 10)) && (decimalNumber != 0))
	{
		printStringNumber((X+PrintOffset),Y,"",0);
		PrintOffset += 8;
	}
	printStringNumber((X+PrintOffset),Y,"",decimalNumber);
     
}




#define Rad2Deg(Rad) (Rad * 180 / M_PI)
ushort CalcVerticalDirection(Vector Origin,Vector Target)
{
	float ux,uy,uz,dist;
	

	ux =	Target[0] - Origin[0];
	uy = 	Target[1] - Origin[1];
	uz =	Target[2] - Origin[2];

	dist = Sqrtf((ux*ux)+(uz*uz));
	
	return ((Atan2t(dist,uy)));
}

void MakeAlignVectorX(Vector Input, short RotX)
{
    float sine  = sinT(RotX);
       float cosine = cosT(RotX);
    float v0=Input[0];
    float v1=Input[1];
    float v2=Input[2];
    
     Input[0]=v0;
    Input[1]=sine*v2+cosine*v1;
    Input[2]=cosine*v2-sine*v1;
}


void MakeAlignVectorZ(Vector Input, short RotZ)
{
    float sine  = sinT(RotZ);
       float cosine = cosT(RotZ);
    float v0=Input[0];
    float v1=Input[1];
    float v2=Input[2];
    
     Input[0]=cosine*v0+sine*v1;
    Input[1]=-sine*v0+cosine*v1;
    Input[2]=v2;
}

void printFloat(int X, int Y, float Value)
{
	printDecimal(X,Y,Value,2);	
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

					    	//x,0,1,2,3,4,5,6,7
char CharacterConvert[9] = 	{-1,0,1,6,3,2,4,5,7};
char CharacterUnconvert[9] = 	{-1,0,1,4,3,5,6,2,7};

//WaveDir = Address to a stored ushort for the calculation
//WaveSpeed = Additional value (degree)
void RunWaveSpeed(ushort *WaveDir,short WaveSpeed)
{
	*(ushort*)WaveDir += WaveSpeed;
}

//WaveXScale = Width of the wave - horizontally
//WaveYThin = Higher value means less distance between waves (degree) - vertically
//WaveDir = Variable that gets calculated by RunWaveSpeed
void SpriteDrawWave(int cx,int cy,ushort *addr,int sizex,int sizey,float WaveXScale,short WaveYThin,ushort WaveDir)
{
	short angle;
	short angstep = WaveYThin;
	int intsx = cx - sizex / 2;
	int sy = cy - sizey / 2;

	int	sx;
	ushort *tmpaddr;

	angle = WaveDir;
	tmpaddr = addr;

	for	(int i = 0; i < sizey; i++)
	{
		KWLoadTextureBlockRGBA16B(tmpaddr+sizex*i,sizex,1);
		sx = (int)(intsx + (WaveXScale) * sinT(angle+angstep*i));
		SPRDrawClip(sx,sy,sizex,1,1);
		sy++;
	}
}

int custom_check_triangle_zx(Bump *bump, float radius,float p1x,float p1y, float p1z, ushort pointer)
{
	return CheckTriangleZX(bump, radius, p1x, p1y, p1z, pointer);
}

int custom_check_triangle_xy(Bump *bump, float radius,float p1x,float p1y, float p1z, ushort pointer)
{
	return CheckTriangleXY(bump, radius, p1x, p1y, p1z, pointer);
}

int custom_check_triangle_yz(Bump *bump, float radius,float p1x,float p1y, float p1z, ushort pointer)
{
	return CheckTriangleYZ(bump, radius, p1x, p1y, p1z, pointer);
}

int custom_check_triangle_zx_v(Bump *bump,float radius,float p1x, float p1y, float p1z ,ushort pointer ,float lastx,float lasty,float lastz)
{
	return CheckTriangleZX_V(bump, radius, p1x, p1y, p1z, pointer, lastx, lasty, lastz);
}

int custom_check_triangle_xy_v(Bump *bump,float radius,float p1x, float p1y, float p1z ,ushort pointer ,float lastx,float lasty,float lastz)
{
	return CheckTriangleXY_V(bump, radius, p1x, p1y, p1z, pointer, lastx, lasty, lastz);
}

int custom_check_triangle_yz_v(Bump *bump,float radius,float p1x ,float p1y, float p1z, ushort pointer ,float lastx,float lasty,float lastz)
{
	return CheckTriangleYZ_V(bump, radius, p1x, p1y, p1z, pointer, lastx, lasty, lastz);
}

ushort custom_check_bump(Bump *bump,float radius,float px,float py,float pz)
{
    return CheckBump(bump, radius, px, py, pz);
}

ushort custom_check_bump_2(Bump* bump, float radius, float px, float py, float pz, float lastx, float lasty, float lastz)
{
	ushort tmp = CheckBump2(bump, radius, px, py, pz, lastx, lasty, lastz);
	
	if (tmp != 0)
	{
		InteractLavaFloor(bump, bump->last_zx, tmp);
	}
	return tmp;
}