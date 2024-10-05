#include "../MainInclude.h"


//#define RunawayToggle 1

BKPathfinder AIPathfinder[4];

ushort BotButtons[4] = {0, 0, 0, 0};
ushort BotPressed[4] = {0, 0, 0, 0};
char BotAnalog[4] = {0, 0, 0, 0};
short ItemBoxCount = 0;
short ItemBoxIndex[100];



//Build up array of item box indicies by querying the simple object array and storing where the item boxes are, this should run once when a course loads
void GetItemBoxIndexes()
{
    ItemBoxCount = 0;
    for (int ThisObject = 0; ThisObject < MAX_OBJECT; ThisObject++)
    {
        if (g_SimpleObjectArray[ThisObject].category == IBOX)
        {
            ItemBoxIndex[ItemBoxCount] = ThisObject;
            ItemBoxCount++;
        }
    }
}


//Before running the function below, ensure that you've set the `Target` value 
//of the BKPathfinder to the float-position of the position you wish to drive towards. 





bool PathfinderComplete(BKPathfinder *Pathfinder, short *PathLengths, short *RampLengths, short *DropLengths)
{
    switch (Pathfinder->PathType)
    {
        case FLATPATH:
        {            
            return 
            (
                (Pathfinder->ProgressTimer >= 90)
                || (Pathfinder->TargetPath == -1) 
                || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
                || (Pathfinder->NearestMarker==PathLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
                || (Pathfinder->NearestMarker < 0) 
                || (Pathfinder->NearestMarker > PathLengths[Pathfinder->TargetPath])
            ); //If bot reaches end of path
            break;
        }

        case RAMPPATH:
        {            
            return 
            (
                (Pathfinder->ProgressTimer >= 120)
                || (Pathfinder->TargetPath == -1) 
                || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
                || (Pathfinder->NearestMarker==RampLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
                || (Pathfinder->NearestMarker < 0) 
                || (Pathfinder->NearestMarker > RampLengths[Pathfinder->TargetPath])
            ); //If bot reaches end of path
            break;
        }

        case DROPPATH:
        {            
            return 
            (
                (Pathfinder->ProgressTimer >= 120)
                || (Pathfinder->TargetPath == -1) 
                || (Pathfinder->NearestMarker==0 && Pathfinder->Direction==-1)  
                || (Pathfinder->NearestMarker==DropLengths[Pathfinder->TargetPath] && Pathfinder->Direction==1) 
                || (Pathfinder->NearestMarker < 0) 
                || (Pathfinder->NearestMarker > DropLengths[Pathfinder->TargetPath])
            ); //If bot reaches end of path
            break;
        }
    }
    return false;
}

int FindNearestRampNode(float CurrentPosition[], float FoundNodePosition[], float TargetY, Marker* PathArray[], short* MarkerCounts, short PathCount, float HeightCheckSquared)
{
    float Distance = 99999999.0;
    float CheckDistance;
    float path_height_start_node, path_height_end_node;
    short use_this_path= -1;
    short use_this_marker=0;
    float TargetHeightDifference = pow(CurrentPosition[1] - TargetY, 2);//Square to get absolute distance. 
    
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
    {
        path_height_start_node = (float)PathArray[ThisPath][0].Position[1];
        path_height_end_node = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];


        //Check beginning of path
        if (pow(CurrentPosition[1] - path_height_start_node, 2) < HeightCheckSquared)
        {
            if (pow(path_height_end_node - TargetY, 2) < TargetHeightDifference)
            {
                CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
                                                   CurrentPosition[2], (float)PathArray[ThisPath][0].Position[2]);
                if (CheckDistance < Distance)
                {
                    Distance = CheckDistance;
                    use_this_path = ThisPath;
                    use_this_marker = 0;
                }
            }
        }
        //Check end of path
        if (pow(CurrentPosition[1] - path_height_end_node, 2) < HeightCheckSquared)
        {
            if (pow(path_height_start_node - TargetY, 2) < TargetHeightDifference)
            {
                CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[0], 
                                                    CurrentPosition[2], (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[2]);
                if (CheckDistance < Distance)
                {
                    Distance = CheckDistance;
                    use_this_path = ThisPath;
                    use_this_marker = MarkerCounts[ThisPath];
                }
            }
        }
    }   
    if (use_this_path != -1)
    {    //Vector that will be returned
            FoundNodePosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
            FoundNodePosition[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
            FoundNodePosition[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
    }

    return(use_this_path);
}




int FindNearestItemBox(float CurrentPosition[], float FoundItemBoxPosition[], float HeightCheckSquared, short courseType)
{   
    //Find the nearest item box
    float player_x = CurrentPosition[0];
    float player_y = CurrentPosition[1];
    float player_z = CurrentPosition[2];
    float distance = 99999999.0;
    float CheckDistance;
    int found_item_box = -1;


    for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
    {
        short i = ItemBoxIndex[ThisItemBox];
        float item_box_position_y = g_SimpleObjectArray[i].position[1];
        float diff_y = item_box_position_y - player_y;
        if (pow(diff_y, 2) < HeightCheckSquared && (diff_y >= 0.0 || courseType > 3)) //Height check
        {
            float item_box_position_x = g_SimpleObjectArray[i].position[0];
            float item_box_position_z = g_SimpleObjectArray[i].position[2];
            CheckDistance = pow(item_box_position_x - player_x, 2) +
                            pow(item_box_position_z - player_z, 2);
            if (CheckDistance < distance)
            {
                distance = CheckDistance;
                //Vector that will be returned
                FoundItemBoxPosition[0] = item_box_position_x;
                FoundItemBoxPosition[1] = item_box_position_y;
                FoundItemBoxPosition[2] = item_box_position_z;
                found_item_box = i;
            }                
        }
    }
    

    // //Find a random item box
    // int found_item_box = ItemBoxIndex[MakeRandomLimmit(ItemBoxCount)];
    // FoundItemBoxPosition[0] = g_SimpleObjectArray[found_item_box].position[0];
    // FoundItemBoxPosition[1] = g_SimpleObjectArray[found_item_box].position[1];
    // FoundItemBoxPosition[2] = g_SimpleObjectArray[found_item_box].position[2];
    return found_item_box;
}





int FindNearestDropNode(float CurrentPosition[], float FoundNodePosition[], float TargetY, Marker* PathArray[], short* MarkerCounts, short PathCount, float HeightCheckSquared)
{
    float Distance = 99999999.0;
    float CheckDistance;
    short use_this_path=-1;
    //short use_this_marker=0;
    
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
    {

        //Check beginning of path, which is the start of the drop
        if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared)
        {
            //if (pow((float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1] - TargetY, 2) < pow(CurrentPosition[1] - TargetY, 2)) //If marker is closer in height to the bot than the target
            //{
                CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
                                                    CurrentPosition[2], (float)PathArray[ThisPath][0].Position[2]);
                if (CheckDistance < Distance)
                {   
                    Distance = CheckDistance;
                    use_this_path = ThisPath;
                    //use_this_marker = 0;
                }
            //}
        }
        //Note that the end of a drop is not where we want to go so we don't check it like we would a ramp
    }   

    if (use_this_path != -1) //If a drop was actually found
    {
        //Vector that will be returned
        FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
        FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
        FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
    }


    return(use_this_path);  //Note if no drop is found, this function returns -1
}



//Returns the furthest path node 
void FindFurthestNode(float CurrentPosition[], float FoundNodePosition[], Marker* PathArray[], short* MarkerCounts, short PathCount)
{
    float Distance = -99999999.0;
    float CheckDistance;
    short use_this_path=-1;
    
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
    {
        //CheckDistance = PythagoreanTheorem(CurrentPosition[0], (float)PathArray[ThisPath][0].Position[0], 
        //                                    CurrentPosition[2], (float)PathArray[ThisPath][0].Position[2]);
        CheckDistance = pow((float)PathArray[ThisPath][0].Position[0] - CurrentPosition[0], 2) +
                        pow((float)PathArray[ThisPath][0].Position[1] - CurrentPosition[1], 2) +
                        pow((float)PathArray[ThisPath][0].Position[2] - CurrentPosition[2], 2);
        if (CheckDistance > Distance)
        {
            Distance = CheckDistance;
            use_this_path = ThisPath;
        }
    }   

    if (use_this_path != -1) //If a drop was actually found
    {
        //Vector that will be returned
        FoundNodePosition[0] = (float)PathArray[use_this_path][0].Position[0]; 
        FoundNodePosition[1] = (float)PathArray[use_this_path][0].Position[1];
        FoundNodePosition[2] = (float)PathArray[use_this_path][0].Position[2];        
    }
}









//Find nearest node in current path
int FindNearestMarker(float CurrentPosition[], Marker *PathArray[], short Markercount, short ThisPath, short defaultMarker)
{
    float Distance = 99999999.0;
    float CheckDistance;
    short use_this_marker = defaultMarker;
    for (int ThisMarker = 0; ThisMarker <= Markercount; ThisMarker++) 
    {
        CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][ThisMarker].Position[0], CurrentPosition[0], 
                                            (float)PathArray[ThisPath][ThisMarker].Position[2], CurrentPosition[2]);
        if (CheckDistance < Distance)
        {
            Distance = CheckDistance;
            use_this_marker = ThisMarker;
            //use_this_marker = 0;
        }    
    }
    return(use_this_marker);
}



//Update path for race courses
void UpdateRacePath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID)
{
    short nearestToTargetPath = -1;
    short nearestToBotPath = -1;
    short EndMarker = 0;
    //First find nearest paths to target and bot
    float CheckDistance  = 99999999.0f;
    float DistanceToTarget = 99999999.0f;
    float DistanceToBot = 99999999.0f;
    for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
    {  
        EndMarker = MarkerCounts[ThisPath];
        //First find path nearest target
        CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
                                            (float)PathArray[ThisPath][EndMarker].Position[2], Pathfinder->Target[2]);
        if (CheckDistance < DistanceToTarget)
        {
            DistanceToTarget = CheckDistance;
            nearestToTargetPath = ThisPath;
        }
        CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
                                            (float)PathArray[ThisPath][0].Position[2], Pathfinder->Target[2]);
        if (CheckDistance < DistanceToTarget)
        {
            DistanceToTarget = CheckDistance;
            nearestToTargetPath = ThisPath;
        }       
        //Second find path nearest bot position
        CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], GlobalPlayer[PlayerID].position[0], 
                                            (float)PathArray[ThisPath][EndMarker].Position[2],  GlobalPlayer[PlayerID].position[2]);
        if (CheckDistance < DistanceToBot)
        {
            DistanceToBot = CheckDistance;
            nearestToBotPath = ThisPath;
        }
        CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0],  GlobalPlayer[PlayerID].position[0], 
                                            (float)PathArray[ThisPath][0].Position[2],  GlobalPlayer[PlayerID].position[2]);
        if (CheckDistance < DistanceToBot)
        {
            DistanceToBot = CheckDistance;
            nearestToBotPath = ThisPath;
        }         
    }
    //Set bot to next path
    short diff;
    short ThisPath;
    // short Progression;
    short Direction;
    if (nearestToTargetPath > nearestToBotPath)
    {
        diff = nearestToTargetPath - nearestToBotPath;
        if (diff < PathCount/2)
        {
            Direction = 1;

        }
        else //if (dif >= MAarkerCount/2)
        {
            Direction = -1;           
        }
    }   
    else // (if (nearestToTargetPath <= nearestToBotPath))
    {
        diff = nearestToBotPath - nearestToTargetPath;
        if (diff < PathCount/2)
        {
            Direction = -1; 
        }
        else //if (dif >= MAarkerCount/2)
        {
            Direction = 1;
        }
    }

    ThisPath = nearestToBotPath;
    if (ThisPath == PathCount) //error catch in case we went completeyl around the circle
    {
        ThisPath = 0;
    }

    // if (Direction == 1)
    // {
    //     Progression = 0;
    // }
    // else //Direction == -1
    // {
    //     Progression = MarkerCounts[ThisPath];
    // }

    short nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);
    Pathfinder->Distance = CheckDistance;
    Pathfinder->TargetPath = ThisPath;
    Pathfinder->Progression = nearestMarker;
    Pathfinder->Direction = Direction;
    Pathfinder->PathType = 0;
    Pathfinder->NearestMarker = nearestMarker;
    Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
    Pathfinder->ProgressTimer = 0;
    // if (EndMarker - nearestMarker > 3)
    // {
    //      Pathfinder->SlowDown = false;
    // }
    // else
    // {
    //     Pathfinder->SlowDown = true;
    // }
}


//Update path for battle courses
void UpdateBKPath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID, char TypeOfPath, float HeightCheckSquared)
{
    float CheckDistance;
    short EndMarker; 
    short nearestMarker;
    float player_height = GlobalPlayer[PlayerID].position[1];
    #ifdef RunawayToggle
    Pathfinder->Distance = -99999999.0f; // Set an impossible value to ensure the first return is true.    
    #else
    Pathfinder->Distance = 99999999.0f; // Set an impossible value to ensure the first return is true. 
    #endif
    


    if (Pathfinder->TargetPath != -1)
    {
        Pathfinder->LastPath = Pathfinder->TargetPath; //Set the last path as we get ready to update.
    }
    Pathfinder->TargetPath = -1;     
    for (short ThisPath = 0; ThisPath < PathCount; ThisPath++)
    {
        EndMarker = MarkerCounts[ThisPath];
        if (pow(player_height - (float)PathArray[ThisPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
        {
            //Test first marker to see if in range.
            objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
            objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
            objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) // && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
            {
                CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
                                                    (float)PathArray[ThisPath][EndMarker].Position[2], Pathfinder->Target[2]);
                
                #ifdef RunawayToggle
                if (CheckDistance > Pathfinder->Distance)  //compare distance, if greater than the current update                
                #else
                if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
                #endif
                {
                    nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, 0);

                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    //Pathfinder->Progression = 0;
                    Pathfinder->Progression = nearestMarker;
                    Pathfinder->Direction = 1;
                    Pathfinder->PathType = TypeOfPath;
                    //Pathfinder->NearestMarker = 0;
                    Pathfinder->NearestMarker = nearestMarker;
                    //Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][0].Position[1];
                    Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
                    Pathfinder->ProgressTimer = 0;
                    // if (EndMarker - nearestMarker > 3)
                    // {
                    //      Pathfinder->SlowDown = false;
                    // }
                    // else
                    // {
                    //     Pathfinder->SlowDown = true;
                    // }
                }
            }
        }

        if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
        {
            //Test last marker to see if in range.
            objectPosition[0] = (float)PathArray[ThisPath][EndMarker].Position[0];
            objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
            objectPosition[2] = (float)PathArray[ThisPath][EndMarker].Position[2];

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
            {
                //First Marker has hit true, check distance of last marker
                CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][0].Position[0], Pathfinder->Target[0], 
                                                    (float)PathArray[ThisPath][0].Position[2], Pathfinder->Target[2]);
                #ifdef RunawayToggle
                if (CheckDistance > Pathfinder->Distance)  //compare distance, if greater than the current update                
                #else
                if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
                #endif
                {
                    nearestMarker = FindNearestMarker(GlobalPlayer[PlayerID].position, PathArray, MarkerCounts[ThisPath], ThisPath, EndMarker);

                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    //Pathfinder->Progression = EndMarker;
                    Pathfinder->Progression = nearestMarker;
                    Pathfinder->Direction = -1;
                    Pathfinder->PathType = TypeOfPath;
                    //Pathfinder->NearestMarker = EndMarker;
                    Pathfinder->NearestMarker = nearestMarker;
                    //Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][EndMarker].Position[1];
                    Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][nearestMarker].Position[1];
                    Pathfinder->ProgressTimer = 0;
                    // if (nearestMarker > 3)
                    // {
                    //      Pathfinder->SlowDown = false;
                    // }
                    // else
                    // {
                    //     Pathfinder->SlowDown = true;
                    // }
                }
            }
        }
    }


    //Default catch for no found paths
    if (Pathfinder->TargetPath == -1 && Pathfinder->LastPath != -1 && Pathfinder->LastPath < PathCount && Pathfinder->PathType == FLATPATH)
    {
        if (pow(player_height - (float)PathArray[Pathfinder->LastPath][0].Position[1], 2) < HeightCheckSquared) //If on same level
        {
            Pathfinder->TargetPath = Pathfinder->LastPath;
            Pathfinder->ProgressTimer = 0.0;
            if (Pathfinder->Direction == 1)
            {
                Pathfinder->Progression = MarkerCounts[Pathfinder->TargetPath];
                Pathfinder->Direction = -1;
                //Pathfinder->SlowDown = false;
            }
            else
            {
                Pathfinder->Progression = 0;
                Pathfinder->Direction = 1;
                //Pathfinder->SlowDown = false;
            }
        }
    }
}


    


void ResetLaneDefaultOffset(int playerID)
{
    switch (MakeRandomLimmit(3))
    {
    case 0:
        LaneData[playerID].lane_free_drive = -(g_RoadWidth[0] * 0.005f);
        break;
    case 1:
        LaneData[playerID].lane_free_drive = 0;
        break;
    case 2:
        LaneData[playerID].lane_free_drive = (g_RoadWidth[0] * 0.005f);
        break;        
    default:
        break;
    }
    LaneData[playerID].speed = 10.0f;
}

void ChooseAlternativePathRandm(int playerID, short pointCheckMin, short pointCheckMax, ushort maxPathIDs)
{
    if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
    {
        CurrentPathID[playerID] = MakeRandomLimmit(maxPathIDs);
        ResetLaneDefaultOffset(playerID);
    }
}

void ChangePathAndPoint(int playerID, short pointCheckMin, short pointCheckMax, ushort currentpathID, ushort newpathID)
{
    if (CurrentPathID[playerID] != currentpathID)
    {
        return;
    }
    
    if (g_playerPathPointTable[playerID] >= pointCheckMin && g_playerPathPointTable[playerID] <= pointCheckMax)
    {
        CurrentPathID[playerID] = newpathID;
        g_playerPathPointTable[playerID] = pointCheckMax;
        ResetLaneDefaultOffset(playerID);
    }
}


void MakeAlternativePath(Marker *altPath, short length, char pathID)
{

    CenterPathBP[(int)pathID] = (Marker*)altPath;
    g_courseTotalPathPoints[(int)pathID] = length;
    MaxPathPoints[(int)pathID] = length;

    for (int i = 0; i < length; i++)
    {
        CenterPathBP[(int)pathID][i].Position[0] *= g_mirrorValue;
        CenterPathBP[(int)pathID][i].Group = CenterPathBP[0][i].Group;
    }

    SideLPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
    SideRPathBP[(int)pathID] = (Marker *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(Marker)));
    CurvePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
    AnglePathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));
    ShortCutPathDataBP[(int)pathID] = (short *)AllocateMemory(MaxPathPoints[(int)pathID]*(sizeof(short)));

    SidePointCalcBP((int)pathID);
    CurveDataCalcBP((int)pathID);
    AngleDataCalcBP((int)pathID);
    ShortcutDataCalcBP((int)pathID);
}



void ProSteeringPlusPlus(int i, Marker* PathArray[], Marker* RampArray[], Marker* DropArray[])
{


    short TargetPath = AIPathfinder[i].TargetPath;
    short Progression = AIPathfinder[i].Progression; //(int)AIPathfinder[i].Progression;
    switch (AIPathfinder[i].PathType) //Get position of current marker to drive towards
    {
        case FLATPATH: //flat paths
            objectPosition[0] = (float)PathArray[TargetPath][Progression].Position[0];
            objectPosition[1] = (float)PathArray[TargetPath][Progression].Position[1];
            objectPosition[2] = (float)PathArray[TargetPath][Progression].Position[2]; 
            //PathGroup = PathArray[TargetPath][Progression].Group;
            break;
        case RAMPPATH: //ramps
            objectPosition[0] = (float)RampArray[TargetPath][Progression].Position[0];
            objectPosition[1] = (float)RampArray[TargetPath][Progression].Position[1];
            objectPosition[2] = (float)RampArray[TargetPath][Progression].Position[2]; 
            //PathGroup = RampArray[TargetPath][Progression].Group;
            break;
        case DROPPATH: //drops 
            objectPosition[0] = (float)DropArray[TargetPath][Progression].Position[0];
            objectPosition[1] = (float)DropArray[TargetPath][Progression].Position[1];
            objectPosition[2] = (float)DropArray[TargetPath][Progression].Position[2]; 
            //PathGroup = DropArray[TargetPath][Progression].Group;
            break;
    }


    GlobalShortA = (short)(MakeDirection(GlobalPlayer[i].position[0],GlobalPlayer[i].position[2], objectPosition[0], objectPosition[2]) * -1);
    GlobalShortA -= GlobalPlayer[i].direction[1];
    GlobalUInt64 = GlobalShortA * GlobalShortA;

    BotButtons[i] = BTN_A;
    BotPressed[i] = 0;
    GlobalPlayer[i].acc_maxcount = AIPathfinder[i].MaxSpeed; //Default top speed
   
    
    if ((GlobalUInt64 > STOPTURN)) //| (PathGroup < 0) | (AIPathfinder[i].SlowDown))
    {   
        GlobalPlayer[i].acc_maxcount = 0.5 * AIPathfinder[i].MaxSpeed; //Slow the bot way down hwen encountering a rival or item box 
        BotButtons[i] |= BTN_B;  //continue braking
        if (GlobalShortA > 0)
        {   
            if ((GlobalController[i]->AnalogX > 0) || (GlobalController[i]->AnalogX < 0))
            {
                BotButtons[i] |= BTN_R;  //continue drifting, otherwise stop.    
            }

            GlobalController[i]->AnalogX = 127;  
        }
        else
        {
            if ((GlobalController[i]->AnalogX > 0) || (GlobalController[i]->AnalogX < 0))
            {
                BotButtons[i] |= BTN_R;  //continue drifting, otherwise stop.    
            }

            GlobalController[i]->AnalogX = -127;  
        }
    }                        
    else if ((GlobalUInt64 > DRIFTTURN) )
    {
        GlobalPlayer[i].acc_maxcount = 0.8 * AIPathfinder[i].MaxSpeed; //Slow the bot way down when encountering a rival or item box 
        BotPressed[i] = BTN_R | BTN_B;   //tap brake and jump
        BotButtons[i] |= BTN_B;

        if (GlobalShortA > 0)
        {   
            GlobalController[i]->AnalogX = 75;
        }
        else
        {
            GlobalController[i]->AnalogX = -75;
        }
    }
    else if (GlobalUInt64 > WIDETURN)
    {
        BotButtons[i] |= BTN_B; //Slow down bot for testing path finding
        if (GlobalShortA > 0)
        {   
            GlobalController[i]->AnalogX = 70;
        }
        else
        {
            GlobalController[i]->AnalogX = -70;
        }
    }
    else if (GlobalUInt64 > MIDTURN)
    {
        if (GlobalShortA > 0)
        {   
            GlobalController[i]->AnalogX = 55;
        }
        else
        {
            GlobalController[i]->AnalogX = -55;
        }
    }
    else if (GlobalUInt64 > SHORTTURN)
    {
        if (GlobalShortA > 0)
        {   
            GlobalController[i]->AnalogX = 45;
        }
        else
        {
            GlobalController[i]->AnalogX = -45;
        }
    }
    else if (GlobalUInt64 > NOTURN)
    {
        if (GlobalShortA > 0)
        {   
            GlobalController[i]->AnalogX = 29;
        }
        else
        {
            GlobalController[i]->AnalogX = -29;
        }
    }
    else
    {

        GlobalController[i]->AnalogX = 0x00;

    }
    

}



void StandardBattleBotBot(int i, int TargetPlayer)
{
    switch( ObjectSubBehaviorTurnTarget(GlobalPlayer[i].position, GlobalPlayer[i].direction[1], AIPathfinder[i].Target, 0x7) ) //Returns -1 or 1, to give direction to turn
    {
        case 0:    
        {          
            if (TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 40, GlobalPlayer[i].position, 40) && !TestCollideSphere(GlobalPlayer[(int)AIPathfinder[i].RivalPlayer].position, 20, GlobalPlayer[i].position, 20))
            {

                BotPressed[i] = BTN_Z;
                BotButtons[i] = BTN_A + BTN_Z;
            }  
            else
            {  
                //Else just drive straight
                BotPressed[i] = 0;
                BotButtons[i] = BTN_A;
            }

            BotAnalog[i] = 0x00;

            break;
        }
        case 1:
        case -1:
        default:
        {
            BotButtons[i] = BTN_A + BTN_B + BTN_R;
            BotAnalog[i] = 0x50;

            break;
        }
    }

}

void OKBattleBot(int BotIndex, Vector TargetPosition, OKAIHeader *AIHeader)
{
    

    Marker** CoursePaths = (Marker**)(GetRealAddress(AIHeader->CoursePaths));
    Marker** CourseDrops = (Marker**)(GetRealAddress(AIHeader->CourseDrops));
    Marker** CourseRamps = (Marker**)(GetRealAddress(AIHeader->CourseRamps));

    short* PathLengths = (short*)(GetRealAddress(AIHeader->PathLengths));
    short* DropLengths = (short*)(GetRealAddress(AIHeader->DropLengths));
    short* RampLengths = (short*)(GetRealAddress(AIHeader->RampLengths));

    float bot_x = GlobalPlayer[BotIndex].position[0]; //x,y,z coordinates of current bot
    float bot_y = GlobalPlayer[BotIndex].position[1];
    float bot_z = GlobalPlayer[BotIndex].position[2];

    float rival_x = AIPathfinder[BotIndex].Target[0]; //x,y,z coordinates of current bot
    float rival_y = AIPathfinder[BotIndex].Target[1];
    float rival_z = AIPathfinder[BotIndex].Target[2];



    //Check for Item Boxes
    /*
    else if ((checkItems(i) == 0) && !(GlobalPlayer[i].slip_flag & STAR) && !isPlayerHoldingFlag(i) && (game_mode != 6))// || hitting_wall)
    {

        if ((nearest_item_box[i][0] == 0.0))
        {
            //float item_box_position[3] = {0.0, 0.0, 0.0};
            if (FindNearestItemBox(GlobalPlayer[i].position, nearest_item_box[i], 225.0f, ci) != -1) //If an item box is found on the same level, target that, as long as bot is not hitting wall
            {
                rival_x = nearest_item_box[i][0]; //x,y,z coords of rival
                rival_y = nearest_item_box[i][1];
                rival_z = nearest_item_box[i][2];   
                bot_rival_p1[i] = getRival(i); //Grab a new rival
                bot_timer_p1[i] = MakeRandomLimmit(1200) +  3000; //Reset bot timer 50-70 seconds. (600 = 10 seconds)
            }
            else //else target rival
            {
                rival_x = GlobalPlayer[bot_rival_p1[i]].position[0]; //x,y,z coords of rival
                rival_y = GlobalPlayer[bot_rival_p1[i]].position[1];
                rival_z = GlobalPlayer[bot_rival_p1[i]].position[2];    
            }            
        }
        else
        {
            rival_x = nearest_item_box[i][0]; //x,y,z coords of rival
            rival_y = nearest_item_box[i][1];
            rival_z = nearest_item_box[i][2];   
        }dropNodePosition


    }
    */


    //Initialize the path finding if course is just starting
    

    //In this section we want to initialize the bots and assign them the first path.
    //This needs to check for paths/ramps/drops all together since they made start off on a platform.

    if (AIPathfinder[BotIndex].Status != 35)
    {
        //First set up BKPathfinder for bot to follow rival
        AIPathfinder[BotIndex].Status = 35;
        
        UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 300, CoursePaths, PathLengths, (short)(AIHeader->TotalPaths), BotIndex, 0, 225.0f);       


        //fallback for maps with no paths.
        if (AIPathfinder[BotIndex].TargetPath == -1)
        {
            // int random_drop = MakeRandomLimmit(LineCounts[ci][2])
            float dropNodePosition[] = {0.,0.,0.};
            int drop_path_index = FindNearestDropNode(GlobalPlayer[BotIndex].position, dropNodePosition, rival_y, CourseDrops, DropLengths, (short)(AIHeader->TotalDrops), 225.0f);
            if (drop_path_index != -1) //crash catch
            {
                AIPathfinder[BotIndex].LastPath = 0;
                AIPathfinder[BotIndex].TargetPath = drop_path_index;
                AIPathfinder[BotIndex].Progression = 0;
                AIPathfinder[BotIndex].Direction = 1;
                AIPathfinder[BotIndex].PathType = 2;
                AIPathfinder[BotIndex].NearestMarker = 0;
                AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
                AIPathfinder[BotIndex].ProgressTimer = 0;                
            }

        }

    }


    ///
    ///TURNING - STEERING
    ///


    

    //Find Nearest Marker
    
    float CheckMarkerDistance = 99999999;
    short TargetPath = AIPathfinder[BotIndex].TargetPath;


    //Check if Bot has fallen. Compare current height to marker height.
    if ((TargetPath != -1)  &&  (AIPathfinder[BotIndex].PathType == FLATPATH))
    { 
        if (AIPathfinder[BotIndex].NearestMarkerHeight - bot_y > 225.0f)
        {
            //AI has fallen, reset paths.
            AIPathfinder[BotIndex].TargetPath = -1;  
            TargetPath = -1;
        }
    }


    //Assign the nearest marker.
    //This section looks at the current path and sees which marker is physically closest
    //It checks all markers and does XZ comparisons, ignoring height. 
    if (TargetPath != -1)
    {
        switch(AIPathfinder[BotIndex].PathType)
        {

            
            case FLATPATH:  //If bot is following a flat path
            {   
                for (int ThisMarker = 0; ThisMarker <= PathLengths[TargetPath]; ThisMarker++)
                {
                    if (pow(GlobalPlayer[BotIndex].position[1] - (float)CoursePaths[TargetPath][ThisMarker].Position[1], 2) < 225.0f) //If height is not too far off
                    {   
                        GlobalFloatA =  pow(GlobalPlayer[BotIndex].position[0] - (float)CoursePaths[TargetPath][ThisMarker].Position[0], 2) + 
                                        pow(GlobalPlayer[BotIndex].position[2] - (float)CoursePaths[TargetPath][ThisMarker].Position[2], 2)   ;
                        if (GlobalFloatA < CheckMarkerDistance)
                        {
                            CheckMarkerDistance = GlobalFloatA;
                            AIPathfinder[BotIndex].NearestMarker = ThisMarker;
                            AIPathfinder[BotIndex].NearestMarkerHeight = (float)CoursePaths[TargetPath][ThisMarker].Position[1];
                        }
                    }
                }          
                
                break;
            }
            case RAMPPATH:  //If bot is following a ramp path
            {
                for (int ThisMarker = 0; ThisMarker <= RampLengths[TargetPath]; ThisMarker++)
                {
                    if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseRamps[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
                    {   
                        GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseRamps[TargetPath][ThisMarker].Position[0], 2) + 
                                        pow(GlobalPlayer[BotIndex].position[2] - (float)CourseRamps[TargetPath][ThisMarker].Position[2], 2)   ;
                        if (GlobalFloatA < CheckMarkerDistance)
                        {
                            CheckMarkerDistance = GlobalFloatA;
                            AIPathfinder[BotIndex].NearestMarker = ThisMarker;
                            AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[TargetPath][ThisMarker].Position[1];
                        }
                    }
                }
                                
                break;
            }
            case DROPPATH:  //If bot is following a drop path
            {
            
                for (int ThisMarker = 0; ThisMarker <= DropLengths[TargetPath]; ThisMarker++)
                {
                    if (pow(GlobalPlayer[BotIndex].position[1] - (float)CourseDrops[TargetPath][ThisMarker].Position[1], 2) < 450.0f)
                    {   
                        GlobalFloatA = pow(GlobalPlayer[BotIndex].position[0] - (float)CourseDrops[TargetPath][ThisMarker].Position[0], 2) + 
                                        pow(GlobalPlayer[BotIndex].position[2] - (float)CourseDrops[TargetPath][ThisMarker].Position[2], 2);
                        if (GlobalFloatA < CheckMarkerDistance)
                        {
                            CheckMarkerDistance = GlobalFloatA;
                            AIPathfinder[BotIndex].NearestMarker = ThisMarker;
                            AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[TargetPath][ThisMarker].Position[1];
                        }
                    }
                }
                break;
            }
        }
    }



    //Navigate towards the target position.
    //This checks if a valid path is currently active and if so
    //checks that the AI has gotten to the next marker.
    //It will then increase the "Progression" value to move the AI along the path.
    //Progression != NearestMarker, this is important for other functions.

    if (TargetPath != -1) //If bot has a valid path
    {
        short Progression = AIPathfinder[BotIndex].Progression;
        switch (AIPathfinder[BotIndex].PathType) //Get position of current marker to drive towards
        {

            case FLATPATH: //flat paths
                objectPosition[0] = (float)CoursePaths[TargetPath][Progression].Position[0];
                objectPosition[1] = (float)CoursePaths[TargetPath][Progression].Position[1];
                objectPosition[2] = (float)CoursePaths[TargetPath][Progression].Position[2]; 
                GlobalIntA = PathLengths[TargetPath];
                break;
            case RAMPPATH: //ramps
                objectPosition[0] = (float)CourseRamps[TargetPath][Progression].Position[0];
                objectPosition[1] = (float)CourseRamps[TargetPath][Progression].Position[1];
                objectPosition[2] = (float)CourseRamps[TargetPath][Progression].Position[2]; 
                GlobalIntA = RampLengths[TargetPath];
                break;
            case DROPPATH: //drops 
                objectPosition[0] = (float)CourseDrops[TargetPath][Progression].Position[0];
                objectPosition[1] = (float)CourseDrops[TargetPath][Progression].Position[1];
                objectPosition[2] = (float)CourseDrops[TargetPath][Progression].Position[2]; 
                GlobalIntA = DropLengths[TargetPath];
                break;
        }



        //Progression-Check Radius
        if (Progression <= 0 || Progression >= GlobalIntA) //If first or last node (start/end of path)
        {
            GlobalFloatA = 5000.0;  
        }
        else //If an inbetween node (driving the path)
        {
            GlobalFloatA = 3500.0;  
        }

        
        //if the AI has gotten close enough to the marker,
        //move the progression to the next value. Drive along path.
        if (pow(bot_x-objectPosition[0], 2) + pow(bot_y-objectPosition[1], 2) + pow(bot_z-objectPosition[2], 2) < GlobalFloatA) //If near the next path marker, advance to the next path marker        
        {
            AIPathfinder[BotIndex].Progression += AIPathfinder[BotIndex].Direction;
            AIPathfinder[BotIndex].ProgressTimer = 0;
        }
        else
        {
            AIPathfinder[BotIndex].ProgressTimer++;
        }

        //safety sanity check for marker values that are out-of-bounds
        if (AIPathfinder[BotIndex].Progression > GlobalIntA)
        {
            AIPathfinder[BotIndex].Progression = GlobalIntA;
        }
        else if (AIPathfinder[BotIndex].Progression < 0)
        {
            AIPathfinder[BotIndex].Progression = 0;
        }

        //Now check if the nearest marker is further in the list than the Progression Value.

        //If the nearest marker is further along than progression, set progression. 
        if (AIPathfinder[BotIndex].Direction > 0)
        {
            if (AIPathfinder[BotIndex].NearestMarker > AIPathfinder[BotIndex].Progression)
            {
                AIPathfinder[BotIndex].Progression = AIPathfinder[BotIndex].NearestMarker;
            }
        }
        else
        {
            if (AIPathfinder[BotIndex].NearestMarker < AIPathfinder[BotIndex].Progression)
            {
                AIPathfinder[BotIndex].Progression = AIPathfinder[BotIndex].NearestMarker;
            }
        }
    }
    else //else if bot has an invalid path
    {
        for (int j=0; j<3; j++) //Clear nearest item box so bot doesn't get stuck trying to go for an item box not on their level
        {
            //nearest_item_box[i][j] = 0.0;
        }
    }
    



    
    //Check height difference to determine if a ramp or drop is needed.
    //Check if the path has ended, if so find the next best path.

    float diff_y = rival_y - bot_y;
    
    switch (AIPathfinder[BotIndex].PathType)
    {
        case FLATPATH:  //If bot is following a flat path
            if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
            {     
                if ((diff_y >= 225.0f) && ((AIHeader->TotalRamps) > 0)) //If target is above bot and ramps exist, look for ramps
                {
                    float nodePosition[] = {0.,0.,0.};
                    int ramp_path_index;
                    //First find nearest ramp
                    ramp_path_index = FindNearestRampNode(GlobalPlayer[BotIndex].position, nodePosition, rival_y, CourseRamps, RampLengths, (AIHeader->TotalRamps), 225.0f);
                    //float diff_x = bot_x - nodePosition[0];
                    //float diff_z = bot_z - nodePosition[2];

                    if (ramp_path_index == -1) //If no path is found in the middle of a fall
                    {
                        return; //end function here to avoid errors
                    }
                    //if (diff_x*diff_x + diff_z*diff_z < RAMPDISTANCESQUARE) //If bot is at ramp, use ramp
                    if (PythagoreanTheorem(bot_x, nodePosition[0], bot_z, nodePosition[2]) < RAMPDISTANCESQUARE) //If bot is at ramp, use ramp
                    {
                        AIPathfinder[BotIndex].Target[0] = rival_x;
                        AIPathfinder[BotIndex].Target[1] = rival_y;
                        AIPathfinder[BotIndex].Target[2] = rival_z;
                        //UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 300.0, BlockFortPaths_Ramps, BlockFortPaths_RampLengths, 12, i, 1);
                        AIPathfinder[BotIndex].LastPath = TargetPath;
                        AIPathfinder[BotIndex].TargetPath = ramp_path_index;
                        AIPathfinder[BotIndex].Progression = 0;
                        AIPathfinder[BotIndex].Direction = 1;
                        AIPathfinder[BotIndex].PathType = 1;
                        AIPathfinder[BotIndex].NearestMarker = 0;
                        AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][0].Position[1];
                        AIPathfinder[BotIndex].ProgressTimer = 0;
                    }
                    else{// Else find path to nearest ramp
                        AIPathfinder[BotIndex].Target[0] = nodePosition[0];
                        AIPathfinder[BotIndex].Target[1] = nodePosition[1];
                        AIPathfinder[BotIndex].Target[2] = nodePosition[2];
                        UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                            
                    }
                    
                }
                else if ( (diff_y <= -225.0f) && ((AIHeader->TotalRamps) > 0 || ((AIHeader->TotalDrops) > 0)) ) //If target is below bot and ramps or drops exist, look for ramps and drops
                {
                    //FOR NOW JUST USE RAMPS, LATER WILL ADD RAMPS AND DROPS
                    float rampNodePosition[] = {0.,0.,0.};
                    float dropNodePosition[] = {0.,0.,0.};
                    //First find nearest ramp and drop
                    int ramp_path_index = FindNearestRampNode(GlobalPlayer[BotIndex].position, rampNodePosition, rival_y, CourseRamps, RampLengths, (AIHeader->TotalRamps), 225.0f);
                    int drop_path_index = FindNearestDropNode(GlobalPlayer[BotIndex].position, dropNodePosition, rival_y, CourseDrops, DropLengths, (AIHeader->TotalRamps), 225.0f);
                    
                    
                    float dist_to_nearest_ramp = PythagoreanTheorem(GlobalPlayer[BotIndex].position[0], rampNodePosition[0], GlobalPlayer[BotIndex].position[2], rampNodePosition[2]);
                    float dist_to_nearest_drop = PythagoreanTheorem(GlobalPlayer[BotIndex].position[0], dropNodePosition[0], GlobalPlayer[BotIndex].position[2], dropNodePosition[2]);
                    if (dist_to_nearest_ramp < dist_to_nearest_drop || drop_path_index == -1) //If a ramp is closer than a drop, use the ramp
                    {
                        if (dist_to_nearest_ramp < RAMPDISTANCESQUARE) //If bot is at ramp, use ramp
                        {
                            AIPathfinder[BotIndex].Target[0] = rival_x;
                            AIPathfinder[BotIndex].Target[1] = rival_y;
                            AIPathfinder[BotIndex].Target[2] = rival_z;
                            // UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 300.0, BlockFortPaths_Ramps, BlockFortPaths_RampLengths, 12, i, 1);
                            AIPathfinder[BotIndex].LastPath = TargetPath;
                            AIPathfinder[BotIndex].TargetPath = ramp_path_index;
                            AIPathfinder[BotIndex].Progression = RampLengths[ramp_path_index];
                            AIPathfinder[BotIndex].Direction = -1;
                            AIPathfinder[BotIndex].PathType = 1;
                            AIPathfinder[BotIndex].NearestMarker = RampLengths[ramp_path_index];
                            AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseRamps[ramp_path_index][RampLengths[ramp_path_index]].Position[1];
                            AIPathfinder[BotIndex].ProgressTimer = 0;
                        }
                        else{// Else find path to nearest ramp
                            AIPathfinder[BotIndex].Target[0] = rampNodePosition[0];
                            AIPathfinder[BotIndex].Target[1] = rampNodePosition[1];
                            AIPathfinder[BotIndex].Target[2] = rampNodePosition[2];
                            UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                            
                        }
                    }
                    else //else if a drop is closer than a ramp, use the drop
                    {
                        if (dist_to_nearest_drop < RAMPDISTANCESQUARE) //If bot is at drop, use drop
                        {
                            AIPathfinder[BotIndex].Target[0] = rival_x;
                            AIPathfinder[BotIndex].Target[1] = rival_y;
                            AIPathfinder[BotIndex].Target[2] = rival_z;
                            // UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 300.0, BlockFortPaths_Ramps, BlockFortPaths_RampLengths, 12, i, 1);
                            AIPathfinder[BotIndex].LastPath = TargetPath;
                            AIPathfinder[BotIndex].TargetPath = drop_path_index;
                            AIPathfinder[BotIndex].Progression = 0;
                            AIPathfinder[BotIndex].Direction = 1;
                            AIPathfinder[BotIndex].PathType = 2;
                            AIPathfinder[BotIndex].NearestMarker = 0;
                            AIPathfinder[BotIndex].NearestMarkerHeight = (float)CourseDrops[drop_path_index][0].Position[1];
                            AIPathfinder[BotIndex].ProgressTimer = 0;
                        }
                        else{// Else find path to nearest drop
                            AIPathfinder[BotIndex].Target[0] = dropNodePosition[0];
                            AIPathfinder[BotIndex].Target[1] = dropNodePosition[1];
                            AIPathfinder[BotIndex].Target[2] = dropNodePosition[2];
                            UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                            
                        }
                    }


                }
                else //Else target is on same plane (or course is flat) so just use regular paths
                {
                    AIPathfinder[BotIndex].Target[0] = rival_x;
                    AIPathfinder[BotIndex].Target[1] = rival_y;
                    AIPathfinder[BotIndex].Target[2] = rival_z;
                    UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);
                }
            }
            break;
        case RAMPPATH: //If bot is following a ramp
            if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
            {
                AIPathfinder[BotIndex].Target[0] = rival_x; //Done with the ramp so go back to a flat path
                AIPathfinder[BotIndex].Target[1] = rival_y;
                AIPathfinder[BotIndex].Target[2] = rival_z;
                UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                   
            }
            break;
        case DROPPATH: //If bot is following a drop
            if ( PathfinderComplete((BKPathfinder*)&AIPathfinder[BotIndex], PathLengths, RampLengths, DropLengths) )
            {
                AIPathfinder[BotIndex].Target[0] = rival_x; //Done with the ramp so go back to a flat path
                AIPathfinder[BotIndex].Target[1] = rival_y;
                AIPathfinder[BotIndex].Target[2] = rival_z;
                UpdateBKPath((BKPathfinder*)(&AIPathfinder[BotIndex]), 225.0f, CoursePaths, PathLengths, (AIHeader->TotalPaths), BotIndex, 0, 225.0f);                                   
            }
            break;
    }




    if (AIPathfinder[BotIndex].TargetPath == -1)//If no path is found, just move around as standard bot for a little bit until a path can be reacquired
    {
        //nearest_item_box[BotIndex][0] = 0.0; //Reset nearest item box
        //nearest_item_box[BotIndex][1] = 0.0;
        //nearest_item_box[BotIndex][2] = 0.0;
        return StandardBattleBotBot(BotIndex, (int)AIPathfinder[BotIndex].RivalPlayer);
    }


    if (TestCollideSphere(AIPathfinder[BotIndex].Target, 100.0f, GlobalPlayer[BotIndex].position, 100.0f) && (pow(bot_y-rival_y, 2) < 225.0f*0.25f))
    {   
        //nearest_item_box[BotIndex][0] = 0.0; //Reset nearest item box
        //nearest_item_box[BotIndex][1] = 0.0;
        //nearest_item_box[BotIndex][2] = 0.0;


        GlobalPlayer[BotIndex].acc_maxcount = 0.75 * AIPathfinder[BotIndex].MaxSpeed; //Slow the bot down when encountering a rival or item box 
        
        return StandardBattleBotBot(BotIndex, (int)AIPathfinder[BotIndex].RivalPlayer);
    }
    

    

    ProSteeringPlusPlus(BotIndex, CoursePaths, CourseRamps, CourseDrops);

    
    AIPathfinder[BotIndex].ShootingTimer -= 1;
    if (AIPathfinder[BotIndex].ShootingTimer <= 0)
    {
        BotPressed[BotIndex] = BTN_Z;
        BotButtons[BotIndex] = BTN_A + BTN_Z;
        AIPathfinder[BotIndex].ShootingTimer = (250 + MakeRandomLimmit(500));
    }
        

}



