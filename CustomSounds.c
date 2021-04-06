#include <sys/types.h>
#include <math.h>
#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "LibraryVariables.h"
#include "SubProgram.h"


void SetCustomSFXData(char sfxID, long rawSFX, long loopPred, long predictors)
{
// Follow all the pointers
    GlobalAddressA = *(long*)(g_sfxPointer + 0x4) + (sfxID * 0x4);
    GlobalAddressB = *(long*)(GlobalAddressA);
    GlobalAddressC = (GlobalAddressB + 0x10);
    GlobalAddressA = *(long*)(GlobalAddressC);

// Set of pointers to sound data 
    *(long*)(GlobalAddressA + (1* 0x4)) = rawSFX;
    *(long*)(GlobalAddressA + (2* 0x4)) = loopPred;
    *(long*)(GlobalAddressA + (3* 0x4)) = predictors;
}

void PlayCustomSound()
{
    SetCustomSFXData(122, 0xADE1C0, 0x803F6980, 0x803F6930);
//	SetCustomSFXData(122, 0xAED840, 0x803F6A30, 0x803F3E50); //Test
    playSound(0x49008026);
}