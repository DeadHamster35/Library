#ifndef OKSTRUCT_H
#define OKSTRUCT_H
#include "Struct.h"

typedef struct OKObject{
	short     Parameter;
	Object	ObjectData;
	short	BehvaiorClass;
	short	OriginPosition[3];
	long		ModelAddress;
	float	ModelScale;     
} OKObject;


#define BEHAVIOR_DEAD	0
#define BEHAVIOR_STATIC 	1
#define BEHAVIOR_ROTATE 	2
#define BEHAVIOR_PATH	3
#define BEHAVIOR_WANDER 	4

#endif