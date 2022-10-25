#include "../MainInclude.h"




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
                (Pathfinder->ProgressTimer >= 60)
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
                (Pathfinder->ProgressTimer >= 60)
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
                (Pathfinder->ProgressTimer >= 60)
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

int FindNearestRampNode(float CurrentPosition[], float FoundNodePosition[], float TargetY, Marker* PathArray[], short* MarkerCounts, short PathCount)
{
    float Distance = 9999999.0;
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
        if (pow(CurrentPosition[1] - path_height_start_node, 2) < 225)
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
        if (pow(CurrentPosition[1] - path_height_end_node, 2) < 225)
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


int FindNearestItemBox(float CurrentPosition[], float FoundItemBoxPosition[])
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
        if (pow(player_y - item_box_position_y, 2) < 225.0) //Height check
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


int FindNearestDropNode(float CurrentPosition[], float FoundNodePosition[], float TargetY, Marker* PathArray[], short* MarkerCounts, short PathCount)
{
    float Distance = 9999999.0;
    float CheckDistance;
    short use_this_path=-1;
    //short use_this_marker=0;
    
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
    {

        //Check beginning of path, which is the start of the drop
        if (pow(CurrentPosition[1]-(float)PathArray[ThisPath][0].Position[1], 2) < 225)
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



void UpdateBKPath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID, char TypeOfPath)
{
    float CheckDistance;
    short EndMarker; 
    Pathfinder->Distance = 9999999.0; // Set an impossible value to ensure the first return is true. 
    if (Pathfinder->TargetPath != -1)
    {
        Pathfinder->LastPath = Pathfinder->TargetPath; //Set the last path as we get ready to update.
    }
    Pathfinder->TargetPath = -1;     
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++)
    {
        EndMarker = MarkerCounts[ThisPath];
        if (pow(GlobalPlayer[PlayerID].position[1] - (float)PathArray[ThisPath][0].Position[1], 2) < 400) //If on same level
        {
            //Test first marker to see if in range.
            objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
            objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
            objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) //&& (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
            {
                CheckDistance = PythagoreanTheorem((float)PathArray[ThisPath][EndMarker].Position[0], Pathfinder->Target[0], 
                                                    (float)PathArray[ThisPath][EndMarker].Position[2], Pathfinder->Target[2]);
                if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
                {
                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    Pathfinder->Progression = 0;
                    Pathfinder->Direction = 1;
                    Pathfinder->PathType = TypeOfPath;
                    Pathfinder->NearestMarker = 0;
                    Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][0].Position[1];
                    Pathfinder->ProgressTimer = 0;
                }
            }
        }

        if (pow(GlobalPlayer[PlayerID].position[1] - (float)PathArray[ThisPath][EndMarker].Position[1], 2) < 225) //If on same level
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
                if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
                {
                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    Pathfinder->Progression = MarkerCounts[ThisPath];
                    Pathfinder->Direction = -1;
                    Pathfinder->PathType = TypeOfPath;
                    Pathfinder->NearestMarker = MarkerCounts[ThisPath];
                    Pathfinder->NearestMarkerHeight = (float)PathArray[ThisPath][MarkerCounts[ThisPath]].Position[1];
                    Pathfinder->ProgressTimer = 0;
                }
            }
        }
    }


    if (Pathfinder->TargetPath == -1)
    {
        //Default catch for no found paths
        Pathfinder->TargetPath = Pathfinder->LastPath;
        if (Pathfinder->Direction == 1)
        {
            Pathfinder->Progression = 0;
        }
        else
        {
            Pathfinder->Progression = MarkerCounts[Pathfinder->TargetPath];
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
