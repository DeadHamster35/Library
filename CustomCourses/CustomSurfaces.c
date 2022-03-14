#include "../MainInclude.h"

#define TRICK_GRAVITY				3600.0f
#define TRICK_TRIGGER_SPEED_MIN		30

#define IS_BROKEN (IS_SPINNING_OUT|SPINOUT_LEFT|SPINOUT_RIGHT|IS_MOMENTUM_HIT|IS_VERTICAL_HIT)

#define FastOoB			251
#define Water			250
#define MushroomBoost	249
#define FeatherJump		248
#define TornadoJump		247
#define SpinOutSaveable	246
#define SpinOut			245
#define FailedStart		244
#define GreenShellHit	243
#define RedShellHit		242
#define ObjectHit		241
#define Shrunken		240
#define StarMan			239
#define Boo		    	238
#define GetItem			237
#define TrickJump		236



short SurfaceStorage[8];

#define STORE_TRICK 0x0001


void AddGravityEdit(Player *car)
{
	AddGravity(car);

	short car_number = car - &GlobalPlayer[0];


	if (g_startingIndicator < 3 || g_startingIndicator >= 6 || g_FadingFlag[4] != 0)
	{
		car->max_power = 0;
		CustomWaterHeight[car_number] = false;
		SurfaceStorage[car_number] = 0;
		return;
	}

	// Keep using //
	switch (car->bump_status)
	{
	case GetItem:
		if (car->jumpcount == 0 && car->wallhitcount == 0)
		{
			RouletteStart(car_number,0);
		}
		break;
	case Shrunken:
		if (car->jumpcount == 0 && car->wallhitcount == 0)
		{
			SetShrunken(car_number, true);
		}
		break;
	case StarMan:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetStar(car, car_number);
		}
		break;
	case FastOoB:
		if (car->jumpcount == 0 && car->wallhitcount == 0)
		{
			SetFastOoB(car, car_number);
		}
		break;
	case Boo:
		if (car->jumpcount == 0 && car->wallhitcount == 0  && !(car->slip_flag&IS_BROKEN))
		{
			SetGhostEffect(car_number, true);
		}
		break;
	case MushroomBoost:
		if (car->accelcount < 300.0f)
		{
			car->max_power = 0;
		}				
		car->turbo_timer = 80;
		break;
	}

	// Storage flag routine //

	if (car->slip_flag&IS_BROKEN)
	{
		SurfaceStorage[car_number] &= ~STORE_TRICK;
	}

	if (SurfaceStorage[car_number]&STORE_TRICK)
	{
		if (car->bump.distance_zx >= 0.2f)
		{
			car->gravity = TRICK_GRAVITY;
		}

		if (car->jumpcount == 0)
		{
			ResetWing(car);
		}
		if (!(car->flag&0x80))
		{
			SetAnimMusicNote(car_number);
			SetTurbo(car, car_number);
			car->turbo_timer = 3;
			SurfaceStorage[car_number] &= ~STORE_TRICK;
			car->velocity[1] = 0;
		}
	}

	// One time uses //

	if (car->max_power == car->bump_status)
	{
		return;
	}
	if (car->jumpcount != 0)
	{
		return;
	}

	switch (car->bump_status)
	{
	case ObjectHit:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetMapObjectHit(car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case RedShellHit:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetRedShellHit(car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case GreenShellHit:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetGreenShellHit(car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case FailedStart:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetFailedStart(car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case SpinOut:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetSpinOut(car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case SpinOutSaveable:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetSpinOutSaveable(car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case FeatherJump:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetWing(car, car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case TornadoJump:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetStorm(car, car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case MushroomBoost:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&IS_BROKEN))
		{
			SetTurbo(car, car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
		}
		break;
	case TrickJump:
		if (car->jumpcount == 0 && car->slip_flag&IS_JUMPING && SPEEDMETER(car->speed) >= TRICK_TRIGGER_SPEED_MIN && !(car->slip_flag&IS_BROKEN) && !(car->slip_flag&IS_FEATHER_JUMPING))
		{
			car->flag |= 0x80;
			SetAnimBonkStars(car_number);
			SetWing(car, car_number);
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
			SurfaceStorage[car_number] |= STORE_TRICK;
		}
		break;

	default:
		if (car->max_power != car->bump_status)
		{
			car->max_power = car->bump_status;
		}
		break;
	}

	// Resets //

	switch ((int)car->max_power)
	{
	case Shrunken:
		if (car->bump_status != Shrunken)
		{
			SetShrunken(car_number, false);
		}
		break;
	case StarMan:
		if (car->bump_status != StarMan)
		{
			ResetStar(car, car_number);
		}
		break;
	case Boo:
		if (car->bump_status != Boo)
		{
			SetGhostEffect(car_number, false);
		}
		break;
	default:
		break;
	}
}

//Water Surface Check

void CheckMapBG_ZX_Hook(Player *car, Vector normal, Vector velocity, Vector g_vector, float *dist, float *new_x, float *new_y, float *new_z)
{
	short car_number = car - &GlobalPlayer[0];

	if (car->bump_status == Water)
	{
		CustomWaterHeight[car_number] = TRUE;
		g_waterlevelPlayer[car_number] = car->position[1] - car->offsetsize - car->radius - car->bump.distance_zx;
	}
	else
	{
		CustomWaterHeight[car_number] = FALSE;
		CheckMapBG_ZX(car,normal,velocity,g_vector,dist,new_x,new_y,new_z);
	}
}


//Useful types
#define SMOKE_DRIFTLETTER	1
#define SMOKE_RANDOM		2
#define SMOKE_GRASS			3
#define SMOKE_RAPID			5


void InitCustomSmoke(Player *car, Vector pos, short count, int kk, int surface, int LR_flag)
{
	int min_speed;
	int color;
	char alpha, dither;

	switch (surface)
	{
	case Shrunken:
		min_speed = 10;
		color =  0x00FFD37A;
		alpha = 100;
		dither = 100;

		if(count == 0 && (car->smoke[kk].timer >= 1 || car->smoke[kk].flag == 0))
		{
			if(SPEEDMETER(car->speed) >= min_speed)
			{
				MakePos(car, &car->smoke[count], pos[0], pos[1], pos[2], surface, LR_flag);
				MakeStartup(&car->smoke[count], SMOKE_RANDOM, 0.75f);
				MakeRDP(&car->smoke[count], color, alpha);
				car->smoke[count].swork5 = dither;
			}
		} 
		else
		{
			if(car->smoke[kk].timer >= 1)
			{
				if(SPEEDMETER(car->speed) >= min_speed)
				{
					MakePos(car, &car->smoke[count], pos[0], pos[1], pos[2], surface, LR_flag);
					MakeStartup(&car->smoke[count], SMOKE_RAPID, 0.75f);
					MakeRDP(&car->smoke[count], color, alpha);
					car->smoke[count].swork5 = dither;
				}
			}
		}
		break;
	}
}

void InitRndSmokeHook(Player *car,short count,int kk,char kno,char place)
{
	InitRndSmoke(car,count,kk,kno,place);

	ushort rndom = MakeRandomLimmit(10);
	int	surface = 0xff, flag;
	Vector pos = {0,0,0};

	if(rndom==0 || rndom==8)
	{
		pos[0] = car->tire_RL.Position[0];
		pos[1] = car->tire_RL.Height+2;
		pos[2] = car->tire_RL.Position[2];
		flag = 1; //LEFT
		surface = car->tire_RL.Status;
	}
	if(rndom==2 || rndom==6)
	{
		pos[0] = car->tire_RR.Position[0];
		pos[1] = car->tire_RR.Height+2;
		pos[2] = car->tire_RR.Position[2];
		flag = 0; //RIGHT
		surface = car->tire_RR.Status;
	}

	InitCustomSmoke(car, pos, count, kk, surface, flag);
}

void InitRapidSmokeHook(Player *car,short count,int kk,char kno,char place)
{
	InitRapidSmoke(car,count,kk,kno,place);

	ushort rndom = MakeRandomLimmit(10);
	int	surface = 0xff, flag;
	Vector pos = {0,0,0};

	if(rndom==0 || rndom==8)
	{
		pos[0] = car->tire_RL.Position[0];
		pos[1] = car->tire_RL.Height+2;
		pos[2] = car->tire_RL.Position[2];
		flag = 1; //LEFT
		surface = car->tire_RL.Status;
	}
	if(rndom==2 || rndom==6)
	{
		pos[0] = car->tire_RR.Position[0];
		pos[1] = car->tire_RR.Height+2;
		pos[2] = car->tire_RR.Position[2];
		flag = 0; //RIGHT
		surface = car->tire_RR.Status;
	}

	InitCustomSmoke(car, pos, count, kk, surface, flag);
}

void InitSpinSmokeHook(Player *car,short count,int kk,char kno,char place)
{
	InitSpinSmoke(car,count,kk,kno,place);

	ushort rndom = MakeRandomLimmit(10);
	int	surface = 0xff, flag;
	Vector pos = {0,0,0};

	if(rndom==0 || rndom==8)
	{
		pos[0] = car->tire_RL.Position[0];
		pos[1] = car->tire_RL.Height+2;
		pos[2] = car->tire_RL.Position[2];
		flag = 1; //LEFT
		surface = car->tire_RL.Status;
	}
	if(rndom==2 || rndom==6)
	{
		pos[0] = car->tire_RR.Position[0];
		pos[1] = car->tire_RR.Height+2;
		pos[2] = car->tire_RR.Position[2];
		flag = 0; //RIGHT
		surface = car->tire_RR.Status;
	}

	InitCustomSmoke(car, pos, count, kk, surface, flag);
} 