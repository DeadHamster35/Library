
.definelabel ok_HeaderROM, 0xBE9178
.definelabel ok_SaveSize, 0x28980
.definelabel ok_HeaderSize, 0x1400
.definelabel ok_MenuSize, 0x2800
.definelabel ok_CourseHeaderSize, 0x80


.definelabel ok_HeaderOffsets, 0x80420000
.definelabel ok_MenuOffsets, ok_HeaderOffsets + ok_HeaderSize
.definelabel ok_CourseHeader, ok_MenuOffsets + ok_MenuSize
.definelabel OverKartHeader, ok_CourseHeader
.definelabel ok_CourseTable, ok_CourseHeader + ok_CourseHeaderSize  //0x28 bytes

.definelabel ok_Target, ok_CourseTable + 0x30
.definelabel ok_Source, ok_Target + 0x4
.definelabel ok_Pointer, ok_Source + 0x4
.definelabel ok_FreePointer, ok_Pointer + 0x4  //set value after loading data.
.definelabel ok_RedCoinList, ok_FreePointer + 0x4
.definelabel ok_Credits, ok_RedCoinList + 0x50 //8 bytes per coin * 10 for space
.definelabel ok_CourseName, ok_Credits + 0x20
.definelabel ok_SerialKey, ok_CourseName + 0x40

.definelabel ok_MapTextureData, ok_SerialKey + 0x10 // 
.definelabel ok_scrolltranslucent, ok_MapTextureData + 0x3000   

<<<<<<< HEAD
.definelabel ok_TKMSpace, ok_ModelData + ok_ModelDataRawSize;
.definelabel ok_USAudio, ok_TKMSpace + 0x2000
//.definelabel ok_USAudio, ok_FreeSpace + 0x10000
=======


.definelabel ok_SaveState, ok_scrolltranslucent + 0x1000
.definelabel ok_ItemTable, ok_SaveState + ok_SaveSize

.definelabel ok_ModelData, ok_ItemTable + 0x30; //hold a ton of potential scrolling objects or translucent objects.

.definelabel ok_Logo, ok_ModelData; // overwrites logo after. 
.definelabel ok_MRSong, ok_ModelData + ok_ModelDataRawSize;

.definelabel ok_USAudio, ok_MRSong + 0x30;
.definelabel ok_TKMSpace, ok_USAudio + 0x10
.definelabel ok_FreeSpace, ok_TKMSpace + 0x2000
.definelabel ok_Storage, ok_FreeSpace + 0x8000








>>>>>>> ac8fb79... Custom Objects for Tarmac
