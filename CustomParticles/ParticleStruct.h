#ifndef PARTICLESTRUCT_H_
#define PARTICLESTRUCT_H_

#include "../MainInclude.h"


#define MAX_CUSTOM_PARTICLES		200


// Custom Particle IDs
#define PTCLSPARKLE			1
#define PTCLPUFF			2
#define PTCLSMOKEPUFF		3
#define PTCLPOP				4
#define PTCLBUBBLEPOP		5
#define PTCLEXPLOSION		6
#define PTCLPEBBLE			7
#define PTCLBUBBLE			8
#define PTCLSPLATTER		9
#define PTCLGROUNDMUD		10
#define PTCLDIRT			11


// Particle KWMode flags
#define KWMODE_BL		0
#define KWMODE_PT		1
#define KWMODE_BL_FLASH	2
#define KWMODE_PT_FLASH	3

// Particle frame modes
#define FRAME_1			0
#define FRAME_2			1
#define FRAME_4			2
#define FRAME_8			3
#define FRAME_16		4
#define FRAME_SUB_2		5
#define FRAME_SUB_3		6
#define FRAME_SUB_4		7
#define FRAME_SUB_5		8
#define FRAME_SUB_6		9

// Particle flags
#define EXISTPTCL   0x8000
#define HITPTCL     0x4000
#define MOVEPTCL    0x2000
#define MYPTCL      0x1000
#define HIDEPTCL	 0x800
#define SCRNSHREPTCL 0x400
#define FALLINGPTCL  0x200
#define SHADOWPTCL	 0x100

#define STATE4PTCL	  0x80
#define STATE3PTCL	  0x40
#define STATE2PTCL	  0x20
#define STATE1PTCL	  0x10



typedef struct CustomParticle{

	short		flag;	
	uchar		category, counter;

	ushort 		renderdistance;
	uchar		xflip, owner;

	float   	fparam;
	float 		scale;

	Vector 		position;
	Vector		velocity;
	uchar		loopcount, loopcountmax;

	USVector	angle;

	uchar		drawmode, movemode, draw_counter, cparam;
	uchar		colR, colG, colB, colA;
	uchar		onscreen, anim_speed, anim_counter, anim_maxframe;

	uchar		param1, param2;
	short		sparam1;

} CustomParticle;


// Externals for Particle Files
extern ushort ParticlePopIA16[];
extern ushort ParticleMudSplatIA16[];
extern ushort ParticleSparkleIA16[];
extern ushort ParticleSmokePuffIA16[];
extern ushort ParticlePuffIA16[];
extern ushort ParticleExplosionRGBA16[];
extern ushort ParticleApplePieceRGBA16[];
extern ushort ParticleBubblePopIA16[];
extern ushort ParticlePebbleIA16[];
extern ushort ParticleBubbleIA16[];
extern ushort ParticleSplatterIA16[];
extern ushort ParticleDirtIA16[];







#endif
