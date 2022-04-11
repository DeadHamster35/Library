#include "../MainInclude.h"
typedef struct BKPathfinder{
     short	TargetPath, LastPath;
	float	Distance;
	Vector	Target;
	
} BKPathfinder;


extern BKPathfinder AIPathfinder[4];

extern void UpdateBKPath(BKPathfinder *Pathfinder, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID);

extern void ResetLaneDefaultOffset(int playerID);

extern void ChooseAlternativePathRandm(int playerID, short pointCheckMin, short pointCheckMax, ushort maxPathIDs);

extern void ChangePathAndPoint(int playerID, short pointCheckMin, short pointCheckMax, ushort currentpathID, ushort newpathID);


extern void MakeAlternativePath(Marker *altPath, short length, char pathID);