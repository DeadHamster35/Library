#include "../MainInclude.h"
typedef struct BKPathfinder{
     short	TargetPath, LastPath; //Current and last path indicies
	float	Distance; //Distance from end/beginning of path
     float     MaxSpeed;
	Vector	Target; //Array of floats giving x,y,z position of target (e.g. a rival or flag)
     short     Progression, NearestMarker; //Step along the path
     float	NearestMarkerHeight; //Height of nearest marker (used for finding falls)
     short     ProgressTimer, ShootingTimer;
     char      Direction, PathType; //Direction along the path, +1 or -1, if the start of the path is IDed, will be +1, if the end of the path is IDed, will be -1     
     char     Status, RivalPlayer;
     bool		SlowDown; //Boolean denoting if bot should slow down near end of path or not



	
} BKPathfinder;



typedef struct OKAIHeader
{
     uint CoursePaths; //uint array of segmented addresses 0x4
     uint CourseRamps;
     uint CourseDrops;
     uint PathLengths; //short array of path lengths 0x2
     uint RampLengths;
     uint DropLengths;
     ushort TotalPaths, TotalRamps, TotalDrops;
} OKAIHeader;

extern short ItemBoxCount;

extern bool PathfinderComplete(BKPathfinder *Pathfinder, short *PathLengths, short *RampLengths, short *DropLengths);

extern BKPathfinder AIPathfinder[4];

extern void GetItemBoxIndexes();

extern int FindNearestRampNode(float CurrentPosition[],  float FoundNodePosition[], float TargetY, Marker *PathArray[], short* MarkerCounts, short PathCount, float HeightCheckSquared);

extern int FindNearestDropNode(float CurrentPosition[],  float FoundNodePosition[], float TargetY, Marker *PathArray[], short* MarkerCounts, short PathCount, float HeightCheckSquared);

extern int FindNearestItemBox(float CurrentPosition[], float FoundItemBoxPosition[], float HeightCheckSquared, bool ignoreHeightCheck, short courseType);

extern void FindFurthestNode(float CurrentPosition[],  float FoundNodePosition[], Marker *PathArray[], short* MarkerCounts, short PathCount);


extern void UpdateRacePath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID);
extern void UpdateBKPath(BKPathfinder *Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID, char TypeOfPath, float HeightCheckSquared);

extern void ResetLaneDefaultOffset(int playerID);

extern void ChooseAlternativePathRandm(int playerID, short pointCheckMin, short pointCheckMax, ushort maxPathIDs);

extern void ChangePathAndPoint(int playerID, short pointCheckMin, short pointCheckMax, ushort currentpathID, ushort newpathID);


extern void MakeAlternativePath(Marker *altPath, short length, char pathID);




#define RAMPDISTANCESQUARE 40000.0
#define PATHDISTANCECHECK 2.0

#define FLATPATH     0
#define RAMPPATH     1
#define DROPPATH     2

#define SEEKER_AI     0
#define RANDOM_AI       1

#define STOPTURN ((DEG1 * 60) * (DEG1 * 60))
#define DRIFTTURN ((DEG1 * 40) * (DEG1 * 40))
#define WIDETURN ((DEG1 * 25) * (DEG1 * 25))
#define MIDTURN ((DEG1 * 12) * (DEG1 * 12))

#define SHORTTURN ((DEG1 * 5) * (DEG1 * 5))
#define NOTURN ((DEG1 * 2) * (DEG1 * 2))