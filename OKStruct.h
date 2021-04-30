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
#define StateBecomeBomb 10
#define StateFlattened 11
#define StateMushroomBoost 12
#define StateSpinOutSaveable 13
#define StateSpinOut 14
#define StateGreenShellHit 15
#define StateRedShellHit 16
#define StateBonk 17
#define StateStarOn 18
#define StateGhostOn 19
#define StateStarOff 20
#define StateGhostOff 21

#endif