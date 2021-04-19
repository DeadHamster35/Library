#ifndef OKSTRUCT_H
#define OKSTRUCT_H
#include "Struct.h"

typedef struct OKObject{
	short     Range,Sight,Viewcone,Target;
	float 	TargetDistance;
	short     ProgramParameter[4];
	short	Counter[2];
	Object	ObjectData;
	short	BehaviorClass, SubBehaviorClass;
	short	OriginPosition[3];
	long		ModelAddress;
	float	ModelScale;     
} OKObject;


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

#endif