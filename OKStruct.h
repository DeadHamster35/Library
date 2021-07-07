#ifndef OKSTRUCT_H
#define OKSTRUCT_H
#include "Struct.h"


typedef struct OKHeader{

	int Version;
	CourseHeader MapHeader;
	uint Sky;
	uint Credits;
	uint CourseName;
	uint SerialKey;
	uint Ghost;
	uint Maps;
	uint ObjectDataStart;
	uint ObjectModelStart;	
	uint ObjectDataEnd;
	uint EchoStart;
	uint EchoEnd;
	char Tempo1, Tempo2, Tempo3, Tempo4;	
	uint MusicID;
	int PathLength;
	float WaterLevel;
	int	WaterType;
	uint ScrollOffset;
	uint ScrollEnd;

} OKHeader;


typedef struct OKModel{

	uint 	TextureAddress;
	uint		MeshAddress;
	short	MeshCount,MeshScale;
} OKModel;

typedef struct OKObjectList{
	short	ObjectIndex;
	short	Padding;
	short	OriginPosition[3];
	short 	OriginAngle[3];
	short 	OriginVelocity[3];
	short	OriginAngularVelocity[3];
} OKObjectList;


typedef struct OKObjectType{
	short 	BehaviorClass;
	short 	StatusClass;
	short 	EffectClass;
	short 	Range;
	short 	Sight;
	short 	Viewcone;	
	short 	MaxSpeed;    
	short	OKModelCount;		
	float	CollisionRadius;  //temp
	OKModel*	ObjectModel;	
} OKObjectType;

typedef struct OKCollisionSphere{
	float	Radius;
	float	Scale;
	short	Position[3], BoxSize[3], Angle[3];
	short	CollisionType, EffectType;
} OKCollisionSphere;

typedef struct OKObject{
	short	ListIndex, SubBehaviorClass;
	short	AngularVelocity[3], PAD;
	float 	TargetDistance;	
	uchar	TurnStatus,WanderStatus,SearchStatus,EMPTYSTATUS;
	short	Counter[2];
	short	PathTarget,PlayerTarget;	
	Object	ObjectData;
} OKObject;

typedef struct OKObjectHeader{
	int			ObjectTypeCount;
	OKObjectType 	*ObjectTypeList;
	int			ObjectCount;
	OKObjectList	*ObjectList;
} OKObjectHeader;

typedef struct OKPathStruct{
	short	PathStart;
	short	PathStop;
	uchar	Type;
	uchar	Power;
	uchar	ColorR,ColorG,ColorB;
	uchar	AdjColorR,AdjColorG,AdjColorB;
} OKPathStruct;

#define PATH_ECHO 		0
#define PATH_COLOR 		1
#define PATH_CAMERA		2
#define PATH_AIRCONTROL 	3
#define PATH_JUMP		4
#define PATH_NOSIMPLE	5 

typedef struct OKRAMHeader{

	int 			ScrollOffset;
	int 			EchoOffset;
	int 			CreditsOffset;
	int 			CourseNameOffset;
	int 			SerialKeyOffset;
	int 			GhostOffset;
	int 			MapsOffset;
	OKObjectHeader	ObjectHeader;

} OKRAMHeader;


typedef struct OKEngine{
	short	AccelerationCount; 	//Top Speed.
	short	Acceleration[10]; 	//Acceleration.	
} OKEngine;
#define ENGINE_ACCEL	0
#define ENGINE_BALANCE	1
#define ENGINE_SPEED	2





#define BEHAVIOR_DEAD	-1
#define BEHAVIOR_STATIC 	0
#define BEHAVIOR_ROTATE 	1
#define BEHAVIOR_PATH	2
#define BEHAVIOR_WANDER 	3
#define BEHAVIOR_SEARCH	4

#define SUBBEHAVIOR_DEAD			-1
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