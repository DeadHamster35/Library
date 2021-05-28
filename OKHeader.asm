//These are new custom RAM values
//0x80400000 - 0x804FFFFF is restricted for OverKart64 functions and data.
//0x80500000 - 0x805FFFFF is reserved for Custom Course Assembly and data.
//0X80600000 - 0X80780000 should be safe for any other custom code.
//The end of RAM is course data, from 0x80800000 backwards.
//This varies based on the size of data for the current course. Be cautious!


//804396C4 targetAddress;?




.definelabel ok_SaveState, ok_USAudio + 0x10

.definelabel ok_ItemTable, ok_SaveState + ok_SaveSize

.definelabel lit_numberSprite, ok_ItemTable + 0x20
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

.definelabel lit_titleFrame, lit_numberSpriteX + 0x200

.definelabel lit_titleFrame_u, lit_titleFrame
.definelabel lit_titleFrame_m, lit_titleFrame_u + 0x720
.definelabel lit_titleFrame_d, lit_titleFrame_m + 0x71C
.definelabel lit_titleFrame_l, lit_titleFrame_d + 0x720
.definelabel lit_titleFrame_r, lit_titleFrame_l + 0x760
.definelabel lit_arrowsSprite, lit_titleFrame_r + 0x760

.definelabel lit_arrowsprite_u, lit_arrowsSprite
.definelabel lit_arrowsprite_d, lit_arrowsprite_u + 0x200
.definelabel lit_arrowsprite_l, lit_arrowsprite_d + 0x200
.definelabel lit_arrowsprite_r, lit_arrowsprite_l + 0x200
.definelabel lit_red_selecter, lit_arrowsprite_r +  0x200 
.definelabel ok_redcoinsprite, lit_red_selecter +  0x200 
.definelabel ok_menucoinsprite, ok_redcoinsprite +  0x200

.definelabel ok_Logo, ok_ModelData
.definelabel ok_MRSong, ok_ModelData + ok_ModelDataRawSize
.definelabel ok_Storage, ok_MRSong + 0x30

//.definelabel lit_alpacasprite, ok_menucoinsprite +  0x200
//.definelabel lit_heartsprite, lit_alpacasprite +  0x800

.definelabel ok_ASMJump, ok_Storage + 0x4
.definelabel ok_Knowledge, 0x807F0000