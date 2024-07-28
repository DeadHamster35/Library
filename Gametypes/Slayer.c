#include "../MainInclude.h"



void SlayerInit()
{
    
    if (HotSwapID > 0)
    {
        CustomObjectivePoints = (BattleObjectivePoint*)(GetRealAddress(0x06000210));

        for (int ThisObj = 0; ThisObj < 64; ThisObj++)
        {
            if (CustomObjectivePoints[ThisObj].Position[0] == (short)-32768)
            {
                ThisObj = 64;                    
            }
            else
            {           
                if (CustomObjectivePoints[ThisObj].GameMode == BATTLE_GAMETYPE)
                {
                    switch (CustomObjectivePoints[ThisObj].Type)
                    {
                        case (SPAWN_POINT):
                        {
                            PlacePlayerSpawn(CustomObjectivePoints[ThisObj].Position, CustomObjectivePoints[ThisObj].Player);
                            break;
                        }
                        case (FLAG_POINT):
                        case (BASE_POINT):
                        {
                            break;
                        }
                    }
                }
            }
        }
        
        
        
        for (int ThisPlayer = g_playerCount; ThisPlayer < 4; ThisPlayer++)
        {
            SpawnPoint[ThisPlayer][0] = -65535;
            SpawnPoint[ThisPlayer][1] = -65535;
            SpawnPoint[ThisPlayer][2] = -65535;
        }
    }

}