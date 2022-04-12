#include "MainInclude.h"

//NEED TO OVERWRITE WITH OWN FUNCTION
extern void allRun();
extern void PrintMenuFunction();



void allRunSwitch()
{
     if (*(uint*)((uint)&ExpansionCheckAddress) == 0xFFDDEECC)
     {
          allRun();
     }
}

void printMenuSwitch()
{
     if (*(uint*)((uint)&ExpansionCheckAddress) == 0xFFDDEECC)
     {
          PrintMenuFunction();
     }
     else
     {
          if (*(uint*)((uint)&ExpansionCheckAddress) == 0x11223344)
		{
               KWSpriteDiv(256,120,(ushort*)((0x80200400 + (int)&RAMCheckEnd - (int)&RAMCheck)),512,240,4);     
               g_FadeCounter2[4] = 1;     
		}
     }
}