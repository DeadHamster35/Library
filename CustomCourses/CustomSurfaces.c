#include "../MainInclude.h"

char EffectActive[8];

#define FastOoB			(char)251
#define Water			(char)250
#define MushroomBoost	(char)249
#define FeatherJump		(char)248
#define TornadoJump		(char)247
#define SpinOutSaveable	(char)246
#define SpinOut			(char)245
#define FailedStart		(char)244
#define GreenShellHit	(char)243
#define RedShellHit		(char)242
#define ObjectHit		(char)241
#define Shrunken		(char)240
#define StarMan			(char)239
#define Boo		    	(char)238
#define GetItem			(char)237


#define dirt_test		(char)19
#define grass_test		(char)18






#define prtcl_None		0
#define prtcl_Smoke		1
#define prtcl_Dirt		7
#define prtcl_Grass		8

#define prtclCol_White      0x00000F0F
#define prtclCol_Brown      0x00020404
#define prtclCol_Dark_Brown 0x00040202
#define prtclCol_Tan        0x00080808





void SurfaceParticles(char playerID, unsigned char SurfaceID, char ReplaceParticle, int ParticleColor, float ParticleScale)
{
    if(GlobalPlayer[(int)playerID].tire_FL.Status == SurfaceID)
    {
	GlobalPlayer[(int)playerID].tire_FL.Status = ReplaceParticle;
    }
    if(GlobalPlayer[(int)playerID].tire_FR.Status == SurfaceID)
    {
	GlobalPlayer[(int)playerID].tire_FR.Status = ReplaceParticle;
    }
    if(GlobalPlayer[(int)playerID].tire_RL.Status == SurfaceID)
    {
	GlobalPlayer[(int)playerID].tire_RL.Status = ReplaceParticle;
    }
    if(GlobalPlayer[(int)playerID].tire_RR.Status == SurfaceID)
    {
	GlobalPlayer[(int)playerID].tire_RR.Status = ReplaceParticle;
    }
	for (int i = 0; i < 10; i++)
	{
        if(GlobalPlayer[(int)playerID].smoke[i].number != 1)
        {
            if((GlobalPlayer[(int)playerID].smoke[i].type == ReplaceParticle) && ReplaceParticle != prtcl_Grass)
            {		
                GlobalPlayer[(int)playerID].smoke[i].swork1 = (ParticleColor>>16) & 0x000000ff;
                GlobalPlayer[(int)playerID].smoke[i].swork2 = (ParticleColor>>8) & 0x000000ff;
                GlobalPlayer[(int)playerID].smoke[i].swork3 = ParticleColor & 0x000000ff;
            }
            GlobalPlayer[(int)playerID].smoke[i].scale =  ParticleScale;
        }
	}
}


void SurfaceProperties(char playerID, char SurfaceID)
{
    switch(SurfaceID)
    {
        case grass_test:
        {
            SurfaceParticles(playerID, SurfaceID, prtcl_Grass, prtclCol_White, 2);
        }
        case dirt_test:
        {
            SurfaceParticles(playerID, SurfaceID, prtcl_Dirt, prtclCol_Tan, 1.5);
        }
    }
}


void GetSurfaceID()
{

	for (char playerID = 0; playerID < 8; playerID++)						// Loop for each racer
	{
		char SurfaceID = (char)(GlobalPlayer[(int)playerID].bump_status);
		if ((GlobalPlayer[(int)playerID].flag & EXISTS) != 0)				// Only run for existing racers
		{
			if (g_startingIndicator < 3)									// Reset at race start
			{
				SurfaceID = 0;
				EffectActive[(int)playerID] = 0;
				CustomWaterHeight[(int)playerID] = false;
				continue;
			}

///////////////////////////////TELESA!!!///////////////////////////////

			if (SurfaceID == Boo)
			{
				EffectActive[(int)playerID] = SurfaceID;
				SetGhostEffect(playerID, true);
				continue;
			}
			if ((SurfaceID != Boo) && (EffectActive[(int)playerID] == Boo))
			{
				SetGhostEffect(playerID, false);
			}

///////////////////////////////ENEMY JUGEMU!!!///////////////////////////////

			if (SurfaceID == FastOoB)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetFastOoB((void*)&GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////STARMAN!!!///////////////////////////////

			if (SurfaceID == StarMan)
			{
				EffectActive[(int)playerID] = SurfaceID;
				SetStarMan(playerID, true);
				continue;
			}
			if ((SurfaceID != StarMan) && (EffectActive[(int)playerID] == StarMan))
			{
				SetStarMan(playerID, false);
			}

///////////////////////////////TORNADO JAMP!!!///////////////////////////////

			if ((SurfaceID == TornadoJump))
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetStorm((void*)&GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////WING JUMP!!!///////////////////////////////

			if (SurfaceID == FeatherJump)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetWing((void*)&GlobalPlayer[(int)playerID], playerID);
				}
				continue;
			}

///////////////////////////////THUNDERRR!!!///////////////////////////////

			if (SurfaceID == Shrunken)
			{
				EffectActive[(int)playerID] = SurfaceID;
				SetShrunken(playerID, true);
				continue;
			}
			if ((SurfaceID != Shrunken) && (EffectActive[(int)playerID] == Shrunken))
			{
				SetShrunken(playerID, false);
			}

///////////////////////////////KINOP BOOST!!!///////////////////////////////

			if (SurfaceID == MushroomBoost)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0 && (GlobalPlayer[(int)playerID].wallhitcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetTurbo((void*)&GlobalPlayer[(int)playerID], playerID);
				}
				if ((GlobalPlayer[(int)playerID].accelcount) < 300)
				{
					EffectActive[(int)playerID] = 0;
				}				
				GlobalPlayer[(int)playerID].turbo_timer = 0x50;
				continue;
			}

///////////////////////////////SPIN PHEW!!!///////////////////////////////

			if (SurfaceID == SpinOutSaveable)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetSpinOutSaveable(playerID);
				}
				continue;
			}

///////////////////////////////SPIN OUT!!!///////////////////////////////

			if (SurfaceID == SpinOut)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetSpinOut(playerID);
				}
				continue;
			}

///////////////////////////////SPIIIIN!!!///////////////////////////////


			if (SurfaceID == FailedStart)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetFailedStart(playerID);
				}
				continue;
			}

///////////////////////////////SHELL HIT!!!///////////////////////////////

			if (SurfaceID == GreenShellHit)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetGreenShellHit(playerID);
				}
				continue;
			}

///////////////////////////////OBJECTS HIT!!!///////////////////////////////

			if (SurfaceID == ObjectHit)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetMapObjectHit(playerID);
				}
				continue;
			}

///////////////////////////////REDSHELL HIT!!!///////////////////////////////

			if (SurfaceID == RedShellHit)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					SetRedShellHit(playerID);
				}
				continue;
			}

///////////////////////////////ITEM GET!!!///////////////////////////////

			if (SurfaceID == GetItem)
			{
				if ((EffectActive[(int)playerID] != SurfaceID) && (GlobalPlayer[(int)playerID].jumpcount) == 0)
				{
					EffectActive[(int)playerID] = SurfaceID;
					RouletteStart(playerID,0);
				}
				continue;
			}


///////////////////////////////WATER!!!///////////////////////////////


			if (SurfaceID == Water)
			{
				if ((GlobalPlayer[(int)playerID].bump.distance_zx <= 2) && ((GlobalPlayer[(int)playerID].jugemu_flag & ON_LAKITU_ROD) == 0))
				{
					CustomWaterHeight[(int)playerID] = true;
					EffectActive[(int)playerID] = SurfaceID;
					g_waterlevelPlayer[(int)playerID] = GlobalPlayer[(int)playerID].position[1] - GlobalPlayer[(int)playerID].bump.distance_zx -5;

					if (GlobalPlayer[(int)playerID].bump.distance_zx <= 0.0)
					{
						GlobalPlayer[(int)playerID].radius = 0;
						HangLakitu((void*)&GlobalPlayer[(int)playerID], playerID);
						GlobalPlayer[(int)playerID].position[1] = g_waterlevelPlayer[(int)playerID] - 10;
					}
				}
				continue;
			}
			if ((SurfaceID != Water) && (EffectActive[(int)playerID] == Water))
			{
				CustomWaterHeight[(int)playerID] = false;
				GlobalPlayer[(int)playerID].radius = g_charRadiusTbl[(GlobalPlayer[(int)playerID].kart)];
			}


//FIN//		
			else
			{
				EffectActive[(int)playerID] = 0;	
			}

            SurfaceProperties(playerID,SurfaceID);


		}
	}
}