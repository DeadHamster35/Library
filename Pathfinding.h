#include "MainInclude.h"
typedef struct BKPathfinder{
     short	TargetPath, LastPath; //Current and last path indicies
	float	Distance; //Distance from end/beginning of path
	Vector	Target; //Array of floats giving x,y,z position of target (e.g. a rival or flag)
     short     Progression; //Step along the path
     char     Direction; //Direction along the path, +1 or -1, if the start of the path is IDed, will be +1, if the end of the path is IDed, will be -1

	
} BKPathfinder;


extern BKPathfinder AIPathfinder[4];

extern void UpdateBKPath(BKPathfinder *Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID);