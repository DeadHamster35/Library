#include "../MainInclude.h"

ushort C_particle_count;

CustomParticle CustomParticleBuffer[MAX_CUSTOM_PARTICLES] ALIGN(16);

//Call on Race Start
void InitialCustomParticleBuffer()
{
	C_particle_count=0;
	for(int i=0; i<MAX_CUSTOM_PARTICLES; i++)
	{
		//Default values on race init
		CustomParticleBuffer[i].flag=0;
		CustomParticleBuffer[i].category=0;
		CustomParticleBuffer[i].counter=0; 
		CustomParticleBuffer[i].cparam=0; 
		CustomParticleBuffer[i].fparam=0; 
		CustomParticleBuffer[i].renderdistance=0;
		CustomParticleBuffer[i].drawmode=0;
		CustomParticleBuffer[i].movemode=0;
		CustomParticleBuffer[i].scale=0;
		CustomParticleBuffer[i].position[0]=0;
		CustomParticleBuffer[i].position[1]=0;
		CustomParticleBuffer[i].position[2]=0;
		CustomParticleBuffer[i].velocity[0]=0;
		CustomParticleBuffer[i].velocity[1]=0;
		CustomParticleBuffer[i].velocity[2]=0;
		CustomParticleBuffer[i].angle[0]=0;
		CustomParticleBuffer[i].angle[1]=0;
		CustomParticleBuffer[i].angle[2]=0;
		CustomParticleBuffer[i].colR=0;
		CustomParticleBuffer[i].colG=0;
		CustomParticleBuffer[i].colB=0;
		CustomParticleBuffer[i].colA=0;
		CustomParticleBuffer[i].onscreen=0;
		CustomParticleBuffer[i].anim_speed=1;
		CustomParticleBuffer[i].anim_counter=0;
		CustomParticleBuffer[i].anim_maxframe=1;
		CustomParticleBuffer[i].draw_counter=0;
		CustomParticleBuffer[i].loopcount=0;
		CustomParticleBuffer[i].loopcountmax=1;
		CustomParticleBuffer[i].sparam1=0;
	}
}

void DeleteCustomParticleBuffer(CustomParticle *particle)
{
	particle->flag=0;
	particle->category=0;
	--C_particle_count;
}

void SetCustomParticleBuffer(CustomParticle *particle,Vector pos,SVector angle,Vector velo,float scale,short category)
{
	CopyVector(particle->position,pos);
	CopyVector(particle->velocity,velo);
	particle->angle[0] = angle[0];
	particle->angle[1] = angle[1];
	particle->angle[2] = angle[2];	



 	particle->category=category;
	SET_FLAG(particle->flag,EXISTPTCL);
	particle->counter=0;
	particle->cparam=0;
	particle->fparam=0;
	particle->renderdistance=500;
	particle->scale=scale;
	particle->loopcount=0;
	particle->loopcountmax=1;
}

short AddCustomParticleBuffer(Vector pos,SVector angle,Vector velo,float scale,short category,char filtermode)
{
	CustomParticle *particle;
	if(C_particle_count>=MAX_CUSTOM_PARTICLES)
	{
		return(-1);
	}
 	for(int i=0;i<MAX_CUSTOM_PARTICLES;i++)
	{
		if(CustomParticleBuffer[i].flag==0)	 
		{
			++C_particle_count;
			particle=(CustomParticle *)&CustomParticleBuffer[i];
			SetCustomParticleBuffer(particle,pos,angle,velo,scale,category);
			CustomParticleBuffer[i].drawmode = filtermode;
			return(i);
		}
	}
	return(-1);		     //NO SPACE!!!!
}


////Color Mode////


void Particle_Colormode(CustomParticle *particle)
{
	switch (particle->drawmode)
	{
	case KWMODE_BL_FLASH:
	case KWMODE_PT_FLASH:
		ToumeIMode(MakeRandomLimmit(200)+40,MakeRandomLimmit(200)+40,MakeRandomLimmit(200)+40,particle->colA);
		break;
	default:
		ToumeIMode(particle->colR,particle->colG,particle->colB,particle->colA);
		break;
	}
}

////Filter////


void Particle_Filtermode(CustomParticle *particle)
{
	switch (particle->drawmode)
	{
	case KWMODE_BL:
	case KWMODE_BL_FLASH:
		gSPSetOtherMode(GraphPtrOffset++,G_SETOTHERMODE_H, G_MDSFT_TEXTFILT, 2, G_TF_BILERP);
		break;
	case KWMODE_PT:
	case KWMODE_PT_FLASH:
		gSPSetOtherMode(GraphPtrOffset++,G_SETOTHERMODE_H, G_MDSFT_TEXTFILT, 2, G_TF_POINT);
		break;
	default:
		break;
	}
}

////On screen////


void Particle_Onscreen(CustomParticle *particle, int player, bool onscreen)
{
	if(onscreen)
	{
		switch (player)
		{
		case 0:
			SET_FLAG(particle->onscreen,ONSCREEN1);
			break;
		case 1:
			SET_FLAG(particle->onscreen,ONSCREEN2);
			break;
		case 2:
			SET_FLAG(particle->onscreen,ONSCREEN3);
			break;
		case 3:
			SET_FLAG(particle->onscreen,ONSCREEN4);
			break;		
		default:
			break;
		}
	}
	if(!onscreen)
	{
		switch (player)
		{
		case 0:
			CLR_FLAG(particle->onscreen,ONSCREEN1);
			break;
		case 1:
			CLR_FLAG(particle->onscreen,ONSCREEN2);
			break;
		case 2:
			CLR_FLAG(particle->onscreen,ONSCREEN3);
			break;
		case 3:
			CLR_FLAG(particle->onscreen,ONSCREEN4);
			break;		
		default:
			break;
		}
	}
}

////Common Move Routines////

void Particle_UpdateVel_Move(CustomParticle *particle)
{

	char frame;
	uchar subframemode = 0;

	switch (particle->anim_speed)
	{
	default:
	case FRAME_1:
		frame = 0;
		break;
	case FRAME_2:
		frame = KW2GFTimer;
		break;
	case FRAME_4:
		frame = KW4GFTimer;
		break;
	case FRAME_8:
		frame = KW8GFTimer;
		break;
	case FRAME_16:
		frame = KW16GFTimer;
		break;

	case FRAME_SUB_2:
		subframemode = 1;
		frame = 2;
		break;
	case FRAME_SUB_3:
		subframemode = 1;
		frame = 3;
		break;
	case FRAME_SUB_4:
		subframemode = 1;
		frame = 4;
		break;
	case FRAME_SUB_5:
		subframemode = 1;
		frame = 5;
		break;
	case FRAME_SUB_6:
		subframemode = 1;
		frame = 6;
		break;
	}

	if (!g_InGame)
	{
		switch (particle->anim_speed)
		{
		default:
		case FRAME_1:
			frame = 0;
			break;
		case FRAME_2:
			frame = GlobalFrameChar/10;
			break;
		case FRAME_4:
			frame = GlobalFrameChar/6;
			break;
		case FRAME_8:
			frame = GlobalFrameChar/3;
			break;
		case FRAME_16:
			frame = GlobalFrameChar/2;
			break;
		}
	}
	

	switch (subframemode)
	{
	default:
	case 0:
		if (particle->anim_counter < particle->anim_maxframe && frame == 0)
		{
			particle->anim_counter++;
		}
		if (particle->anim_counter >= particle->anim_maxframe)
		{
			particle->anim_counter = 0;
			particle->loopcount++;
		}
		break;

	case 1:
		if (particle->anim_counter < particle->anim_maxframe)
		{
			if (particle->anim_counter + frame >= particle->anim_maxframe)
			{
				particle->anim_counter = particle->anim_maxframe;
			}
			else
			{
				particle->anim_counter += frame;
			}
		}
		particle->loopcount++;
		break;
	}

	if (particle->loopcount >= particle->loopcountmax)
	{
		DeleteCustomParticleBuffer(particle);
	}	


	particle->position[0] += particle->velocity[0];
	particle->position[1] += particle->velocity[1];
	particle->position[2] += particle->velocity[2];
}




////-------Create Local Particle-------//
// category = particle visual
// player = camera screen
// screen_share = show to every player
// rndoffset = random spawn offset from position
// filtermode = bilinear/point KWMODE_BL/KWMODE_PT or add color flashing: _FLASH
// anim_speed = FRAME_1/FRAME_2/FRAME_4/FRAME_8/FRAME_16 or _SUB_ for skip
// loopcount = sprite sheet loop until destruction
// xflip = mirror sprite
// RGBA = int 0xRRGGBBAA or CHARS2INT(r,g,b,a)
short ParticleCreate_Local(short category, int player, bool screen_share, short angle, Vector pos, float scale, float speed_forward, float speed_up, short rotationadd, ushort rndoffset, char filtermode, uchar anim_speed, uchar loopcount, uchar xflip, uint RGBA)
{
	CustomParticle *particle;	
	short particleID = -1;

	Vector vel = {0,speed_up,speed_forward};
	SVector ang = {0,0,deg(180)};

	MakeAlignVector(vel,angle);

	particleID = AddCustomParticleBuffer(pos,ang,vel,scale,category,filtermode);

	particle=&CustomParticleBuffer[particleID];

	particle->owner = (char)player;
	particle->anim_speed = anim_speed;
	particle->anim_counter = 0;
	particle->xflip = xflip;
	particle->loopcountmax = loopcount;
	particle->sparam1 = rotationadd;


	particle->colR = (RGBA>>24) & 0xFF;
	particle->colG = (RGBA>>16) & 0xFF;
	particle->colB = (RGBA>>8) & 0xFF;
	particle->colA = RGBA & 0xFF;

	float rndX = MakeRandomLimmit(rndoffset);
	float rndY = MakeRandomLimmit(rndoffset);
	float rndZ = MakeRandomLimmit(rndoffset);
	if (MakeRandomLimmit(2) == 0)
	{
		particle->position[0] += rndX;
		particle->position[1] += rndY;
		particle->position[2] += rndZ;
	}
	else
	{
		particle->position[0] -= rndX;
		particle->position[1] -= rndY;
		particle->position[2] -= rndZ;		
	}

	if (screen_share)
	{
		SET_FLAG(particle->flag,SCRNSHREPTCL);
	}

	switch (particle->category)
	{
	default:
		particle->anim_maxframe = 6;
		break;
	case PTCLSMOKEPUFF:
	case PTCLBUBBLEPOP:
	case PTCLEXPLOSION:
		particle->anim_maxframe = 7;
		break;
	case PTCLSPLATTER:
		particle->anim_maxframe = 4;
		break;
	case PTCLDIRT:
		particle->anim_maxframe = 3;
		break;
	case PTCLPEBBLE:
		particle->renderdistance = 3000;
		particle->anim_maxframe = 1;
		break;
	case PTCLBUBBLE:
		particle->anim_maxframe = 1;
		break;
	}

	return particleID;
}


////Common 32x32 Particle////

void ParticleDraw_Common_32x32(CustomParticle *particle, int player, bool RGBAMode)
{
	if (!(particle->flag&SCRNSHREPTCL) && particle->owner != player)
	{
		return;
	}

	float distance;
	int rdist= particle->renderdistance;

	distance=CheckDisplayRange(GlobalCamera[player]->camera_pos,particle->position,GlobalCamera[player]->camera_direction[1],20*20,g_screenViewAngle[player],rdist*rdist);
	
	if(distance<0 && g_InGame == 1) // Not on screen
	{
		return;
	}

	// Setup //
	Vtx_t *VTXTile;
	Gfx *GFXTile;

	GFXTile = KWTextureIA_AAZBBL_Init;
	uchar SpriteMode = 0;

	if (RGBAMode)
	{
		GFXTile = KWTextureRGBA_AAZBBL_Init;
		SpriteMode = 1;
	}

	VTXTile = Vtx_KTile32x32;

	if (particle->xflip)
	{
		VTXTile = Vtx_KTile32x32XFlip;
	}

	// Sheets //

	ushort *sprite_sheet;

	switch (particle->category)
	{
	default:
	case PTCLSMOKEPUFF:
		sprite_sheet = ParticleSmokePuffIA16;
		break;
	case PTCLPUFF:
		sprite_sheet = ParticlePuffIA16;
		break;
	case PTCLPOP:
		sprite_sheet = ParticlePopIA16;
		break;
	case PTCLSPARKLE:
		sprite_sheet = ParticleSparkleIA16;
		break;
	case PTCLGROUNDMUD:
		sprite_sheet = ParticleMudSplatIA16;
		break;
	case PTCLBUBBLEPOP:
		sprite_sheet = ParticleBubblePopIA16;
		break;
	case PTCLPEBBLE:
		sprite_sheet = ParticlePebbleIA16;
		break;
	case PTCLBUBBLE:
		sprite_sheet = ParticleBubbleIA16;
		break;
	case PTCLEXPLOSION:
		sprite_sheet = ParticleExplosionRGBA16;
		break;
	case PTCLSPLATTER:
		sprite_sheet = ParticleSplatterIA16;
		break;
	case PTCLDIRT:
		sprite_sheet = ParticleDirtIA16;
		break;
	}

	if (particle->anim_maxframe > 1)
	{
		sprite_sheet += (0x400*particle->anim_counter);
	}	


	// Make sprite //
	if (g_InGame)
	{
	    particle->angle[2] = particle->angle[2] + particle->sparam1;
	    particle->angle[1] = KWLookCamera(particle->position[0],particle->position[2],GlobalCamera[player]);
	}
	

	KWCreateAffine3D(particle->position,particle->angle,particle->scale);

	switch (SpriteMode)
	{
	default:
	case 0:
		gSPDisplayList(GraphPtrOffset++, GFXTile);
		Particle_Colormode(particle);
		Particle_Filtermode(particle);
		KWTextureIA16_Sub(sprite_sheet,VTXTile,32,32,32,32);
		break;

	case 1:
		gSPDisplayList(GraphPtrOffset++, GFXTile);
		Particle_Colormode(particle);
		Particle_Filtermode(particle);
		KWTextureRGBA_SubBL(sprite_sheet,VTXTile,32,32,32);
		break;
	}


}




////Particle////

void DrawCustomParticle(int player)
{
	CustomParticle *particle;

	for(int i=0;i<MAX_CUSTOM_PARTICLES;i++)
	{
		if(!(CustomParticleBuffer[i].flag&EXISTPTCL))
		{
			continue;
		}
		if(CustomParticleBuffer[i].flag&HIDEPTCL)
		{
			continue;
		}

		particle =(CustomParticle *)&CustomParticleBuffer[i];

		switch (particle->category)
		{
			case PTCLSPARKLE:
			case PTCLPUFF:
			case PTCLSMOKEPUFF:
			case PTCLPOP:
			case PTCLGROUNDMUD:
			case PTCLBUBBLEPOP:
			case PTCLPEBBLE:
			case PTCLBUBBLE:
			case PTCLSPLATTER:
			case PTCLDIRT:
				ParticleDraw_Common_32x32(particle,player,0);
				break;
			case PTCLEXPLOSION:
				ParticleDraw_Common_32x32(particle,player,1);
				break;
			default:
				break;
		}
	}
}

void MoveCustomParticle()
{
	if (g_gamePausedFlag != 0)
	{
		return;
	}

	CustomParticle *particle;

	for(int i=0;i<MAX_CUSTOM_PARTICLES;i++)
	{
		if(!(CustomParticleBuffer[i].flag&EXISTPTCL))
		{
			continue;
		}
		if(CustomParticleBuffer[i].flag&HIDEPTCL)
		{
			continue;
		}

		particle =(CustomParticle *)&CustomParticleBuffer[i];

		Particle_UpdateVel_Move(particle);

	}
}