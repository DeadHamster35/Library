// These are new custom RAM values
// 0x80400000 - 0x804FFFFF is restricted for OverKart64 functions and data.
// 0x80500000 - 0x805FFFFF is reserved for Custom Course Assembly and data.
// 0X80600000 - 0X80780000 should be safe for any other custom code.
// The end of RAM is course data, from 0x80800000 backwards.
// This varies based on the size of data for the current course. Be cautious!

extern long ok_SaveState;  //0x80420000
extern long ok_HeaderOffsets; //0x80450000
extern long ok_MenuOffsets; //0x80451400
extern long ok_CourseHeader; //0x80453C00

extern long ok_HeaderROM; //0xBE9178

extern long ok_Target; //0x80454D04
extern long ok_Source; //0x80454D08
extern long ok_Pointer; //0x80454D0C


extern long ok_ItemTable; //


extern long ok_CourseTable; //0x80454D50  //0x28 bytes

extern long ok_FreePointer;
extern long ok_RedCoinList;//0x80454D78
extern long ok_Credits;
extern long ok_MapTextureData; //0x80455000 //


extern long ok_Logo;
extern long ok_ModelData;
extern long ok_FreeSpace; 
extern long ok_TKMSpace;

extern long ok_RedCoinSprite;
extern long ok_menucoinsprite;
//extern long lit_alpacasprite;
//extern long lit_heartsprite;

extern long lit_numberSprite;
extern long lit_numberSprite0;
extern long lit_numberSprite1;
extern long lit_numberSprite2;
extern long lit_numberSprite3;
extern long lit_numberSprite4;
extern long lit_numberSprite5;
extern long lit_numberSprite6;
extern long lit_numberSprite7;
extern long lit_numberSprite8;
extern long lit_numberSprite9;
extern long lit_numberSpriteX;

extern long lit_titleFrame;
extern long lit_titleFrame_u;
extern long lit_titleFrame_m;
extern long lit_titleFrame_d;
extern long lit_titleFrame_l;
extern long lit_titleFrame_r;

extern long lit_arrowsSprite;
extern long lit_arrowsprite_u;
extern long lit_arrowsprite_d;
extern long lit_arrowsprite_l;
extern long lit_arrowsprite_r;
extern long lit_red_selecter;
extern long ok_ScrollTranslucent;

extern long ok_USAudio;
extern long ok_MRSong;
extern unsigned long ok_Storage;

extern void ok_ASMJump(); //
extern long ok_Knowledge;
extern long JP_Audio;
extern long JP_Bank;







