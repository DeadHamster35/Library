#include <sys/types.h>
#include <math.h>
#include <stdbool.h>


extern bool CheckPlatform();
extern void runDMA();
extern void runRAM();
extern void runTKM();
extern void runMIO();

extern void SetFontColor(int FontR, int FontG, int FontB, int ShadowR, int ShadowG, int ShadowB);

extern int GetRealAddress(long RSPAddress);

extern void ResetObject();

extern char* printHex(char *buf, int num, int nDigits);

extern char ReturnStringLength(long stringAddress);
extern char CharacterConvert[];
extern char CharacterUnconvert[];