#include "MainInclude.h"
extern int BootCode();



void CheckExpansion()
{
	DMA(((uint)&PRELOAD_RAM + 0x200), (int)&BootCode, 0x200);	
	ramCopy(0x80610000, 0x80100000, 0x100000);
	*(long long*)(0x80600000) = 0x3525352535253525;
	if (*(int*)(0x80600004) != 0x35253525)
	{
		*(uint*)((uint)&ExpansionCheckAddress) = 0x11223344;
		DMA(((uint)&PRELOAD_RAM + 0x400), (int)(&RAMCheck), (int)&RAMCheckEnd - (int)&RAMCheck); 
		decodeMIO0(((uint)&PRELOAD_RAM + 0x400), (((uint)&PRELOAD_RAM + 0x400) + (int)&RAMCheckEnd - (int)&RAMCheck));
	}
	else
	{
		*(uint*)((uint)&ExpansionCheckAddress) = 0xFFDDEECC;
		DMA(0x80400000, (uint)(&PAYLOAD_ROM), (uint)(&DMA_MAX_LENGTH));        
	}
	return;
}