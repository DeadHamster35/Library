#include "MainInclude.h"
typedef struct BKPathfinder{
     short	TargetPath, LastPath;
	float	Distance;
	Vector	Target;
	
} BKPathfinder;


extern BKPathfinder AIPathfinder[4];

extern void UpdateBKPath(BKPathfinder Pathfinder, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID);
