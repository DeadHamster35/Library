#include <stdbool.h>
#include <math.h>
#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"

#include "../library/LibraryVariables.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"
#include "../library/MarioKartObjects.h"
#include "../library/MarioKartStats.h"
#include "../RawAssets/ModelData/ModelData.h"
#include "../library/CustomLevels.h"
#include "../library/OKCustomObjects.h"








void PrintMenuTest()
{

}

void printGPTime(float printTime, int OffsetY)
{




     wholeNumber = (int) printTime;
     decimalNumber = (int) ((printTime - wholeNumber) * 100);



     if (decimalNumber < 0)
     {
          decimalNumber = decimalNumber * -1;
     }

     if (wholeNumber > 60)
     {
          minutes = (long)(floor)(wholeNumber/60);
          seconds = wholeNumber - (minutes * 60);
     }
     else
     {
          seconds = wholeNumber;
     }

     if (minutes >= 10)
     {
          if (minutes >= 100)
          {
               if (minutes >= 1000)
               {

                    printOffsetA = 40;
               }
               else
               {
                    printOffsetA = 32;
               }
          }
          else
          {
               printOffsetA = 24;
          }
     }
     else
     {
          printOffsetA = 16;
     }

     if (seconds >= 10)
     {
          if (seconds >= 100)
          {
               if (seconds >= 1000)
               {

                    printOffsetB = 40;
               }
               else
               {
                    printOffsetB = 32;
               }
          }
          else
          {
               printOffsetB = 24;
          }
     }
     else
     {
          printOffsetB = 16;
     }



     printOffsetB = printOffsetB + printOffsetA;


     loadFont();
     MenuPosition[1] = 170+(int)OffsetY;
     MenuPosition[0] = 55;

     printString(MenuPosition[0],MenuPosition[1],"Total Time:");

     MenuPosition[0] = 145;


     printString(MenuPosition[0] + printOffsetA, MenuPosition[1], "'");
     if (seconds < 10)
     {
          printStringNumber(MenuPosition[0] + printOffsetA,MenuPosition[1],"",0);
          printOffsetA = printOffsetA + 8;
          printOffsetB = printOffsetB + 8;
     }

     printString(MenuPosition[0] + printOffsetB, MenuPosition[1], "\"");
     if (decimalNumber < 10)
     {
          printStringNumber(MenuPosition[0]+printOffsetB,MenuPosition[1],"",0);
          printOffsetB = printOffsetB + 8;
     }




     printStringNumber(MenuPosition[0],MenuPosition[1],"",minutes);
     printStringNumber(MenuPosition[0] + printOffsetA,MenuPosition[1],"",seconds);
     printStringNumber(MenuPosition[0]+printOffsetB,MenuPosition[1],"",decimalNumber);



}



void printMap(char devParameter)
{
          if (g_playerCount == 1)
          {
               MenuPosition[0] = 25;
               MenuPosition[1] = 150;
               GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0] + 18, MenuPosition[1] + 18, MenuPosition[0] + 185, MenuPosition[1] + 68, 0, 0, 0, 175);
               GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0] + 18, MenuPosition[1] + 18 + (devParameter * 20), MenuPosition[0] + 74, MenuPosition[1] + 28 + (devParameter * 20), 200, 0, 0, 175);
               loadFont();


               printStringNumber(MenuPosition[0],MenuPosition[1],"  Map X:",g_mapX);
               printStringNumber(MenuPosition[0],MenuPosition[1]+10,"  Map Y:",g_mapY);
               printStringNumber(MenuPosition[0],MenuPosition[1]+20,"Start X:",g_startX);
               printStringNumber(MenuPosition[0],MenuPosition[1]+30,"Start Y:",g_startY);
               printString(MenuPosition[0],MenuPosition[1]+40,"  Scale:");

               wholeNumber = (int) (g_mapScale * 100);
               decimalNumber = (int) (((g_mapScale * 100) - wholeNumber) * 1000);

               if (decimalNumber < 0)
               {
                    decimalNumber = decimalNumber * -1;
               }
               if (wholeNumber >= 10)
               {
                    if (wholeNumber >= 100)
                    {
                         if (wholeNumber >= 1000)
                         {

                              printOffsetB = 8;
                         }
                         else
                         {
                         printOffsetB = 16;
                         }
                    }
                    else
                    {
                    printOffsetB = 24;
                    }
               }
               else
               {
                    printOffsetB = 32;
               }
               if (wholeNumber >= 0)
               {
                    printOffsetB = printOffsetB + 8;
               }

               printOffsetA = 56;

               if (decimalNumber < 100)
               {
                    printStringNumber(MenuPosition[0]+printOffsetA-4,MenuPosition[1]+ 40,"",0);
                    printOffsetC = 8;
               }
               else
               {
                    printOffsetC = 0;
               }
               MenuPosition[0] = 50;

               printStringNumber(MenuPosition[0]+printOffsetB,MenuPosition[1] + 40,"",wholeNumber);
               printString(MenuPosition[0]+printOffsetA,MenuPosition[1] + 40,".");
               printStringNumber(MenuPosition[0]+printOffsetA-4+printOffsetC,MenuPosition[1] + 40,"",decimalNumber);


     }

}





short CheckPlayerSelect(int TargetController, short Direction)
{
     short Target = PlayerCharacterSelect[TargetController];
     while (true)
     {
          GlobalBoolC = true;
          if (((Target + Direction) < 8) && ((Target + Direction) > -1))
          {
               Target += Direction;          
               for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
               {
                    if (ThisController != TargetController)
                    {
                         if (PlayerCharacterSelect[ThisController] == Target)
                         {
                              GlobalBoolC = false;
                         }
                    }
               }
               if (GlobalBoolC)
               {
                    return Target;
               }
          }
          else
          {
               return -1;
          }
     }
}

void PlayerSelectMenuStart()
{
     if (MenuChanged != 12)
     {
          MenuProgress[0] = 0;
          MenuProgress[1] = 0;
          MenuProgress[2] = 0;
          MenuProgress[3] = 0;
          MenuChanged = 12;          
     }
}

void PlayerSelectMenu(short StatsMode)
{
     
     
     GlobalIntC = *(int*)(long)(&PlayerOK);
     
     if ((KBGNumberNext) && (MenuBackup == 0))
     {
          KBGNumberNext = 0;
          
     }
     for (int ThisJump = 0; ThisJump < 8; ThisJump++)
     {
          jtbl_DispObjPsel[ThisJump] = 0x800A08C8;
     }

     *(int*)(long)&PlayerShowStats = 0;
     HotSwapID = 0;
     setPreviews();
     stockASM();
     hsLabel = -1;
     GlobalBoolB = true;
     GlobalBoolD = true;

     asm_BlinkCheck = 0x1420000E;

     for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
     {
                    
          //Set Portraits and Banner for Character Selected
          for (int ThisPortrait = 0; ThisPortrait < 8; ThisPortrait++)
          {
               SelectPortraitTable[ThisPortrait].TextureOffset[ThisController] = BackupPortraitTable[ThisPortrait].TextureOffset[(int)PlayerCharacterSelect[ThisController]];
          }
          SelectNamePlateTable.TextureOffset[ThisController] = BackupNamePlateTable.TextureOffset[(int)PlayerCharacterSelect[ThisController]];	
          //




          //Check Button Response
          if ((GlobalController[ThisController]->ButtonPressed & BTN_A) == BTN_A)
          {    
               if (PlayerOK[ThisController] < 2)
               {
                    PlayerOK[ThisController]++;
                    asm_DispOBSubPSelCursor1[ThisController] = 0x800A00FC;
               }
          }
          if ((GlobalController[ThisController]->ButtonPressed & BTN_B) == BTN_B)
          {
               if (PlayerOK[ThisController] > 0)
               {
                    PlayerOK[ThisController]--;
                    if (PlayerOK[ThisController] == 0)
                    {
                         asm_DispOBSubPSelCursor1[ThisController] = 0x800A08C8;     
                    }                    
               }
          }


          if (PlayerOK[ThisController] == 0)
          {
               GlobalBoolB = false;
               
          }
          jtbl_DispObjPsel[ThisController] = 0x800A01BC;
     }
     
     //
     if (MenuBackup == 0)
     {    
          if (StatsMode == 2)
          {
               GlobalBoolB = true;
               
               for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
               {
                    
                    SetEngine(CharacterConvert[PlayerCharacterSelect[ThisController] + 1],PlayerEngineSelect[ThisController]);
                    SetSteering(CharacterConvert[PlayerCharacterSelect[ThisController] + 1], PlayerSteerSelect[ThisController]);
                    
                    if (MenuProgress[ThisController] == 0)
                    {
                         PlayerOK[ThisController] = 0;
                         PlayerShowStats[ThisController] = 0;
                         asm_DispOBSubPSelCursor1[ThisController] = 0x800A08C8;

                         if ((GlobalController[ThisController]->AnalogPressed & BTN_DLEFT) == BTN_DLEFT)
                         {
                              if (CheckPlayerSelect(ThisController,-1) != -1)
                              {
                                   PlayerCharacterSelect[ThisController] = CheckPlayerSelect(ThisController, -1);
                              }
                              asm_BlinkCheck = 0;
                         }
                         else if ((GlobalController[ThisController]->AnalogPressed & BTN_DRIGHT) == BTN_DRIGHT)
                         {
                              if (CheckPlayerSelect(ThisController,1) != -1)
                              {
                                   PlayerCharacterSelect[ThisController] = CheckPlayerSelect(ThisController, 1);
                              }                         
                              asm_BlinkCheck = 0;
                         }
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_A) == BTN_A)
                         {    
                              MenuProgress[ThisController]++;
                         }
                    }
                    else if (MenuProgress[ThisController] == 1)
                    {
                         GlobalBoolB = false;
                         PlayerOK[ThisController] = 0;
                         PlayerShowStats[ThisController] = 1;
                         asm_DispOBSubPSelCursor1[ThisController] = 0x800A00FC;

                         if ((GlobalController[ThisController]->AnalogPressed & BTN_DLEFT) == BTN_DLEFT)
                         {
                              if ((int)PlayerEngineSelect[ThisController] > 0)
                              {
                                   PlayerEngineSelect[ThisController]--;                                   
                              }                         
                         }
                         else if ((GlobalController[ThisController]->AnalogPressed & BTN_DRIGHT) == BTN_DRIGHT)
                         {
                              if ((int)PlayerEngineSelect[ThisController] < 2)
                              {
                                   PlayerEngineSelect[ThisController]++;                                   
                              }                         
                         }
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_A) == BTN_A)
                         {    
                              MenuProgress[ThisController]++;
                         }
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_B) == BTN_B)
                         {    
                              MenuProgress[ThisController]--;
                         }
                    }
                    else if (MenuProgress[ThisController] == 2)
                    {
                         GlobalBoolB = false;
                         PlayerOK[ThisController] = 0;
                         PlayerShowStats[ThisController] = 1;
                         asm_DispOBSubPSelCursor1[ThisController] = 0x800A00FC;

                         if ((GlobalController[ThisController]->AnalogPressed & BTN_DLEFT) == BTN_DLEFT)
                         {
                              if ((int)PlayerSteerSelect[ThisController] > 0)
                              {
                                   PlayerSteerSelect[ThisController]--;                                   
                              }                        
                         }
                         else if ((GlobalController[ThisController]->AnalogPressed & BTN_DRIGHT) == BTN_DRIGHT)
                         {
                              if ((int)PlayerSteerSelect[ThisController] < 2)
                              {
                                   PlayerSteerSelect[ThisController]++;                                   
                              }                         
                         }
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_A) == BTN_A)
                         {    
                              MenuProgress[ThisController]++;
                         }
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_B) == BTN_B)
                         {    
                              MenuProgress[ThisController]--;
                         }
                    }
                    else if (MenuProgress[ThisController] == 3)
                    {
                         GlobalBoolB = false;
                         PlayerShowStats[ThisController] = 0;
                         PlayerOK[ThisController] = 1;
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_B) == BTN_B)
                         {    
                              MenuProgress[ThisController]--;
                         }
                    }
               }
               if (GlobalBoolB)
               {
                    if ((GlobalController[4]->ButtonPressed & BTN_B) == BTN_B)
                    {
                         SetFadeOutB();
                         *(int*)(long)&PlayerShowStats = 0;
                         MenuBackup = 1;
                    }   
               }
          }
          else
          {
               GlobalBoolB = true;
               for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
               {
                    if (MenuProgress[ThisController] == 0)
                    {
                         PlayerShowStats[ThisController] = 1;
                         asm_DispOBSubPSelCursor1[ThisController] = 0x800A08C8;
                         PlayerOK[ThisController] = 0;

                         if ((GlobalController[ThisController]->AnalogPressed & BTN_DLEFT) == BTN_DLEFT)
                         {
                              if (CheckPlayerSelect(ThisController,-1) != -1)
                              {
                                   PlayerCharacterSelect[ThisController] = CheckPlayerSelect(ThisController, -1);
                              }                         
                              asm_BlinkCheck = 0;
                         }
                         else if ((GlobalController[ThisController]->AnalogPressed & BTN_DRIGHT) == BTN_DRIGHT)
                         {
                              if (CheckPlayerSelect(ThisController,1) != -1)
                              {
                                   PlayerCharacterSelect[ThisController] = CheckPlayerSelect(ThisController, 1);
                              }                         
                              asm_BlinkCheck = 0;
                         }
                         if ((GlobalController[ThisController]->ButtonPressed & BTN_A) == BTN_A)
                         {    
                              MenuProgress[ThisController]++;
                         }
                    }
                    else if (MenuProgress[ThisController] == 1)
                    {
                         PlayerShowStats[ThisController] = 0;
                         PlayerOK[ThisController] = 1;
                         asm_DispOBSubPSelCursor1[ThisController] = 0x800A00FC;

                         GlobalBoolB = false;

                         
                    }
               }                              
               if (GlobalBoolB)
               {
                    if ((GlobalController[4]->ButtonPressed & BTN_B) == BTN_B)
                    {
                         SetFadeOutB();
                         *(int*)(long)&PlayerShowStats = 0;
                         MenuBackup = 1;
                    }   
               }            
          }          
     }
          
     GlobalBoolA = true;
     for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
     {
          if (PlayerOK[ThisController] == 0)
          {
               GlobalBoolA = false;
          }
     }
     if (GlobalBoolA)
     {
          if (menuScreenC !=2)
          {
               menuScreenC = 2;
          }
          else
          {
               if ((GlobalController[4]->ButtonPressed & BTN_A) == BTN_A)
               {
                    SetFadeOut(30);
               }
          }
     }


     if ((menuScreenC == 2) && ((GlobalController[4]->ButtonPressed & BTN_B) == BTN_B))
     {
          menuScreenC = 1;
          for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
          {
               PlayerOK[ThisController] = 0;
               if (StatsMode == 0)
               {
                    MenuProgress[ThisController] = 1;
               }
               else
               {
                    MenuProgress[ThisController] = 0;
               }
          }
          asm_DispOBSubPSelCursor1[0] = 0x800A08C8;
          asm_DispOBSubPSelCursor1[1] = 0x800A08C8;
          asm_DispOBSubPSelCursor1[2] = 0x800A08C8;
          asm_DispOBSubPSelCursor1[3] = 0x800A08C8;
     }
     
     for (int CurrentHUD = 0; CurrentHUD < 32; CurrentHUD++)
     {
          if ((GlobalMenuHUD[CurrentHUD].kind >= KO_PSEL_MA) && (GlobalMenuHUD[CurrentHUD].kind <= KO_PSEL_KU))
          {
               GlobalMenuHUD[CurrentHUD].pattern = 4;               
          }
     }
}
void MapSelectMenuBefore()
{     
     if (MenuChanged != 13)
     {
          HotSwapID = 0;
          MenuChanged = 13;
          setLabel();
          setPreviews();
     }
}

void PlayerSelectMenuAfter()
{
     HotSwapID = 0;
     if (MenuChanged != 13)
     {
          for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
          {
               asm_DispOBSubPSelCursor1[ThisController] = 0x800A08C8;
               g_CharacterSelections[ThisController] = CharacterConvert[(int)PlayerCharacterSelect[ThisController] + 1];
               PlayerCharacterSelect[ThisController] = ThisController;
               MenuProgress[ThisController] = 0;
          }
          MenuChanged = 13;
     }
}

void GameSelectMenu()
{
     HotSwapID = 0;
     GlobalBoolD = true;
     
     GlobalBoolC = false;

     GlobalIntA = 160 - ((g_playerCount * 64 + ((g_playerCount - 1) * 6)) / 2);
     for (int ThisPlayer = 0; ThisPlayer < g_playerCount; ThisPlayer++)
     {
          PlayerSelectPositions[ThisPlayer].x = GlobalIntA;
          GlobalIntA += 70;
     }
     MenuBackup = 0;

     if (MenuChanged != 11)
     {
          for (int ThisController = 0; ThisController < g_playerCount; ThisController++)
          {						
               PlayerCharacterSelect[ThisController] = ThisController;
               asm_DispOBSubPSelCursor1[ThisController] = 0x800A08C8;
          }
          MenuChanged = 11;
     }
     
}



void MapSelectMenu()
{
     
     if (g_gameMode == 3)
     {
          GlobalShortA = 4;
     }
     else
     {
          GlobalShortA = 1;
     }
     if (menuScreenA == GlobalShortA)
     {
          if ((GlobalController[0]->ButtonPressed & BTN_L) == BTN_L)
          {
               swapHS(0);
          }
          else if ((GlobalController[0]->ButtonPressed & BTN_R) == BTN_R)
          {
               swapHS(1);
          }
     }

     *(int*)(&PlayerOK) = 0;
     if ((HotSwapID > 0) && (!GlobalBoolD))
     {
     GlobalBoolD = true;
          setBanners();
     }
     switch(g_gameMode)
     {
          //GRAND PRIX

          case 0:
          {
               if (courseValue != (g_cupSelect * 4))
               {
                    courseValue = (g_cupSelect * 4);
                    loadHotSwap(courseValue);
               }
               break;
          }
          case 1:
          case 2:
          case 3:
          {
               if (courseValue != (g_cupSelect * 4)  + g_courseSelect)
               {

                    courseValue = (g_cupSelect * 4) + g_courseSelect;
                    loadHotSwap(courseValue);
               }
               break;
          }
     }

     if (hsLabel != HotSwapID)
     {
          setLabel();
          hsLabel = HotSwapID;
     }
     
}


void DrawPlayerSelect(short StatsMode)
{
     
     for (int CurrentPlayer = 0; CurrentPlayer < g_playerCount; CurrentPlayer++)
     {	
          
          //printStringNumber(5,5,"",(int)(GlobalStat.PowerDownRT[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] +1]][7] * 1000));
          //printStringUnsignedHex(5,15,"",(int)(&GlobalStat.PowerDownRT[0][0]));
          if (PlayerShowStats[CurrentPlayer])
          {
               //printStringNumber(5,5,"PlayerSelect",GlobalIntC);
               GlobalIntA = PlayerSelectPositions[CurrentPlayer].x -1;
               GlobalIntB = PlayerSelectPositions[CurrentPlayer].y +79;
               
               if ((MenuProgress[CurrentPlayer] == 1) && (StatsMode == 2))
               {
                    if (MenuFlash[CurrentPlayer] > 255)
                    {
                         MenuFlash[CurrentPlayer] = 0;
                    }
                    else
                    {
                         MenuFlash[CurrentPlayer]+=10;
                    }		
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA - 1,GlobalIntB - 1,GlobalIntA + 65,GlobalIntB + 51,(int)MenuFlash[CurrentPlayer],(int)MenuFlash[CurrentPlayer],(int)MenuFlash[CurrentPlayer],255);	
                              
               }
               GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB,GlobalIntA + 64,GlobalIntB + 50,0,0,0,255);	
               
               

               if ((MenuProgress[CurrentPlayer] == 2) && (StatsMode == 2))
               {
                    if (MenuFlash[CurrentPlayer] > 255)
                    {
                         MenuFlash[CurrentPlayer] = 0;
                    }
                    else
                    {
                         MenuFlash[CurrentPlayer]+=10;
                    }		
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA-1,GlobalIntB + 53,GlobalIntA + 65,GlobalIntB + 71,(int)MenuFlash[CurrentPlayer],(int)MenuFlash[CurrentPlayer],(int)MenuFlash[CurrentPlayer],255);			
               }
               GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 54,GlobalIntA + 64,GlobalIntB + 70,0,0,0,255);
               
               
               GlobalIntA = PlayerSelectPositions[CurrentPlayer].x + 3;
               for (int ThisBox = 0; ThisBox < 6; ThisBox++)
               {
                    
                    GlobalIntB = PlayerSelectPositions[CurrentPlayer].y + 91;
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB,GlobalIntA + 8,GlobalIntB + 3,255,255,255,255);
                    GlobalIntB +=17;
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB,GlobalIntA + 8,GlobalIntB + 3,255,255,255,255);
                    GlobalIntB +=17;
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB,GlobalIntA + 8,GlobalIntB + 3,255,255,255,255);
                    GlobalIntB +=20;
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB,GlobalIntA + 8,GlobalIntB + 3,255,255,255,255);
                    GlobalIntA += 10;
               }
               
               

               
               
               GlobalIntA = PlayerSelectPositions[CurrentPlayer].x + 3;
               GlobalIntB = PlayerSelectPositions[CurrentPlayer].y +79;

               GlobalIntB +=12;
               if (StatsMode != 2)
               {
                    GlobalIntC = 58 - (58 * 8 * (1 - (GlobalStat.AccelerationCount[g_raceClass][(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] + 1]] / GlobalStat.AccelerationCount[g_raceClass][6])));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
                    GlobalIntB +=17;
                    GlobalIntC = 58 + (58 * (1 - (GlobalStat.PowerDownRT[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] +1]][7] / GlobalStat.PowerDownRT[6][7])));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
                    GlobalIntB +=17;
                    GlobalIntC = 58 * (GlobalStat.PowerBandAcceleration[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] + 1]] / GlobalStat.PowerBandAcceleration[6]);
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
                    GlobalIntB +=20;
                    GlobalIntC = 58 + (58 * (1 - (GlobalStat.ProOffsetAngle[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] + 1]] / GlobalStat.ProOffsetAngle[7])));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
               }
               else
               {
                    GlobalIntC = 58 - (58 * 8 * (1 - (GlobalStat.AccelerationCount[g_raceClass][(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] + 1]] / (float)(EngineSpeed[g_raceClass][2]))));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
                    GlobalIntB +=17;
                    GlobalIntC = 58 + (58 * (1 - (GlobalStat.PowerDownRT[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] +1]][7] /((float)EnginePowerDownRT[1][7] / 100))));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
                    GlobalIntB +=17;
                    GlobalIntC = 29 + (29 * (GlobalStat.PowerBandAcceleration[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] + 1]] /((float)PowerBand[1] / 10)));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);
                    GlobalIntB +=20;
                    GlobalIntC = 58 + (58 * (1 - (GlobalStat.ProOffsetAngle[(int)CharacterConvert[(int)PlayerCharacterSelect[CurrentPlayer] + 1]] /((float)SteerAngle[2] / 100))));
                    
                    GraphPtr = FillRect1ColorF(GraphPtr,GlobalIntA,GlobalIntB + 1,GlobalIntA + GlobalIntC,GlobalIntB + 2,255,0,0,255);					
               }


               
               GlobalIntA = PlayerSelectPositions[CurrentPlayer].x;
               GlobalIntB = PlayerSelectPositions[CurrentPlayer].y +79;

               GlobalIntB -= 18;
               GlobalIntA -= 16;
               loadFont();
               SetFontColor(31,15,15,15,8,16);
               printString(GlobalIntA,GlobalIntB,"Speed");
               
               GlobalIntB +=17;
               printString(GlobalIntA,GlobalIntB,"Grip");
               
               GlobalIntB +=17;
               printString(GlobalIntA,GlobalIntB,"Boost");
               
               GlobalIntB +=20;
               printString(GlobalIntA,GlobalIntB,"Steer");
               
          }	
     }
}