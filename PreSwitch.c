#include "MainInclude.h"
extern long RAMCheck, RAMCheckEnd, ExpansionCheckAddress;

//NEED TO OVERWRITE WITH OWN FUNCTION
__attribute__((weak)) void allRun(){return;};
__attribute__((weak)) void PrintMenuFunction(){return;};



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