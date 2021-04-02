#include "GameVariables/NTSC/GameOffsets.h"
#include "GameVariables/NTSC/StatsOffsets.h"
#include "SharedFunctions.h"
#include "LibraryVariables.h"

void dmaLoop(int loopCount)
{
     for(int currentPass = 0; currentPass < loopCount; currentPass++)
     {
          runDMA();
          *targetAddress = *targetAddress + dataLength;
          currentPass++;
     }
}

void unknown33(int mode)
{
     //Unknown33 - 40
     if (mode== 0)
     {
          *sourceAddress = 0xE36D0;
          *targetAddress = 0x800E2AD0;
          dataLength = 0x1E0;
          runDMA();
     }
     else
     {
          switch(mode)
          {

               case 0x01:
               {
                    *sourceAddress = 0xE36D0;
                    break;
               }
               case 0x02:
               {
                    *sourceAddress = 0xE370C;
                    break;
               }
               case 0x03:
               {
                    *sourceAddress = 0xE3748;
                    break;
               }
               case 0x04:
               {
                    *sourceAddress = 0xE3784;
                    break;
               }
               case 0x05:
               {
                    *sourceAddress = 0xE37C0;
                    break;
               }
               case 0x06:
               {
                    *sourceAddress = 0xE37FC;
                    break;
               }
               case 0x07:
               {
                    *sourceAddress = 0xE3838;
                    break;
               }
               case 0x08:
               {
                    *sourceAddress = 0xE3874;
                    break;
               }
          }
          dataLength = 0x3C;
          *targetAddress = 0x800E2AD0;
          dmaLoop(8);
     }
}



void unknown41(int mode)
{

     if (mode == 0)
     {
          *sourceAddress = 0xE38B0;
          *targetAddress = 0x800E2CB0;
          dataLength = 0x1E0;
          runDMA();
     }
     else
          {
          switch(mode)
          {

               case 0x01:
               {
                    *sourceAddress = 0xE38B0;
                    break;
               }
               case 0x02:
               {
                    *sourceAddress = 0xE38EC;
                    break;
               }
               case 0x03:
               {
                    *sourceAddress = 0xE3928;
                    break;
               }
               case 0x04:
               {
                    *sourceAddress = 0xE3964;
                    break;
               }
               case 0x05:
               {
                    *sourceAddress = 0xE39A0;
                    break;
               }
               case 0x06:
               {
                    *sourceAddress = 0xE39DC;
                    break;
               }
               case 0x07:
               {
                    *sourceAddress = 0xE3A18;
                    break;
               }
               case 0x08:
               {
                    *sourceAddress = 0xE3A54;
                    break;
               }
          }
          *targetAddress = 0x800E2CB0;
          dataLength = 0x3C;
          dmaLoop(8);
     }



}


void accelTable(int mode)
{
     if (mode == 0)
     {
          *sourceAddress = 0xE3AD0;
          *targetAddress = 0x800E2ED0 ;
          dataLength = 0x140;
          runDMA();
     }
     else
     {
          switch(mode)
          {
               case 0x01:
               {
                    *sourceAddress = 0xE3AD0;
                    break;
               }
               case 0x02:
               {
                    *sourceAddress = 0xE3AF8;
               }
               case 0x03:
               {
                    *sourceAddress = 0xE3B20;
               }
               case 0x04:
               {
                    *sourceAddress = 0xE3B48;
               }
               case 0x05:
               {
                    *sourceAddress = 0xE3B70;
                    break;
               }
               case 0x06:
               {
                    *sourceAddress = 0xE3B98;
                    break;
               }
               case 0x07:
               {
                    *sourceAddress = 0xE3BC0;
                    break;
               }
               case 0x08:
               {
                    *sourceAddress = 0xE3BE8;
                    break;
               }
          }
          dataLength = 0x28;
          *targetAddress = 0x800E2ED0;
          dmaLoop(8);
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
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 3364;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 3364;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 3457;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 3457;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 3364;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 3364;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 3457;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 3364;
               break;
          }



     }
     if (mode > 0x00)
     {
          u11_Mario = GlobalFloatA;
          u11_Luigi = GlobalFloatA;
          u11_Yoshi = GlobalFloatA;
          u11_Toad = GlobalFloatA;
          u11_DK = GlobalFloatA;
          u11_Wario = GlobalFloatA;
          u11_Peach = GlobalFloatA;
          u11_Bowser = GlobalFloatA;
     }
     //
     //
     //





     //unknown12
     switch(mode)
     {
          case 0x00:
          {
               u12_Mario = 3844;
               u12_Luigi = 3844;
               u12_Yoshi = 3943;
               u12_Toad = 3943;
               u12_DK = 3844;
               u12_Wario = 3844;
               u12_Peach = 3943;
               u12_Bowser = 3844;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 3943;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 3943;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 3943;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 3844;
               break;
          }



     }
     if (mode > 0x00)
     {
          u12_Mario = GlobalFloatA;
          u12_Luigi = GlobalFloatA;
          u12_Yoshi = GlobalFloatA;
          u12_Toad = GlobalFloatA;
          u12_DK = GlobalFloatA;
          u12_Wario = GlobalFloatA;
          u12_Peach = GlobalFloatA;
          u12_Bowser = GlobalFloatA;
     }
     //
     //
     //









     //unknown13
     switch(mode)
     {
          case 0x00:
          {
               u13_Mario = 4096;
               u13_Luigi = 4096;
               u13_Yoshi = 4199;
               u13_Toad = 4199;
               u13_DK = 4096;
               u13_Wario = 4096;
               u13_Peach = 4199;
               u13_Bowser = 4096;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 4096;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 4096;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 4199;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 4199;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 4096;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 4096;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 4199;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 4096;
               break;
          }



     }
     if (mode > 0x00)
     {
          u13_Mario = GlobalFloatA;
          u13_Luigi = GlobalFloatA;
          u13_Yoshi = GlobalFloatA;
          u13_Toad = GlobalFloatA;
          u13_DK = GlobalFloatA;
          u13_Wario = GlobalFloatA;
          u13_Peach = GlobalFloatA;
          u13_Bowser = GlobalFloatA;
     }
     //
     //
     //









     //unknown14
     switch(mode)
     {
          case 0x00:
          {
               u14_Mario = 3844;
               u14_Luigi = 3844;
               u14_Yoshi = 3943;
               u14_Toad = 3943;
               u14_DK = 3844;
               u14_Wario = 3844;
               u14_Peach = 3943;
               u14_Bowser = 3844;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 3943;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 3943;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 3844;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 3943;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 3844;
               break;
          }



     }

     if (mode > 0x00)
     {
          u14_Mario = GlobalFloatA;
          u14_Luigi = GlobalFloatA;
          u14_Yoshi = GlobalFloatA;
          u14_Toad = GlobalFloatA;
          u14_DK = GlobalFloatA;
          u14_Wario = GlobalFloatA;
          u14_Peach = GlobalFloatA;
          u14_Bowser = GlobalFloatA;
     }
     //
     //
     //










     //cc50
     switch(mode)
     {
          case 0x00:
          {
               cc50_Mario = 290;
               cc50_Luigi = 290;
               cc50_Yoshi = 294;
               cc50_Toad = 294;
               cc50_DK = 290;
               cc50_Wario = 290;
               cc50_Peach = 294;
               cc50_Bowser = 290;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 290;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 290;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 294;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 294;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 290;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 290;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 294;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 290;
               break;
          }



     }
     if (mode > 0x00)
     {
          cc50_Mario = GlobalFloatA;
          cc50_Luigi = GlobalFloatA;
          cc50_Yoshi = GlobalFloatA;
          cc50_Toad = GlobalFloatA;
          cc50_DK = GlobalFloatA;
          cc50_Wario = GlobalFloatA;
          cc50_Peach = GlobalFloatA;
          cc50_Bowser = GlobalFloatA;
     }
     //
     //
     //









     //cc100
     switch(mode)
     {
          case 0x00:
          {
               cc100_Mario = 310;
               cc100_Luigi = 310;
               cc100_Yoshi = 314;
               cc100_Toad = 314;
               cc100_DK = 310;
               cc100_Wario = 310;
               cc100_Peach = 314;
               cc100_Bowser = 310;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 314;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 314;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 314;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 310;
               break;
          }



     }
     if (mode > 0x00)
     {
          cc100_Mario = GlobalFloatA;
          cc100_Luigi = GlobalFloatA;
          cc100_Yoshi = GlobalFloatA;
          cc100_Toad = GlobalFloatA;
          cc100_DK = GlobalFloatA;
          cc100_Wario = GlobalFloatA;
          cc100_Peach = GlobalFloatA;
          cc100_Bowser = GlobalFloatA;
     }
     //
     //
     //










     //cc150
     switch(mode)
     {
          case 0x00:
          {
               cc150_Mario = 320;
               cc150_Luigi = 320;
               cc150_Yoshi = 324;
               cc150_Toad = 324;
               cc150_DK = 320;
               cc150_Wario = 320;
               cc150_Peach = 324;
               cc150_Bowser = 320;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 320;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 320;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 324;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 324;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 320;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 320;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 324;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 320;
               break;
          }



     }
     if (mode > 0x00)
     {
          cc150_Mario = GlobalFloatA;
          cc150_Luigi = GlobalFloatA;
          cc150_Yoshi = GlobalFloatA;
          cc150_Toad = GlobalFloatA;
          cc150_DK = GlobalFloatA;
          cc150_Wario = GlobalFloatA;
          cc150_Peach = GlobalFloatA;
          cc150_Bowser = GlobalFloatA;
     }
     //
     //
     //










     //ccextra
     switch(mode)
     {
          case 0x00:
          {
               ccextra_Mario = 310;
               ccextra_Luigi = 310;
               ccextra_Yoshi = 314;
               ccextra_Toad = 314;
               ccextra_DK = 310;
               ccextra_Wario = 310;
               ccextra_Peach = 314;
               ccextra_Bowser = 310;
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 314;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 314;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 310;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 314;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 310;
               break;
          }



     }
     if (mode > 0x00)
     {
          ccextra_Mario = GlobalFloatA;
          ccextra_Luigi = GlobalFloatA;
          ccextra_Yoshi = GlobalFloatA;
          ccextra_Toad = GlobalFloatA;
          ccextra_DK = GlobalFloatA;
          ccextra_Wario = GlobalFloatA;
          ccextra_Peach = GlobalFloatA;
          ccextra_Bowser = GlobalFloatA;
     }
     //
     //
     //







     switch(mode)
     {
          case 0x00:
          {
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
               break;
          }
          case 0x01:
          {
               GlobalFloatA = 0;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 0;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 0.002;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 0.002;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = -0.002;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = -0.002;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 0.002;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = -0.002;
               break;
          }



     }
     if (mode > 0x00)
     {
          turncoA_Mario = GlobalFloatA;
          turncoA_Luigi = GlobalFloatA;
          turncoA_Yoshi = GlobalFloatA;
          turncoA_Toad = GlobalFloatA;
          turncoA_DK = GlobalFloatA;
          turncoA_Wario = GlobalFloatA;
          turncoA_Peach = GlobalFloatA;
          turncoA_Bowser = GlobalFloatA;
          turncoB_Mario = GlobalFloatA;
          turncoB_Luigi = GlobalFloatA;
          turncoB_Yoshi = GlobalFloatA;
          turncoB_Toad = GlobalFloatA;
          turncoB_DK = GlobalFloatA;
          turncoB_Wario = GlobalFloatA;
          turncoB_Peach = GlobalFloatA;
          turncoB_Bowser = GlobalFloatA;
     }




     switch(mode)
     {
          case 0x00:
          {
               tripleTap_Mario = 2;

               tripleTap_Luigi = 2;

               tripleTap_Yoshi = 3;

               tripleTap_Toad = 3;

               tripleTap_DK = 1.5;

               tripleTap_Wario = 1.5;

               tripleTap_Peach = 3;

               tripleTap_Bowser = 3;

               break;
          }
          case 0x01:
          {
               GlobalFloatA = 2;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 2;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 3;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 3;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 1.5;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 1.5;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 3;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 3;
               break;
          }



     }
     if (mode > 0x00)
     {
          tripleTap_Mario = GlobalFloatA;
          tripleTap_Luigi = GlobalFloatA;
          tripleTap_Yoshi = GlobalFloatA;
          tripleTap_Toad = GlobalFloatA;
          tripleTap_DK = GlobalFloatA;
          tripleTap_Wario = GlobalFloatA;
          tripleTap_Peach = GlobalFloatA;
          tripleTap_Bowser = GlobalFloatA;
     }

     switch(mode)
     {
          case 0x00:
          {
               turnangle_Mario = 1.25;

               turnangle_Luigi = 1.25;

               turnangle_Yoshi = 1.28;

               turnangle_Toad = 1.28;

               turnangle_DK = 1.15;

               turnangle_Wario = 1.15;

               turnangle_Peach = 1.28;

               turnangle_Bowser = 1.28;

               break;
          }
          case 0x01:
          {
               GlobalFloatA = 1.25;
               break;
          }
          case 0x02:
          {
               GlobalFloatA = 1.25;
               break;
          }
          case 0x03:
          {
               GlobalFloatA = 1.28;
               break;
          }
          case 0x04:
          {
               GlobalFloatA = 1.28;
               break;
          }
          case 0x05:
          {
               GlobalFloatA = 1.15;
               break;
          }
          case 0x06:
          {
               GlobalFloatA = 1.15;
               break;
          }
          case 0x07:
          {
               GlobalFloatA = 1.28;
               break;
          }
          case 0x08:
          {
               GlobalFloatA = 1.28;
               break;
          }



     }
     if (mode > 0x00)
     {
          turnangle_Mario = GlobalFloatA;
          turnangle_Luigi = GlobalFloatA;
          turnangle_Yoshi = GlobalFloatA;
          turnangle_Toad = GlobalFloatA;
          turnangle_DK = GlobalFloatA;
          turnangle_Wario = GlobalFloatA;
          turnangle_Peach = GlobalFloatA;
          turnangle_Bowser = GlobalFloatA;

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
