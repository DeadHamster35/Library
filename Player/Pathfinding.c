#include "../MainInclude.h"




BKPathfinder AIPathfinder[4];




//Before running the function below, ensure that you've set the `Target` value 
//of the BKPathfinder to the float-position of the position you wish to drive towards. 

void FindNearestPathNode(float CurrentPosition[], float TargetPosition[], Marker* PathArray[], short* MarkerCounts, short PathCount)
{
    float Distance = 9999999.0;
    float CheckDistance;
    float height_check;
    short use_this_path= 0;
    short use_this_marker=0;
    float diff_x, diff_z;
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
    {
        //Check beginning of path
        height_check = CurrentPosition[1] - (float)PathArray[ThisPath][0].Position[1];
        if (height_check*height_check < 400) //If on same level
        {
            diff_x = CurrentPosition[0] - (float)PathArray[ThisPath][0].Position[0];
            diff_z = CurrentPosition[2] - (float)PathArray[ThisPath][0].Position[2];
            CheckDistance = diff_x*diff_x + diff_z*diff_z;
            if (CheckDistance < Distance)
            {
                Distance = CheckDistance;
                use_this_path = ThisPath;
                use_this_marker = 0;
            }
        }
        //Check end of path
        height_check = CurrentPosition[1] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1];
        if (height_check*height_check < 400) //If on same level
        {
            diff_x = CurrentPosition[0] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[0];
            diff_z = CurrentPosition[2] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[2];
            CheckDistance = diff_x*diff_x + diff_z*diff_z;
            if (CheckDistance < Distance)
            {
                Distance = CheckDistance;
                use_this_path = ThisPath;
                use_this_marker = MarkerCounts[ThisPath]-1;
            }
        }
    }   
    //Vector that will be returned
    TargetPosition[0] = (float)PathArray[use_this_path][use_this_marker].Position[0]; 
    TargetPosition[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
    TargetPosition[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
}



void UpdateBKPath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID, char TypeOfPath)
{
     //float CheckHeightStart; 
     //float CheckHeightEnd;
     float CheckDistance;
     //float diff_x, diff_y, diff_z;
     float diff_x, diff_z;
     float height_check;
     Pathfinder->Distance = 9999999.0; // Set an impossible value to ensure the first return is true. 

     Pathfinder->LastPath = Pathfinder->TargetPath; //Set the last path as we get ready to update.
     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++)
     {
        height_check = GlobalPlayer[PlayerID].position[1] - (float)PathArray[ThisPath][0].Position[1];
        if (height_check*height_check < 400) //If on same level
        {
            //Test first marker to see if in range.
            objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
            objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
            objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5)) //&& (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
            {
                //First Marker has hit true, check distance of last marker
                diff_x = ((float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[0] - Pathfinder->Target[0]);
                //diff_y = ((float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1] - Pathfinder->Target[1]);
                diff_z = ((float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[2] - Pathfinder->Target[2]);
                //CheckDistance = diff_x*diff_x + diff_y*diff_y + diff_z*diff_z;  //(A^2 + B^2 + C^2) = d
                CheckDistance = diff_x*diff_x + diff_z*diff_z;


                if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
                {
                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    // Pathfinder->Progression = MarkerCounts[ThisPath]-1;
                    // Pathfinder->Direction = -1;
                    Pathfinder->Progression = 0;
                    Pathfinder->Direction = 1;
                    Pathfinder->PathType = TypeOfPath;
                }
            }
        }

        height_check =  GlobalPlayer[PlayerID].position[1] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1];
        if (height_check*height_check < 400) //If on same level
        {
            //Test last marker to see if in range.
            objectPosition[0] = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[0];
            objectPosition[1] = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1];
            objectPosition[2] = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[2];

            if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5))// && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
            {
               //First Marker has hit true, check distance of last marker
               diff_x = ((float)PathArray[ThisPath][0].Position[0] - Pathfinder->Target[0]);
               //diff_y = ((float)PathArray[ThisPath][0].Position[1] - Pathfinder->Target[1]);
               diff_z = ((float)PathArray[ThisPath][0].Position[2] - Pathfinder->Target[2]);
               //CheckDistance = diff_x*diff_x + diff_y*diff_y+ diff_z*diff_z;  //(A^2 + B^2 + C^2) = d
               CheckDistance = diff_x*diff_x + diff_z*diff_z;  //(A^2 + B^2 + C^2) = d

               if (CheckDistance < Pathfinder->Distance)  //compare distance, if less than the current update
               {
                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    // Pathfinder->Progression = 0;
                    // Pathfinder->Direction = 1;
                    Pathfinder->Progression = MarkerCounts[ThisPath]-1;
                    Pathfinder->Direction = -1;
                    Pathfinder->PathType = TypeOfPath;
               }
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

Vector* FindNearestPathNode(Vector CurrentPosition, Marker *PathArray[], short* MarkerCounts, short PathCount)
{
    Vector ReturnValue;
    float Distance = 9999999.0;
    float CheckDistance;
    float height_check;
    short use_this_path;
    short use_this_marker;
    float diff_x, diff_z;
    for (int ThisPath = 0; ThisPath < PathCount; ThisPath++) //Loop through each possible path and check the beginning and ending nodes and save the closest one to CurrentPosition
    {
        //Check beginning of path
        height_check = CurrentPosition[1] - (float)PathArray[ThisPath][0].Position[1];
        if (height_check*height_check < 400) //If on same level
        {
            diff_x = CurrentPosition[0] - (float)PathArray[ThisPath][0].Position[0];
            diff_z = CurrentPosition[2] - (float)PathArray[ThisPath][0].Position[2];
            CheckDistance = diff_x*diff_x + diff_z*diff_z;
            if (CheckDistance < Distance)
            {
                Distance = CheckDistance;
                use_this_path = ThisPath;
                use_this_marker = 0;
            }
        }
        //Check end of path
        height_check = CurrentPosition[1] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1];
        if (height_check*height_check < 400) //If on same level
        {
            diff_x = CurrentPosition[0] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[0];
            diff_z = CurrentPosition[2] - (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[2];
            CheckDistance = diff_x*diff_x + diff_z*diff_z;
            if (CheckDistance < Distance)
            {
                Distance = CheckDistance;
                use_this_path = ThisPath;
                use_this_marker = MarkerCounts[ThisPath]-1;
            }
        }
    }   

    
    ReturnValue[0] = (float)PathArray[use_this_path][use_this_marker].Position[0];
    ReturnValue[1] = (float)PathArray[use_this_path][use_this_marker].Position[1];
    ReturnValue[2] = (float)PathArray[use_this_path][use_this_marker].Position[2];
    return((Vector *)&ReturnValue)
}