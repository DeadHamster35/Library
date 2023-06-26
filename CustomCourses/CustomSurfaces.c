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

#define RESULT_JUMP				0x0800
#define MOVE_CAMERA				0
#define STOP_CAMERA				1
#define LAND					0x0100
#define WALLHIT	   				0x0010
#define WALLHIT_JOIN			0x0020

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
#define LavaSurface		234

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



void CheckDirectionFunc(int Null, Screen *display)
{
	ushort ang= display->camera->camera_direction[1];
	if(g_ScreenFlip)
    {
		if (ZFLIP)
		{	
			if(ang<DEG1 * 45)     display->camera_direction=0;          
			else if(ang<DEG1 * 135)     display->camera_direction=3;          
			else if(ang<DEG1 * 225)     display->camera_direction=2;          
			else if(ang<DEG1 * 315)     display->camera_direction=1;          
			else      display->camera_direction=0;    
		}
		else
		{
			if(ang< DEG1 * 45)     display->camera_direction=2;          
			else if(ang< DEG1 * 135)     display->camera_direction=3;          
			else if(ang< DEG1 * 225)     display->camera_direction=0;          
			else if(ang< DEG1 * 315)     display->camera_direction=1;          
			else      display->camera_direction=2;  
		}
           
    }
    else
    {
		if (ZFLIP)
		{	
			if(ang< (DEG1 * 45))     
			{
				display->camera_direction=0;          
			}
			else 
			{
				if(ang< (DEG1 * 135))     
				{
					display->camera_direction=1;  
				}
				else
				{
					if(ang< (DEG1 * 225))
					{
						display->camera_direction=2;
					}
					else
					{
						if(ang< (DEG1 * 315))
						{
							display->camera_direction=3;
						}
						else
						{
							display->camera_direction=0;
						}
					}   
				}
			}          
		}
		else
		{
			if(ang<DEG1 * 45)     display->camera_direction=2;          
			else if(ang<DEG1 * 135)     display->camera_direction=1;          
			else if(ang<DEG1 * 225)     display->camera_direction=0;          
			else if(ang<DEG1 * 315)     display->camera_direction=3;          
			else      display->camera_direction=2;    
		}
           
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

	if ((face->status & 0x00FF) == LavaSurface) //LavaFloor
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

void custom_RunKart(Player* car, Camera* camera, char place, char kno)
{
	RunKart(car, camera, place, kno);
}

void custom_lava_SpinKart(Player* car, Camera* camera, char place, char kno)
{
	Vector power_vector = { 0.0f,0.0f,1.0f };
	Vector g_vector = { 0,0,0 };
	Vector power_vec = { 0,0,0 };

	float new_x, new_y, new_z;
	float old_x, old_y, old_z;
	float nx;
	float grav_x, grav_y, grav_z;
	float dist, speed;
	Vector velocity;
	Vector normal;
	short carmera_flag;

	/////// WEAPON
	WeaponStatus(car, kno, place);

	/////// STRATEGY
	if ((car->slip_flag & SPIN_L) == SPIN_L || (car->slip_flag & SPIN_R) == SPIN_R
		|| (car->slip_flag & RAPID_ACC) == RAPID_ACC || (car->slip_flag & WING) == WING
		|| (car->slip_flag & STORM) == STORM || (car->slip_flag & THUNDER_SPIN) == THUNDER_SPIN
		|| (car->handling_flag & RESULT_JUMP)) carmera_flag = STOP_CAMERA;
	else carmera_flag = MOVE_CAMERA;

	SetStrategy(car, kno, place);

	////// FORCE
	//AddGravity(car);
	//Instead of AddGravity, just set the gravity to 1000 and zx gravity to 0.
	car->gravity = 1000;
	car->gravity_xz[0] = 0;
	car->gravity_xz[2] = 0;

	//Don't care about slip stream here
	//SlipCheck(car,kno);

	if ((car->slip_flag & SPIN_L) == SPIN_L || (car->slip_flag & SPIN_R) == SPIN_R || (car->slip_flag & THUNDER_SPIN) == THUNDER_SPIN)
	{
		grav_x = (-1 * (car->gravity_xz[0])) + ((-car->bump.bump_zx[0] * car->gravity) * .1);
		grav_y = (-car->bump.bump_zx[1] * car->gravity);
		grav_z = (-1 * (car->gravity_xz[2])) + ((-car->bump.bump_zx[2] * car->gravity) * .1);
	}
	else
	{
		grav_x = -1 * car->gravity_xz[0];
		grav_y = -1 * (car->gravity);
		grav_z = -1 * car->gravity_xz[2];
	}
	//////// CAR & CAR
	CheckKartHit(car, kno, place);

	///////// VELOCITY (X,Y,Z)
	if (carmera_flag == STOP_CAMERA) {
		MakeAlignMatrix(car->align, car->up_vector[0], car->up_vector[1], car->up_vector[2], car->direction[1]);
		MakeAlignMatrix(car->align2, car->up_vector[0], car->up_vector[1], car->up_vector[2], car->old_direction);
	}
	else {
		MakeAlignMatrix(car->align, car->up_vector[0], car->up_vector[1], car->up_vector[2], car->direction[1]);
	}

	// Go away power vector, you make math hard to do.
	//power_vector[2] = PowerCheck(car,kno); 
	//if(carmera_flag==STOP_CAMERA) 
	//	MultipleMatrixByVector(power_vector,car->align2);
	//else 
	//	MultipleMatrixByVector(power_vector,car->align);

	velocity[0] = car->velocity[0];
	velocity[1] = car->velocity[1];
	velocity[2] = car->velocity[2];

	if (car->hitcount <= 2 && car->wallhitcount <= 2
		&& (car->slip_flag & ROLLOVER) != ROLLOVER
		&& (car->slip_flag & EXPLODE) != EXPLODE && (car->slip_flag & THROW_EXPLODE) != THROW_EXPLODE) {
		velocity[0] += ((((power_vector[0] + grav_x) + power_vec[0]) - (velocity[0] * (0.12 * car->mass))) / 6000) / ((car->brake_time * 5) + 1);
		velocity[2] += ((((power_vector[2] + grav_z) + power_vec[2]) - (velocity[2] * (0.12 * car->mass))) / 6000) / ((car->brake_time * 5) + 1);
	}
	else {
		velocity[0] += ((((power_vector[0] + grav_x) + power_vec[0]) - (velocity[0] * (0.2 * car->mass))) / 6000) * 0.08;
		velocity[2] += ((((power_vector[2] + grav_z) + power_vec[2]) - (velocity[2] * (0.2 * car->mass))) / 6000) * 0.08;
	}

	velocity[1] += ((((power_vector[1] + grav_y) + power_vec[1]) - (velocity[1] * (0.12 * car->mass))) / 6000); // /car->sus.jump_firstspeed;

	if ((car->jugemu_flag & ON_LAKITU_ROD) == ON_LAKITU_ROD || (car->jugemu_flag & OUT_OF_BOUNDS) == OUT_OF_BOUNDS) {
		velocity[0] = 0;
		velocity[1] = 0;
		velocity[2] = 0;
	}

	////// CAR POSITION
	old_x = car->position[0];
	old_y = car->position[1];
	old_z = car->position[2];
	car->old_position[0] = car->position[0];
	car->old_position[1] = car->position[1];
	car->old_position[2] = car->position[2];

	new_x = old_x + car->velocity[0]; // WAS new_x = old_x+car->velocity[0]+kwcar[kno].boundvel[0];
	new_y = old_y + car->velocity[1];
	new_z = old_z + car->velocity[2]; // WAS old_z+car->velocity[2]+kwcar[kno].boundvel[2];


	//DriftJump(car);
	//new_y +=car->jump;

	//////  CHECK BUMP 
	custom_check_bump_2((Bump*)&car->bump, car->radius, new_x, new_y, new_z, car->old_position[0], car->old_position[1], car->old_position[2]);
	car->up_vector[0] = 0;
	car->up_vector[1] = 1;
	car->up_vector[2] = 0;

	/////JUMP FLAG
	car->slip_flag = car->slip_flag | N_JUMP;
	car->jumpcount += 1;
	if ((dist = car->bump.distance_zx) <= 0) {
		car->slip_flag = car->slip_flag & ~(D_JUMP);
		car->slip_flag = car->slip_flag & ~(N_JUMP);
		if ((car->slip_flag & ROLLOVER) != ROLLOVER && (car->slip_flag & EXPLODE) != EXPLODE
			&& (car->slip_flag & THROW_EXPLODE) != THROW_EXPLODE) {
			if (car->jumpcount >= 28) {  ///////BIG PURUPURU
				if (car->jumpcount >= 50) car->jumpcount = 50;
				car->sus.bound_firstspeed = 3;
				car->sus.bound_timer = 0;
				car->talk = car->talk | POOMP;
				if ((car->flag & IS_PLAYER) == IS_PLAYER && (car->flag & IS_GHOST) != IS_GHOST)NaPlyLandStart(kno, (float)(car->jumpcount) / 50);
				if ((car->flag & IS_PLAYER) == IS_PLAYER) car->handling_flag |= LAND;
			}
			if ((car->jumpcount <= 27 && car->jumpcount >= 10) && SPEEDMETER(car->speed) >= 20) {   ///////SMALL PURUPURU 
				car->sus.bound_firstspeed = 2;
				car->sus.bound_timer = 0;
				if ((car->flag & IS_PLAYER) == IS_PLAYER && (car->flag & IS_GHOST) != IS_GHOST)NaPlyLandStart(kno, (float)(car->jumpcount) / 50);
				if ((car->flag & IS_PLAYER) == IS_PLAYER) car->handling_flag |= LAND;
			}
			car->jumpcount = 0;    ///// JUMP STOP
		}
		else { ///////////ROLLOVER
			if (car->jumpcount >= 10) {
				if (car->jumpcount >= 50) car->jumpcount = 50;
				if ((car->flag & IS_PLAYER) == IS_PLAYER && (car->flag & IS_GHOST) != IS_GHOST)NaPlyLandStart(kno, (float)(car->jumpcount) / 20);

				if (car->jumpcount >= 40) car->jumpcount = 20;
				if ((car->slip_flag & ROLLOVER) == ROLLOVER) {
					car->jumpcount /= 6.5;
					car->jmp_acc = 0.06;
					car->jmp_speed = 0.0;
				}
				else {////,EXPLODE
					car->jumpcount /= 7.5;
					car->jmp_acc = 0.06;
					car->jmp_speed = 0.0;
					if ((car->flag & IS_PLAYER) == IS_PLAYER) car->handling_flag |= LAND;
				}
			}
			else car->jumpcount = 0;
		}
		car->jump = car->jumpcount;
	}

	/////// CHECK HIT
	if ((dist = car->bump.distance_zx) <= 0) {
		CheckMapBG_ZX(car, normal, velocity, g_vector, &dist, &new_x, &new_y, &new_z);
	}
	if ((dist = car->bump.distance_xy) < 0) {
		CheckMapBG_XY(car, normal, velocity, &dist, &new_x, &new_y, &new_z);
		CheckWall(car, kno, velocity);
		AccelOff(car, 6);
	}
	if ((dist = car->bump.distance_yz) < 0) {
		CheckMapBG_YZ(car, normal, velocity, &dist, &new_x, &new_y, &new_z);
		CheckWall(car, kno, velocity);
		AccelOff(car, 6);
	}
	if ((dist = car->bump.distance_xy) >= 0 && (dist = car->bump.distance_yz) >= 0) {
		car->hit_flag &= ~WALLHIT_JOIN;
		if (car->wallhitcount != 0) {
			car->wallhitcount += 1;
			if (car->wallhitcount >= 10)car->wallhitcount = 0;
		}
	}

	///// CHECK ROLOVER_FALL
	if (CheckSlope(car->bump.last_zx) != 0 && (car->slip_flag & ROLLOVER_FALL) != ROLLOVER_FALL) {
		SetRolloverFall(car, kno);
	}
	else {
		if (!(car->slip_flag & N_JUMP) && CheckSlope(car->bump.last_zx) == 0 && (car->slip_flag & ROLLOVER_FALL))
			ResetRolloverFall(car, kno);
	}

	/////check basic player,s hight
	car->ground = CalcHeight(new_x, new_y, new_z, car->bump.last_zx);

	//////CHECK TIRE POSITION 
	if ((car->flag & IS_PLAYER) == IS_PLAYER && (g_ScreenSplitA == 0 || g_ScreenSplitA == 1 || g_ScreenSplitA == 2))
		TirePosition(car, new_x, new_y, new_z);
	else
		EnemyTirePosition(car, new_x, new_y, new_z);

	////// SLIPANGLE
	SetSlipAngle(car, kno, old_x, old_z, new_x, new_z);

	////// NEW POSITION
	speed = velocity[0] * velocity[0] + velocity[2] * velocity[2];
	car->old_speed = car->speed;
	car->speed = Sqrtf(speed);

	if (((car->slip_flag & ROLLOVER) != ROLLOVER && car->force <= 0 && car->speed < 0.13) || ((car->slip_flag & ROLLOVER) != ROLLOVER && car->force <= 0 && car->speed < 0.20 && (car->slip_flag & BREAKE) == BREAKE)) {
		velocity[0] = velocity[0] + (-1 * velocity[0]);
		velocity[2] = velocity[2] + (-1 * velocity[2]);
	}
	else {
		car->position[0] = new_x;
		car->position[2] = new_z;
	}
	car->position[1] = new_y;
	car->gravity_xz[0] = g_vector[0];
	car->gravity_xz[2] = g_vector[2];

	car->velocity[0] = velocity[0];
	car->velocity[1] = velocity[1];
	car->velocity[2] = velocity[2];


	if ((car->flag & IS_PLAYER) == IS_PLAYER) {
		if (car->speed > 9) // WAS if(car->speed>MaxSpeed[car->kart])
		{
			nx = 9 / car->speed; // WAS nx=MaxSpeed[car->kart]/car->speed;
			car->velocity[0] = car->velocity[0] * nx;
			car->velocity[1] = car->velocity[1] * nx;
			car->velocity[2] = car->velocity[2] * nx;
			car->speed = 9; // WAS car->speed = MaxSpeed[car->kart];
		}
	}

	////////CHECK SPLASH
	CheckSplash(car, kno);
}

void custom_SpinKart(Player* Car, Camera* camera, char place, char kno)
{
	int PlayerID = (*(long*)&Car - (long)&g_PlayerStructTable) / 0xDD8;
	if (LavaFloorRecoiling[PlayerID])
	{
		custom_lava_SpinKart(Car, camera, place, kno);
	}
	else
	{
		SpinKart(Car, camera, place, kno);
	}
}