#include "../MainInclude.h"








void ResetBall(int ThisBall)
{
    GameFlag[ThisBall].Position[0] = SpawnPoint[ThisBall][0];
    GameFlag[ThisBall].Position[1] = SpawnPoint[ThisBall][1];
    GameFlag[ThisBall].Position[2] = SpawnPoint[ThisBall][2];

    GameFlag[ThisBall].Velocity[0] = 0;
    GameFlag[ThisBall].Velocity[1] = 0;
    GameFlag[ThisBall].Velocity[2] = 0;

    GameFlag[ThisBall].PlayerHolding = -1;
    GameFlag[ThisBall].IFrames = 0;
    GameFlag[ThisBall].RespawnTimer = 0;
    GameFlag[ThisBall].Angle = 0;
}


void DrawGameBalls(Camera* LocalCamera)
{
     
    //Draw GameFlags
     
    objectAngle[0] = 0;     
    objectAngle[2] = 0;
    for (int ThisBall = 0; ThisBall < FlagCount; ThisBall++)
    {
        GlobalIntA = (int)GameFlag[ThisBall].PlayerHolding;
        
        if (GlobalIntA != -1)
        {
            GameFlag[ThisBall].Position[0] = GlobalPlayer[GlobalIntA].position[0];
            GameFlag[ThisBall].Position[1] = GlobalPlayer[GlobalIntA].position[1] + 5;
            GameFlag[ThisBall].Position[2] = GlobalPlayer[GlobalIntA].position[2];               
        }
        else
        {
            GameFlag[ThisBall].Position[0] += GameFlag[ThisBall].Velocity[0];
            GameFlag[ThisBall].Position[1] += GameFlag[ThisBall].Velocity[1];
            GameFlag[ThisBall].Position[2] += GameFlag[ThisBall].Velocity[2];

            

            CheckBump2((Bump*)&GameFlag[ThisBall].BumpData, 4.0, GameFlag[ThisBall].Position[0], GameFlag[ThisBall].Position[1], GameFlag[ThisBall].Position[2], GameFlag[ThisBall].Position[0] - GameFlag[ThisBall].Velocity[0], GameFlag[ThisBall].Position[1] - GameFlag[ThisBall].Velocity[1], GameFlag[ThisBall].Position[2] - GameFlag[ThisBall].Velocity[2] );
            ManualBump((Bump*)&GameFlag[ThisBall].BumpData, GameFlag[ThisBall].Position);     
            if (GameFlag[ThisBall].BumpData.distance_xy < 0)               
            {
                ManualBounce(GameFlag[ThisBall].BumpData.bump_xy, GameFlag[ThisBall].Velocity);                    
            }
            if (GameFlag[ThisBall].BumpData.distance_yz < 0)
            {
                ManualBounce(GameFlag[ThisBall].BumpData.bump_yz, GameFlag[ThisBall].Velocity);
            }
            if(GameFlag[ThisBall].BumpData.distance_zx < 0)
            {
                GameFlag[ThisBall].Velocity[0] *= (1.0 - (0.2 / 30));
                GameFlag[ThisBall].Velocity[1] = 0;
                GameFlag[ThisBall].Velocity[2] *= (1.0 - (0.2 / 30));
            }
            else
            {
                GameFlag[ThisBall].Velocity[1] -= 0.5;
                if (GameFlag[ThisBall].Velocity[1] < -2.0)
                {
                    GameFlag[ThisBall].Velocity[1] = -2.0;
                }
            }
        }
                
        objectVelocity[0] = 0;
        objectVelocity[1] = 0;
        objectVelocity[2] = DEG1 * 2;
        MakeAlignVector(objectVelocity, GameFlag->Angle);
        objectAngle[0] = (short)objectVelocity[0];
        objectAngle[2] = (short)objectVelocity[0];
        DrawGeometryScale(GameFlag[ThisBall].Position, objectAngle, (int)GameFlag[ThisBall].F3D, 0.1);
    }
}




void PlaceBalls(uint BattleFlagF3D, uint PlayerFlagF3D[])
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
    for (int ThisBall = 0; ThisBall < FlagCount; ThisBall++)
    {
        if (HotSwapID > 0)
        {
            GlobalPlayer[ThisBall].position[0] = PlayerSpawnPoints[ThisBall].Position[0];
            GlobalPlayer[ThisBall].position[1] = PlayerSpawnPoints[ThisBall].Position[1] + 5;
            GlobalPlayer[ThisBall].position[2] = PlayerSpawnPoints[ThisBall].Position[2];
            GlobalPlayer[ThisBall].direction[1] = (short)(CalcDirection(GlobalPlayer[ThisBall].position, Origin));
        }
        Objectives[ThisBall].FlagHeld = -1;
        Objectives[ThisBall].FlagTimer = 0;
        Objectives[ThisBall].IFrames = 0;
        Objectives[ThisBall].Score = 0;
        
        if (TeamMode == 1)
        {
            if (ThisBall < 2)
            {
                Objectives[ThisBall].TeamIndex = 0;                    
            }
            else
            {
                Objectives[ThisBall].TeamIndex = 1;
            }
        }
        else
        {
            Objectives[ThisBall].TeamIndex = ThisBall;
        }
        GameFlag[ThisBall].PlayerHolding = -1;
        GameFlag[ThisBall].IFrames = 0;
        GameFlag[ThisBall].RespawnTimer = 0;
        GameFlag[ThisBall].Angle = GlobalPlayer[ThisBall].direction[1];
        GameFlag[ThisBall].Velocity[0] = 0;
        GameFlag[ThisBall].Velocity[1] = 0;
        GameFlag[ThisBall].Velocity[2] = 0;

        objectVelocity[0] = 0;
        objectVelocity[1] = 0;
        objectVelocity[2] = 15;
        MakeAlignVector(objectVelocity, GameFlag[ThisBall].Angle);

        GameFlag[ThisBall].Position[0] = GlobalPlayer[ThisBall].position[0] + objectVelocity[0];
        GameFlag[ThisBall].Position[1] = GlobalPlayer[ThisBall].position[1] + objectVelocity[1] + 5;
        GameFlag[ThisBall].Position[2] = GlobalPlayer[ThisBall].position[2] + objectVelocity[2];
        GameFlag[ThisBall].F3D = BattleFlagF3D;
    }
}




void CaptureBalls()
{
    //Decrement the I-Frames for the Flag.
    for (int ThisBall = 0; ThisBall < FlagCount; ThisBall++)
    {
        if (GameFlag[ThisBall].IFrames > 0)
        {
            GameFlag[ThisBall].IFrames--;
        }
        if (Objectives[ThisBall].IFrames > 0)
        {
            Objectives[ThisBall].IFrames--;
        }
    }

    //Check for Picking up balls
    for (int ThisPlayer = 0; ThisPlayer < g_playerCount; ThisPlayer++)
    {
        if (Objectives[ThisPlayer].FlagHeld == -1)
        {
            if (Objectives[ThisPlayer].IFrames == 0)
            {
                for (int ThisBall = 0; ThisBall < FlagCount; ThisBall++)
                {
                        if (GameFlag[ThisBall].PlayerHolding == -1)
                        {
                            if (GameFlag[ThisBall].IFrames == 0)
                            {
                                if (TestCollideSphere(GlobalPlayer[ThisPlayer].position, GlobalPlayer[ThisPlayer].radius, GameFlag[ThisBall].Position, 5.0))
                                {
                                    Objectives[ThisPlayer].FlagHeld = ThisBall;
                                    GameFlag[ThisBall].PlayerHolding = ThisPlayer;
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
            for (int ThisBall = 0; ThisBall < FlagCount; ThisBall++)
            {
                if (TestCollideSphere(GlobalPlayer[ThisPlayer].position, GlobalPlayer[ThisPlayer].radius, GameBase[ThisBall].Position, 5.0))
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
                if (TestCollideSphere(GameFlag[ThisPlayer].Position, 5.0, GameBase[ThisBall].Position, 5.0))
                {
                    if (TeamMode == 1)
                    {
                        TeamScore[(int)Objectives[ThisPlayer].TeamIndex]++;
                    }
                    else
                    {
                        Objectives[ThisPlayer].Score++;
                    }
                    GameFlag[(int)Objectives[ThisPlayer].FlagHeld].RespawnTimer = SpawnTime;
                }
            }
        }
    }

    
     
    for (int ThisBall = 0; ThisBall < FlagCount; ThisBall++)
    {
        if (GameFlag[ThisBall].RespawnTimer > 0)
        {
            GameFlag[ThisBall].RespawnTimer--;
        }
        else if (GameFlag[ThisBall].RespawnTimer == 0)
        {
            ResetBall(ThisBall);     
        }
    }
     
}
void DropBalls(int PlayerIndex)
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


void ShootBall(int PlayerIndex)
{
    if (Objectives[PlayerIndex].FlagHeld != -1)
    {
        GlobalIntA = (int)Objectives[PlayerIndex].FlagHeld;
        GameFlag[GlobalIntA].Position[0] = GlobalPlayer[PlayerIndex].position[0];
        GameFlag[GlobalIntA].Position[1] = GlobalPlayer[PlayerIndex].position[1] + 5;
        GameFlag[GlobalIntA].Position[2] = GlobalPlayer[PlayerIndex].position[2];

        
        GameFlag[GlobalIntA].Velocity[0] = 0;
        GameFlag[GlobalIntA].Velocity[1] = 5;
        GameFlag[GlobalIntA].Velocity[2] = 8;

        MakeAlignVector(objectVelocity,(GlobalPlayer[PlayerIndex].direction[1]));
        
        ChangeMaxSpeed((char)PlayerIndex, 60);

        GameFlag[(int)Objectives[PlayerIndex].FlagHeld].PlayerHolding = -1;
        GameFlag[(int)Objectives[PlayerIndex].FlagHeld].IFrames = 30;
        Objectives[PlayerIndex].FlagHeld= -1;
        Objectives[PlayerIndex].IFrames = 90;
    }    
}