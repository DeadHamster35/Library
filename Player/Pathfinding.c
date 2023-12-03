#include "../MainInclude.h"


//#define RunawayToggle 1

BKPathfinder AIPathfinder[4];

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
    float Distance = 9999999999.0;
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




int FindNearestItemBox(float CurrentPosition[], float FoundItemBoxPosition[], float HeightCheckSquared)
{   
    //Find the nearest item box
    float player_x = CurrentPosition[0];
    float player_y = CurrentPosition[1];
    float player_z = CurrentPosition[2];
    float distance = 9999999999.0;
    float CheckDistance;
    int found_item_box = -1;


    for (int ThisItemBox = 0; ThisItemBox < ItemBoxCount; ThisItemBox++)
    {
        short i = ItemBoxIndex[ThisItemBox];
        float item_box_position_y = g_SimpleObjectArray[i].position[1];
        float diff_y = item_box_position_y - player_y;
        if (pow(diff_y, 2) < HeightCheckSquared && diff_y >= 0.0) //Height check
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
    float Distance = 9999999999.0;
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
    float Distance = -9999999999.0;
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
    float Distance = 9999999999.0;
    float CheckDistance;
    short use_this_marker = defaultMarker;
    for (int ThisMarker = 0; ThisMarker < Markercount; ThisMarker++) 
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

void UpdateBKPath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID, char TypeOfPath, float HeightCheckSquared)
{
    float CheckDistance;
    short EndMarker; 
    short nearestMarker;
    float player_height = GlobalPlayer[PlayerID].position[1];
    #ifdef RunawayToggle
    Pathfinder->Distance = -9999999999.0f; // Set an impossible value to ensure the first return is true.    
    #else
    Pathfinder->Distance = 9999999999.0f; // Set an impossible value to ensure the first return is true. 
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

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) //&& (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
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
                    if (EndMarker - nearestMarker > 3)
                    {
                         Pathfinder->SlowDown = false;
                    }
                    else
                    {
                        Pathfinder->SlowDown = true;
                    }
                }
            }
        }

        if (pow(player_height - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < HeightCheckSquared) //If on same level
        {
            //Test last marker to see if in range.
            objectPosition[0] = (float)PathArray[ThisPath][EndMarker].Position[0];
            objectPosition[1] = (float)PathArray[ThisPath][EndMarker].Position[1];
            objectPosition[2] = (float)PathArray[ThisPath][EndMarker].Position[2];

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5) && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
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
                    if (nearestMarker > 3)
                    {
                         Pathfinder->SlowDown = false;
                    }
                    else
                    {
                        Pathfinder->SlowDown = true;
                    }
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
                Pathfinder->SlowDown = false;
            }
            else
            {
                Pathfinder->Progression = 0;
                Pathfinder->Direction = 1;
                Pathfinder->SlowDown = false;
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
