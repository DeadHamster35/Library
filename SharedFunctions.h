#include <sys/types.h>
#include <math.h>



extern void runDMA();
extern void runRAM();
extern void runTKM();
extern void runMIO();

extern int GetRealAddress(long RSPAddress);

extern void ResetObject();

extern char* printHex(char *buf, int num, int nDigits);
