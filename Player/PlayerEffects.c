#include "../MainInclude.h"





// VISUALS //

void SetAnimMusicNote(char playerID)
{
	GlobalPlayer[(int)playerID].talk |= MUSIC_NOTE;
}

void SetAnimCrash(char playerID)
{
	GlobalPlayer[(int)playerID].talk |= CRASH;
}

void SetAnimPoomp(char playerID)
{
	GlobalPlayer[(int)playerID].talk |= POOMP;
}

void SetAnimBoing(char playerID)
{
	GlobalPlayer[(int)playerID].talk |= BOING;
}

void SetAnimExplosion(char playerID)
{
	GlobalPlayer[(int)playerID].talk |= FLASH;
}

void SetAnimBonkStars(char playerID)
{
	GlobalPlayer[(int)playerID].handling_flag |= TROPHYJUMP_STARS;
}

void SetAnimLandingDust(char playerID)
{
	GlobalPlayer[(int)playerID].handling_flag |= LANDING_DUST;
}

void SetAnimBooSmoke(char playerID)
{
	GlobalPlayer[(int)playerID].handling_flag |= BOO_SMOKE_EFFECT;
}

void SetAnimWaterDrip(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID].jugemu_flag |= WATER_EFFECT;
		return;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID].jugemu_flag & WATER_EFFECT) != 0))
	{
		GlobalPlayer[(int)playerID].jugemu_flag ^= WATER_EFFECT;
		return;
	}
}

void SetAnimSmoking(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID].jugemu_flag |= LAVA_EFFECT;
		return;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID].jugemu_flag & LAVA_EFFECT) != 0))
	{
		GlobalPlayer[(int)playerID].jugemu_flag ^= LAVA_EFFECT;
		return;
	}
}

void DisableOutline(char playerID) // Fixes custom characters black outlines
{
	if ((unsigned char)GlobalPlayer[(int)playerID].erase == 0xFF)
	{
		GlobalPlayer[(int)playerID].erase = 0x30;
	}
}



// GAMEPLAY // 

void SetMapObjectHit(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= HIT_BOMB;
}

void SetMushroomBoost(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= USE_MUSHROOM;
}

void SetLightningHit(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= HIT_LIGHTNING;
}

void SetShrunken(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID].slip_flag |= IS_LIGHTNING_HIT;
		GlobalPlayer[(int)playerID].thunder_timer = 0x00FF;
	}
	if (!active)
	{
		GlobalPlayer[(int)playerID].slip_flag |= IS_UNSQUISHED;
		GlobalPlayer[(int)playerID].thunder_timer = 0x01CC;
	}
}

void SetStarMan(char playerID, bool active)
{
	if (active)
	{
		if ((GlobalPlayer[(int)playerID].slip_flag & IS_STAR) == 0)
		{
			NAEnmTrgStart(GlobalPlayer[(int)playerID].position,GlobalPlayer[(int)playerID].velocity,0x0100ff2c);
		}
		GlobalPlayer[(int)playerID].slip_flag |= IS_STAR;
		g_StarUseCounter[(int)playerID]  = 0xFFFF;
	}
	if (!active)
	{
		g_StarUseCounter[(int)playerID]  = 0;
		ResetStar((void*)&GlobalPlayer[(int)playerID], playerID);
		NAEnmTrgStop(GlobalPlayer[(int)playerID].position,0x0100ff2c);
	}

}

void SetGhostEffect(char playerID, bool active, int UseCount)
{

	if (active)
	{
		
		g_GhostUseCounter[(int)playerID]  = UseCount;
		g_GhostUseTimer[(int)playerID] = 30;
		if ((GlobalPlayer[(int)playerID].slip_flag & IS_BOO) == 0)
		{
			SetVSGhost((void*)&GlobalPlayer[(int)playerID], playerID);
		}
	}
	if ((!active))
	{
		g_GhostUseCounter[(int)playerID]  = 0;
		g_GhostUseTimer[(int)playerID]  = -1;
		ResetVSGhost((void*)&GlobalPlayer[(int)playerID], playerID);
	}

}

void SetBooTranslucent(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= USE_BOO;
}

void SetBecomeBomb(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID].weapon |= PRESS_BECOME_BOMB;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID].flag & IS_BOMB) != 0))
	{
		GlobalPlayer[(int)playerID].flag ^= IS_BOMB;
	}
}



void SetFlattened(char playerID, bool active)
{
	if (active)
	{
		GlobalPlayer[(int)playerID].weapon |= PRESS_SQUISH;
	}
	if ((!active) && ((GlobalPlayer[(int)playerID].weapon & PRESS_SQUISH) != 0))
	{
		GlobalPlayer[(int)playerID].weapon ^= PRESS_SQUISH;
	}
}

void SetSpinOutSaveable(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= HIT_BANANA;
}

void SetSpinOut(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= HIT_CRITTER;
}

void SetFailedStart(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= PRESS_STARTSPIN;
}

void SetGreenShellHit(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= HIT_GREENSHELL;
}

void SetRedShellHit(char playerID)
{
	GlobalPlayer[(int)playerID].weapon |= HIT_REDSHELL;
}

void SetBonk(char playerID)
{
	GlobalPlayer[(int)playerID].slip_flag |= IS_BONKING;
}

void ChangeMaxSpeed(char playerID, float SpeedGain)
{
	GlobalPlayer[(int)playerID].acc_maxcount += (float)SpeedGain;
}


void SetCamShiftUp(char playerID, float shift)
{
	GlobalCamera[(int)playerID]->camera_vector[1] = 9 + shift;
}

void ChangePlayerSize(char playerID, float ScaleFactor)
{
	if(((GlobalPlayer[(int)playerID].kart) == 5) || ((GlobalPlayer[(int)playerID].kart) == 7))
	{
		GlobalPlayer[(int)playerID].radius = 6 * (float)ScaleFactor;
	}
	else
	{
		GlobalPlayer[(int)playerID].radius = 5.5 * (float)ScaleFactor;
	}
	GlobalPlayer[(int)playerID].offsetsize = (float)ScaleFactor;

	if (playerID <= 3)
	{
		GlobalCamera[(int)playerID]->camera_vector[1] = 9 * (float)ScaleFactor;
	}
}

void SetPlayerColor(char playerID, int Colors, int AdjColor, float speed)
{
	MakeBodyColor((void*)&GlobalPlayer[(int)playerID], playerID, Colors, speed);
	MakeBodyColorAdjust((void*)&GlobalPlayer[(int)playerID], playerID, AdjColor, speed);
}

void SetPlayerEcho(char playerID, char echo)
{
	if (!(GlobalPlayer[(int)playerID].flag&IS_PLAYER))
	{
		return;
	}	
	GlobalAddressA = (long)(&g_playerEcho) + (0x3C * playerID);
	*(char*)GlobalAddressA = echo;
}

void playrandmCharacterSFX(char playerID)
{
	if ((g_RNG <= 0x3333))
	{
    	NAPlyVoiceStart(playerID, 0x29008008 + (GlobalPlayer[(int)playerID].kart * 0x10));  //voice char lucky sfx
    	return;
    }
	if (g_RNG <= 0x7777)
	{
    	NAPlyVoiceStart(playerID, 0x2900800D + (GlobalPlayer[(int)playerID].kart * 0x10));   //voice char yahho sfx
    	return;
	}
	if (g_RNG <= 0x9999)
	{
    	NAPlyVoiceStart(playerID, 0x29008001 + (GlobalPlayer[(int)playerID].kart * 0x10));   //voice char gogo sfx
    	return;
	}
	NAPlyVoiceStart(playerID, 0x2900800C + (GlobalPlayer[(int)playerID].kart * 0x10));   //voice char jump sfx    
}


void ProStickAngleHook(Player *car, Controller *cont, char number)
{
    if(car->talk&0x2 && (!(car->slip_flag&IS_DRIFTING) || ((car->slip_flag&IS_JUMPING) && (car->slip_flag&IS_DRIFTING))))
    {
        ProStickAngle(car,cont,number);
    }
    else
    {
        if (!(car->slip_flag&IS_IN_AIR))
        {
            ProStickAngle(car,cont,number);
        }
        else if(car->slip_flag&IS_JUMPING && car->bump.distance_zx <= 5)
        {
            ProStickAngle(car,cont,number);
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
			//SetFlattened(PlayerID, true);	
			SetBroken((Player*)&GlobalPlayer[PlayerID], PlayerID);
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
			break;
		}
		case StateStarOff:
		{
			SetStarMan(PlayerID,false);
			break;
		}
		case StateGhostOn:
		{
			//SetGhostEffect(PlayerID,true, 1);			
			SetVSGhost((Player*)&GlobalPlayer[(int)PlayerID], (char)PlayerID);
			break;
		}
		case StateGhostOff:
		{
			SetGhostEffect(PlayerID,false, 0);
			break;
		}
		
	}
}