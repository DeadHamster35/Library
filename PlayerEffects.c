#include <sys/types.h>
#include <math.h>
#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "LibraryVariables.h"
#include "SubProgram.h"
#include "OKStruct.h"





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

void SetShrunken(char playerID, bool active)
{
	if (active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xBC) |= 64;
		*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xB0) = 0x00FF;
	}
	if (!active)
	{
		GlobalAddressA = (long)(&g_PlayerStateTable);
		*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xBC) |= 8;
		*(short*)(GlobalAddressA + (0xDD8 * playerID) + 0xB0) = 0x01CC;
	}

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

void SetBecomeBomb(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xC) |= 4;
}



void SetFlattened(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xE) |= 1;
}

void SetSpinOutSaveable(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xF) |= 1;
}

void SetSpinOut(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xD) |= 32;
}

void SetFailedStart(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable);
	*(char*)(GlobalAddressA + (0xDD8 * playerID) + 0xC) |= 16;
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

void playrandmCharacterSFX(char playerID)
{
	GlobalAddressA = (long)(&g_PlayerStateTable) + (0xDD8 * playerID);
	GlobalCharA = ((char)*(short*)(GlobalAddressA + 0x254) * 0x10);

	if ((g_RNG <= 0x3333))
	{
    	NAPlyVoiceStart(playerID, 0x29008008 + GlobalCharA);  //voice char lucky sfx
    	return;
    }
	if (g_RNG <= 0x7777)
	{
    	NAPlyVoiceStart(playerID, 0x2900800D + GlobalCharA);   //voice char yahho sfx
    	return;
	}
	if (g_RNG <= 0x9999)
	{
    	NAPlyVoiceStart(playerID, 0x29008001 + GlobalCharA);   //voice char gogo sfx
    	return;
	}
	NAPlyVoiceStart(playerID, 0x2900800C + GlobalCharA);   //voice char jump sfx    
}

void EnableAirControl(char playerID)
{
	GlobalAddressC = (long)&g_PlayerStateTable + (0xDD8 * playerID) + 0xBF;
	GlobalAddressB = (long)&g_PlayerStateTable + (0xDD8 * playerID) + 0xBD;
	if(((*(char*)(GlobalAddressC) & 8) != 0) && ((*(char*)(GlobalAddressC) & 4) == 0) && ((*(char*)(GlobalAddressB) & 16) == 0))
	{
		*(char*)GlobalAddressC ^= 8;
		if(((*(char*)(GlobalAddressC) & 2) == 0) && ((*(char*)(GlobalAddressC) & 16) == 0))
		{
			*(char*)GlobalAddressC |= 16;
			*(char*)GlobalAddressC |= 2;
		}
	}
}




void MasterEffect(int PlayerID, short EffectID)
{
	switch (EffectID)
	{
		case StateAnimMusicNote:
		{
			SetAnimMusicNote(PlayerID);
			break;
		}
		case StateAnimCrash:
		{
			SetAnimCrash(PlayerID);
			break;
		}
		case StateAnimPoomp:
		{
			SetAnimPoomp(PlayerID);
			break;
		}
		case StateAnimBoing:
		{
			SetAnimBoing(PlayerID);
			break;
		}
		case StateAnimExplosion:
		{
			SetAnimExplosion(PlayerID);
			break;
		}
		case StateAnimBonkStars:
		{
			SetAnimBonkStars(PlayerID);
			break;
		}
		case StateAnimLandingDust:
		{
			SetAnimLandingDust(PlayerID);
			break;
		}
	}

}


void MasterStatus(int PlayerID, short StatusID)
{
	switch (StatusID)
	{
		case StateMapObjectHit:
		{
			SetMapObjectHit(PlayerID);
			break;
		}
		case StateLightningHit:
		{
			SetLightningHit(PlayerID);
			break;
		}
		case StateBooTranslucent:
		{
			SetBooTranslucent(PlayerID);
			break;
		}
		case StateBecomeBomb:
		{
			SetBecomeBomb(PlayerID);
			break;			
		}
		case StateFlattened:
		{
			SetFlattened(PlayerID);			
			break;
		}
		case StateMushroomBoost:
		{
			SetMushroomBoost(PlayerID);
			break;
		}
		case StateSpinOutSaveable:
		{
			SetSpinOutSaveable(PlayerID);
			break;
		}
		case StateSpinOut:
		{
			SetSpinOut(PlayerID);
			break;
		}
		case StateGreenShellHit:
		{
			SetGreenShellHit(PlayerID);
			break;
		}
		case StateRedShellHit:
		{
			SetRedShellHit(PlayerID);
			break;
		}
		case StateBonk:
		{
			SetBonk(PlayerID);
			break;
		}
		case StateStarOn:
		{
			SetStarMan(PlayerID,true);
		}
		case StateStarOff:
		{
			SetStarMan(PlayerID,false);
		}
		case StateGhostOn:
		{
			SetGhostEffect(PlayerID,true);
		}
		case StateGhostOff:
		{
			SetGhostEffect(PlayerID,false);
		}
		
	}
}