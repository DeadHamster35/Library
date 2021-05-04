#ifndef OKSTRUCT_H
#define OKSTRUCT_H
#include "Struct.h"

typedef struct OKObject{
	short     Range,Sight,Viewcone;
	uchar	TurnStatus,WanderStatus,SearchStatus,EMPTYSTATUS;
	short	Counter[2];
	short	PathTarget,PlayerTarget;
	short	BehaviorClass, SubBehaviorClass;
	short	OriginPosition[3], AngularVelocity[3];
	short	CollisionCount, ModelCount;
	long		CollisionAddress;
	long		ModelAddress;
	float	ModelScale;     
	float 	TargetDistance;
	float	MaxSpeed;
	
	Object	ObjectData;
} OKObject;

typedef struct OKCollisionSphere{
	float	Radius;
	short	Position[3], BoxSize[3];
	short	CollisionType, EffectType;
} OKCollisionSphere;

typedef struct OKModel{
	float 	ModelScale;
	uint		ModelAddress;
} OKModel;


#define BEHAVIOR_DEAD	0
#define BEHAVIOR_STATIC 	1
#define BEHAVIOR_ROTATE 	2
#define BEHAVIOR_PATH	3
#define BEHAVIOR_WANDER 	4
#define BEHAVIOR_SEARCH	5

#define SUBBEHAVIOR_DOCILE 		0
#define SUBBEHAVIOR_ALERT		1
#define SUBBEHAVIOR_CHASE		2
#define SUBBEHAVIOR_SURPRISE		3



// OKObject Result State
#define StateAnimMusicNote 0
#define StateAnimCrash 1
#define StateAnimPoomp 2
#define StateAnimBoing 3
#define StateAnimExplosion 4
#define StateAnimBonkStars 5
#define StateAnimLandingDust 6

#define StateMapObjectHit 7
#define StateLightningHit 8
#define StateBooTranslucent 9
#define StateBecomeBombOn 10
#define StateBecomeBombOff 11
#define StateFlattenedOn 12
#define StateFlattenedOff 13
#define StateMushroomBoost 14
#define StateSpinOutSaveable 15
#define StateSpinOut 16
#define StateGreenShellHit 17
#define StateRedShellHit 18
#define StateBonk 19
#define StateStarOn 20
#define StateGhostOn 21
#define StateStarOff 22
#define StateGhostOff 23

#endif