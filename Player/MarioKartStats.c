#include "../MainInclude.h"

void SetEngine(int CharacterID, int ThisEngine)
{     
     GlobalStat.AccelerationCount[0][CharacterID] = (float)(EngineSpeed[0][ThisEngine]);
     GlobalStat.AccelerationCount[1][CharacterID] = (float)(EngineSpeed[1][ThisEngine]);
     GlobalStat.AccelerationCount[2][CharacterID] = (float)(EngineSpeed[2][ThisEngine]);
     GlobalStat.AccelerationCount[3][CharacterID] = (float)(EngineSpeed[1][ThisEngine]);
     GlobalStat.AccelerationCount[4][CharacterID] = (float)(EngineSpeed[3][ThisEngine]);
     for (int ThisAccel = 0; ThisAccel < 10; ThisAccel++)
     {
          GlobalStat.Acceleration[CharacterID][ThisAccel] =((float)(AccelerationCurve[ThisEngine][ThisAccel]) / 10);
     }
     for (int ThisPower = 0; ThisPower < 15; ThisPower++)
     {
          GlobalStat.PowerDownFT[CharacterID][ThisPower] =((float)(EnginePowerDownFT[ThisEngine][ThisPower]) / 100);
          GlobalStat.PowerDownRT[CharacterID][ThisPower] =((float)(EnginePowerDownRT[ThisEngine][ThisPower]) / 100);
     }
     GlobalStat.PowerBandAcceleration[CharacterID] = ((float)PowerBand[ThisEngine] / 10);
}

void SetSteering (int CharacterID, int ThisSteering)
{
     GlobalStat.ProOffsetAngle[CharacterID] =((float)(SteerAngle[ThisSteering]) / 100);
     GlobalStat.KartSteerLoss[CharacterID] =((float)(SteerValue[ThisSteering]) / 1000);     
     GlobalStat.PowerRecover[CharacterID] =((float)(SteerValue[ThisSteering]) / 1000);     
}

void dmaLoop(int loopCount)
{
     for(int currentPass = 0; currentPass < loopCount; currentPass++)
     {
          runDMA();
          *targetAddress = *targetAddress + dataLength;
     }
}

void unknown33(int mode)
{
     
     switch(mode)
     {
          case 0x00:
          {
               *sourceAddress = 0xE36D0;
               *targetAddress = 0x800E2AD0;
               dataLength = 0x1E0;
               runDMA();
               break;
          }
          case 0x01:
          {
               *sourceAddress = 0xE3748;
               dataLength = 0x3C;
               *targetAddress = 0x800E2AD0;
               dmaLoop(8);
               break;
          }
          
     }
}



void unknown41(int mode)
{
     switch(mode)
     {
          case 0x00:
          {
               *sourceAddress = 0xE38B0;
               *targetAddress = 0x800E2CB0;
               dataLength = 0x1E0;
               runDMA();
               break;
          }
          case 0x01:
          {
               *sourceAddress = 0xE3A18;
               *targetAddress = 0x800E2CB0;
               dataLength = 0x3C;
               dmaLoop(8);
               break;
          }
     }
}


void accelTable(int mode)
{    
     switch(mode)
     {
          case 0x00:
          {
               *sourceAddress = 0xE3AD0;
               *targetAddress = 0x800E2ED0 ;
               dataLength = 0x140;
               runDMA();
               break;
          }
          case 0x01:
          {
               *sourceAddress = 0xE3B48;
               dataLength = 0x28;
               *targetAddress = 0x800E2ED0;
               dmaLoop(8);
               break;
          }
     }
}



void equalStats(int mode)
{
     //unknown11
     switch(mode)
     {
          case 0x00:
          {
               u11_Mario = 3364;
               u11_Luigi = 3364;
               u11_Yoshi = 3457;
               u11_Toad = 3457;
               u11_DK = 3364;
               u11_Wario = 3364;
               u11_Peach = 3457;
               u11_Bowser = 3364;

               u12_Mario = 3844;
               u12_Luigi = 3844;
               u12_Yoshi = 3943;
               u12_Toad = 3943;
               u12_DK = 3844;
               u12_Wario = 3844;
               u12_Peach = 3943;
               u12_Bowser = 3844;

               u13_Mario = 4096;
               u13_Luigi = 4096;
               u13_Yoshi = 4199;
               u13_Toad = 4199;
               u13_DK = 4096;
               u13_Wario = 4096;
               u13_Peach = 4199;
               u13_Bowser = 4096;

               u14_Mario = 3844;
               u14_Luigi = 3844;
               u14_Yoshi = 3943;
               u14_Toad = 3943;
               u14_DK = 3844;
               u14_Wario = 3844;
               u14_Peach = 3943;
               u14_Bowser = 3844;

               cc50_Mario = 290;
               cc50_Luigi = 290;
               cc50_Yoshi = 294;
               cc50_Toad = 294;
               cc50_DK = 290;
               cc50_Wario = 290;
               cc50_Peach = 294;
               cc50_Bowser = 290;

               cc100_Mario = 310;
               cc100_Luigi = 310;
               cc100_Yoshi = 314;
               cc100_Toad = 314;
               cc100_DK = 310;
               cc100_Wario = 310;
               cc100_Peach = 314;
               cc100_Bowser = 310;

               cc150_Mario = 320;
               cc150_Luigi = 320;
               cc150_Yoshi = 324;
               cc150_Toad = 324;
               cc150_DK = 320;
               cc150_Wario = 320;
               cc150_Peach = 324;
               cc150_Bowser = 320;

               ccextra_Mario = 310;
               ccextra_Luigi = 310;
               ccextra_Yoshi = 314;
               ccextra_Toad = 314;
               ccextra_DK = 310;
               ccextra_Wario = 310;
               ccextra_Peach = 314;
               ccextra_Bowser = 310;

               turncoA_Mario = 0;
               turncoA_Luigi = 0;
               turncoA_Yoshi = 0.002;
               turncoA_Toad = 0.002;
               turncoA_DK = -0.002;
               turncoA_Wario = -0.002;
               turncoA_Peach = 0.002;
               turncoA_Bowser = -0.002;
               turncoB_Mario = 0;
               turncoB_Luigi = 0;
               turncoB_Yoshi = 0.002;
               turncoB_Toad = 0.002;
               turncoB_DK = -0.002;
               turncoB_Wario = -0.002;
               turncoB_Peach = 0.002;
               turncoB_Bowser = -0.002;

               tripleTap_Mario = 2;
               tripleTap_Luigi = 2;
               tripleTap_Yoshi = 3;
               tripleTap_Toad = 3;
               tripleTap_DK = 1.5;
               tripleTap_Wario = 1.5;
               tripleTap_Peach = 3;
               tripleTap_Bowser = 3;

               turncontr_Mario = 1.25;
               turncontr_Luigi = 1.25;
               turncontr_Yoshi = 1.28;
               turncontr_Toad = 1.28;
               turncontr_DK = 1.15;
               turncontr_Wario = 1.15;
               turncontr_Peach = 1.28;
               turncontr_Bowser = 1.15;
               break;
          }
          case 0x01:
          {
               u11_Mario = 3457;
               u11_Luigi = 3457;
               u11_Yoshi = 3457;
               u11_Toad = 3457;
               u11_DK = 3457;
               u11_Wario = 3457;
               u11_Peach = 3457;
               u11_Bowser = 3457;

               u12_Mario = 3943;
               u12_Luigi = 3943;
               u12_Yoshi = 3943;
               u12_Toad = 3943;
               u12_DK = 3943;
               u12_Wario = 3943;
               u12_Peach = 3943;
               u12_Bowser = 3943;

               u13_Mario = 4199;
               u13_Luigi = 4199;
               u13_Yoshi = 4199;
               u13_Toad = 4199;
               u13_DK = 4199;
               u13_Wario = 4199;
               u13_Peach = 4199;
               u13_Bowser = 4199;

               u14_Mario = 3943;
               u14_Luigi = 3943;
               u14_Yoshi = 3943;
               u14_Toad = 3943;
               u14_DK = 3943;
               u14_Wario = 3943;
               u14_Peach = 3943;
               u14_Bowser = 3943;

               cc50_Mario = 294;
               cc50_Luigi = 294;
               cc50_Yoshi = 294;
               cc50_Toad = 294;
               cc50_DK = 294;
               cc50_Wario = 294;
               cc50_Peach = 294;
               cc50_Bowser = 294;

               cc100_Mario = 314;
               cc100_Luigi = 314;
               cc100_Yoshi = 314;
               cc100_Toad = 314;
               cc100_DK = 314;
               cc100_Wario = 314;
               cc100_Peach = 314;
               cc100_Bowser = 314;

               cc150_Mario = 324;
               cc150_Luigi = 324;
               cc150_Yoshi = 324;
               cc150_Toad = 324;
               cc150_DK = 324;
               cc150_Wario = 324;
               cc150_Peach = 324;
               cc150_Bowser = 324;

               ccextra_Mario = 314;
               ccextra_Luigi = 314;
               ccextra_Yoshi = 314;
               ccextra_Toad = 314;
               ccextra_DK = 314;
               ccextra_Wario = 314;
               ccextra_Peach = 314;
               ccextra_Bowser = 314;

               turncoA_Mario = 0.002;
               turncoA_Luigi = 0.002;
               turncoA_Yoshi = 0.002;
               turncoA_Toad = 0.002;
               turncoA_DK = 0.002;
               turncoA_Wario = 0.002;
               turncoA_Peach = 0.002;
               turncoA_Bowser = 0.002;
               turncoB_Mario = 0.002;
               turncoB_Luigi = 0.002;
               turncoB_Yoshi = 0.002;
               turncoB_Toad = 0.002;
               turncoB_DK = 0.002;
               turncoB_Wario = 0.002;
               turncoB_Peach = 0.002;
               turncoB_Bowser = 0.002;

               tripleTap_Mario = 3;
               tripleTap_Luigi = 3;
               tripleTap_Yoshi = 3;
               tripleTap_Toad = 3;
               tripleTap_DK = 3;
               tripleTap_Wario = 3;
               tripleTap_Peach = 3;
               tripleTap_Bowser = 3;

               turncontr_Mario = 1.28;
               turncontr_Luigi = 1.28;
               turncontr_Yoshi = 1.28;
               turncontr_Toad = 1.28;
               turncontr_DK = 1.28;
               turncontr_Wario = 1.28;
               turncontr_Peach = 1.28;
               turncontr_Bowser = 1.28;
               break;

               
          }
     }
     accelTable(mode);
     unknown33(mode);
     unknown41(mode);



}


void checkStats(int mode)
{
     if (mode != StatsID)
     {
          equalStats(mode);
          StatsID = mode;
     }
}
