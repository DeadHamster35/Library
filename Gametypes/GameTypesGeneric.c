#include "../MainInclude.h"



int ObjectiveMapID = 0;



void DisplayScore()
{
     if (TeamMode)
     {
          PrintBigTextNumber(142, 90, 0.5f, "", TeamScore[0]);
          PrintBigTextNumber(142, 130, 0.5f, "", TeamScore[1]);
          return;
     }

     switch(g_playerCount)
     {
          case 2:
          {
               PrintBigTextNumber(142, 90, 0.5f, "", Objectives[0].Score);
               PrintBigTextNumber(142, 130, 0.5f, "", Objectives[1].Score);
               break;
          }
          case 3:
          {
               PrintBigTextNumber(70, 90, 0.4f, "", Objectives[0].Score);
               PrintBigTextNumber(230, 90, 0.4f, "", Objectives[1].Score);
               PrintBigTextNumber(70, 130, 0.4f, "", Objectives[2].Score);
               break;
          }
          case 4:
          {
               PrintBigTextNumber(70, 90, 0.4f, "", Objectives[0].Score);
               PrintBigTextNumber(230, 90, 0.4f, "", Objectives[1].Score);
               PrintBigTextNumber(70, 130, 0.4f, "", Objectives[2].Score);
               PrintBigTextNumber(230, 130, 0.4f, "", Objectives[3].Score);
               break;
          }
     }
}

void BalloonCheck(int PlayerStuct, int Neg1, float BalloonNumA, char BalloonNum, int BalloonNumB, ushort Angle)
{
     if (BattleGametype == BTL_CTF)
     {
          return;
     }
     if (BattleGametype == BTL_SOCCER)
     {
          return;
     }

     BalloonDisp(PlayerStuct, Neg1, BalloonNumA, BalloonNum, BalloonNumB, Angle);
}

void ResetFlag(int ThisFlag)
{
     GameFlag[ThisFlag].Position[0] = (float)GameFlag[ThisFlag].Origin[0];
     GameFlag[ThisFlag].Position[1] = (float)GameFlag[ThisFlag].Origin[1];
     GameFlag[ThisFlag].Position[2] = (float)GameFlag[ThisFlag].Origin[2];

     GameFlag[ThisFlag].Velocity[0] = 0;
     GameFlag[ThisFlag].Velocity[1] = 0;
     GameFlag[ThisFlag].Velocity[2] = 0;

     GameFlag[ThisFlag].PlayerHolding = -1;
     GameFlag[ThisFlag].IFrames = 0;
     GameFlag[ThisFlag].RespawnTimer = 0;
     GameFlag[ThisFlag].Angle[0] = 0;
     GameFlag[ThisFlag].Angle[1] = 0;
     GameFlag[ThisFlag].Angle[2] = 0;

     CheckBump2(
          (Bump*)&GameFlag[ThisFlag].BumpData, 
          4.0, 
          GameFlag[ThisFlag].Position[0], 
          GameFlag[ThisFlag].Position[1], 
          GameFlag[ThisFlag].Position[2], 
          GameFlag[ThisFlag].Position[0] - GameFlag[ThisFlag].Velocity[0], 
          GameFlag[ThisFlag].Position[1] - GameFlag[ThisFlag].Velocity[1], 
          GameFlag[ThisFlag].Position[2] - GameFlag[ThisFlag].Velocity[2] 
     );
}


void PlacePlayerSpawn(SVector Position, int PlayerID)
{
     
     SpawnPoint[PlayerID][0] = (float)Position[0];
     SpawnPoint[PlayerID][1] = (float)Position[1] + 5.0f;
     SpawnPoint[PlayerID][2] = (float)Position[2];
     
     GlobalPlayer[PlayerID].position[0] = (float)Position[0];
     GlobalPlayer[PlayerID].position[1] = (float)Position[1] + 5.0f;
     GlobalPlayer[PlayerID].position[2] = (float)Position[2];

     GlobalPlayer[PlayerID].old_position[0] = (float)Position[0];
     GlobalPlayer[PlayerID].old_position[1] = (float)Position[1] + 5.0f;
     GlobalPlayer[PlayerID].old_position[2] = (float)Position[2];

     GlobalPlayer[PlayerID].ground = (float)Position[1];

     GlobalCamera[PlayerID]->camera_pos[0] = (float)Position[0];
     GlobalCamera[PlayerID]->camera_pos[1] = (float)Position[1] + 5.0f;
     GlobalCamera[PlayerID]->camera_pos[2] = (float)Position[2];


     GlobalPlayer[PlayerID].direction[1] = (short)(CalcDirection(GlobalPlayer[PlayerID].position, Origin) * -1);

     CheckBump2
     (    
          (Bump*)&GlobalPlayer[PlayerID].bump, 
          5.0, 
          GlobalPlayer[PlayerID].position[0], GlobalPlayer[PlayerID].position[1], GlobalPlayer[PlayerID].position[2], 
          GlobalPlayer[PlayerID].old_position[0], GlobalPlayer[PlayerID].old_position[1], GlobalPlayer[PlayerID].old_position[2] 
     );
     

     ManualBump((Bump*)&GlobalPlayer[PlayerID].bump, GlobalPlayer[PlayerID].position);     
}

void PlaceFlagSpawn(SVector Position, int FlagID)
{
     GameFlag[FlagID].Origin[0] = Position[0];
     GameFlag[FlagID].Origin[1] = Position[1];
     GameFlag[FlagID].Origin[2] = Position[2];
     ResetFlag(FlagID);
}
void PlaceBaseSpawn(SVector Position, int BaseID)
{
     GameBase[BaseID].Position[0] = (float)Position[0];
     GameBase[BaseID].Position[1] = (float)Position[1];
     GameBase[BaseID].Position[2] = (float)Position[2];     
     GameBase[BaseID].Origin[0] = Position[0];
     GameBase[BaseID].Origin[1] = Position[1];
     GameBase[BaseID].Origin[2] = Position[2];     
     GameBase[BaseID].PlayerHolding = BaseID;
}


void DrawGameBase(Camera* LocalCamera)
{    
     //Draw GameFlags
     objectAngle[0] = 0;    
     objectAngle[1] = 0; 
     objectAngle[2] = 0;
     for (int ThisFlag = 0; ThisFlag < FlagCount; ThisFlag++)
     {    
          uint *GArray = (uint*)(GameBase[ThisFlag].F3D);
          gSPDisplayList(GraphPtrOffset++, GArray[0]);
          DrawGeometryScale(GameBase[ThisFlag].Position, objectAngle, GArray[1], 0.35);
     }
}

void DrawGameFlags(Camera* LocalCamera)
{
     FaceStruct *Surface = (FaceStruct*)(gFaceBuffer);
     //Draw GameFlags
     for (int ThisFlag = 0; ThisFlag < FlagCount; ThisFlag++)
     {
          GlobalIntA = (int)GameFlag[ThisFlag].PlayerHolding;
          GameFlag[ThisFlag].Angle[0] += (DEG1 * GameFlag[ThisFlag].AngularVel[0]);
          GameFlag[ThisFlag].Angle[1] += (DEG1 * GameFlag[ThisFlag].AngularVel[1]);
          GameFlag[ThisFlag].Angle[2] += (DEG1 * GameFlag[ThisFlag].AngularVel[2]);
          if (GlobalIntA != -1)
          {
               GameFlag[ThisFlag].Position[0] = GlobalPlayer[GlobalIntA].position[0];
               GameFlag[ThisFlag].Position[1] = GlobalPlayer[GlobalIntA].position[1] + 5;
               GameFlag[ThisFlag].Position[2] = GlobalPlayer[GlobalIntA].position[2];              
               GameFlag[ThisFlag].Velocity[0] = 0;
               GameFlag[ThisFlag].Velocity[1] = 0;
               GameFlag[ThisFlag].Velocity[2] = 0;
          }
          else
          {
               GameFlag[ThisFlag].Position[0] += GameFlag[ThisFlag].Velocity[0];
               GameFlag[ThisFlag].Position[1] += GameFlag[ThisFlag].Velocity[1];
               GameFlag[ThisFlag].Position[2] += GameFlag[ThisFlag].Velocity[2];

               
               GlobalFloatA = 0;
               for (int ThisVector = 0; ThisVector < 3; ThisVector++)
               {
                    GlobalFloatA += GameFlag[ThisFlag].Velocity[ThisVector] * GameFlag[ThisFlag].Velocity[ThisVector];
               }

               if (GlobalFloatA > 0.0f)
               {
                    CheckBump2((Bump*)&GameFlag[ThisFlag].BumpData, 4.0, GameFlag[ThisFlag].Position[0], GameFlag[ThisFlag].Position[1], GameFlag[ThisFlag].Position[2], GameFlag[ThisFlag].Position[0] - GameFlag[ThisFlag].Velocity[0], GameFlag[ThisFlag].Position[1] - GameFlag[ThisFlag].Velocity[1], GameFlag[ThisFlag].Position[2] - GameFlag[ThisFlag].Velocity[2] );
                    ManualBump((Bump*)&GameFlag[ThisFlag].BumpData, GameFlag[ThisFlag].Position);     
                    
                    if (GameFlag[ThisFlag].BumpData.distance_xy < 0)               
                    {
                         ManualBounce(GameFlag[ThisFlag].BumpData.bump_xy, GameFlag[ThisFlag].Velocity);                    
                    }
                    if (GameFlag[ThisFlag].BumpData.distance_yz < 0)
                    {
                         ManualBounce(GameFlag[ThisFlag].BumpData.bump_yz, GameFlag[ThisFlag].Velocity);
                    }
                    if(GameFlag[ThisFlag].BumpData.distance_zx < 0)
                    {
                         GameFlag[ThisFlag].Velocity[0] *= (1.0 -  (float)((float)GameFlag[ThisFlag].Friction / 30000.0));
                         if (GameFlag[ThisFlag].Velocity[1] < ((float)GameFlag[ThisFlag].Gravity / -250.0))
                         {
                              GameFlag[ThisFlag].Velocity[1] *= (-1.0 + (float)((float)GameFlag[ThisFlag].Bounce / 1000.0));
                         }
                         else
                         {
                              GameFlag[ThisFlag].Velocity[1] = 0;
                         }
                         
                         GameFlag[ThisFlag].Velocity[2] *= (1.0 -  (float)((float)GameFlag[ThisFlag].Friction / 30000.0));

                       
                    }
                    else
                    {
                         GameFlag[ThisFlag].Velocity[1] -= (float)((float)GameFlag[ThisFlag].Gravity / 1000.0);
                    }
               }
               
          }
          

          if (GameFlag[ThisFlag].Position[1] < g_waterHeight)
          {
               ResetFlag(ThisFlag);
          }
            
          
          
          if ((int)(Surface[GameFlag[ThisFlag].BumpData.last_zx].status & 0xFF) == JUMPMARK) //LavaFloor
          {
               ResetFlag(ThisFlag);
          }
          

          uint *GArray = (uint*)(GameFlag[ThisFlag].F3D);
          gSPDisplayList(GraphPtrOffset++, GArray[0]);
          DrawGeometryScale(GameFlag[ThisFlag].Position, GameFlag[ThisFlag].Angle, GArray[1], ((float)(GameFlag[ThisFlag].Scale / 1000.0f)));
     }
}


void DropFlag(int PlayerIndex)
{
     if (Objectives[PlayerIndex].FlagHeld != -1)
     {
          GlobalIntA = (int)Objectives[PlayerIndex].FlagHeld;
          GameFlag[GlobalIntA].Position[0] = GlobalPlayer[PlayerIndex].position[0];
          GameFlag[GlobalIntA].Position[1] = GlobalPlayer[PlayerIndex].position[1] + 5;
          GameFlag[GlobalIntA].Position[2] = GlobalPlayer[PlayerIndex].position[2];

          
          GameFlag[GlobalIntA].Velocity[0] = -2 + (MakeRandomLimmit(4));
          GameFlag[GlobalIntA].Velocity[1] = (float)(GameFlag[GlobalIntA].Lift) / 1000.0;
          GameFlag[GlobalIntA].Velocity[2] = -3 + (MakeRandomLimmit(6));

          MakeAlignVector(objectVelocity,(GlobalPlayer[PlayerIndex].direction[1]));
          
          ChangeMaxSpeed((char)PlayerIndex, 60);

          GameFlag[(int)Objectives[PlayerIndex].FlagHeld].PlayerHolding = -1;
          GameFlag[(int)Objectives[PlayerIndex].FlagHeld].IFrames = 30;
          GameFlag[(int)Objectives[PlayerIndex].FlagHeld].RespawnTimer = 120;
          Objectives[PlayerIndex].FlagHeld= -1;
          Objectives[PlayerIndex].IFrames = 100;
     }       
	
}

bool CheckExecuteItem(int PlayerIndex)
{    
    if (Objectives[PlayerIndex].FlagHeld == -1)
    {
        return true;
    }
    else
    {
        return false;
    }
}