
.definelabel ok_HeaderROM, 0xBE9178
.definelabel ok_SaveSize, 0x28980
.definelabel ok_HeaderSize, 0x1400
.definelabel ok_MenuSize, 0x2800
.definelabel ok_CourseHeaderSize, 0x6C


.definelabel ok_HeaderOffsets, 0x80420000
.definelabel ok_MenuOffsets, ok_HeaderOffsets + ok_HeaderSize
.definelabel ok_CourseHeader, ok_MenuOffsets + ok_MenuSize
.definelabel ok_CourseTable, ok_CourseHeader + ok_CourseHeaderSize  //0x28 bytes

.definelabel ok_Target, ok_CourseTable + 0x28
.definelabel ok_Source, ok_Target + 0x4
.definelabel ok_Pointer, ok_Source + 0x4
.definelabel ok_FreePointer, ok_Pointer + 0x4  //set value after loading data.
.definelabel ok_RedCoinList, ok_FreePointer + 0x4
.definelabel ok_Credits, ok_RedCoinList + 0x50 //8 bytes per coin * 10 for space
.definelabel ok_MapTextureData, ok_Credits + 0x40 // up to 0x3000 bytes
.definelabel ok_scrolltranslucent, ok_MapTextureData + 0x3000  //hold a ton of potential scrolling objects or translucent objects. 

.definelabel ok_ModelData, ok_scrolltranslucent + 0x4000; // overwrites logo after. 

.definelabel ok_TKMSpace, ok_ModelData + ok_ModelDataRawSize;
.definelabel ok_USAudio, ok_TKMSpace + 0x2000
//.definelabel ok_USAudio, ok_FreeSpace + 0x10000
