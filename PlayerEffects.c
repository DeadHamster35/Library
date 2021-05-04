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
	GlobalPlayer[(int)playerID]->talk |= 32;
}

void SetAnimCrash(char playerID)
{
	GlobalPlayer[(int)playerID]->talk |= 64;
}

void SetAnimPoomp(char playerID)
{
	GlobalPlayer[(int)playerID]->talk |= 256;
}

void SetAnimBoing(char playerID)
{
	GlobalPlayer[(int)playerID]->talk |= 2048;
}

void SetAnimExplosion(char playerID)
{
	GlobalPlayer[(int)playerID]->talk |= 4096;
}

void SetAnimBonkStars(char playerID)
{
	GlobalPlayer[(int)playerID]->handling_flag |= 4096;
}

void SetAnimLandingDust(char playerID)
{
	GlobalPlayer[(int)playerID]->handling_flag |= 256;
}

void SetAnimBooSmoke(char playerID)
{
	GlobalPlayer[(int)playerID]->handling_flag |= 512;
}

void SetAnimWaterDrip(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID]->jugemu_flag |= 8192;
		return;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID]->jugemu_flag & 8192) != 0))
	{
		GlobalPlayer[(int)playerID]->jugemu_flag ^= 8192;
		return;
	}
}

void SetAnimSmoking(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID]->jugemu_flag |= 4096;
		return;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID]->jugemu_flag & 4096) != 0))
	{
		GlobalPlayer[(int)playerID]->jugemu_flag ^= 4096;
		return;
	}
}

void DisableOutline(char playerID) // Fixes custom characters black outlines
{
	if ((unsigned char)GlobalPlayer[(int)playerID]->erase == 0xFF)
	{
		GlobalPlayer[(int)playerID]->erase = 0x30;
	}
}



// GAMEPLAY // 

void SetMapObjectHit(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 4194304;
}

void SetMushroomBoost(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 512;
}

void SetLightningHit(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 16384;
}

void SetShrunken(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID]->slip_flag |= 1073741824;
		GlobalPlayer[(int)playerID]->thunder_timer = 0x00FF;
	}
	if (!active)
	{
		GlobalPlayer[(int)playerID]->slip_flag |= 134217728;
		GlobalPlayer[(int)playerID]->thunder_timer = 0x01CC;
	}
}

void SetStarMan(char playerID, bool active)
{
	if (active)
	{
		if ((GlobalPlayer[(int)playerID]->slip_flag & 512) == 0)
		{
			NAEnmTrgStart(GlobalPlayer[(int)playerID]->position,GlobalPlayer[(int)playerID]->velocity,0x0100ff2c);
		}
		GlobalPlayer[(int)playerID]->slip_flag |= 512;
		g_StarUseCounter[(int)playerID]  = 0xFFFF;
	}
	if (!active)
	{
		g_StarUseCounter[(int)playerID]  = 0;
		ResetStar((void*)GlobalPlayer[(int)playerID], playerID);
		NAEnmTrgStop(GlobalPlayer[(int)playerID]->position,0x0100ff2c);
	}

}

void SetGhostEffect(char playerID, bool active)
{

	if (active)
	{
		if ((GlobalPlayer[(int)playerID]->slip_flag & 2147483648U) == 0)
		{
			SetVSGhost((void*)GlobalPlayer[(int)playerID], playerID);
		}
		g_GhostUseCounter[(int)playerID]  = 0xFFFF;
	}
	if ((!active))
	{
		g_GhostUseCounter[(int)playerID]  = 0;
		g_GhostUseTimer[(int)playerID]  = -1;
		ResetVSGhost((void*)GlobalPlayer[(int)playerID], playerID);
	}

}

void SetBooTranslucent(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 2048;
}

void SetBecomeBomb(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID]->weapon |= 67108864;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID]->flag & 64) != 0))
	{
		GlobalPlayer[(int)playerID]->flag ^= 64;
	}
}



void SetFlattened(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID]->weapon |= 256;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID]->weapon & 256) != 0))
	{
		GlobalPlayer[(int)playerID]->weapon ^= 256;
	}
}

void SetSpinOutSaveable(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 1;
}

void SetSpinOut(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 2097152;
}

void SetFailedStart(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 268435456;
}

void SetGreenShellHit(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 4;
}

void SetRedShellHit(char playerID)
{
	GlobalPlayer[(int)playerID]->weapon |= 2;
}

void SetBonk(char playerID)
{
	GlobalPlayer[(int)playerID]->slip_flag |= 32768;
}

void ChangeMaxSpeed(char playerID, float SpeedGain)
{
	GlobalPlayer[(int)playerID]->acc_maxcount += (float)SpeedGain;
}

void SetCamShiftUp(char playerID, float shift)
{
	GlobalCamera[(int)playerID]->camera_vector[1] = 9 + shift;
}

void ChangePlayerSize(char playerID, float ScaleFactor)
{
	if(((GlobalPlayer[(int)playerID]->kart) == 5) || ((GlobalPlayer[(int)playerID]->kart) == 7))
	{
		GlobalPlayer[(int)playerID]->radius = 6 * (float)ScaleFactor;
	}
	else
	{
		GlobalPlayer[(int)playerID]->radius = 5.5 * (float)ScaleFactor;
	}
	GlobalPlayer[(int)playerID]->offsetsize = (float)ScaleFactor;

	if (playerID <= 3)
	{
		GlobalCamera[(int)playerID]->camera_vector[1] = 9 * (float)ScaleFactor;
	}
}

void SetPlayerColor(char playerID, int Colors, int AdjColor, float speed)
{
	MakeBodyColor((void*)GlobalPlayer[(int)playerID], playerID, Colors, speed);
	MakeBodyColorAdjust((void*)GlobalPlayer[(int)playerID], playerID, AdjColor, speed);
}

void SetPlayerEcho(char playerID, char echo)
{
	GlobalAddressA = (long)(&g_playerEcho) + (0x3C * playerID);
	*(char*)GlobalAddressA = echo;
}

void playrandmCharacterSFX(char playerID)
{
	if ((g_RNG <= 0x3333))
	{
    	NAPlyVoiceStart(playerID, 0x29008008 + (GlobalPlayer[(int)playerID]->kart * 0x10));  //voice char lucky sfx
    	return;
    }
	if (g_RNG <= 0x7777)
	{
    	NAPlyVoiceStart(playerID, 0x2900800D + (GlobalPlayer[(int)playerID]->kart * 0x10));   //voice char yahho sfx
    	return;
	}
	if (g_RNG <= 0x9999)
	{
    	NAPlyVoiceStart(playerID, 0x29008001 + (GlobalPlayer[(int)playerID]->kart * 0x10));   //voice char gogo sfx
    	return;
	}
	NAPlyVoiceStart(playerID, 0x2900800C + (GlobalPlayer[(int)playerID]->kart * 0x10));   //voice char jump sfx    
}

void EnableAirControl(char playerID)
{
	if(((GlobalPlayer[(int)playerID]->slip_flag & 8) != 0) && ((GlobalPlayer[(int)playerID]->slip_flag & 4) == 0) && ((GlobalPlayer[(int)playerID]->slip_flag & 1048576) == 0))
	{
		GlobalPlayer[(int)playerID]->slip_flag ^= 8;
		if(((GlobalPlayer[(int)playerID]->slip_flag & 2) == 0) && ((GlobalPlayer[(int)playerID]->slip_flag & 16) == 0))
		{
			GlobalPlayer[(int)playerID]->slip_flag |= 16;
			GlobalPlayer[(int)playerID]->slip_flag |= 2;
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
		case StateBecomeBombOn:
		{
			SetBecomeBomb(PlayerID, true);
			break;			
		}
		case StateBecomeBombOff:
		{
			SetBecomeBomb(PlayerID, false);
			break;			
		}
		case StateFlattenedOn:
		{
			SetFlattened(PlayerID, true);			
			break;
		}
		case StateFlattenedOff:
		{
			SetFlattened(PlayerID, false);			
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