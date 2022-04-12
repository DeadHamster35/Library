#include "MainInclude.h"



BKPathfinder AIPathfinder[4];




//Before running the function below, ensure that you've set the `Target` value 
//of the BKPathfinder to the float-position of the position you wish to drive towards. 

void UpdateBKPath(BKPathfinder* Pathfinder, short FirstMarkerDistance, Marker *PathArray[], short* MarkerCounts, short PathCount, short PlayerID)
{
     float CheckHeightStart, CheckHeightEnd;
     float CheckDistance;
     float diff_x, diff_y, diff_z;
     Pathfinder->Distance = 999999999.0; // Set an impossible value to ensure the first return is true. 

     Pathfinder->LastPath = Pathfinder->TargetPath; //Set the last path as we get ready to update.
     for (int ThisPath = 0; ThisPath < PathCount; ThisPath++)
     {
          //Test first marker to see if in range.
          objectPosition[0] = (float)PathArray[ThisPath][0].Position[0];
          objectPosition[1] = (float)PathArray[ThisPath][0].Position[1];
          objectPosition[2] = (float)PathArray[ThisPath][0].Position[2];

          if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5) && (ThisPath != Pathfinder->LastPath))  //check if the first marker is within 125 units of the player
          {
               //First Marker has hit true, check distance of last marker
               diff_x = ((float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[0] - Pathfinder->Target[0]);
               diff_y = ((float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1] - Pathfinder->Target[1]);
               diff_z = ((float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[2] - Pathfinder->Target[2]);
               CheckDistance = diff_x*diff_x + diff_y*diff_y*100000.0 + diff_z*diff_z;  //(A^2 + B^2 + C^2) = d

               diff_y = (float)PathArray[ThisPath][0].Position[1] - GlobalPlayer[PlayerID].position[1]; //Check height of end of path nearest bot
               CheckHeightStart = diff_y*diff_y;

               // diff_y = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1] - GlobalPlayer[PlayerID].position[1]; //Check height of end of path nearest target
               // CheckHeightEnd = diff_y*diff_y;
               
               if (CheckDistance < Pathfinder->Distance && CheckHeightStart < 500.0)// && CheckHeightEnd < 500.0)  //compare distance, if less than the current update
               {
                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    // Pathfinder->Progression = MarkerCounts[ThisPath]-1;
                    // Pathfinder->Direction = -1;
                    Pathfinder->Progression = 0;
                    Pathfinder->Direction = 1;
               }
          }

          //Test last marker to see if in range.
          objectPosition[0] = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[0];
          objectPosition[1] = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1];
          objectPosition[2] = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[2];

          if (TestCollideSphere(GlobalPlayer[PlayerID].position, FirstMarkerDistance, objectPosition, 5) && (ThisPath != Pathfinder->LastPath))  //check if the last marker is within 125 units of the player
          {
               //First Marker has hit true, check distance of last marker
               diff_x = ((float)PathArray[ThisPath][0].Position[0] - Pathfinder->Target[0]);
               diff_y = ((float)PathArray[ThisPath][0].Position[1] - Pathfinder->Target[1]);
               diff_z = ((float)PathArray[ThisPath][0].Position[2] - Pathfinder->Target[2]);
               CheckDistance = diff_x*diff_x + diff_y*diff_y*100000.0 + diff_z*diff_z;  //(A^2 + B^2 + C^2) = d


               diff_y = (float)PathArray[ThisPath][MarkerCounts[ThisPath]-1].Position[1] - GlobalPlayer[PlayerID].position[1]; //Check height of end of path nearest bot
               CheckHeightStart = diff_y*diff_y;

               // diff_y = (float)PathArray[ThisPath][0].Position[1] - GlobalPlayer[PlayerID].position[1]; //Check height of end of path nearest target
               // CheckHeightEnd = diff_y*diff_y;

               if (CheckDistance < Pathfinder->Distance && CheckHeightStart < 500.0)// && CheckHeightEnd < 500.0)  //compare distance, if less than the current update
               {
                    Pathfinder->Distance = CheckDistance;
                    Pathfinder->TargetPath = ThisPath;
                    // Pathfinder->Progression = 0;
                    // Pathfinder->Direction = 1;
                    Pathfinder->Progression = MarkerCounts[ThisPath]-1;
                    Pathfinder->Direction = -1;
               }
          }

     }
}