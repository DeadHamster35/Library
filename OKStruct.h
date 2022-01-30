#ifndef OKSTRUCT_H
#define OKSTRUCT_H
#include "MainInclude.h"


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

typedef struct OKObjectList{
	short	ObjectIndex;
	char		SoundPlaying, ScriptID;
	short	OriginPosition[3];
	short 	OriginAngle[3];
	short 	OriginVelocity[3];
	short	OriginAngularVelocity[3];
} OKObjectList;

typedef struct OKSkeleton{
	uint			AnimationOffset;
	int			MeshCount;
	float		MeshScale;
	uint			MeshOffset;
	int			ChildCount;
} OKSkeleton;

#define AnimationCount 3

typedef struct OKObjectType{

	short 			BehaviorClass, StatusClass;
	short 			EffectClass, Range;
	short 			Sight, Viewcone;
	short 			MaxSpeed, RenderRadius;
	short			CollisionRadius, Hitbox;
	short			SoundRadius;
	short			CollisionResult, DamagedResult;
	char				SoundType, ZSortToggle;
	char				OKModelCount, OKXLUCount, GravityToggle, CameraAlignToggle;
	int				SoundID;
	OKModel*			ObjectModel;
	OKModel*			ObjectXLU;//
	uint				ObjectAnimations;

} OKObjectType;

typedef struct OKCollisionSphere{
	float	Radius;
	float	Scale;
	short	Position[3], BoxSize[3], Angle[3];
	short	CollisionType, EffectType;
} OKCollisionSphere;

typedef struct OKObject{
	short	ListIndex, SubBehaviorClass;
	short	AngularVelocity[3];
	uchar	AnimationFrame, AnimationMax;
	float	ZBuffer;
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



#define REACTION_NONE 	0
#define REACTION_DEAD 	1
#define REACTION_BOUNCE	2

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