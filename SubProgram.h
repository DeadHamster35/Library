#ifndef SubProgram_H
#define SubProgram_H

#include "MainInclude.h"

#define   DEG1 0xB6
#define	SegmentOffset(a)	((unsigned int)(a) & 0x00ffffff)
#define	SegmentNumber(a)	(((unsigned int)(a) << 4) >> 28)
#define	SegmentAddress(num, off)	(((num) << 24) + (off))

#define gs_Nin_LoadTextureImage(timg,fmt,siz,width,height,tmem,tt)	\
	gsDPSetTextureImage(fmt,siz,1,timg),	\
	gsDPTileSync(),	\
	gsDPSetTile(fmt,siz,0,tmem,tt,0,0,0,0,0,0,0),	\
	gsDPLoadSync(),	\
	gsDPLoadBlock(tt,0,0,width*height-1,CALC_DXT(width,siz##_BYTES))

#define gs_Nin_SetUpTileDescrip(fmt,siz,width,height,tmem,tt,cs,ms,ss,ct,mt,st)	\
	gsDPTileSync(),	\
	gsDPSetTile(fmt,siz,((((width)*siz##_LINE_BYTES)+7)>>3),tmem,tt,0,ct,mt,st,cs,ms,ss),	\
	gsDPSetTileSize(tt,0,0,(width-1)<<G_TEXTURE_IMAGE_FRAC,(height-1)<<G_TEXTURE_IMAGE_FRAC)


#define gsDPLoadTextureBlockMM32(timg, fmt, siz, width, height, length,        \
                pal, cms, cmt, masks, maskt, shifts, shiftt)            \
        gsDPTileSync(),                                                 \
        gsDPSetTextureImage(fmt, siz, 1, timg),                         \
        gsDPSetTile(fmt, siz, 0, 0, G_TX_LOADTILE, 0 , cmt, maskt,    \
                shiftt, cms, masks, shifts),                            \
        gsDPLoadSync(),                                                 \
        gsDPLoadBlock(G_TX_LOADTILE, 0, 0, length-1,0x0),               \
        gsDPSetTile(fmt, siz, ((((width) * siz##_BYTES)+7)>>3), 0,    \
                1, pal, cmt, maskt, 0, cms, masks,                      \
                0),                                                     \
        gsDPSetTileSize(1, 0, 0,                                        \
                (32-1) << G_TEXTURE_IMAGE_FRAC,                         \
                (32-1) << G_TEXTURE_IMAGE_FRAC),                        \
        gsDPSetTile(fmt, siz, ((((16) * siz##_BYTES)+7)>>3), 256,       \
                2, pal, cmt, (maskt - 1), 1, cms, (masks -1),           \
                1),                                                     \
        gsDPSetTileSize(2, 0, 0,                                        \
                (16-1) << G_TEXTURE_IMAGE_FRAC,                         \
                (16-1) << G_TEXTURE_IMAGE_FRAC),                        \
        gsDPSetTile(fmt, siz, ((((8) * siz##_BYTES)+7)>>3), 320,        \
                3, pal, cmt, (maskt-2), 2, cms, (masks-2),              \
                2),                                                     \
        gsDPSetTileSize(3, 0, 0,                                        \
                (8-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (8-1) << G_TEXTURE_IMAGE_FRAC),                         \
        gsDPSetTile(fmt, siz, ((((4) * siz##_BYTES)+7)>>3), 336,        \
                4, pal, cmt, (maskt-3), 3, cms, (masks-3),              \
                3),                                                     \
        gsDPSetTileSize(4, 0, 0,                                        \
                (4-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (4-1) << G_TEXTURE_IMAGE_FRAC),                         \
        gsDPSetTile(fmt, siz, ((((2) * siz##_BYTES)+7)>>3), 340,        \
                5, pal, cmt, (maskt-4), 4, cms, (masks-4),              \
                4),                                                     \
        gsDPSetTileSize(5, 0, 0,                                        \
                (2-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (2-1) << G_TEXTURE_IMAGE_FRAC),                         \
        gsDPSetTile(fmt, siz, ((((1) * siz##_BYTES)+7)>>3), 342,        \
                6, pal, cmt, (maskt-5), 5, cms, (masks-5),              \
                5),                                                     \
        gsDPSetTileSize(6, 0, 0,                                        \
                (1-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (1-1) << G_TEXTURE_IMAGE_FRAC)


#define g_Nin_LoadTextureImage(timg,fmt,siz,width,height,tmem,tt)	\
	gDPSetTextureImage(GraphPtrOffset++, fmt,siz,1,timg);	\
	gDPTileSync(GraphPtrOffset++);	\
	gDPSetTile(GraphPtrOffset++, fmt,siz,0,tmem,tt,0,0,0,0,0,0,0);	\
	gDPLoadSync(GraphPtrOffset++);	\
	gDPLoadBlock(GraphPtrOffset++, tt,0,0,width*height-1,CALC_DXT(width,siz##_BYTES));

#define g_Nin_SetUpTileDescrip(fmt,siz,width,height,tmem,tt,cs,ms,ss,ct,mt,st)	\
	gDPTileSync(GraphPtrOffset++);	\
	gDPSetTile(GraphPtrOffset++, fmt,siz,((((width)*siz##_LINE_BYTES)+7)>>3),tmem,tt,0,ct,mt,st,cs,ms,ss);	\
	gDPSetTileSize(GraphPtrOffset++, tt,0,0,(width-1)<<G_TEXTURE_IMAGE_FRAC,(height-1)<<G_TEXTURE_IMAGE_FRAC);


#define gDPLoadTextureBlockMM32(timg, fmt, siz, width, height, length,        \
                pal, cms, cmt, masks, maskt, shifts, shiftt)            \
        gDPTileSync(GraphPtrOffset++);                                             \
        gDPSetTextureImage(GraphPtrOffset++, fmt, siz, 1, timg);                         \
        gDPSetTile(GraphPtrOffset++, fmt, siz, 0, 0, G_TX_LOADTILE, 0 , cmt, maskt,    \
                shiftt, cms, masks, shifts);                           \
        gDPLoadSync();                                                 \
        gDPLoadBlock(G_TX_LOADTILE, 0, 0, length-1,0x0);               \
        gDPSetTile(GraphPtrOffset++, fmt, siz, ((((width) * siz##_BYTES)+7)>>3), 0,    \
                1, pal, cmt, maskt, 0, cms, masks,                      \
                0);                                                     \
        gDPSetTileSize(GraphPtrOffset++, 1, 0, 0,                                        \
                (32-1) << G_TEXTURE_IMAGE_FRAC,                         \
                (32-1) << G_TEXTURE_IMAGE_FRAC);                        \
        gDPSetTile(GraphPtrOffset++, fmt, siz, ((((16) * siz##_BYTES)+7)>>3), 256,       \
                2, pal, cmt, (maskt - 1), 1, cms, (masks -1),           \
                1);                                                     \
        gDPSetTileSize(GraphPtrOffset++, 2, 0, 0,                                        \
                (16-1) << G_TEXTURE_IMAGE_FRAC,                         \
                (16-1) << G_TEXTURE_IMAGE_FRAC);                        \
        gDPSetTile(GraphPtrOffset++, fmt, siz, ((((8) * siz##_BYTES)+7)>>3), 320,        \
                3, pal, cmt, (maskt-2), 2, cms, (masks-2),              \
                2);                                                     \
        gDPSetTileSize(GraphPtrOffset++, 3, 0, 0,                                        \
                (8-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (8-1) << G_TEXTURE_IMAGE_FRAC);                         \
        gDPSetTile(GraphPtrOffset++, fmt, siz, ((((4) * siz##_BYTES)+7)>>3), 336,        \
                4, pal, cmt, (maskt-3), 3, cms, (masks-3),              \
                3);                                                     \
        gDPSetTileSize(GraphPtrOffset++, 4, 0, 0,                                        \
                (4-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (4-1) << G_TEXTURE_IMAGE_FRAC);                         \
        gDPSetTile(GraphPtrOffset++, fmt, siz, ((((2) * siz##_BYTES)+7)>>3), 340,        \
                5, pal, cmt, (maskt-4), 4, cms, (masks-4),              \
                4);                                                     \
        gDPSetTileSize(GraphPtrOffset++, 5, 0, 0,                                        \
                (2-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (2-1) << G_TEXTURE_IMAGE_FRAC);                         \
        gDPSetTile(GraphPtrOffset++, fmt, siz, ((((1) * siz##_BYTES)+7)>>3), 342,        \
                6, pal, cmt, (maskt-5), 5, cms, (masks-5),              \
                5);                                                     \
        gDPSetTileSize(GraphPtrOffset++, 6, 0, 0,                                        \
                (1-1) << G_TEXTURE_IMAGE_FRAC,                          \
                (1-1) << G_TEXTURE_IMAGE_FRAC);


#define     PhysToK0(x)	((x)|0x80000000)
#define     K0_TO_PHYS(x) ((x)&0x1FFFFFFF)
#define     cup_NTSC 0x800F2BB4
#define     cup_PAL 0x800F2C14
#define     MaxPowerConvert(a)  ((a * a) / 25)
#define     MaxPowerBase(a)     Sqrtf(a * 25)
#define     JR_RA 0

#endif