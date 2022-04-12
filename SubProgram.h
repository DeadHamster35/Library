#ifndef SubProgram_H
#define SubProgram_H

#include "MainInclude.h"

#define   DEG1 0xB6
#define	SegmentOffset(a)	((unsigned int)(a) & 0x00ffffff)
#define	SegmentNumber(a)	(((unsigned int)(a) << 4) >> 28)
#define	SegmentAddress(num, off)	(((num) << 24) + (off))

#define	PhysToK0(x)	((x)|0x80000000)
#define   K0_TO_PHYS(x) ((x)&0x1FFFFFFF)
#define   cup_NTSC 0x800F2BB4
#define   cup_PAL 0x800F2C14
#define   MaxPowerConvert(a)  ((a * a) / 25)
#define   MaxPowerBase(a)     Sqrtf(a * 25)

#endif