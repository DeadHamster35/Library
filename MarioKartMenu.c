#include "MainInclude.h"








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



void printMap(int devParameter)
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
     stockASM();
     hsLabel = -1;
     GlobalBoolB = true;

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
          if ((GlobalController[0]->ButtonPressed & BTN_Z) == BTN_Z)
          {
               swapHS(0);
          }
          else if ((GlobalController[0]->ButtonPressed & BTN_R) == BTN_R)
          {
               swapHS(1);
          }
     }

     *(int*)(&PlayerOK) = 0;
     if (HotSwapID > 0)
     {
          courseValue = -1;
          gpCourseIndex = 0;
          switch(g_gameMode)
          {
               //GRAND PRIX

               case 0:
               {
                    if (courseValue != (g_cupSelect * 4))
                    {
                         courseValue = (g_cupSelect * 4);
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
                         
                    }
                    break;
               }
          }
     }
     else
     {
          LoadCustomHeader(-1);
     }
     
     if (KBGChange == 0)
     {          
          if (hsLabel != HotSwapID)
          {
               setLabel();               
               hsLabel = HotSwapID;
          }
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

int numPlaces (int n) 
{
    if (n < 0) return 0;
    if (n < 10) return 1;
    if (n < 100) return 2;
    if (n < 1000) return 3;
    if (n < 10000) return 4;
    if (n < 100000) return 5;
    if (n < 1000000) return 6;
    if (n < 10000000) return 7;
    if (n < 100000000) return 8;
    return 9;
}

void DrawNumberSprite(int x, int y, int number)
{
	SprDrawClipST(x,y,8,16,number*8,0,1);
}

//Prints a value with right-handed number sprites
void printNumberSprite(int X, int Y, int Value)
{
	KWSprite(1000,1000,104,16,StockNumberSprites);

	char negativeVal = 0;

	if (Value < 0)
	{
		Value = Value*-1;
		negativeVal = 1;
	}

	int digit[9] = {
	((Value%10)),
	((Value%100)/10),
	((Value%1000)/100),
	((Value%10000)/1000),
	((Value%100000)/10000),
	((Value%1000000)/100000),
	((Value%10000000)/1000000),
	((Value%100000000)/10000000),
	((Value%1000000000)/100000000)
	};

	for (int index = 0; index < numPlaces(Value); index++)
	{
		DrawNumberSprite(X-9*index, Y, digit[index]);
		if (negativeVal == 1)
		{
			DrawNumberSprite(X-9*(numPlaces(Value)), Y+4, 11);
			DrawNumberSprite(X-9*(numPlaces(Value)), Y+4, 10);
			negativeVal = 0;
		}
	}
}

char ReturnStringLength(char *stringAddress)
{
	GlobalCharE = 0;
	GlobalCharA = *(char*)stringAddress;
	if(GlobalCharA != 0)
	{
		do
		{
			++GlobalCharE;
			GlobalCharA = (*(char*)(stringAddress + GlobalCharE));
		}
		while (GlobalCharA != 0);
	}
	return(GlobalCharE);
}



///////////////HUD Buttons///////////////
/*
void loadHudButtons()
{
     *sourceAddress = (int)(&HudButtonsROM);
     *targetAddress = (int)(&ok_FreeSpace);
     dataLength = 0x4400;
     runDMA();
     *sourceAddress = (int)(&ok_FreeSpace);
     *targetAddress = (int)(&hud_buttons);
     runMIO();
}
*/

void SpriteBtnA(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x100));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x100),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,hud_buttons);
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,hud_buttons,16,16);
          }
          break;
     }
}

void SpriteBtnB(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x300));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x300),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x200));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x200),16,16);
          }
          break;
     }
}

void SpriteBtnStart(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x500));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x500),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x400));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x400),16,16);
          }
          break;
     }
}

void SpriteBtnCUp(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x700));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x700),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x600));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x600),16,16);
          }
          break;
     }
}

void SpriteBtnCDown(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x900));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x900),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x800));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x800),16,16);
          }
          break;
     }
}

void SpriteBtnCLeft(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0xB00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0xB00),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0xA00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0xA00),16,16);
          }
          break;
     }
}

void SpriteBtnCRight(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0xD00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0xD00),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0xC00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0xC00),16,16);
          }
          break;
     }
}

void SpriteBtnL(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0xF00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0xF00),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0xE00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0xE00),16,16);
          }
          break;
     }
}

void SpriteBtnR(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1100));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1100),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1000));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1000),16,16);
          }
          break;
     }
}

void SpriteBtnZ(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1300));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1300),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1200));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1200),16,16);
          }
          break;
     }
}


void SpriteBtnDUp(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1500));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1500),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1400));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1400),16,16);
          }
          break;
     }
}

void SpriteBtnDDown(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1700));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1700),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1600));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1600),16,16);
          }
          break;
     }
}

void SpriteBtnDLeft(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1900));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1900),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1800));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1800),16,16);
          }
          break;
     }
}

void SpriteBtnDRight(int posx, int posy, float scale, bool pressed)
{
     switch (pressed)
     {
     case true:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1B00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1B00),16,16);
          }
          break;
     
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1A00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1A00),16,16);
          }
          break;
     }
}

void SpriteBtnDMid(int posx, int posy, float scale)
{

     if (scale == 1 || scale == 0)
     {
          KWSprite(posx,posy,16,16,(hud_buttons+0x1C00));
     }
     else
     {
          KWSprite(0,0,0,0,hud_buttons);
          KWSpriteScale(posx,posy,scale,(hud_buttons+0x1C00),16,16);
     }
}

//Direction: 0-Mid; 1-Up; 2-Down; 3-Left; 4-Right
void SpriteAnalogStick(int posx, int posy, float scale, char direction)
{
     switch (direction)
     {
     case 1: //UP
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1E00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1E00),16,16);
          }
          break;
     case 2: //DOWN
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1F00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1F00),16,16);
          }
          break;
     case 3: //LEFT
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x2000));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x2000),16,16);
          }
          break;
     case 4: //RIGHT
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x2100));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x2100),16,16);
          }
          break;	
     default:
          if (scale == 1 || scale == 0)
          {
               KWSprite(posx,posy,16,16,(hud_buttons+0x1D00));
          }
          else
          {
               KWSprite(0,0,0,0,hud_buttons);
               KWSpriteScale(posx,posy,scale,(hud_buttons+0x1D00),16,16);
          }
          break;
     }
}


     
/*
void loadNiceFont()
{
	*sourceAddress = (int)(&NiceFontROM);
	*targetAddress = (int)(&ok_FreeSpace);
	dataLength = 0x4400;
	runDMA();
	*sourceAddress = (int)(&ok_FreeSpace);
	*targetAddress = (int)(&nicefont);
	runMIO();
}
*/


void PrintNiceText(int posx, int posy, float scale, char *text)
{
	char *FontString = text;


	for (int i = 0; i < ReturnStringLength(text); i++)
	{
		if (text[i] < 33)
		{
			continue;
		}

		if (text[i] > 127)
		{
			continue;
		}
		if (text[i] >= 97 && text[i] <= 122)
		{
			if (scale == 1 || scale == 0)
			{
				KWSprite(posx+i*7,posy,8,16,(nicefont+0x80*(FontString[i]-64)-0x80));
			}
			else
			{
				KWSprite(0,0,0,0,nicefont);
				KWSpriteScale(posx+i*8*scale,posy,scale,(nicefont+0x80*(FontString[i]-64)-0x80),8,16);
			}
			continue;
		}
		if (text[i] >= 123 && text[i] <= 127)
		{
			if (scale == 1 || scale == 0)
			{
				KWSprite(posx+i*7,posy,8,16,(nicefont+0x80*(FontString[i]-58)-0x80));
			}
			else
			{
				KWSprite(0,0,0,0,nicefont);
				KWSpriteScale(posx+i*8*scale,posy,scale,(nicefont+0x80*(FontString[i]-58)-0x80),8,16);
			}
			continue;
		}			
		else
		{
			if (scale == 1 || scale == 0)
			{
				KWSprite(posx+i*7,posy,8,16,(nicefont+0x80*(FontString[i]-32)-0x80));
			}
			else
			{
				KWSprite(0,0,0,0,nicefont);
				KWSpriteScale(posx+i*8*scale,posy,scale,(nicefont+0x80*(FontString[i]-32)-0x80),8,16);
			}
		}
	}
}



void PrintNiceTextNumber(int posx, int posy, float scale, char *text, int value)
{
	PrintNiceText(posx, posy, scale, text);

	char negativeVal = 0;

	if (value < 0)
	{
		value = value*-1;
		negativeVal = 1;
	}

	int digit[9] = {
	((value%10)),
	((value%100)/10),
	((value%1000)/100),
	((value%10000)/1000),
	((value%100000)/10000),
	((value%1000000)/100000),
	((value%10000000)/1000000),
	((value%100000000)/10000000),
	((value%1000000000)/100000000)
	};




	char valstring[50];
	for (int a = 0; a < 50; a++)
	{
		valstring[a] = 32;
	}
	
	for (int i = 0; i < numPlaces(value); i++)
	{
		if (i > 9)
		{
			continue;
		}
		valstring[i] = (digit[numPlaces(value)-1-i] + 48);
	}

	PrintNiceText((scale*14)+posx+(ReturnStringLength(text))*7*scale, posy, scale, valstring);		

	if (negativeVal == 1)
	{
		PrintNiceText((scale*7)+posx+(ReturnStringLength(text))*7*scale, posy, scale, "-");
		negativeVal = 0;
	}
}




