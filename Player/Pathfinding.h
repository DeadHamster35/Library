#include "../MainInclude.h"
typedef struct BKPathfinder{
     short	TargetPath, LastPath; //Current and last path indicies
	float	Distance; //Distance from end/beginning of path
	Vector	Target; //Array of floats giving x,y,z position of target (e.g. a rival or flag)
     short     Progression, NearestMarker; //Step along the path
     short     ProgressTimer;
     char      Direction; //Direction along the path, +1 or -1, if the start of the path is IDed, will be +1, if the end of the path is IDed, will be -1
     char 	PathType; //0=regular flat path, 1=ramp, 2=drop

	
} BKPathfinder;


extern bool PathfinderComplete(BKPathfinder *Pathfinder, short *PathLengths, short *RampLengths, short *DropLengths);

extern BKPathfinder AIPathfinder[4];

extern void GetItemBoxIndexes();

extern int FindNearestRampNode(float CurrentPosition[],  float FoundNodePosition[], float TargetY, Marker *PathArray[], short* MarkerCounts, short PathCount);

extern int FindNearestDropNode(float CurrentPosition[],  float FoundNodePosition[], float TargetY, Marker *PathArray[], short* MarkerCounts, short PathCount);

extern int FindNearestItemBox(float CurrentPosition[], float FoundItemBoxPosition[]);

extern void UpdateBKPath(BKPathfinder *Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID, char TypeOfPath);

extern void ResetLaneDefaultOffset(int playerID);

extern void ChooseAlternativePathRandm(int playerID, short pointCheckMin, short pointCheckMax, ushort maxPathIDs);

extern void ChangePathAndPoint(int playerID, short pointCheckMin, short pointCheckMax, ushort currentpathID, ushort newpathID);


extern void MakeAlternativePath(Marker *altPath, short length, char pathID);




#define RAMPDISTANCESQUARE 40000.0
#define PATHDISTANCECHECK 350.0

#define FLATPATH     0
#define RAMPPATH     1
#define DROPPATH     2

#define STANDARD_AI     0
#define SEEKER_AI       1
#define RANDOM_AI       2

#define STOPTURN ((DEG1 * 60) * (DEG1 * 60))
#define DRIFTTURN ((DEG1 * 40) * (DEG1 * 40))
#define WIDETURN ((DEG1 * 25) * (DEG1 * 25))
#define MIDTURN ((DEG1 * 12) * (DEG1 * 12))

#define SHORTTURN ((DEG1 * 5) * (DEG1 * 5))
#define NOTURN ((DEG1 * 2) * (DEG1 * 2))