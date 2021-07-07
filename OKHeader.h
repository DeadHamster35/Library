#include "OKStruct.h"
//These are new custom RAM values
//0x80400000 - 0x804FFFFF is restricted for OverKart64 functions and data.
//0x80500000 - 0x805FFFFF is reserved for Custom Course Assembly and data.
//0X80600000 - 0X80780000 should be safe for any other custom code.
//The end of RAM is course data; //from 0x80800000 backwards.
//This varies based on the size of data for the current course. Be cautious!


//804396C4 targetAddress;?

extern int ok_HeaderROM; //0xBE9178
extern int ok_SaveSize; //0x28980
extern int ok_HeaderSize; //0x1400
extern int ok_MenuSize; //0x2800
extern int ok_CourseHeaderSize; //0x80


extern int ok_HeaderOffsets; //0x80420000
extern int ok_MenuOffsets; //ok_HeaderOffsets + ok_HeaderSize
extern int ok_CourseHeader; //ok_MenuOffsets + ok_MenuSize
extern OKHeader OverKartHeader; //ok_CourseHeader
extern int ok_CourseTable; //ok_CourseHeader + ok_CourseHeaderSize  //0x28 bytes

extern int ok_Target; //ok_CourseTable + 0x30
extern int ok_Source; //ok_Target + 0x4
extern int ok_Pointer; //ok_Source + 0x4
extern int ok_FreePointer; //ok_Pointer + 0x4  //set value after loading data.
extern int ok_RedCoinList; //ok_FreePointer + 0x4
extern int ok_Credits; //ok_RedCoinList + 0x50 //8 bytes per coin * 10 for space
extern int ok_CourseName; //ok_Credits + 0x20
extern int ok_SerialKey; //ok_CourseName + 0x40

extern int ok_MapTextureData; //ok_SerialKey + 0x10 // 
extern int ok_scrolltranslucent; //ok_MapTextureData + 0x3000   



extern int ok_SaveState; //ok_scrolltranslucent + 0x1000
extern int ok_ItemTable; //ok_SaveState + ok_SaveSize

extern int ok_ModelData; //ok_ItemTable + 0x30; //hold a ton of potential scrolling objects or translucent objects.

extern int ok_Logo; //ok_ModelData; // overwrites logo after. 
extern int ok_MRSong; //ok_ModelData + ok_ModelDataRawSize;

extern int ok_USAudio; //ok_MRSong + 0x30;
extern int ok_TKMSpace; //ok_USAudio + 0x10
extern int ok_FreeSpace; //ok_TKMSpace + 0x2000
extern int ok_Storage; //ok_FreeSpace + 0x8000



extern int ok_ItemTable; //ok_SaveState + ok_SaveSize

extern int lit_numberSprite; //ok_ItemTable + 0x20
extern int lit_numberSprite0; //lit_numberSprite
extern int lit_numberSprite1; //lit_numberSprite0 + 0x200
extern int lit_numberSprite2; //lit_numberSprite1 + 0x200
extern int lit_numberSprite3; //lit_numberSprite2 + 0x200
extern int lit_numberSprite4; //lit_numberSprite3 + 0x200
extern int lit_numberSprite5; //lit_numberSprite4 + 0x200
extern int lit_numberSprite6; //lit_numberSprite5 + 0x200
extern int lit_numberSprite7; //lit_numberSprite6 + 0x200
extern int lit_numberSprite8; //lit_numberSprite7 + 0x200
extern int lit_numberSprite9; //lit_numberSprite8 + 0x200
extern int lit_numberSpriteX; //lit_numberSprite9 + 0x200

extern int lit_titleFrame; //lit_numberSpriteX + 0x200

extern int lit_titleFrame_u; //lit_titleFrame
extern int lit_titleFrame_m; //lit_titleFrame_u + 0x720
extern int lit_titleFrame_d; //lit_titleFrame_m + 0x71C
extern int lit_titleFrame_l; //lit_titleFrame_d + 0x720
extern int lit_titleFrame_r; //lit_titleFrame_l + 0x760
extern int lit_arrowsSprite; //lit_titleFrame_r + 0x760

extern int lit_arrowsprite_u; //lit_arrowsSprite
extern int lit_arrowsprite_d; //lit_arrowsprite_u + 0x200
extern int lit_arrowsprite_l; //lit_arrowsprite_d + 0x200
extern int lit_arrowsprite_r; //lit_arrowsprite_l + 0x200
extern int lit_red_selecter; //lit_arrowsprite_r +  0x200 
extern int ok_RedCoinSprite; //lit_red_selecter +  0x200 
extern int ok_menucoinsprite; //ok_RedCoinSprite +  0x200
extern ushort nicefont[]; //ok_menucoinsprite +  0x200
extern ushort hud_buttons[]; //nicefont +  0x4400

//extern int lit_alpacasprite; //hud_buttons +  0x4400
//extern int lit_heartsprite; //lit_alpacasprite +  0x800

extern void ok_ASMJump; //ok_Storage + 0x4
extern int ok_Knowledge; //0x807F0000