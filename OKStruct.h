#ifndef OKSTRUCT_H
#define OKSTRUCT_H
#include "MainInclude.h"


#define ObjectSegment 		0x0A000000
#define ModelSegment		0x08000000

#define CourseDataSegment	0x06000000
#define CourseF3DSEgment 	0x07000000
#define TextureSegment		0x05000000

typedef struct OKHeader{

	int Version;
	CourseHeader MapHeader;
	uint SectionViewPosition;
	uint XLUSectionViewPosition;
	uint SurfaceMapPosition;
	uint Sky;
	short SkyType, WeatherType;
	uint Credits;
	uint CourseName;
	uint SerialKey;
	uint Ghost;
	uint Maps;
	uint ObjectDataStart;
	uint ObjectModelStart;	
	uint ObjectAnimationStart;
	uint ObjectDataEnd;
	uint BombOffset;
	uint EchoStart;
	uint EchoEnd;
	char Tempo1, Tempo2, Tempo3, Tempo4;	
	uint MusicID;
	int PathLength;
	short WaterType,WaterLevel;
	uint ScrollOffset;
	uint ScrollEnd;
	uint PathOffset;
} OKHeader;


typedef struct OKModel{

	uint 	TextureAddress;
	uint		MeshAddress;
	short	MeshCount,MeshScale;
} OKModel;


typedef struct OKSkeleton{
	uint			AnimationOffset;
	short		NodeCount, CollisionCount;
	float		MeshScale;
	uint			NodeOffset;		//OKNode Offset
	uint			CollisionOffset; 	//OKCollision Offset
	int			ChildCount;
} OKSkeleton;

typedef struct OKNode{
	uint TextureOffset;
	uint	MeshCount;
	uint	MeshOffset;
}OKNode;

#define AnimationCount 3




typedef struct OKCollisionSphere{
	short		Type, Scale;
	short		Angle[3];
	short		Size[3];
	short		Position[3];
	uchar 		StatusClass, EffectClass, CollisionResult, DamagedResult;//
} OKCollisionSphere;




typedef struct OKObjectType{

	short 			BehaviorClass, Range;//
	short			BumpRadius, MaxSpeed;//
	short 			Sight, Viewcone;//
	short 			SoundRadius, RenderRadius;//	
	char				SoundType, ZSortToggle, GravityToggle, CameraAlignToggle; //
	
	char				OKModelCount, OKXLUCount, CollisionCount, ObjectFlag;
	int				SoundID;
	
	uint			ObjectHitbox;	//OKCollisionSphere Address
	uint			ObjectModel;  		//OKModel Address
	uint			ObjectXLU;		//OKModel Address
	uint			ObjectAnimations;	//OKSkeleton Address

} OKObjectType;


typedef struct OKObjectList{
	short	TypeIndex;
	short	Flag;
	short	OriginPosition[3];
	short 	OriginAngle[3];
	short 	OriginVelocity[3];
	short	OriginAngularVelocity[3];
} OKObjectList;

typedef struct OKObject{
	short	ListIndex, TypeIndex;
	short	SoundPlaying, SubBehaviorClass;//
	short	AngularVelocity[3];
	uchar	AnimationFrame, AnimationMax;//
	float	ZBuffer;//
	float 	TargetDistance;	//
	uchar	TurnStatus,WanderStatus,SearchStatus,EMPTYSTATUS;//
	short	Counter[2];//
	short	PathTarget,PlayerTarget;	//
	Object	ObjectData;//
} OKObject;

typedef struct OKPathStruct{
	short	PathStart;
	short	PathStop;
	uchar	Type;
	uchar	Power;
	uchar	ColorR,ColorG,ColorB;
	uchar	AdjColorR,AdjColorG,AdjColorB;
} OKPathStruct;


typedef struct OKOption{
	
	uint		OptionName;
	uint		ParameterCount;
	uint*	ParameterNames;
	int*		ParameterLengths;
} OKOption;

typedef struct OKPanel{

	uint			NameAddress;
	short		OptionCount, NameLength;
	OKOption*		Options;	
	char*		ParameterToggles;

} OKPanel;


typedef struct OKMenu{
	uint		PanelCount;
	OKPanel*	PanelAddress;
} OKMenu;

#define SKY_CLEAR 		0
#define SKY_CLOUD 		1
#define SKY_STAR 		2
#define SKY_WEATHER 	3

#define WEATHER_SNOW 	0
#define WEATHER_RAIN 	1


#define PATH_ECHO 		0
#define PATH_COLOR 		1
#define PATH_CAMERA		2
#define PATH_AIRCONTROL 	3
#define PATH_JUMP		4
#define PATH_NOSIMPLE	5 

typedef struct OKRAMHeader{

	int 			ScrollOffset;
	int 			EchoOffset;	
	
	int			ObjectTypeCount;
	OKObjectType 	*ObjectTypeList;
	int			ObjectCount;
	OKObjectList	*ObjectList;

} OKRAMHeader;


typedef struct OKEngine{
	short	AccelerationCount; 	//Top Speed.
	short	Acceleration[10]; 	//Acceleration.	
} OKEngine;




typedef struct OKPathfinder{
     Vector    Position;
     Vector    Target;
	Vector	Checkpoint;
	short	Status, Timer;
	short	Angle;
     Bump      Bump;
	
} OKPathfinder;



#define ENGINE_ACCEL	0
#define ENGINE_BALANCE	1
#define ENGINE_SPEED	2



#define REACTION_NONE 	0
#define REACTION_DEAD 	1
#define REACTION_BOUNCE	2
#define REACTION_BALL	3

#define BEHAVIOR_DEAD	-1
#define BEHAVIOR_STATIC 	0
#define BEHAVIOR_FLOAT 	1
#define BEHAVIOR_PATH	2
#define BEHAVIOR_WANDER 	3
#define BEHAVIOR_SEARCH	4
#define BEHAVIOR_BOUNCE 	5
#define BEHAVIOR_FLEE	6
#define BEHAVIOR_STRAFE	7

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