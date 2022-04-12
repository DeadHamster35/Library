#include "..\Library\MainInclude.h"
#include "OKInclude.h"

typedef struct ObjectivePlayer
{
     char      FlagHeld, TeamIndex;
     short     FlagTimer;
     short     IFrames, Score;
} ObjectivePlayer;

typedef struct ObjectiveObject
{
     float     Position[3];
     float     Velocity[3];
     short     RespawnTimer, IFrames;
     char      PlayerHolding, TeamIndex;     
     short     Angle;
     uint      F3D;
     Bump      BumpData;
} ObjectiveObject;

ObjectivePlayer       Objectives[4];
ObjectiveObject     GameFlag[4];
ObjectiveObject     GameBase[4];

Marker* PlayerSpawnPoints;
Marker* ObjectivePoints;

float SpawnPoint[4][3];
char      FlagCount, TeamMode;
char      ScoreToWin, ObjectiveCount;
short     SpawnTime, HitstunTime;
short     TeamScore[2];

Vector Origin = {0,0,0,};




void DrawGameFlags(Camera* LocalCamera)
{
     
     //Draw GameFlags
     
     objectAngle[0] = 0;     
     objectAngle[2] = 0;
     for (int ThisFlag = 0; ThisFlag < FlagCount; ThisFlag++)
     {
          GlobalIntA = (int)GameFlag[ThisFlag].PlayerHolding;
          GameFlag->Angle += (DEG1 * 2);
          if (GlobalIntA != -1)
          {
               GameFlag[ThisFlag].Position[0] = GlobalPlayer[GlobalIntA].position[0];
               GameFlag[ThisFlag].Position[1] = GlobalPlayer[GlobalIntA].position[1] + 5;
               GameFlag[ThisFlag].Position[2] = GlobalPlayer[GlobalIntA].position[2];               
          }
          else
          {
               GameFlag[ThisFlag].Position[0] += GameFlag[ThisFlag].Velocity[0];
               GameFlag[ThisFlag].Position[1] += GameFlag[ThisFlag].Velocity[1];
               GameFlag[ThisFlag].Position[2] += GameFlag[ThisFlag].Velocity[2];

               

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
                    GameFlag[ThisFlag].Velocity[0] *= (1.0 - (0.7 / 30));
                    GameFlag[ThisFlag].Velocity[1] = 0;
                    GameFlag[ThisFlag].Velocity[2] *= (1.0 - (0.7 / 30));
               }
               else
               {
                    GameFlag[ThisFlag].Velocity[1] -= 0.5;
                    if (GameFlag[ThisFlag].Velocity[1] < -2.0)
                    {
                         GameFlag[ThisFlag].Velocity[1] = -2.0;
                    }
               }
          }
                    
          objectAngle[1] = GameFlag->Angle;
          DrawGeometryScale(GameFlag[ThisFlag].Position, objectAngle, (int)GameFlag[ThisFlag].F3D, 0.1);
     }
}

void PlaceFlags()
{
     if (HotSwapID > 0)
     {
          PlayerSpawnPoints = (Marker*)(GetRealAddress(0x06000008));
          ObjectivePoints = (Marker*)(GetRealAddress(0x06000030));

          for (ObjectiveCount = 0; ObjectiveCount < 64; ObjectiveCount++)
          {
               if ((ushort)ObjectivePoints[(int)ObjectiveCount].Position[0] == 0x8000)
               {
                    break;
               }
          }
     }
     for (int ThisFlag = 0; ThisFlag < g_playerCount; ThisFlag++)
     {
          if (HotSwapID > 0)
          {
               GlobalPlayer[ThisFlag].position[0] = PlayerSpawnPoints[ThisFlag].Position[0];
               GlobalPlayer[ThisFlag].position[1] = PlayerSpawnPoints[ThisFlag].Position[1] + 5;
               GlobalPlayer[ThisFlag].position[2] = PlayerSpawnPoints[ThisFlag].Position[2];
               GlobalPlayer[ThisFlag].direction[1] = (short)(CalcDirection(GlobalPlayer[ThisFlag].position, Origin));
          }
          Objectives[ThisFlag].FlagHeld = -1;
          Objectives[ThisFlag].FlagTimer = 0;
          Objectives[ThisFlag].IFrames = 0;
          Objectives[ThisFlag].Score = 0;
          
          if (TeamMode == 1)
          {
               if (ThisFlag < 2)
               {
                    Objectives[ThisFlag].TeamIndex = 0;                    
               }
               else
               {
                    Objectives[ThisFlag].TeamIndex = 1;
               }
          }
          else
          {
               Objectives[ThisFlag].TeamIndex = ThisFlag;
          }
          GameFlag[ThisFlag].PlayerHolding = -1;
          GameFlag[ThisFlag].IFrames = 0;
          GameFlag[ThisFlag].RespawnTimer = 0;
          GameFlag[ThisFlag].Angle = GlobalPlayer[ThisFlag].direction[1];
          GameFlag[ThisFlag].Velocity[0] = 0;
          GameFlag[ThisFlag].Velocity[1] = 0;
          GameFlag[ThisFlag].Velocity[2] = 0;

          objectVelocity[0] = 0;
          objectVelocity[1] = 0;
          objectVelocity[2] = 15;
          MakeAlignVector(objectVelocity, GameFlag[ThisFlag].Angle);

          GameFlag[ThisFlag].Position[0] = GlobalPlayer[ThisFlag].position[0] + objectVelocity[0];
          GameFlag[ThisFlag].Position[1] = GlobalPlayer[ThisFlag].position[1] + objectVelocity[1] + 5;
          GameFlag[ThisFlag].Position[2] = GlobalPlayer[ThisFlag].position[2] + objectVelocity[2];
          GameFlag[ThisFlag].F3D = (uint)&BattleFlag;
     }
     if (TeamMode != 1)
     {
          for (int ThisFlag = g_playerCount; ThisFlag < 4; ThisFlag++)
          {
               objectVelocity[0] = 5;
               objectVelocity[1] = 0;
               objectVelocity[2] = 15;
               MakeAlignVector(objectVelocity, GlobalPlayer[ThisFlag].direction[1]);

               SpawnPoint[ThisFlag][0] = GlobalPlayer[ThisFlag].position[0] - objectVelocity[0] * 2;
               SpawnPoint[ThisFlag][1] = GlobalPlayer[ThisFlag].position[1];
               SpawnPoint[ThisFlag][2] = GlobalPlayer[ThisFlag].position[2] - objectVelocity[2] * 2;

               //ResetFlag(ThisFlag);
          }
     }
     FlagCount = g_playerCount;
}

void CaptureFlag()
{
     //Decrement the I-Frames for the Flag.
     for (int ThisFlag = 0; ThisFlag < FlagCount; ThisFlag++)
     {
          if (GameFlag[ThisFlag].IFrames > 0)
          {
               GameFlag[ThisFlag].IFrames--;
          }
          if (Objectives[ThisFlag].IFrames > 0)
          {
               Objectives[ThisFlag].IFrames--;
          }
     }

     //Check for Picking up Flags
     for (int ThisPlayer = 0; ThisPlayer < g_playerCount; ThisPlayer++)
     {
          if (Objectives[ThisPlayer].FlagHeld == -1)
          {
               if (Objectives[ThisPlayer].IFrames == 0)
               {
                    for (int ThisFlag = 0; ThisFlag < FlagCount; ThisFlag++)
                    {
                         if (GameFlag[ThisFlag].PlayerHolding == -1)
                         {
                              if (GameFlag[ThisFlag].IFrames == 0)
                              {
                                   if (TestCollideSphere(GlobalPlayer[ThisPlayer].position, GlobalPlayer[ThisPlayer].radius, GameFlag[ThisFlag].Position, 5.0))
                                   {
                                        Objectives[ThisPlayer].FlagHeld = ThisFlag;
                                        GameFlag[ThisFlag].PlayerHolding = ThisPlayer;
                                        ChangeMaxSpeed(ThisPlayer, -60);
                                   }
                              }
                         }
                    }
               }
          }
     }
     //Check Scoring
     
     for (int ThisPlayer = 0; ThisPlayer < g_playerCount; ThisPlayer++)
     {
          if (Objectives[ThisPlayer].FlagHeld != 0)
          {
               for (int ThisBase = 0; ThisBase < FlagCount; ThisBase++)
               {
                    if (TestCollideSphere(GlobalPlayer[ThisPlayer].position, GlobalPlayer[ThisPlayer].radius, GameBase[ThisBase].Position, 5.0))
                    {
                         if (TeamMode == 1)
                         {
                              TeamScore[(int)Objectives[ThisPlayer].TeamIndex]++;
                         }
                         else
                         {
                              Objectives[ThisPlayer].Score++;
                         }
                         GameFlag[(int)Objectives[ThisPlayer].FlagHeld].PlayerHolding = -1;
                         GameFlag[(int)Objectives[ThisPlayer].FlagHeld].RespawnTimer = SpawnTime;
                         Objectives[ThisPlayer].FlagHeld = -1;                         
                    }
               }
          }
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

          
          GameFlag[GlobalIntA].Velocity[0] = -6 + (MakeRandomLimmit(12));
          GameFlag[GlobalIntA].Velocity[1] = 5;
          GameFlag[GlobalIntA].Velocity[2] = -8 + (MakeRandomLimmit(16));

          MakeAlignVector(objectVelocity,(GlobalPlayer[PlayerIndex].direction[1]));
          
          ChangeMaxSpeed((char)PlayerIndex, 60);

          GameFlag[(int)Objectives[PlayerIndex].FlagHeld].PlayerHolding = -1;
          GameFlag[(int)Objectives[PlayerIndex].FlagHeld].IFrames = 30;
          Objectives[PlayerIndex].FlagHeld= -1;
          Objectives[PlayerIndex].IFrames = 90;
     }       
	
}