#include "../MainInclude.h"


const CTFSpawn SoccerSkyscraperSpawns = 
{ 
    {
            //EASY
        {
            { {0,480,-480}, {0,480,480}, {-480,480,0}, {480,480,0} },    //BASE
            { {0,480,-435}, {0,480,435}, {-435,480,0}, {435,480,0} },   //BALL
            { {0,480,-350}, {0,480,350}, {-350,480,0}, {350,480,0} }    //PLAYER
        },
        //HARD
        {
            { {0,480,-75}, {0,480,75}, {-75,480,0}, {75,480,0} }, 
            { {0,480,-435}, {0,480,435}, {-435,480,0}, {435,480,0} },
            { {0,480,-350}, {0,480,350}, {-350,480,0}, {350,480,0} }
        }
    }
};

const CTFSpawn SoccerBlockFortSpawns = 
{ 
    {
        //EASY
        {
            { {0,0,-650}, {0,0,650}, {-650,0,0}, {650,0,0} }, 
            { {0,0,-700}, {0,0,700}, {-700,0,0}, {700,0,0} },
            { {0,0,-500}, {0,0,500}, {-500,0,0}, {500,0,0} }
        },

        //HARD
        {
            { {-450,92,-450}, {450,92,450}, {-450,92,450}, {450,92,-450} },
            { {-700,0,-700}, {700,0,700}, {-700,0,700}, {700,0,-700} },
            { {-150,47,-150}, {150,47,150}, {-150,47,150}, {150,47,-150} }
        }
    }
};


const CTFSpawn SoccerDoubleDeckerSpawns = 
{ 
    {
        //EASY
        {
            { {0,60,-675}, {0,60,675}, {-675,60,0}, {675,60,0} }, 
            { {0,50,-50}, {0,50,50}, {-50,50,0}, {50,50,0} },
            { {0,100,-635}, {0,100,635}, {-635,100,0}, {635,100,0} }
        },
        //HARD
        {
            { {0,90,-275}, {0,90,275}, {-275,90,0}, {275,90,0} }, 
            { {0,0,-675}, {0,0,675}, {-675,0,0}, {675,0,0} },
            { {0,0,-635}, {0,0,635}, {-635,0,0}, {635,0,0} },
        }
    }    
};

const CTFSpawn SoccerBigDonutSpawns =
{ 
    {
        //EASY
        {
            { {0,200,-615}, {0,200,615}, {-615,200,0}, {615,200,0} }, 
            { {0,210,-750}, {0,210,750}, {-750,210,0}, {750,210,0} },
            { {0,230,-875}, {0,230,875}, {-875,230,0}, {875,230,0} }
        },
        //HARD
        {
            { {0,230,-875}, {0,230,875}, {-875,230,0}, {875,230,0} }, 
            { {0,210,-750}, {0,210,750}, {-750,210,0}, {750,210,0} },
            { {0,200,-615}, {0,200,615}, {-615,200,0}, {615,200,0} }
        }
    }
};

CTFSpawn SoccerGameSpawns[4] = {SoccerBigDonutSpawns, SoccerBlockFortSpawns, SoccerDoubleDeckerSpawns, SoccerSkyscraperSpawns};
 


void PlaceBalls(uint BattleFlagF3D, uint BattleBaseF3D, uint PlayerBaseF3D[], uint Difficulty)
{    
    if (HotSwapID > 0)
    {
        CustomObjectivePoints = (BattleObjectivePoint*)(GetRealAddress(0x06000210));

        for (int ThisObj = 0; ThisObj < 64; ThisObj++)
        {
            if ((ushort)CustomObjectivePoints[(int)ObjectiveCount].Position[0] == 0x8000)
            {
                break;
            }
            else
            {    
                if (CustomObjectivePoints[ThisObj].GameMode == CTF_GAMETYPE)
                {
                        switch (CustomObjectivePoints[ThisObj].Type)
                        {
                            case (SPAWN_POINT):
                            {
                                PlacePlayerSpawn(CustomObjectivePoints[ThisObj].Position, CustomObjectivePoints[ThisObj].Player);
                                break;
                            }
                            case (FLAG_POINT):
                            {
                            PlaceFlagSpawn(CustomObjectivePoints[ThisObj].Position, CustomObjectivePoints[ThisObj].Player);

                            //Setup Soccerball F3D and Physics.
                            GameFlag[CustomObjectivePoints[ThisObj].Player].F3D = BattleFlagF3D;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].TeamIndex = CustomObjectivePoints[ThisObj].Player;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].Friction = 500;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].Bounce = 200;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].Gravity = 400;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].Lift = 10000;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].Scale = 200;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].AngularVel[0] = 0;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].AngularVel[1] = 0;
                            GameFlag[CustomObjectivePoints[ThisObj].Player].AngularVel[2] = 2;

                            break;
                            }
                            case (BASE_POINT):
                            {
                                PlaceBaseSpawn(CustomObjectivePoints[ThisObj].Position, CustomObjectivePoints[ThisObj].Player);
                                GameBase[CustomObjectivePoints[ThisObj].Player].F3D = PlayerBaseF3D[CustomObjectivePoints[ThisObj].Player];
                                break;
                            }
                        }
                }
            }
        }

        for (int ThisFlag = 0; ThisFlag < g_playerCount; ThisFlag++)
        {    
            Objectives[ThisFlag].FlagHeld = -1;
            Objectives[ThisFlag].FlagTimer = 0;
            Objectives[ThisFlag].IFrames = 0;
            Objectives[ThisFlag].Score = 0;
        }

    }
    else
    {
        /*
        0x0F	Block Fort
        0x10	Skyscraper
        0x11	Double Deck
        0x12	DK's Jungle Parkway
        0x13	Big Donut
        */
        switch (g_courseID)
        {
            case 15:
            {
                ObjectiveMapID = 1;
                break;
            }
            case 16:
            {
                ObjectiveMapID = 3;
                break;
            }
            case 17:
            {
                ObjectiveMapID = 2;
                break;
            }
            case 19:
            {
                ObjectiveMapID = 0;
                break;
            }
            default:
            {
                ObjectiveMapID = -1;
                //wtf
                break;
            }
        }
        
        if (ObjectiveMapID != -1)
        {    
            
            for (int ThisFlag = 0; ThisFlag < g_playerCount; ThisFlag++)
            {
                Objectives[ThisFlag].FlagHeld = -1;
                Objectives[ThisFlag].FlagTimer = 0;
                Objectives[ThisFlag].IFrames = 0;
                Objectives[ThisFlag].Score = 0;

                
                
                PlaceBaseSpawn(SoccerGameSpawns[ObjectiveMapID].Position[Difficulty][0][ThisFlag], ThisFlag);
                GameBase[ThisFlag].F3D = PlayerBaseF3D[ThisFlag];

                PlaceFlagSpawn(SoccerGameSpawns[ObjectiveMapID].Position[Difficulty][1][ThisFlag], ThisFlag);
                GameFlag[ThisFlag].F3D = BattleFlagF3D;
                GameFlag[ThisFlag].TeamIndex = ThisFlag;
                GameFlag[ThisFlag].Friction = 500;
                GameFlag[ThisFlag].Bounce = 200;
                GameFlag[ThisFlag].Gravity = 500;
                GameFlag[ThisFlag].Lift = 10000;
    
                GameFlag[ThisFlag].Scale = 10;
                GameFlag[ThisFlag].AngularVel[0] = 0;
                GameFlag[ThisFlag].AngularVel[1] = 0;
                GameFlag[ThisFlag].AngularVel[2] = 2;


                PlacePlayerSpawn(SoccerGameSpawns[ObjectiveMapID].Position[Difficulty][2][ThisFlag], ThisFlag);
                
                
            }
        }
        
    }
    for (int ThisFlag = 0; ThisFlag < g_playerCount; ThisFlag++)
    {
        
        
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
        
    }
    for (int ThisFlag = g_playerCount; ThisFlag < 4; ThisFlag++)
    {
        

        SpawnPoint[ThisFlag][0] = -65535;
        SpawnPoint[ThisFlag][1] = -65535;
        SpawnPoint[ThisFlag][2] = -65535;

        GameBase[ThisFlag].F3D = BattleFlagF3D;
        GameFlag[ThisFlag].TeamIndex = -1;
        ResetFlag(ThisFlag);

    }
    FlagCount = g_playerCount;
}

void CaptureBalls()
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
                        if (GameFlag[ThisFlag].TeamIndex != Objectives[ThisPlayer].TeamIndex)
                        {
                            if (GameFlag[ThisFlag].PlayerHolding == -1)
                            {
                                if (GameFlag[ThisFlag].IFrames == 0)
                                {
                                    if (TestCollideSphere(GlobalPlayer[ThisPlayer].position, GlobalPlayer[ThisPlayer].radius, GameFlag[ThisFlag].Position, 5.0))
                                    {
                                            Objectives[ThisPlayer].FlagHeld = ThisFlag;
                                            GameFlag[ThisFlag].PlayerHolding = ThisPlayer;
                                            ChangeMaxSpeed(ThisPlayer, -90);
                                    }
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
                if (TestCollideSphere(GlobalPlayer[ThisPlayer].position, GlobalPlayer[ThisPlayer].radius, GameBase[ThisBase].Position, 8.0))
                {
                        if (TeamMode == 1)
                        {
                            TeamScore[(int)Objectives[ThisPlayer].TeamIndex]++;
                        }
                        else
                        {
                            Objectives[ThisPlayer].Score++;
                        }
                        ChangeMaxSpeed(ThisPlayer, 90);
                        ResetFlag(Objectives[ThisPlayer].FlagHeld);
                        Objectives[ThisPlayer].FlagHeld = -1;
                }
            }
        }
    }
    
    for (int ThisFlag = 0; ThisFlag < FlagCount; ThisFlag++)
    {
        if (GameFlag[ThisFlag].RespawnTimer > 0)
        {
            GameFlag[ThisFlag].RespawnTimer--;
        }
        else if (GameFlag[ThisFlag].RespawnTimer == 1)
        {
            ResetFlag(ThisFlag);     
        }
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
        GameFlag[GlobalIntA].Velocity[2] = 4;

        GameFlag[GlobalIntA].Angle[1] = GlobalPlayer[PlayerIndex].direction[1];

        MakeAlignVector(GameFlag[GlobalIntA].Velocity,(GlobalPlayer[PlayerIndex].direction[1]));
        
        ChangeMaxSpeed((char)PlayerIndex, 90);

        GameFlag[(int)Objectives[PlayerIndex].FlagHeld].PlayerHolding = -1;
        GameFlag[(int)Objectives[PlayerIndex].FlagHeld].IFrames = 30;
        Objectives[PlayerIndex].FlagHeld= -1;
        Objectives[PlayerIndex].IFrames = 90;
    }    
}