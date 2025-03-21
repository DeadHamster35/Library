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
     
     MenuPosition[0] = 25;
     MenuPosition[1] = 150;
     GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0] + 18, MenuPosition[1] + 18, MenuPosition[0] + 185, MenuPosition[1] + 68, 0, 0, 0, 175);
     GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0] + 18, MenuPosition[1] + 18 + (devParameter * 10), MenuPosition[0] + 74, MenuPosition[1] + 28 + (devParameter * 10), 200, 0, 0, 175);
     loadFont();


     printStringNumber(MenuPosition[0],MenuPosition[1],"  Map XY:",g_mapX);
     printStringNumber(MenuPosition[0]+112,MenuPosition[1],"",g_mapY);
     printStringNumber(MenuPosition[0],MenuPosition[1]+10,"Start XY:",g_startX);
     printStringNumber(MenuPosition[0]+112,MenuPosition[1]+10,"",g_startY);
     printString(MenuPosition[0],MenuPosition[1]+20,"   Scale:");               
     printFloat(MenuPosition[0] + 72,MenuPosition[1]+20,(g_mapScale * 100.0f));
     printStringNumber(MenuPosition[0],MenuPosition[1]+30,"Line XY:",RadarLineX);
     printStringNumber(MenuPosition[0]+112,MenuPosition[1]+30,"",RadarLineY);
               

     

}


void CourseMenu(int Alpha)
{
     
     DrawBox(50,10,220,121,0,0,0,Alpha);
     
     DrawBox(48,8,2,124,255,0,0,255);
     DrawBox(270,8,2,124,255,0,0,255);
     DrawBox(50,8,220,2,255,0,0,255);
     DrawBox(50,130,220,2,255,0,0,255);
     DrawBox(60,32,200,1,0,0,0,255);
     KWSprite(80,22,16,16,(ushort*)&lit_arrowsprite_l);
     
     

     if (ParameterIndex == 0) //currentParameter
     {
          MenuPosition[0] = 157 -(10 * 4);
          GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0], 19, MenuPosition[0] + (10 * 8), 29, 200, 0, 0, 200);
     }
     else if (ParameterIndex == 1) //currentParameter
     {
          MenuPosition[0] = 155 - ((cupChar[MenuCup]) * 4);
          GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0], 41, MenuPosition[0] + (cupChar[MenuCup] * 8), 51, 0, 200, 0, 200);
     }
     else
     {
          if (SYSTEM_Region == 0x00)
          {
               GlobalAddressA = (cup_PAL + (MenuCup * 8) + ((ParameterIndex - 2) * 2));
          }
          else
          {
               GlobalAddressA = (cup_NTSC + (MenuCup * 8) + ((ParameterIndex - 2) * 2));
          }
          short *l_courseID = (short *)GlobalAddressA;
          MenuPosition[0] = 157 - ((courseChar[(long)*l_courseID]) * 4);
          MenuPosition[1] = ((ParameterIndex - 1) * 14) + 44;
          GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0], MenuPosition[1], MenuPosition[0] + (courseChar[(long)*l_courseID] * 8), MenuPosition[1]+11, 0, 0, 200, 200);
     }
     LoopValue = 0;
     loadFont();
     printString(98,0,"Cup Editor");
     MenuPosition[0] = 135 - (cupChar[MenuCup] * 4);
     printString(MenuPosition[0],22,cupNames[MenuCup]);
     MenuPosition[1] = 40;
     do{
          if (SYSTEM_Region == 0x00)
          {
               GlobalAddressA = (cup_PAL + (MenuCup * 8) + LoopValue * 2);
          }
          else
          {
               GlobalAddressA = (cup_NTSC + (MenuCup * 8) + LoopValue * 2);
          }
          short *l_courseID = (short *)GlobalAddressA;
          MenuPosition[0] = 138 - (courseChar[(long)*l_courseID] * 4);
          printString(MenuPosition[0],MenuPosition[1],courseNames[(long)*l_courseID]);
          MenuPosition[1] = MenuPosition[1] + 14;
          LoopValue++;
     } while (LoopValue < 4);
}

float FPSA, FPSB;
void DrawFPS(int X, int Y)
{     
    if (GlobalFrameCount % 5 == 0)
    {
        FPSA = (1 * CPU2SEC) / CycleCount[0];
        FPSB = (1 * CPU2SEC) / CycleCount[1];
    }
    loadFont();
    printDecimal(X,Y,FPSA, 2);         
    printDecimal(X,Y + 10,FPSB, 2); 
}




void ModularMenu(OKMenu* OptionsMenu)
{
     if (MenuBlink > 30)
     {
          MenuBlink = 0;
     }
     else
     {
          MenuBlink++;
     }
     
     DrawBox(30,10,260,200,0,0,0,200);
     
     DrawBox(28,8,2,203,255,0,0,255);
     DrawBox(290,8,2,203,255,0,0,255);
     DrawBox(30,8,260,2,255,0,0,255);
     DrawBox(30,209,260,2,255,0,0,255);
     DrawBox(40,32,240,1,0,0,0,255);

     
     if (ParameterIndex == 0) //currentParameter
     {
          MenuPosition[0] = 158 - ((OptionsMenu->PanelAddress[MenuIndex].NameLength) * 4);
          GraphPtr = FillRect1ColorF(GraphPtr, MenuPosition[0], 19, MenuPosition[0] + ((OptionsMenu->PanelAddress[MenuIndex].NameLength) * 8), 29, 200, 0, 0, 200);
     }
     else
     {
          MenuPosition[1] = ParameterIndex * 19 + 32;          
          if (MenuBlink < 29)  
          {
               KWSprite(38,MenuPosition[1]+2,16,16,(ushort*)&lit_red_selecter);
          }
     }

     LoopValue = 0;
     MenuPosition[0] = 138 - ((OptionsMenu->PanelAddress[MenuIndex].NameLength) * 4);
     
     
     
     loadFont();
     SetFontColor(255,255,255,75,75,75);
     
     printString(MenuPosition[0],0,(char*)OptionsMenu->PanelAddress[MenuIndex].NameAddress);
     
     MenuPosition[1] = 30;
     
     if (OptionsMenu->PanelAddress[MenuIndex].OptionCount > 7)
     {
          GlobalShortB = 7;
     }
     else
     {
          GlobalShortB = OptionsMenu->PanelAddress[MenuIndex].OptionCount;
     }
     for (LoopValue = 0; LoopValue < GlobalShortB; LoopValue++)
     {
          OKOption* ThisOption = (OKOption*)(&OptionsMenu->PanelAddress[MenuIndex].Options[LoopValue + (long)MenuOverflow]);          
          printString(30,MenuPosition[1],(char*)ThisOption->OptionName);
          GlobalShortA = (int)OptionsMenu->PanelAddress[MenuIndex].ParameterToggles[LoopValue + (long)MenuOverflow];
          MenuPosition[0] = 220 - (ThisOption->ParameterLengths[GlobalShortA] * 4);          
          printString(MenuPosition[0],MenuPosition[1],(char*)ThisOption->ParameterNames[GlobalShortA]);
          MenuPosition[1] = MenuPosition[1] + 19;     
     } 
     
     if ((MenuOverflow + 7) < OptionsMenu->PanelAddress[MenuIndex].OptionCount)  //menuOverflowIndex
     {
          if (MenuBlink < 15)  //used for blinking down arrow
          {
               KWSprite(161,190,16,16,(ushort*)&lit_arrowsprite_d);
          }
     }
     if (MenuOverflow > 0)  //menuOverflowIndex
     {
          if (MenuBlink < 15)  //used for blinking down arrow
          {
               KWSprite(161,40,16,16,(ushort*)&lit_arrowsprite_u);
          }
     }
     if (MenuIndex > 0)  //used for left arrow
     {
          KWSprite(80,22,16,16,(ushort*)&lit_arrowsprite_l);
     }
     if (MenuIndex < OptionsMenu->PanelCount)  //used for right arrow
     {
          KWSprite(240,22,16,16,(ushort*)&lit_arrowsprite_r);
     }
}






void DrawMapSelectDefault()
{
     DrawBox(65,18,190,25,0,0,0,175);
     if (HotSwapID == 0)
     {
          PrintBigText(80,16, 0.9f,"Original Set");
     }
     else if (HotSwapID < 10)
     {
          PrintBigTextNumberNoGap(80,16, 0.9f,"Custom Set ",HotSwapID);
     }
     else
     {
          PrintBigTextNumberNoGap(80,16, 0.9f,"Custom Set",HotSwapID);
     }
     SpriteBtnCLeft(45,35,1.0,false);
     SpriteBtnCRight(279,35,1.0,false);
     
}


void MapSelectMenuDefault()
{
     

     
     if (g_gameMode == GAMEMODE_BATTLE)
     {
          GlobalShortA = 4;
     }
     else
     {
          GlobalShortA = 1;
     }
     if (menuScreenA == GlobalShortA)
     {
        if ((GlobalController[4]->ButtonPressed & BTN_CLEFT) == BTN_CLEFT)
        {
            swapHS(0);
        }
        else if ((GlobalController[4]->ButtonPressed & BTN_CRIGHT) == BTN_CRIGHT)
        {
            swapHS(1);
        }
        LoadCustomHeader(courseValue);

        
        if ((GlobalController[4]->ButtonPressed & BTN_R) == BTN_R)
        {
            MenuToggle = !MenuToggle;
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
                    courseValue = (g_cupSelect * 4);                    
                    break;
               }
               case 1:
               case 2:
               case 3:
               {
                    courseValue = (g_cupSelect * 4) + g_courseSelect;
                    break;
               }
          }
     }
     else
     {
          LoadCustomHeader(-1);
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

int ReturnStringLength(char *stringAddress)
{
	GlobalIntA = 0;
	GlobalCharA = *(char*)stringAddress;
	if(GlobalCharA != 0)
	{
		do
		{
			++GlobalIntA;
			GlobalCharA = (*(char*)(stringAddress + GlobalIntA));
		}
		while (GlobalCharA != 0);
	}
	return(GlobalIntA);
}



///////////////HUD Buttons///////////////

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


void PrintBigText(int posx, int posy, float scale, char *text)
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
			GlobalAddressA = (uint)((&nicefont[0])+(0x200*(FontString[i]-64)-0x200));
               KWTexture2DRGBA(posx+(scale*i*16),posy,0,scale,(uchar*)GlobalAddressA,(void*)(&V1632), 16, 32, 16, 32);
			continue;
		}
		if (text[i] >= 123 && text[i] <= 127)
		{
			GlobalAddressA = (uint)((&nicefont[0])+(0x200*(FontString[i]-58)-0x200));
               KWTexture2DRGBA(posx+(scale*i*16),posy,0,scale,(uchar*)GlobalAddressA,(void*)(&V1632), 16, 32, 16, 32);
			continue;
		}			
		else
		{
			GlobalAddressA = (uint)((&nicefont[0])+(0x200*(FontString[i]-32)-0x200));
               KWTexture2DRGBA(posx+(scale*i*16),posy,0,scale,(uchar*)GlobalAddressA,(void*)(&V1632), 16, 32, 16, 32);
		}
	}
}


void PrintBigTextNumber(int posx, int posy, float scale, char *text, int value)
{
	PrintBigText(posx, posy, scale, text);
     
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

	PrintBigText((scale*32)+posx+(ReturnStringLength(text))*15*scale, posy, scale, valstring);		

	if (negativeVal == 1)
	{
		PrintBigText((scale*15)+posx+(ReturnStringLength(text))*15*scale, posy, scale, "-");
		negativeVal = 0;
	}
}



void PrintBigTextNumberNoGap(int posx, int posy, float scale, char *text, int value)
{
	PrintBigText(posx, posy, scale, text);
     
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

	PrintBigText((scale*32)+posx+(ReturnStringLength(text) -1)*15*scale, posy, scale, valstring);		

	if (negativeVal == 1)
	{
		PrintBigText((scale*15)+posx+(ReturnStringLength(text) -1)*15*scale, posy, scale, "-");
		negativeVal = 0;
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


void DisplayCrashScreen()
{
     
}






void drawButtonInputDisplay(bool FullMenu)
{
	if (g_startingIndicator < 3 || g_startingIndicator > 4 || g_playerCount > 2)
	{
		return;
	}
	
	short PosX[4], PosY[4];
	short OffsetX = 85, OffsetY = 55;
	float scale = 0.5f;
	switch (g_playerCount)
	{
	case 2:
		OffsetY = 30;
		break;
	}

	for (int i = 0; i < g_playerCount; i++)
	{

		if (GlobalPlayer[i].flag&IS_CPU_PLAYER)
		{
			continue;
		}
		

		PosX[i] = GlobalScreen[i]->posx-GlobalScreen[i]->width/2 +OffsetX;
		PosY[i] = GlobalScreen[i]->posy-GlobalScreen[i]->height/2 +OffsetY;

		GraphPtr = FillRect1ColorF(GraphPtr,
		PosX[i] - 20, PosY[i] - 22, PosX[i] + 40, PosY[i] + 10, //x1, y1, x2, y2
		0, 0, 0, 64); //r, g, b, a

		if (GlobalController[i]->ButtonHeld&BTN_A)
		{
			SpriteBtnA(PosX[i]+21,PosY[i]+3,scale,1);
		}
		else
		{
			SpriteBtnA(PosX[i]+21,PosY[i]+3,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_B)
		{
			SpriteBtnB(PosX[i]+15,PosY[i]-3,scale,1);
		}
		else
		{
			SpriteBtnB(PosX[i]+15,PosY[i]-3,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_START)
		{
			SpriteBtnStart(PosX[i]+4,PosY[i]+5,scale,1);
		}
		else
		{
			SpriteBtnStart(PosX[i]+4,PosY[i]+5,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_CDOWN)
		{
			SpriteBtnCDown(PosX[i]+30,PosY[i],scale,1);
		}
		else
		{
			SpriteBtnCDown(PosX[i]+30,PosY[i],scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_CLEFT)
		{
			SpriteBtnCLeft(PosX[i]+25,PosY[i]-5,scale,1);
		}
		else
		{
			SpriteBtnCLeft(PosX[i]+25,PosY[i]-5,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_CRIGHT)
		{
			SpriteBtnCRight(PosX[i]+35,PosY[i]-5,scale,1);
		}
		else
		{
			SpriteBtnCRight(PosX[i]+35,PosY[i]-5,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_CUP)
		{
			SpriteBtnCUp(PosX[i]+30,PosY[i]-10,scale,1);
		}
		else
		{
			SpriteBtnCUp(PosX[i]+30,PosY[i]-10,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_R)
		{
			SpriteBtnR(PosX[i]+35,PosY[i]-17,scale,1);
		}
		else
		{
			SpriteBtnR(PosX[i]+35,PosY[i]-17,scale,0);
		}

		if (GlobalController[i]->ButtonHeld&BTN_Z)
		{
			SpriteBtnZ(PosX[i]+17,PosY[i]-17,scale,1);
		}
		else
		{
			SpriteBtnZ(PosX[i]+17,PosY[i]-17,scale,0);
		}


          if (FullMenu)
          {
               SpriteBtnDMid(PosX[i]-10,PosY[i],scale);

               if (GlobalController[i]->ButtonHeld&BTN_DDOWN)
               {
                    SpriteBtnDDown(PosX[i]-10,PosY[i]+7,scale,1);
               }
               else
               {
                    SpriteBtnDDown(PosX[i]-10,PosY[i]+7,scale,0);
               }

               if (GlobalController[i]->ButtonHeld&BTN_DUP)
               {
                    SpriteBtnDUp(PosX[i]-10,PosY[i]-7,scale,1);
               }
               else
               {
                    SpriteBtnDUp(PosX[i]-10,PosY[i]-7,scale,0);
               }
          
               if (GlobalController[i]->ButtonHeld&BTN_DLEFT)
               {
                    SpriteBtnDLeft(PosX[i]-17,PosY[i],scale,1);
               }
               else
               {
                    SpriteBtnDLeft(PosX[i]-17,PosY[i],scale,0);
               }

               if (GlobalController[i]->ButtonHeld&BTN_DRIGHT)
               {
                    SpriteBtnDRight(PosX[i]-3,PosY[i],scale,1);
               }
               else
               {
                    SpriteBtnDRight(PosX[i]-3,PosY[i],scale,0);
               }
               
               //
               //

               if (GlobalController[i]->ButtonHeld&BTN_L)
               {
                    SpriteBtnL(PosX[i]-10,PosY[i]-17,scale,1);
               }
               else
               {
                    SpriteBtnL(PosX[i]-10,PosY[i]-17,scale,0);
               }

          }

		SpriteAnalogStick(PosX[i]+4+(GlobalController[i]->AnalogX*0.05f),PosY[i]-10+(GlobalController[i]->AnalogY*-0.05f),scale,0);
	}
}

short AnchorPoint[][4]  = 
{
     {85,23,95,20}, 
     {120,90,130,85}, {180,210,190,205},
     {120,90,130,85}, {180,210,190,205},
};

void Zanzou2(int player)
{
    uint time = 0x0D00C158;

    short LapMax = 3;
    if (HotSwapID > 0)
    {
        LapMax = OverKartHeader.LapCount;
    }


    //Time
	if (KWLap[player].tptr2) 
    {
		KWSpriteXLU(KWLap[player].tx[1]-19,KWLap[player].ty+8,128,(ushort*)time,32,16,32,16);
        KWPrintLapTimeXLU(KWLap[player].tx[1],KWLap[player].ty,128,KWLap[player].totaltime);
	}
	if (KWLap[player].tptr3) 
    {
        KWSpriteXLU(KWLap[player].tx[2]-19,KWLap[player].ty+8,80,(ushort*)time,32,16,32,16);
        KWPrintLapTimeXLU(KWLap[player].tx[2],KWLap[player].ty,80,KWLap[player].totaltime);
	}

    int LocalLapY = KWLap[player].cy + 3;
    int LocalLapX = KWLap[player].cx2;

    LocalLapX -= 16;
    LocalLapY -= 4;
    
    gDPPipeSync(GraphPtrOffset++);
    gDPSetCycleType(GraphPtrOffset++, G_CYC_1CYCLE);
    gSPClearGeometryMode(GraphPtrOffset++,G_ZBUFFER);

    gSPSetGeometryMode(GraphPtrOffset++,G_SHADE | G_SHADING_SMOOTH);
    gDPSetPrimColor(GraphPtrOffset++, 0, 0, 255, 255, 255, 255);
    gDPSetCombineLERP(GraphPtrOffset++,0, 0, 0, TEXEL0,
        TEXEL0, 0, PRIMITIVE, 0,
        0, 0, 0, TEXEL0,
        TEXEL0, 0, PRIMITIVE, 0);
    gDPSetTexturePersp(GraphPtrOffset++,G_TP_NONE);
    gDPSetTextureFilter(GraphPtrOffset++,G_TF_POINT);
    gDPSetTextureConvert(GraphPtrOffset++,G_TC_FILT);
    gDPSetTextureLOD(GraphPtrOffset++,G_TL_TILE);
    gDPSetTextureDetail(GraphPtrOffset++,G_TD_CLAMP);
    gDPSetTextureLUT(GraphPtrOffset++,G_TT_NONE);
    gDPSetRenderMode(GraphPtrOffset++,  G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2);

    gDPSetTextureLUT(GraphPtrOffset++, G_TT_RGBA16);
	gSPTexture(GraphPtrOffset++, 65535, 65535, 0, 0, 1);
	gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + laptext_PaletteOffset);
	gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures, G_IM_FMT_CI,32,8,0,G_TX_CLAMP,G_TX_CLAMP,5,3,0,0);
    
    
    gDPTileSync(GraphPtrOffset++);
    KWRectangle(LocalLapX,LocalLapY,32,8,0,0,1);
    
  	if (KWLap[player].cptr2)
    {
        LocalLapX =  KWLap[player].cx2;
        gDPSetPrimColor(GraphPtrOffset++, 0, 0, 255, 255, 255, 128);
        KWRectangle(LocalLapX,LocalLapY,32,8,0,0,1);
	}
    if (KWLap[player].cptr3)
    {
        LocalLapX =  KWLap[player].cx3;
        gDPSetPrimColor(GraphPtrOffset++, 0, 0, 255, 255, 255, 80);
        KWRectangle(LocalLapX,LocalLapY,32,8,0,0,1);
	}


    gDPPipeSync(GraphPtrOffset++);
    gDPTileSync(GraphPtrOffset++);

    gDPSetPrimColor(GraphPtrOffset++, 0, 0, 255, 255, 255, 255);

    LocalLapX = KWLap[player].cx + 10;
    LocalLapY = KWLap[player].cy;

    
    LocalLapY -= 8;

    int LapIndex = *GlobalLap[player] + LapMax - 2;
    if (LapIndex < 0)
    {
        LapIndex = 0;
    }
    
    //1 player large font.
    gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + LargeLapNumbers_PaletteOffset);

    gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures + LargeLapNumbers_Offset + (128 * LapIndex), G_IM_FMT_CI,16,16,0,G_TX_CLAMP,G_TX_CLAMP,4,4,0,0);
    KWRectangle(LocalLapX,LocalLapY,16,16,0,0,1);

    LocalLapX += 10;
    gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures + LargeLapNumbers_Offset + (128 * 10), G_IM_FMT_CI,16,16,0,G_TX_CLAMP,G_TX_CLAMP,4,4,0,0);
    KWRectangle(LocalLapX,LocalLapY,16,16,0,0,1);

    LocalLapX += 9;
    gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures + LargeLapNumbers_Offset + (128 * LapMax), G_IM_FMT_CI,16,16,0,G_TX_CLAMP,G_TX_CLAMP,4,4,0,0);
    KWRectangle(LocalLapX,LocalLapY,16,16,0,0,1);
    
    


}


void KWDisplayUDLapWrapper(int ThisPlayer)
{
    
    
    
    
    if (g_KWDBDispSW != 0)
    {
        KWDisplayItemBox(ThisPlayer);
        return;
    }
    if (RadarOn[ThisPlayer] == 1)
    {
        KWDisplayItemBox(ThisPlayer);
        return;
    }
    if (g_KWScreenEnable == 0)
    {
        KWDisplayItemBox(ThisPlayer);
        return;
    }


    KWDisplayItemBox(ThisPlayer);
    KWDisplayTotalTime(ThisPlayer);

    
    KWDisplayInit();
    short LapMax = 3;
    if (HotSwapID > 0)
    {
        LapMax = OverKartHeader.LapCount;
    }
    
    gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + laptext_PaletteOffset);
    gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures, G_IM_FMT_CI,32,8,0,G_TX_CLAMP,G_TX_CLAMP,5,3,0,0);

    int LocalLapX = KWLap[ThisPlayer].cx - 16;
    int LocalLapY = KWLap[ThisPlayer].cy -1;
    KWRectangle(LocalLapX,LocalLapY,32,8,0,0,1);
    
    if (KWLap[ThisPlayer].goal != LapMax)
    {
        int LapIndex = *GlobalLap[ThisPlayer] + LapMax - 2;
        if (LapIndex < 0)
        {
            LapIndex = 0;
        }

        //1 player large font.
        gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + LargeLapNumbers_PaletteOffset);
        LocalLapX += 26;
        LocalLapY -= 7;
        gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures + LargeLapNumbers_Offset + (128 * LapIndex), G_IM_FMT_CI,16,16,0,G_TX_CLAMP,G_TX_CLAMP,4,4,0,0);
        KWRectangle(LocalLapX,LocalLapY,16,16,0,0,1);

        LocalLapX += 10;
        gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures + LargeLapNumbers_Offset + (128 * 10), G_IM_FMT_CI,16,16,0,G_TX_CLAMP,G_TX_CLAMP,4,4,0,0);
        KWRectangle(LocalLapX,LocalLapY,16,16,0,0,1);

        LocalLapX += 9;
        gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures + LargeLapNumbers_Offset + (128 * LapMax), G_IM_FMT_CI,16,16,0,G_TX_CLAMP,G_TX_CLAMP,4,4,0,0);
        KWRectangle(LocalLapX,LocalLapY,16,16,0,0,1);
    }

    
    gDPSetRenderMode(GraphPtrOffset++,  G_RM_OPA_SURF, G_RM_OPA_SURF2);
}

void KWDisplay4LapWrapper(int ThisPlayer)
{
    KWDisplayTotalTime(ThisPlayer);

    if ((g_KWScreenEnable == 0) || (g_KWLapSW == 0) )
    {
    
        if (KWLap[ThisPlayer].bomb)
        {
            KWTexture2DCI8BL(
                KWLap[ThisPlayer].bombx, 
                KWLap[ThisPlayer].bomby, 
                0, 1.0f, 
                (ushort*)0x0D01B4D8, 
                (uchar*)0x0D01D6D8,
                (void*)0x0D005AE0,
                32,32,32,32
            );
        }
        KWDisplayItemBoxS(ThisPlayer);
        return;
    }

    KWDisplayItemBoxS(ThisPlayer);

    KWDisplayInit();
    int LocalLapX, LocalLapY;
    short LapMax = 3;
    if (HotSwapID > 0)
    {
        LapMax = OverKartHeader.LapCount;
    }

    gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + laptext_PaletteOffset);
    gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures, G_IM_FMT_CI,32,8,0,G_TX_CLAMP,G_TX_CLAMP,5,3,0,0);

    
    
    if (KWLap[ThisPlayer].goal != LapMax)
    {
        int LocalLapX = KWLap[ThisPlayer].cx - 16;
        int LocalLapY = KWLap[ThisPlayer].cy - 4;
        KWRectangle(LocalLapX,LocalLapY,32,8,0,0,1);
    }

    gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + SmallLapNumbers_PaletteOffset);
    gDPLoadTextureBlock_4b(GraphPtrOffset++, ((uint)&LapCounterTextures + SmallLapNumbers_Offset), G_IM_FMT_CI,16,128,0,G_TX_CLAMP,G_TX_CLAMP,4,7,0,0);

    if (KWLap[ThisPlayer].goal != LapMax)
    {
        LocalLapX = KWLap[ThisPlayer].cx - 26;
        LocalLapY = KWLap[ThisPlayer].cy + 4;

        int LapIndex = *GlobalLap[ThisPlayer] + LapMax - 2;
        if (LapIndex < 0)
        {
            LapIndex = 0;
        }

        KWRectangle(LocalLapX+13,LocalLapY,16,8,0,(8*LapIndex),1);
        KWRectangle(LocalLapX+21,LocalLapY,8,8,0,(8*10),1);
        KWRectangle(LocalLapX+29,LocalLapY,16,8,0,(8*LapMax),1);
    }
    
    
    if (KWLap[ThisPlayer].bomb)
    {
        KWTexture2DCI8BL(
            KWLap[ThisPlayer].bombx, 
            KWLap[ThisPlayer].bomby, 
            0, 1.0f, 
            (ushort*)0x0D01B4D8, 
            (uchar*)0x0D01D6D8,
            (void*)0x0D005AE0,
            32,32,32,32
        );
    }
    
    gDPSetRenderMode(GraphPtrOffset++,  G_RM_OPA_SURF, G_RM_OPA_SURF2);
}
     
void KWDisplayLRLapWrapper(int ThisPlayer)
{
    KWDisplayTotalTime(ThisPlayer);
    
    

    if ((g_KWScreenEnable == 0) || (g_KWLapSW == 0) )
    {
        KWDisplayItemBox(ThisPlayer);
        return;
    }

    KWDisplayItemBox(ThisPlayer);

    KWDisplayInit();
    int LocalLapX, LocalLapY;
    short LapMax = 3;
    if (HotSwapID > 0)
    {
        LapMax = OverKartHeader.LapCount;
    }
    gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + laptext_PaletteOffset);
    gDPLoadTextureBlock_4b(GraphPtrOffset++, (uint)&LapCounterTextures, G_IM_FMT_CI,32,8,0,G_TX_CLAMP,G_TX_CLAMP,5,3,0,0);

    
    
    if (KWLap[ThisPlayer].goal != LapMax)
    {
        int LocalLapX = KWLap[ThisPlayer].cx - 16;
        int LocalLapY = KWLap[ThisPlayer].cy - 4;
        KWRectangle(LocalLapX,LocalLapY,32,8,0,0,1);
    }

    gDPLoadTLUT_pal16(GraphPtrOffset++, 0, (uint)&LapCounterTextures + SmallLapNumbers_PaletteOffset);
    gDPLoadTextureBlock_4b(GraphPtrOffset++, ((uint)&LapCounterTextures + SmallLapNumbers_Offset), G_IM_FMT_CI,16,128,0,G_TX_CLAMP,G_TX_CLAMP,4,7,0,0);

    if (KWLap[ThisPlayer].goal != LapMax)
    {
        LocalLapX = KWLap[ThisPlayer].cx;
        LocalLapY = KWLap[ThisPlayer].cy - 4;

        int LapIndex = *GlobalLap[ThisPlayer] + LapMax - 2;
        if (LapIndex < 0)
        {
            LapIndex = 0;
        }

        KWRectangle(LocalLapX+13,LocalLapY,16,8,0,(8*LapIndex),1);
        KWRectangle(LocalLapX+21,LocalLapY,8,8,0,(8*10),1);
        KWRectangle(LocalLapX+29,LocalLapY,16,8,0,(8*LapMax),1);
    }
    gDPSetRenderMode(GraphPtrOffset++,  G_RM_OPA_SURF, G_RM_OPA_SURF2);

}
     
void KWDisplayInit()
{
    gDPPipeSync(GraphPtrOffset++);
    
    gDPSetCycleType(GraphPtrOffset++, G_CYC_1CYCLE);
    

    gSPClearGeometryMode(GraphPtrOffset++, G_ZBUFFER);
    gSPSetGeometryMode(GraphPtrOffset++, G_SHADE | G_SHADING_SMOOTH);
    
    gDPSetPrimColor(GraphPtrOffset++, 0, 0, 255, 255, 255, 255);
    gDPSetCombineLERP(GraphPtrOffset++,0, 0, 0, TEXEL0,
        TEXEL0, 0, PRIMITIVE, 0,
        0, 0, 0, TEXEL0,
        TEXEL0, 0, PRIMITIVE, 0);
    gDPSetTexturePersp(GraphPtrOffset++,G_TP_NONE);
    gDPSetTextureFilter(GraphPtrOffset++,G_TF_POINT);
    gDPSetTextureConvert(GraphPtrOffset++,G_TC_FILT);
    gDPSetTextureLOD(GraphPtrOffset++,G_TL_TILE);
    gDPSetTextureDetail(GraphPtrOffset++,G_TD_CLAMP);
    gDPSetTextureLUT(GraphPtrOffset++,G_TT_NONE);
    gDPSetRenderMode(GraphPtrOffset++,  G_RM_XLU_SURF, G_RM_XLU_SURF2);
    gDPPipeSync(GraphPtrOffset++);
    

    gDPSetTextureLUT(GraphPtrOffset++, G_TT_RGBA16);
    gSPTexture(GraphPtrOffset++, 65535, 65535, 0, 0, 1);
    
}

void KWDisplay2P_1LR()
{
    KWDisplayLRLapWrapper(0);
}
void KWDisplay2P_2LR()
{
    KWDisplayLRLapWrapper(1);
}


void KWDisplay4P_1()
{
    KWDisplay4LapWrapper(0);
}
void KWDisplay4P_2()
{
    KWDisplay4LapWrapper(1);
}
void KWDisplay4P_3()
{
    KWDisplay4LapWrapper(2);
}
void KWDisplay4P_4()
{
    KWDisplay4LapWrapper(3);
}


void KWDisplay2P_1UD()
{
    KWDisplayUDLapWrapper(0);
}
void KWDisplay2P_2UD()
{
    KWDisplayUDLapWrapper(1);
}
