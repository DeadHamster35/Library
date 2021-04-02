#include <sys/types.h>
#include <math.h>
#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "LibraryVariables.h"
#include "SubProgram.h"



// VISUALS //

void SetAnimMusicNote(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xB7) |= 32;
}

void SetAnimCrash(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xB7) |= 64;
}

void SetAnimPoomp(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xB6) |= 1;
}

void SetAnimBoing(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xB6) |= 8;
}

void SetAnimExplosion(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xB6) |= 16;
}

void SetAnimBonkStars(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0x44) |= 16;
}

void SetAnimLandingDust(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0x44) |= 1;
}

void SetAnimBooSmoke(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0x44) |= 2;
}

void SetAnimWaterDrip(char playerID, bool active)
{
	if (active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xCA) |= 32;
		return;
	}
	if (!active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xCA) = 0;
		return;
	}
}

void SetAnimSmoking(char playerID, bool active)
{
	if (active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xCA) |= 16;
		return;
	}
	if (!active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xCA) = 0;
		return;
	}
}

void DisableOutline(char playerID) // Fixes custom characters black outlines
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	if (*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xC7) == 0xFF)
	{
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xC7) = 0x30;
	}
}



// GAMEPLAY // 

void SetMapObjectHit(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xD) |= 64;
}

void SetMushroomBoost(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xE) |= 2;
}

void SetLightningHit(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xE) |= 64;
}

void SetStarMan(char playerID, bool active)
{
	if (active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xBE) |= 2;
		GlobalAddressA = (long)(&g_ItemUseCounter);
		*(short*)(GlobalAddressA + (0x4 * playerID) + 0x2) = 0xFFFF;
	}
	if (!active)
	{
		GlobalAddressA = (long)(&g_ItemUseCounter);
		*(short*)(GlobalAddressA + (0x4 * playerID) + 0x2) = 0;
		GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
		ResetStar((void*)(GlobalAddressA), playerID);
	}

}

void SetGhostEffect(char playerID, bool active)
{

	if (active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
		SetVSGhost((void*)(GlobalAddressA), playerID);
	}
	if (!active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
		ResetVSGhost((void*)(GlobalAddressA), playerID);
	}

}

void SetBooTranslucent(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xE) |= 8;
}

void SetBooInvisible(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xC) |= 4;
}



void SetFlattened(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xE) |= 1;
}

void SetSpinOut(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xF) |= 1;
}

void SetGreenShellHit(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xF) |= 4;
}

void SetRedShellHit(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xF) |= 2;
}

void SetBonk(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xBE) |= 128;
}

void ChangeMaxSpeed(char playerID, float SpeedGain)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(float*)(GlobalAddressA + (0xDD8 * playerID) + 0x214) += (float)SpeedGain;
}

void SetCamShiftUp(char playerID, float shift)
{
		GlobalAddressA = (long)(&g_CameraTable);
		*(float*)(GlobalAddressA + (0xB8 * playerID) + 0x34) = 9 + shift;
}

void ChangePlayerSize(char playerID, float ScaleFactor)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(float*)(GlobalAddressA + (0xDD8 * playerID) + 0x70) *= (float)ScaleFactor;
	*(float*)(GlobalAddressA + (0xDD8 * playerID) + 0x224) *= (float)ScaleFactor;
	if (playerID <= 3)
	{
		GlobalAddressA = (long)(&g_CameraTable);
		*(float*)(GlobalAddressA + (0xDD8 * playerID) + 0x38) *= (float)ScaleFactor;
	}
}

void SetPlayerColor(char playerID, int BodyColor, float speed)
{
	GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
	MakeBodyColor( (void*)(GlobalAddressA), playerID, BodyColor, speed);
}

void SetPlayerEcho(char playerID, char echo)
{
	GlobalAddressA = (long)(&g_playerEcho) + (0x3C * playerID);
	*(char*)GlobalAddressA = echo;
}
