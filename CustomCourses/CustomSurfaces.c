#include "../MainInclude.h"

//Surface SFX

#define SFX_STOP_ALL			21

#define SFX_SLIP				1
#define SFX_DRIFT				2
#define SFX_MOTOR				3

#define SFX_DIRT_TRAP_STEER		13
#define SFX_SAND_TRAP_STEER		14
#define SFX_STONE				15
#define SFX_SNOW				16
#define SFX_WOOD_STEER			17
#define SFX_SPINOUT_ONCE		18
#define SFX_SPINOUT				19
#define SFX_ICE					20
#define SFX_WOOD_BRIDGE			24
#define SFX_WOOD_BRIDGE2		25
#define SFX_RAILWAY				26
#define SFX_BUBBLES				27

#define SFX_GRASS_CENTER		4
#define SFX_GRASS_LEFT			5
#define SFX_GRASS_RIGHT			6
#define SFX_WET_SAND_CENTER		7
#define SFX_WET_SAND_LEFT		8
#define SFX_WET_SAND_RIGHT		9
#define SFX_SAND_CENTER			10
#define SFX_SAND_LEFT			11
#define SFX_SAND_RIGHT			12
#define SFX_DIRT_CENTER			22
#define SFX_DIRT_LEFT			23
#define SFX_DIRT_RIGHT			24
#define SFX_WET_SNOW_CENTER		28
#define SFX_WET_SNOW_LEFT		29
#define SFX_WET_SNOW_RIGHT		30

int LavaFloorBumpCount[8];
bool LavaFloorRecoilRequired[8];
bool LavaFloorRecoiling[8];

float absFloat(float value)
{
	int x = *(int*)&value;
	x &= 0x7FFFFFFF;
	return *(float*)&x;
}

void SurfaceSFX(Player *car, int SFX_ID, float min_Speed)
{
	short car_number = car - &GlobalPlayer[0];

	if (SPEEDMETER(car->speed) >= min_Speed && car->flag&IS_PLAYER)
	{
		if (g_PlayerSurfaceSoundID[car_number] == 0)
		{
			g_PlayerSurfaceSoundID[car_number] = SFX_ID;
		}
	}	
}

#define TRICK_GRAVITY				4000.0f
#define TRICK_TRIGGER_SPEED_MIN		30

#define GAP_GRAVITY				2000.0f

#define IS_BROKEN (IS_SPINNING_OUT|SPINOUT_LEFT|SPINOUT_RIGHT|IS_MOMENTUM_HIT|IS_VERTICAL_HIT|IS_TUMBLING|IS_WALL_TUMBLING)



#define NOTHING 		0
#define ASPHALT 		1
#define DIRT			2
#define SAND			3
#define STONE			4
#define SNOW                    5
#define WOOD			6
#define SAND_TRAP		7
#define GRASS			8
#define ICE  			9
#define WET_SAND		10
#define WET_SNOW                11
#define ROCK                    12
#define DIRT_TRAP               13
#define RAILWAY                 14
#define CAVE                    15
#define BRIDGE                  16   //rickety
#define KIBASHI                 17




#define DASHMARK2		252	    //for JUNGLE
#define JUMPMARK		253	    //for JUNGLE
#define DASHMARK		254	    //for PEACH CIRCUIT
#define OTHER 			255



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
#define GapJump			235

#define Mud				18


short SurfaceStorage[8];

#define STORE_NONE 	0
#define STORE_TRICK 1
#define	STORE_GAP	2

void AddGravityEdit(Player *car)
{
	short car_number = car - &GlobalPlayer[0];

	short cont_number = car_number;
	if (car->flag&IS_GHOST)
	{
		cont_number = car_number + 4;
		if (car_number == 0)
		{
			cont_number = 7;
		}
	}

	AddGravity(car);

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
	case Mud:
		if (car->jumpcount == 0 && car->wallhitcount == 0 && !(car->slip_flag&(IS_STAR|IS_BRAKING)))
		{
			SurfaceSFX(car,SFX_WET_SAND_CENTER,10.0f);
			if (car->flag&IS_CPU_PLAYER && car->handling_flag&CPU_SIMPLE_KART)
			{
				car->bump_status = 1;
				break;
			}
			car->power_cont = 0.65f;
		}
		break;
	}

	// Storage flag routine //
	
	if (car->slip_flag&IS_BROKEN || car->jugemu_flag&ON_LAKITU_ROD)
	{
		SurfaceStorage[car_number] = STORE_NONE;
		car->max_power = 0;
	}

	if (SurfaceStorage[car_number]&STORE_TRICK)
	{
		if (car->bump.distance_zx >= 0.2f)
		{
			car->gravity = TRICK_GRAVITY;
		}
		if (car->jumpcount >= 40)
		{
			car->slip_flag &= ~IS_FEATHER_JUMPING;
			car->old_direction = car->direction[1];
		}
		if (car->jumpcount == 0)
		{
			ResetWing(car);
		}
		if (!(car->flag&0x80))
		{
			SetAnimMusicNote(car_number);
			if (car->slip_flag&IS_TURBO_BOOSTING)
			{
				car->turbo_timer += 15;
			}
			else
			{
				if (!(car->slip_flag&IS_BROKEN))
				{
					SetTurbo(car, car_number);
					car->turbo_timer = 3;
				}
			}
			SurfaceStorage[car_number] = STORE_NONE;
			car->velocity[1] = 0;
			MakeBodyColor(car,car_number,0x00500050,2.0f);
		}
	}



	if (SurfaceStorage[car_number]&STORE_GAP)
	{
		if (car->bump.distance_zx >= 0.2f)
		{
			
			car->gravity = 100.0 * GlobalPlayer[car_number].bump.dummy;  //use bump.dummy; goes unused by gamecode
		}
		if (car->jumpcount >= 40)
		{
			car->slip_flag &= ~IS_FEATHER_JUMPING;
			car->old_direction = car->direction[1];
		}
		if (car->jumpcount == 0)
		{
			ResetWing(car);
		}
		if (!(car->flag&0x80))
		{
			SetAnimMusicNote(car_number);
			if (car->slip_flag&IS_TURBO_BOOSTING)
			{
				car->turbo_timer += 15;
			}
			else
			{
				if (!(car->slip_flag&IS_BROKEN))
				{
					SetTurbo(car, car_number);
					car->turbo_timer = 3;
				}
			}
			SurfaceStorage[car_number] = STORE_NONE;
			car->velocity[1] = 0;
			MakeBodyColor(car,car_number,0x00500050,2.0f);
		}
	}


	
	switch ((int)car->max_power)
	{
		case TrickJump:
		{
		if (car->jumpcount <= 10 && GlobalController[cont_number]->ButtonPressed&BTN_R && SPEEDMETER(car->speed) >= TRICK_TRIGGER_SPEED_MIN && !(car->slip_flag&IS_BROKEN) && !(car->slip_flag&IS_FEATHER_JUMPING) && !(SurfaceStorage[car_number]&STORE_TRICK))
		{
			car->flag |= 0x80;
			SetAnimBonkStars(car_number);
			if (car->slip_flag&IS_TURBO_BOOSTING)
			{
				short turbo_store = car->turbo_timer;
				SetWing(car, car_number);
				car->slip_flag |= IS_TURBO_BOOSTING;
				car->turbo_timer = turbo_store;
			}
			else
			{
				SetWing(car, car_number);
			}
			car->jumpcount = 0;
			if (car->max_power != car->bump_status)
			{
				car->max_power = car->bump_status;
			}
				SurfaceStorage[car_number] = STORE_TRICK;
			}
			else if (car->flag & IS_CPU_PLAYER)
			{
				if (car->tire_FL.Status != TrickJump)
				{
					car->flag |= 0x80;
					SetAnimBonkStars(car_number);
					SetWing(car, car_number);
					car->jumpcount = 0;
					if (car->max_power != car->bump_status)
					{
						car->max_power = car->bump_status;
					}
					SurfaceStorage[car_number] = STORE_TRICK;
				}
			}
			break;
		}

		case GapJump:
		{
			
			if (car->jumpcount <= 10 && GlobalController[cont_number]->ButtonPressed&BTN_R && SPEEDMETER(car->speed) >= TRICK_TRIGGER_SPEED_MIN && !(car->slip_flag&IS_BROKEN) && !(car->slip_flag&IS_FEATHER_JUMPING) && !(SurfaceStorage[car_number]&STORE_GAP))
			{
				car->flag |= 0x80;
				SetAnimBonkStars(car_number);
				if (car->slip_flag&IS_TURBO_BOOSTING)
				{
					
					
					short turbo_store = car->turbo_timer;
					SetWing(car, car_number);
					car->slip_flag |= IS_TURBO_BOOSTING;
					car->turbo_timer = turbo_store;
				}
				else
				{
					SetWing(car, car_number);
				}
				car->jumpcount = 0;
				if (car->max_power != car->bump_status)
				{
					car->max_power = car->bump_status;		
				}
				
				FaceStruct *SurfaceBuffer = (FaceStruct*)(gFaceBuffer);
				Vtx *TargetVert = (Vtx*)SurfaceBuffer[GlobalPlayer[car_number].bump.last_zx].p1;
				//Target Blue-Channel of SurfaceMap Vertex Color
				GlobalPlayer[car_number].bump.dummy = TargetVert->v.cn[2];  //use.bump dummy; goes unused by gamecode		
				SurfaceStorage[car_number] = STORE_GAP;
			}
			else if (car->flag & IS_CPU_PLAYER)
			{
				if (car->tire_FL.Status != GapJump)
				{
					FaceStruct *SurfaceBuffer = (FaceStruct*)(gFaceBuffer);
					Vtx *TargetVert = (Vtx*)SurfaceBuffer[GlobalPlayer[car_number].bump.last_zx].p1;
					//Target Blue-Channel of SurfaceMap Vertex Color
					GlobalPlayer[car_number].bump.dummy = TargetVert->v.cn[2];  //use.bump dummy; goes unused by gamecode
					car->flag |= 0x80;
					SetAnimBonkStars(car_number);
					SetWing(car, car_number);
					car->jumpcount = 0;
					if (car->max_power != car->bump_status)
					{
						car->max_power = car->bump_status;
					}
					SurfaceStorage[car_number] = STORE_GAP;
				}
			}
			break;
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

	case GapJump:
	{
		if (car->max_power != car->bump_status)
		{
			car->max_power = car->bump_status;
		}
		
		break;
	}
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
	if (HotSwapID > 0)
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
	else
	{
		CheckMapBG_ZX(car,normal,velocity,g_vector,dist,new_x,new_y,new_z);
	}
}


//Useful types
#define SMOKE_DRIFTLETTER	1
#define SMOKE_RANDOM		2
#define SMOKE_GRASS			3
#define SMOKE_RAPID			5

//Smoke dither
#define SMOKE_DITHERNONE	0
#define SMOKE_DITHER		1

void InitCustomSmoke(Player *car, Vector pos_R, Vector pos_F, short count, int kk, int surface, int LR_flag)
{
	int min_speed;
	int color;
	char alpha;
	short car_number = car-&GlobalPlayer[0];

	switch (surface)
	{
	case Mud:
		min_speed = 5;
		color =  CHARS2INT(0,16,0,0);
		alpha = 100;

		if(count == 0 && (car->smoke[kk].timer >= 1 || car->smoke[kk].flag == 0))
		{
			if(SPEEDMETER(car->speed) >= min_speed)
			{
				MakePos(car, &car->smoke[count], pos_R[0], pos_R[1], pos_R[2], surface, LR_flag);
				MakeStartup(&car->smoke[count], SMOKE_RANDOM, 0.75f);
				MakeRDP(&car->smoke[count], color, alpha);
				car->smoke[count].swork5 = SMOKE_DITHER;
				ParticleCreate_Local(PTCLGROUNDMUD, car_number, 0, -car->direction[1], pos_R, 0.3f, SPEEDMETER(car->speed)/200, 0, 0, 1, KWMODE_BL, FRAME_1, 1, LR_flag, CHARS2INT(230,140,40,175));
			}
		} 
		else
		{
			if(car->smoke[kk].timer >= 1)
			{
				if(SPEEDMETER(car->speed) >= min_speed)
				{
					MakePos(car, &car->smoke[count], pos_R[0], pos_R[1], pos_R[2], surface, LR_flag);
					MakeStartup(&car->smoke[count], SMOKE_RAPID, 1.0f);
					MakeRDP(&car->smoke[count], color, alpha);
					car->smoke[count].swork5 = SMOKE_DITHER;
					ParticleCreate_Local(PTCLGROUNDMUD, car_number, 0, -car->direction[1], pos_R, 0.3f, SPEEDMETER(car->speed)/200, 0, 0, 1, KWMODE_BL, FRAME_1, 1, LR_flag, CHARS2INT(230,140,40,175));
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
	Vector pos_R = {0,0,0};
	Vector pos_F = {0,0,0};

	if(rndom==0 || rndom==8)
	{
		pos_R[0] = car->tire_RL.Position[0];
		pos_R[1] = car->tire_RL.Height+2;
		pos_R[2] = car->tire_RL.Position[2];
		pos_F[0] = car->tire_FL.Position[0];
		pos_F[1] = car->tire_FL.Height+2;
		pos_F[2] = car->tire_FL.Position[2];
		flag = 1; //LEFT
		surface = car->tire_RL.Status;
	}
	if(rndom==2 || rndom==6)
	{
		pos_R[0] = car->tire_RR.Position[0];
		pos_R[1] = car->tire_RR.Height+2;
		pos_R[2] = car->tire_RR.Position[2];
		pos_F[0] = car->tire_FR.Position[0];
		pos_F[1] = car->tire_FR.Height+2;
		pos_F[2] = car->tire_FR.Position[2];
		flag = 0; //RIGHT
		surface = car->tire_RR.Status;
	}

	InitCustomSmoke(car, pos_R, pos_F, count, kk, surface, flag);
}

void InitRapidSmokeHook(Player *car,short count,int kk,char kno,char place)
{
	InitRapidSmoke(car,count,kk,kno,place);

	ushort rndom = MakeRandomLimmit(10);
	int	surface = 0xff, flag;
	Vector pos_R = {0,0,0};
	Vector pos_F = {0,0,0};

	if(rndom==0 || rndom==8)
	{
		pos_R[0] = car->tire_RL.Position[0];
		pos_R[1] = car->tire_RL.Height+2;
		pos_R[2] = car->tire_RL.Position[2];
		pos_F[0] = car->tire_FL.Position[0];
		pos_F[1] = car->tire_FL.Height+2;
		pos_F[2] = car->tire_FL.Position[2];
		flag = 1; //LEFT
		surface = car->tire_RL.Status;
	}
	if(rndom==2 || rndom==6)
	{
		pos_R[0] = car->tire_RR.Position[0];
		pos_R[1] = car->tire_RR.Height+2;
		pos_R[2] = car->tire_RR.Position[2];
		pos_F[0] = car->tire_FR.Position[0];
		pos_F[1] = car->tire_FR.Height+2;
		pos_F[2] = car->tire_FR.Position[2];
		flag = 0; //RIGHT
		surface = car->tire_RR.Status;
	}

	InitCustomSmoke(car, pos_R, pos_F, count, kk, surface, flag);
}

void InitSpinSmokeHook(Player *car,short count,int kk,char kno,char place)
{
	InitSpinSmoke(car,count,kk,kno,place);

	ushort rndom = MakeRandomLimmit(10);
	int	surface = 0xff, flag;
	Vector pos_R = {0,0,0};
	Vector pos_F = {0,0,0};

	if(rndom==0 || rndom==8)
	{
		pos_R[0] = car->tire_RL.Position[0];
		pos_R[1] = car->tire_RL.Height+2;
		pos_R[2] = car->tire_RL.Position[2];
		pos_F[0] = car->tire_FL.Position[0];
		pos_F[1] = car->tire_FL.Height+2;
		pos_F[2] = car->tire_FL.Position[2];
		flag = 1; //LEFT
		surface = car->tire_RL.Status;
	}
	if(rndom==2 || rndom==6)
	{
		pos_R[0] = car->tire_RR.Position[0];
		pos_R[1] = car->tire_RR.Height+2;
		pos_R[2] = car->tire_RR.Position[2];
		pos_F[0] = car->tire_FR.Position[0];
		pos_F[1] = car->tire_FR.Height+2;
		pos_F[2] = car->tire_FR.Position[2];
		flag = 0; //RIGHT
		surface = car->tire_RR.Status;
	}

	InitCustomSmoke(car, pos_R, pos_F, count, kk, surface, flag);
}

void LavaFloorRecoil()
{
	float launchAngle;
	float distZX, distY;
	float vel;
	int players = g_gameMode == 00 ? 8 : g_playerCount;
	for (int i = 0; i < players; i++)
	{
		if (LavaFloorRecoilRequired[i])
		{
			LavaFloorRecoiling[i] = true;
			short pathPoint = g_playerPathPointTable[i];

			NAPlyTrgStart(i, 0x1900a40b);
			GlobalPlayer[i].slip_flag = 0;
			GlobalPlayer[i].slip_flag |= IS_TUMBLING;
			GlobalPlayer[i].speed = 0;

			short direction = (short)(MakeDirection(GlobalPlayer[i].position[0], GlobalPlayer[i].position[2], g_pathPointPointer[pathPoint].pointx, g_pathPointPointer[pathPoint].pointz) * -1);
			GlobalPlayer[i].direction[1] = direction;

			distZX = Sqrtf(
				(GlobalPlayer[i].position[0] - g_pathPointPointer[pathPoint].pointx) * (GlobalPlayer[i].position[0] - g_pathPointPointer[pathPoint].pointx)
				+
				(GlobalPlayer[i].position[2] - g_pathPointPointer[pathPoint].pointz) * (GlobalPlayer[i].position[2] - g_pathPointPointer[pathPoint].pointz));
			distY = g_pathPointPointer[pathPoint].pointy - GlobalPlayer[i].position[1];

			//Similar height
			if (absFloat(distY < 30))
			{
				launchAngle = (-.135 * distZX) + 107.5;
				if (launchAngle < 55) launchAngle = 55;
				if (launchAngle > 80) launchAngle = 80;
				vel = 70;
				if (distZX < 500) { vel = 22; }
				if (distZX < 450) { vel = 20; }
				if (distZX < 400) { vel = 15; }
				if (distZX < 350) { vel = 16; }
				if (distZX < 300) { vel = 16; }
				if (distZX < 250) { vel = 16.8; }
				if (distZX < 200) { vel = 18; }
				if (distZX < 150) { vel = 16.5; }
				if (distZX < 125) { vel = 12; }
			}

			//Lava below course
			if (distY >= 30)
			{
				launchAngle = (-.135 * distZX) + 105.5;
				if (launchAngle < 60) launchAngle = 60;
				if (launchAngle > 80) launchAngle = 80;
				vel = 70;
				if (distZX < 500) { vel = 23; }
				if (distZX < 450) { vel = 21; }
				if (distZX < 400) { vel = 16; }
				if (distZX < 350) { vel = 17; }
				if (distZX < 300) { vel = 17; }
				if (distZX < 250) { vel = 17.8; }
				if (distZX < 200) { vel = 19; }
				if (distZX < 150) { vel = 17.5; }
				if (distZX < 100) { vel = 13; }
			}

			//Lava far below course
			if (distY >= 60)
			{
				launchAngle = (-.135 * distZX) + 107.5;
				if (launchAngle < 65) launchAngle = 65;
				if (launchAngle > 82) launchAngle = 82;
				vel = 70;
				if (distZX < 500) { vel = 26; }
				if (distZX < 450) { vel = 24; }
				if (distZX < 400) { vel = 19; }
				if (distZX < 350) { vel = 20; }
				if (distZX < 300) { vel = 20; }
				if (distZX < 250) { vel = 20.8; }
				if (distZX < 200) { vel = 22; }
				if (distZX < 150) { vel = 20.5; }
				if (distZX < 100) { vel = 16; }
			}

			if (distY <= -30) //Lava above course
			{
				launchAngle = (-.135 * distZX) + 107.5;
				if (launchAngle < 55) launchAngle = 55;
				if (launchAngle > 80) launchAngle = 80;
				vel = 70;
				if (distZX < 500) { vel = 20; }
				if (distZX < 450) { vel = 18; }
				if (distZX < 400) { vel = 13; }
				if (distZX < 350) { vel = 14; }
				if (distZX < 300) { vel = 14; }
				if (distZX < 250) { vel = 14.8; }
				if (distZX < 200) { vel = 16; }
				if (distZX < 150) { vel = 14.5; }
				if (distZX < 125) { vel = 10; }
			}

			if (distY <= -59) //Lava far above course
			{
				launchAngle = (-.135 * distZX) + 107.5;
				if (launchAngle < 55) launchAngle = 55;
				if (launchAngle > 80) launchAngle = 80;
				vel = 70;
				if (distZX < 500) { vel = 21; }
				if (distZX < 450) { vel = 19; }
				if (distZX < 400) { vel = 14; }
				if (distZX < 350) { vel = 14.5; }
				if (distZX < 300) { vel = 15; }
				if (distZX < 250) { vel = 15.8; }
				if (distZX < 200) { vel = 17; }
				if (distZX < 150) { vel = 15.5; }
				if (distZX < 125) { vel = 12; }
			}

			if (distY <= -89) //Lava really far above course
			{
				launchAngle = (-.135 * distZX) + 107.5;
				if (launchAngle < 55) launchAngle = 55;
				if (launchAngle > 80) launchAngle = 80;
				vel = 70;
				if (distZX < 500) { vel = 22; }
				if (distZX < 450) { vel = 14; }
				if (distZX < 400) { vel = 13; }
				if (distZX < 350) { vel = 13; }
				if (distZX < 300) { vel = 16; }
				if (distZX < 250) { vel = 16.8; }
				if (distZX < 200) { vel = 18; }
				if (distZX < 150) { vel = 16.5; }
				if (distZX < 125) { vel = 12; }
			}

			float launchAngleRadians = launchAngle * 3.1415 / 180.0f;
			float vZX = cosF(launchAngleRadians) * vel;
			float vY = sinF(launchAngleRadians) * vel;

			objectVelocity[0] = 0;
			objectVelocity[1] = vY;
			objectVelocity[2] = vZX;

			MakeAlignVector(objectVelocity, GlobalPlayer[i].direction[1]);
			GlobalPlayer[i].gravity = 0;
			GlobalPlayer[i].gravity_xz[0] = 0;
			GlobalPlayer[i].gravity_xz[1] = 0;
			GlobalPlayer[i].gravity_xz[2] = 0;
			GlobalPlayer[i].velocity[0] = objectVelocity[0];
			GlobalPlayer[i].velocity[1] = objectVelocity[1];
			GlobalPlayer[i].velocity[2] = objectVelocity[2];
			LavaFloorRecoilRequired[i] = false;
		}

		if (LavaFloorRecoiling[i] && !LavaFloorRecoilRequired[i])
		{
			short pathPoint = g_playerPathPointTable[i];
			if (pathPoint + 2 <= g_courseTotalPathPoints[0]) pathPoint += 2;
			short direction = (short)(MakeDirection(GlobalPlayer[i].position[0], GlobalPlayer[i].position[2], g_pathPointPointer[pathPoint].pointx, g_pathPointPointer[pathPoint].pointz) * -1);
			GlobalPlayer[i].direction[1] = direction;
		}
	}
}

void InteractLavaFloor(Bump* bump, ushort pointer)
{
	int PlayerIndex = (*(long*)&bump - (long)&g_PlayerStructTable - 0x110) / 0xDD8;
	FaceStruct* face = (FaceStruct*)gFaceBuffer + pointer;

	if ((face->status & 0x00FF) == 204) //LavaFloor
	{
		GlobalPlayer[PlayerIndex].jugemu_flag |= LAVA_EFFECT;
		LavaFloorRecoilRequired[PlayerIndex] = true;
		LavaFloorBumpCount[PlayerIndex] += 1;
	}
	else
	{
		if (LavaFloorRecoiling[PlayerIndex])
		{
			ResetRolloverFall((Player*)&GlobalPlayer[PlayerIndex], PlayerIndex);
			if ((GlobalPlayer[PlayerIndex].slip_flag & IS_TUMBLING) == IS_TUMBLING)
				GlobalPlayer[PlayerIndex].slip_flag ^= IS_TUMBLING;

			if ((GlobalPlayer[PlayerIndex].jugemu_flag & LAVA_EFFECT) == LAVA_EFFECT)
				GlobalPlayer[PlayerIndex].jugemu_flag ^= LAVA_EFFECT;

			LavaFloorRecoilRequired[PlayerIndex] = false;
			LavaFloorRecoiling[PlayerIndex] = false;
			LavaFloorBumpCount[PlayerIndex] = 0;
		}
	}

	if (LavaFloorBumpCount[PlayerIndex] >= 4)
	{
		CallLakitu(&GlobalPlayer[PlayerIndex]);
	}
}