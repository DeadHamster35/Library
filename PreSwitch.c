#include "MainInclude.h"


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
               KWSpriteDiv(256,120,(ushort*)((((uint)&PRELOAD_RAM + 0x400) + (int)&RAMCheckEnd - (int)&RAMCheck)),512,240,4);     
               g_FadeCounter2[4] = 1;     
		}
     }
}