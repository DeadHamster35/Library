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


#endif