//These are new custom RAM values
//The end of RAM is course data, from 0x80800000 backwards.
//This varies based on the size of data for the current course. Be cautious!
.definelabel ok_HeaderROM, 0xBE9178
.definelabel ok_SaveSize, 0x28980
.definelabel ok_HeaderSize, 0x1400
.definelabel ok_MenuSize, 0x2800
.definelabel ok_CourseHeaderSize, 0xC0


.definelabel ok_HeaderOffsets, RAM_END
.definelabel ok_MenuOffsets, ok_HeaderOffsets + ok_HeaderSize
.definelabel ok_CourseHeader, ok_MenuOffsets + ok_MenuSize
.definelabel OverKartHeader, ok_CourseHeader
.definelabel ok_CourseTable, ok_CourseHeader + ok_CourseHeaderSize  //0x28 bytes

.definelabel ok_Target, ok_CourseTable + 0x30
.definelabel ok_Source, ok_Target + 0x4
.definelabel ok_Pointer, ok_Source + 0x4
.definelabel ok_FreePointer, ok_Pointer + 0x4  //set value after loading data.\
.definelabel ok_Credits, ok_FreePointer + 0x4
.definelabel ok_CourseName, ok_Credits + 0x20
.definelabel ok_SerialKey, ok_CourseName + 0x40

.definelabel ok_MapTextureData, ok_SerialKey + 0x20 // 
.definelabel ok_scrolltranslucent, ok_MapTextureData + 0x3000   



.definelabel ok_SaveState, ok_scrolltranslucent + 0x500
.definelabel ok_ItemTable, ok_SaveState + ok_SaveSize

.definelabel ok_ModelData, ok_ItemTable + 0x30; //hold a ton of potential scrolling objects or translucent objects.

.definelabel ok_Logo, ok_ModelData; // overwrites logo after. 

.definelabel ok_MRSong, ok_ModelData + ok_ModelDataRawSize + 8;

.definelabel ok_FreeCam, ok_MRSong + 0x30
.definelabel ok_FreeCamBackup, ok_MRSong + 0x50
.definelabel ok_USAudio, ok_FreeCamBackup + 0x50;
.definelabel ok_Instrument, ok_USAudio + 0x10
.definelabel ok_Sequence, ok_Instrument + 0x10
.definelabel ok_Bomb, ok_Sequence + 0x10

//804396C4 targetAddress;?

.definelabel lit_numberSprite, ok_Bomb + 0xB0
.definelabel lit_numberSprite0, lit_numberSprite
.definelabel lit_numberSprite1, lit_numberSprite0 + 0x200
.definelabel lit_numberSprite2, lit_numberSprite1 + 0x200
.definelabel lit_numberSprite3, lit_numberSprite2 + 0x200
.definelabel lit_numberSprite4, lit_numberSprite3 + 0x200
.definelabel lit_numberSprite5, lit_numberSprite4 + 0x200
.definelabel lit_numberSprite6, lit_numberSprite5 + 0x200
.definelabel lit_numberSprite7, lit_numberSprite6 + 0x200
.definelabel lit_numberSprite8, lit_numberSprite7 + 0x200
.definelabel lit_numberSprite9, lit_numberSprite8 + 0x200
.definelabel lit_numberSpriteX, lit_numberSprite9 + 0x200

.definelabel lit_arrowsSprite, lit_numberSpriteX + 0x200

.definelabel lit_arrowsprite_u, lit_arrowsSprite
.definelabel lit_arrowsprite_d, lit_arrowsprite_u + 0x200
.definelabel lit_arrowsprite_l, lit_arrowsprite_d + 0x200
.definelabel lit_arrowsprite_r, lit_arrowsprite_l + 0x200
.definelabel lit_red_selecter, lit_arrowsprite_r +  0x200 
.definelabel ok_RedCoinSprite, lit_red_selecter +  0x200 
.definelabel ok_GoldCoinSprite, ok_RedCoinSprite +  0x200 
.definelabel ok_menucoinsprite, ok_RedCoinSprite +  0x200
.definelabel hud_buttons, ok_RedCoinSprite +  0x400
.definelabel nicefont, hud_buttons +  0x4400



.definelabel ok_TKMSpace,  nicefont + 0x22000 
.definelabel ok_FreeSpace, ok_TKMSpace + 0x2010

.definelabel ok_Storage, ok_FreeSpace + 0x20000
.definelabel OKHeaderEND, ok_Storage + 0x100000

.definelabel ok_Knowledge, 0x805F0000
.definelabel SwopCheck, 0x805F0004