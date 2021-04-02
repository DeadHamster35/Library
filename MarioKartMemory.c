#include <stdbool.h>
#include "GameVariables/NTSC/GameOffsets.h"
#include "SharedFunctions.h"
#include "LibraryVariables.h"
#include "Struct.h"

void LoadData (int SourceInput, int SizeData)
{
    *sourceAddress = SourceInput;
    *targetAddress = FreeSpaceAddress;
    dataLength = SizeData;
    GlobalShortA = 4 - (SizeData % 4);
    FreeSpaceAddress = FreeSpaceAddress + SizeData + GlobalShortA;
    runDMA();
}