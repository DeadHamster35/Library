#include "../../../library/MainInclude.h" 

/*README:
CALL IN INITIAL SETUP: //////////////////////////////////////////////////////////////////////////
	change_ib_crash_col();

MOVE INTO BUILD: ////////////////////////////////////////////////////////////////////////////////
	//ITEMBOX
	.org 0x10C5D0 //in 802A2F34 display_object2
	JAL display_itembox_hack
	.org 0x10C5E0
	JAL display_itembox_hack

	.org 0x10C5C0 //in 802A2F34 display_object2
	JAL display_fake_itembox_hack

	.org 0x10CC40 //in 802A3548 object_strategy
	JAL move_itembox_hook
	.org 0x10CC60
	JAL move_fake_itembox_hook
	.org 0x10CC50
	JAL move_special_itembox_hook

	.org 0x10830C // in 8029EC88 add_object_buffer <- called when objects set
	JAL set_object_buffer_hook

MOVE INTO BUILD IF YOU WANT TO TO REMOVE THE MENU ITEMBOX CURSOR: ////////////////////////////////
	//REMOVE ITEMBOX MENU CURSOR
	.org 0x0A29A4 //in ?
	NOP
	.org 0x0A2B04 //in ?
	NOP
	.org 0x0A38D8 //in ?
	NOP
	.org 0x0A5120 //in ?
	NOP
	.org 0x0A6320 //in ?
	NOP
	.org 0x0A6C0C //in ?
	NOP
	.org 0x0A6F10 //in ?
	NOP
	.org 0x0A7280 //in ?
	NOP
	
COMPILE ERROR?
	#define G_CCMUX_3	3 
	#define G_CCMUX_4	4
	#define G_ACMUX_3       3 
	#define G_ACMUX_4       4

*/

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   VARS                                                 //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

float ib_blender_scale = 0.003f;

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   TEXTURES                                             //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

u64 ibhatena_gem_txt[] = {
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092019200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x920092019a41c3c1, 0xd441dc81e501cc41, 0x9a81920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009201, 0xb341e481fd81fd81, 0xfdc1fe01fe01fe41, 0xedc1920192009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x92009200aac1ec81, 0xfd41fd81fd81fdc1, 0xfe01fe01fe41fe81, 0xfe819a8192009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200cbc1fd41fd41, 0xfd81fdc1fdc1f5c1, 0xdd01c441e581fec1, 0xfec1c48192009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009201, 0xdc41fd41fd81fd81, 0xfdc1ed41b3819201, 0x92009200ab81fec1, 0xff01c4c192009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x920092009a41ec81, 0xfd41fd81fd81fdc1, 0xcc41920192009200, 0x920092009201ff01, 0xff01b40192009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x92009201e481fd41, 0xfd81fd81fdc1ab41, 0x9200920092009200, 0x920092009200c4c1, 0xde01920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200dc41fd41fd81, 0xfdc1fdc1ab419200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0xcbc1fd81fd81fdc1, 0xfdc1ab4192009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x920092009200ab01, 0xfd81fd81fdc1fe01, 0xb381920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x920092009201ed01, 0xfd81fdc1fe01cc81, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x92009200d441fdc1, 0xfdc1fe01ed819201, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x92009a41fd81fdc1, 0xfe01fe01a3019200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092019201, 0x9201920192009200, 
	0x9200920092009200, 0x9200dcc1fe01fe01, 0xfe41d4c192009200, 0x9200920092009200, 0x9200920092009200, 0x920092009201a341, 0xc501de41f741ffc1, 0xff81eec192019200, 
	0x9200920092009200, 0xa2c1fe01fe01fe41, 0xf601920192009200, 0x9200920092009200, 0x9200920092019ac1, 0xbcc1de01f741ffc1, 0xffc1ffc1ffc1ff81, 0xff81ff81b4019200, 
	0x9200920092009200, 0xd481fe41fe41fe81, 0xc481920092009200, 0x920092009201a341, 0xc501de41ef01ffc1, 0xffc1ffc1ffc1ffc1, 0xffc1ffc1ff81ff81, 0xff81ff019a819200, 
	0x9200920092009201, 0xfe01fe41fe81f641, 0x9201920092009200, 0x9a81cd41eec1ff81, 0xffc1ffc1ffc1ffc1, 0xffc1ffc1ffc1ffc1, 0xff81ff81ff81ff81, 0xff41ee4192019200, 
	0x920092009200bc01, 0xfe81fe81fec1ccc1, 0x920092009200bc81, 0xff41ff81ff81ffc1, 0xffc1ffc1ffc1ffc1, 0xffc1f741de01b441, 0xc501ff81ff41ff41, 0xff01ee4192019200, 
	0x920092009200dd41, 0xfe81fec1fec19a81, 0x920092009200d581, 0xff81ff81ffc1ffc1, 0xffc1ffc1ef01de01, 0xabc1920192009201, 0xf701ff41ff41ff01, 0xff01ee0192019200, 
	0x920092009201fe81, 0xfec1fec1e6019201, 0x920092009200b441, 0xff81ffc1ffc1ef01, 0xcd81a34192019200, 0x920092009200c501, 0xff41ff41ff01ff01, 0xfec1ee0192019200, 
	0x92009200ab81fec1, 0xff01ff01c4c19200, 0x9200920092009200, 0xa341b4419ac19201, 0x9200920092009200, 0x920092009201f701, 0xff41ff01fec1fec1, 0xfe81edc192019200, 
	0x92009200ccc1ff01, 0xff01ff419a819200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x92009200c4c1ff01, 0xff01fec1f641fe81, 0xfe81dd4192009200, 
	0x92009200ddc1ff01, 0xff41eec192019200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x92009a81ff01ff01, 0xfec1ee01edc1fe41, 0xfe41d48192009200, 
	0x92009201ee41ff41, 0xff41de0192009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200d541ff01fec1, 0xfec1a301ed81fe41, 0xfe01d48192009200, 
	0x92009201ff01ff81, 0xff81d58192009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0xa301fec1fec1fe81, 0xdd419201ed81fe01, 0xfdc1d44192009200, 
	0x92009201ff81ff81, 0xff81c50192009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0xddc1fec1fe81fe81, 0xa3019201ed41fdc1, 0xfd81d44192009200, 
	0x92009201ff81ff81, 0xffc1b44192009200, 0x9200920092009200, 0x9200920092009200, 0x920092009200b3c1, 0xfec1fe81fe41d4c1, 0x92009201ed01fd81, 0xfd41d40192009200, 
	0x92009201ff81ffc1, 0xffc1b44192009200, 0x9200920092009200, 0x9200920092009200, 0x920092009a81f641, 0xfe81fe41f5c19a81, 0x92009201ed01fd41, 0xfd41d40192009200, 
	0x92009201ffc1ffc1, 0xffc1bcc192009200, 0x9200920092009200, 0x9200920092009200, 0x92009201e5c1fe81, 0xfe41fe01bbc19200, 0x92009201fd41fd41, 0xfd01d3c192009200, 
	0x92009201ffc1ffc1, 0xffc1d5c192009200, 0x9200920092009200, 0x9200920092009200, 0x9200d501fe81fe41, 0xfe01e50192019200, 0x92009201fd01fd01, 0xfcc1d3c192009200, 
	0x92009201f741ffc1, 0xffc1e68192019200, 0x9200920092009200, 0x9200920092009200, 0xc481fe41fe41fe01, 0xfdc19a8192009200, 0x92009201fd01fcc1, 0xfc81d38192009200, 
	0x92009201e6c1ffc1, 0xffc1ff819ac19200, 0x9200920092009200, 0x920092009200c441, 0xfe41fe41fe01fdc1, 0xb341920092009200, 0x92009201fcc1fc81, 0xfc81d38192009200, 
	0x92009200cd81ffc1, 0xffc1ff81d5819200, 0x9200920092009200, 0x92009a81dd41fe41, 0xfe01fe01fdc1c3c1, 0x9200920092009200, 0x92009201fc81fc81, 0xfc41d34192009200, 
	0x92009200a341ffc1, 0xff81ff81ff41de01, 0xb40192019201b3c1, 0xdd41fe41fe41fe01, 0xfe01fdc1dcc19200, 0x9200920092009200, 0x92009201fc41fc41, 0xfc01d34192009200, 
	0x920092009200de01, 0xff81ff41ff41ff01, 0xff01fec1fec1fe81, 0xfe41fe41fe01fdc1, 0xfdc1cc0192009200, 0x9200920092009200, 0x92009201fc41fc01, 0xfc01db4192009200, 
	0x9200920092009ac1, 0xeec1ff41ff01ff01, 0xfec1fec1fe81fe41, 0xfe41fe01fdc1f581, 0xb341920092009200, 0x9200920092009200, 0x92009201fc01fc01, 0xfbc1eb4192019200, 
	0x9200920092009200, 0x9a81dd81ff01fec1, 0xfe81fe81fe41fe01, 0xfe01f581d4419a41, 0x9200920092009200, 0x9200920092009200, 0x92009201f3c1fbc1, 0xfbc1fb81a2419200, 
	0x9200920092009200, 0x920092009a81bc01, 0xd4c1d4c1d481cc41, 0xab01920192009200, 0x9200920092009200, 0x9200920092009200, 0x92009200cb01fb81, 0xfb81fb81d2c19200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x920092009a41cac1, 0xf341eb41a2419200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9201920192009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 0x9200920092009200, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 0xfffefffefffefffe, 
	
};

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   VERTEX                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

Vtx ibshadow_Gem_mesh_vtx_0[8] = {
	{{{994, 0, -2400},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{-994, 0, -2400},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{-2400, 0, -994},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{-994, 0, 2400},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{-2400, 0, 994},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{2400, 0, 994},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{994, 0, 2400},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
	{{{2400, 0, -994},0, {-13, -1011},{0x00, 0x00, 0x00, 0x80}}},
};

Vtx ibhatena_Gem_mesh_vtx_0[4] = {
	{{{0, 2000, 996},0, {1008, -16},{0xFF, 0xFF, 0xFF, 0xFF}}},
	{{{0, 2000, -1004},0, {-16, -16},{0xFF, 0xFF, 0xFF, 0xFF}}},
	{{{0, -2000, -1004},0, {-16, 2032},{0xFF, 0xFF, 0xFF, 0xFF}}},
	{{{0, -2000, 996},0, {1008, 2032},{0xFF, 0xFF, 0xFF, 0xFF}}},
};

Vtx ib_Gem_mesh_vtx_0[91] = {
	{{{2400, 784, 994},0, {1, -117},{0x9B, 0x9B, 0x0, 0x99}}},
	{{{0, -2270, 0},0, {432, -1007},{0x99, 0x99, 0x0, 0x99}}},
	{{{2400, 784, -994},0, {-13, -1011},{0x99, 0x99, 0x0, 0x99}}},
	{{{0, -2270, 0},0, {432, -1007},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{994, 784, -2400},0, {-13, -1011},{0xDF, 0xDF, 0x0, 0x99}}},
	{{{2400, 784, -994},0, {1, -117},{0xDC, 0xDC, 0x0, 0x99}}},
	{{{994, 784, -2400},0, {1, -117},{0x99, 0x99, 0x0, 0x99}}},
	{{{-994, 784, -2400},0, {-13, -1011},{0x99, 0x99, 0x0, 0x99}}},
	{{{-2400, 784, -994},0, {-13, -1011},{0xDC, 0xDC, 0x0, 0x99}}},
	{{{-994, 784, -2400},0, {1, -117},{0xD7, 0xD7, 0x0, 0x99}}},
	{{{-2400, 784, -994},0, {1, -117},{0x99, 0x99, 0x0, 0x99}}},
	{{{-2400, 784, 994},0, {-13, -1011},{0x9B, 0x9B, 0x0, 0x99}}},
	{{{994, 784, 2400},0, {432, -1007},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{2400, 784, 994},0, {-13, -1011},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{1135, 1671, 1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, 1671, 1605},0, {1, -117},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{-994, 784, 2400},0, {432, -1007},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{994, 784, 2400},0, {-13, -1011},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{-2400, 784, 994},0, {432, -1007},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-994, 784, 2400},0, {-13, -1011},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-1135, 1671, 1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-1605, 1671, 0},0, {1, -117},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{-2400, 784, -994},0, {432, -1007},{0xCE, 0xCE, 0x0, 0x99}}},
	{{{-2400, 784, 994},0, {-13, -1011},{0xDE, 0xDE, 0x0, 0x99}}},
	{{{-994, 784, -2400},0, {432, -1007},{0xC1, 0xC1, 0x0, 0x99}}},
	{{{-2400, 784, -994},0, {-13, -1011},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-1135, 1671, -1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, 1671, -1605},0, {1, -117},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{994, 784, -2400},0, {432, -1007},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{-994, 784, -2400},0, {-13, -1011},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{2400, 784, -994},0, {432, -1007},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{994, 784, -2400},0, {-13, -1011},{0xC1, 0xC1, 0x0, 0x99}}},
	{{{1135, 1671, -1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-1135, 1671, 1135},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-994, 784, 2400},0, {432, -1007},{0xFE, 0xFE, 0x0, 0x99}}},
	{{{0, 1671, 1605},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{994, 784, 2400},0, {432, -1007},{0xFE, 0xFE, 0x0, 0x99}}},
	{{{1135, 1671, 1135},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{0, 1671, 1605},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{1135, 1671, 1135},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{2400, 784, 994},0, {432, -1007},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{1605, 1671, 0},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{2400, 784, -994},0, {432, -1007},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{1135, 1671, -1135},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{1605, 1671, 0},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{1135, 1671, -1135},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{994, 784, -2400},0, {432, -1007},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{0, 1671, -1605},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-994, 784, -2400},0, {432, -1007},{0xFC, 0xFC, 0x0, 0x99}}},
	{{{-1135, 1671, -1135},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{0, 1671, -1605},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-1135, 1671, -1135},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-2400, 784, -994},0, {432, -1007},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-1605, 1671, 0},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-2400, 784, 994},0, {432, -1007},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-1135, 1671, 1135},0, {-13, -1011},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{-1605, 1671, 0},0, {1, -117},{0xFF, 0xFF, 0x0, 0x99}}},
	{{{1135, 1671, -1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {432, -1007},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{1605, 1671, 0},0, {-13, -1011},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, -2270, 0},0, {432, -1007},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{-994, 784, 2400},0, {-13, -1011},{0xDB, 0xDB, 0x0, 0x99}}},
	{{{-2400, 784, 994},0, {1, -117},{0xD7, 0xD7, 0x0, 0x99}}},
	{{{-994, 784, 2400},0, {1, -117},{0x99, 0x99, 0x0, 0x99}}},
	{{{0, -2270, 0},0, {432, -1007},{0x99, 0x99, 0x0, 0x99}}},
	{{{994, 784, 2400},0, {-13, -1011},{0x99, 0x99, 0x0, 0x99}}},
	{{{2400, 784, 994},0, {-13, -1011},{0xD7, 0xD7, 0x0, 0x99}}},
	{{{994, 784, 2400},0, {1, -117},{0xDB, 0xDB, 0x0, 0x99}}},
	{{{1605, 1671, 0},0, {1, -117},{0xCC, 0xCC, 0x0, 0x99}}},
	{{{2400, 784, 994},0, {432, -1007},{0xDE, 0xDE, 0x0, 0x99}}},
	{{{2400, 784, -994},0, {-13, -1011},{0xCE, 0xCE, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {432, -1007},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{1135, 1671, 1135},0, {-13, -1011},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{1605, 1671, 0},0, {1, -117},{0xDB, 0xDB, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-1605, 1671, 0},0, {432, -1007},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{-1135, 1671, 1135},0, {-13, -1011},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {432, -1007},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, 1671, -1605},0, {-13, -1011},{0xFC, 0xFC, 0x0, 0x99}}},
	{{{-1135, 1671, -1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{1135, 1671, 1135},0, {1, -117},{0xBB, 0xBB, 0x0, 0x99}}},
	{{{0, 1671, 1605},0, {-13, -1011},{0xC2, 0xC2, 0x0, 0x99}}},
	{{{-1605, 1671, 0},0, {432, -1007},{0xDB, 0xDB, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {-13, -1011},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{-1135, 1671, -1135},0, {1, -117},{0xDC, 0xDC, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {1, -117},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{-1135, 1671, 1135},0, {432, -1007},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{0, 1671, 1605},0, {-13, -1011},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{0, 1671, 0},0, {432, -1007},{0xDD, 0xDD, 0x0, 0x99}}},
	{{{1135, 1671, -1135},0, {-13, -1011},{0xDC, 0xDC, 0x0, 0x99}}},
	{{{0, 1671, -1605},0, {1, -117},{0xDD, 0xDD, 0x0, 0x99}}},
};

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   TRIS (DRAW COMMAND)                                  //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

Gfx ibshadow_Gem_mesh_tri_0[] = {
	gsSPVertex(ibshadow_Gem_mesh_vtx_0 + 0, 8, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(0, 2, 3, 0),
	gsSP1Triangle(2, 4, 3, 0),
	gsSP1Triangle(3, 5, 0, 0),
	gsSP1Triangle(3, 6, 5, 0),
	gsSP1Triangle(5, 7, 0, 0),
	gsSPEndDisplayList(),
};

Gfx ibhatena_Gem_mesh_tri_0[] = {
	gsSPVertex(ibhatena_Gem_mesh_vtx_0 + 0, 4, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(0, 2, 3, 0),
	gsSPEndDisplayList(),
};

Gfx ib_Gem_mesh_tri_0[] = {
	gsSPVertex(ib_Gem_mesh_vtx_0 + 0, 15, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(3, 4, 5, 0),
	gsSP1Triangle(6, 1, 7, 0),
	gsSP1Triangle(3, 8, 9, 0),
	gsSP1Triangle(10, 1, 11, 0),
	gsSP1Triangle(12, 13, 14, 0),
	gsSPVertex(ib_Gem_mesh_vtx_0 + 15, 15, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(3, 4, 5, 0),
	gsSP1Triangle(6, 7, 8, 0),
	gsSP1Triangle(9, 10, 11, 0),
	gsSP1Triangle(12, 13, 14, 0),
	gsSPVertex(ib_Gem_mesh_vtx_0 + 30, 15, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(3, 4, 5, 0),
	gsSP1Triangle(6, 7, 8, 0),
	gsSP1Triangle(9, 10, 11, 0),
	gsSP1Triangle(12, 13, 14, 0),
	gsSPVertex(ib_Gem_mesh_vtx_0 + 45, 15, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(3, 4, 5, 0),
	gsSP1Triangle(6, 7, 8, 0),
	gsSP1Triangle(9, 10, 11, 0),
	gsSP1Triangle(12, 13, 14, 0),
	gsSPVertex(ib_Gem_mesh_vtx_0 + 60, 14, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(3, 4, 5, 0),
	gsSP1Triangle(0, 6, 7, 0),
	gsSP1Triangle(8, 9, 10, 0),
	gsSP1Triangle(11, 12, 13, 0),
	gsSPVertex(ib_Gem_mesh_vtx_0 + 74, 14, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSP1Triangle(3, 4, 5, 0),
	gsSP1Triangle(6, 3, 7, 0),
	gsSP1Triangle(8, 9, 10, 0),
	gsSP1Triangle(11, 12, 13, 0),
	gsSPVertex(ib_Gem_mesh_vtx_0 + 88, 3, 0),
	gsSP1Triangle(0, 1, 2, 0),
	gsSPEndDisplayList(),
};

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   MESH & MATERIAL                                      //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

Gfx ib_Gem_mesh[] = {
	gsSPDisplayList(ib_Gem_mesh_tri_0),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsSPEndDisplayList(),
};

Gfx ibhatena_Gem_material[] = {
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsSPClearGeometryMode(G_CULL_BACK),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPTileSync(),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, ibhatena_gem_txt),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPLoadSync(),
	gsDPLoadBlock(7, 0, 0, 2047, 256),
	gsDPPipeSync(),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 252),
	gsDPSetPrimColor(0, 0, 254, 254, 254, 255),
	gsSPEndDisplayList(),
};

Gfx ibhatena_Gem_mesh[] = {
	gsDPSetRenderMode	(G_RM_ZB_CLD_SURF, G_RM_ZB_CLD_SURF2),
	gsSPDisplayList(ibhatena_Gem_material),
	gsSPDisplayList(ibhatena_Gem_mesh_tri_0),
		//gsSPDisplayList(ibhatena_Gem_revert_material), //DELETED & ADDED DIRECTLY HERE:
		gsDPPipeSync(),
		gsSPSetGeometryMode(G_CULL_BACK),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsSPEndDisplayList(),
};

Gfx ibshadow_Gem_mesh[]={
	gsDPPipeSync(),
	gsSPTexture(0xFFFF, 0xFFFF, 1, 1, 0),
	gsSPClearGeometryMode(G_LIGHTING),
	gsDPSetBlendMask(0xff),
   	gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
 	gsDPSetRenderMode	(G_RM_ZB_CLD_SURF, G_RM_ZB_CLD_SURF2),
	gsSPDisplayList(ibshadow_Gem_mesh_tri_0),
        gsDPSetAlphaCompare(G_AC_NONE),	//clear!
	gsSPEndDisplayList(),
}; 

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   MOVEMENT                                             //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

void set_object_buffer_hook (Object *obj,FVector pos,SVector angle,FVector velo,short category)
{
	set_object_buffer(obj,pos,angle,velo,category);

	if(category == FAKEIBOX)
	{
		obj->fparam = 0.35f*ib_blender_scale; //OG: D_802B95F4 0.35f
	}
}

void move_itembox_hook(Object *obj)
{
	move_itembox(obj);

	obj->angle[0] = 0;		//OG: obj->angle[0]+=deg1*1;
							//OG: obj->angle[1]-=deg1*2; 182*2=364 0x16C
	obj->angle[2] = 0;		//OG: obj->angle[2]+=deg1*1;
}

void move_fake_itembox_hook (Object *obj)
{
	float   dd,dx,dy,dz;
	
	move_fake_itembox(obj);

	switch(obj->sparam)
	{
	case 0: //Y POS FIX
			dx = GlobalPlayer[(int)obj->velocity[0]].position[0] - obj->position[0];
			dy = GlobalPlayer[(int)obj->velocity[0]].position[1] - obj->position[1];
			dz = GlobalPlayer[(int)obj->velocity[0]].position[2] - obj->position[2];
			dd = Sqrtf(dx*dx+dy*dy+dz*dz)/10.0f;
			dy /= dd;	
			obj->position[1]= GlobalPlayer[(int)obj->velocity[0]].position[1] -(dy*ib_blender_scale) -2.5f;//OG: -dy -1.0f;

			//RADIUS FIX
			obj->radius=5.5f*0.35f;
			break; 
	case 1: //SCALE AFTER DROP FIX
			if(obj->fparam<1.0f*ib_blender_scale)	   	   obj->fparam+=0.05f;
 			else if(obj->fparam>=1.0f*ib_blender_scale)	   obj->fparam=1.0f*ib_blender_scale;

			//RADIUS FIX
			obj->radius=5.5f*1.0f;
			break;
	}

	//ROTATION
	obj->angle[0] = 0; 				//OG: obj->angle[0]-=deg1*1;
	obj->angle[1] -= 0x16C + 0x16C;	//OG: obj->angle[1]+=deg1*2; 182*2=364 0x16C
	obj->angle[2] = 0;				//OG: obj->angle[2]-=deg1*1;
}

void move_special_itembox_hook(Object *obj)
{
	move_special_itembox(obj);
	
	obj->angle[0] = 0;		//OG: obj->angle[0]+=deg1*1;
							//OG: obj->angle[1]-=deg1*2; 
	obj->angle[2] = 0;  	//OG: obj->angle[2]+=deg1*1;    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   ITEMBOX CRUSH ANIM                                   //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

void change_ib_crash_col () //USE OG TRIS FOR CRASH ANIM (THIS WILL CHANGE THE MENU CURSOR TOO!)
{
	for(int i=0, j=0; i<24; ) //DYE WITH 2 ALTERNATING COLORS
	{
		*(uint*)(0x801A16B4 + i*0x10) = 0xFFFF0099;
		*(uint*)(0x801A16E4 + i*0x10) = 0x99990099;

		if(j == 2){j=0, i+=4;}
		else{i++; j++;}
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   DRAWING                                              //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

void display_fake_itembox_hack (Camera *camera,Object *obj)
{
	SVector   angle; 
	FVector   vct;
	AffineMtx aff;
	AffineMtx aff2;
	float pp,scale;

	FVector     kageposition;
	SVector     kageangle;

	
	float distance=check_display_range(camera->camera_pos,obj->position,camera->camera_direction[1],50*50,screen_view_angle[camera-camera1],1000*1000);
  	if(distance<0) {out_of_screen(camera,obj); return;}

	if(obj->position[1]>((float)maximum_y)+800.0f) {out_of_screen(camera,obj); return;} // 
	if(obj->position[1]<((float)minimum_y)-800.0f) {out_of_screen(camera,obj); return;} // 

  	on_screen(camera,obj);

  	//HATENA	
	angle[0]=0;            
	angle[1]=obj->angle[1];
	angle[2]=0;            

	create_modeling_matrix(aff,obj->position,angle);
	scaling_matrix(aff,obj->fparam);

	if(obj->sparam!=2)
	{
		if((obj->sparam != 0) && (distance<100000)) //CLOSE VIEW
		{
	     	/*kageangle[0]=0; //CAN BE USED BUT DOESN'T LOOK THAT GOOD ON STEEP TERRAIN ATM 
	     	kageangle[1]=obj->angle[1];
	     	kageangle[2]=0;
	     	kageposition[0]=obj->position[0];
	     	kageposition[1]=obj->position[1] - (8.3f); //FINETUNE
	     	kageposition[2]=obj->position[2];
		    create_modeling_matrix(aff,kageposition,kageangle);
			scaling_matrix(aff,obj->fparam);
		    if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
      	   	gSPDisplayList(GraphPtr++, ibshadow_Gem_mesh); //gfx_itemboxshadow */

			kageangle[0]=0;
			kageangle[1]=obj->angle[1]*2;
			kageangle[2]=0;
			kageposition[0]=obj->position[0];
	     	kageposition[1]=obj->position[1];
			kageposition[2]=obj->position[2];
		    create_modeling_matrix(aff,kageposition,kageangle);
			scaling_matrix(aff,obj->fparam);
		    if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
			gSPDisplayList(GraphPtr++, ibhatena_Gem_mesh);//itembox_grp_hatena
		}
		
		create_modeling_matrix(aff,obj->position,obj->angle);
		scaling_matrix(aff,obj->fparam);
		if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
		gSPClearGeometryMode(GraphPtr++,G_LIGHTING);
		gDPSetCombineMode(GraphPtr++,G_CC_MODULATERGBA, G_CC_MODULATERGBA);
		
			if(((obj->angle[1])<deg15)&&((obj->angle[1])>0))
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
		else if(((obj->angle[1])>deg1*150)&&((obj->angle[1])<deg1*165))
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
		else if(((obj->angle[1])>deg1*80)&&((obj->angle[1])<deg1*95))
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
		else if(((obj->angle[1])>deg1*280)&&((obj->angle[1])<deg1*295))
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
		else
		{
			gDPSetBlendMask(GraphPtr++,0xff);
			gDPSetRenderMode(GraphPtr++,G_RM_ZB_CLD_SURF,G_RM_ZB_CLD_SURF2);
		}
			
		gSPSetGeometryMode(GraphPtr++,G_SHADING_SMOOTH);
		gSPDisplayList(GraphPtr++, &ib_Gem_mesh); //itembox_grp_box
	}
	else //explosion	
	{
		gSPClearGeometryMode(GraphPtr++,G_LIGHTING);
		gSPClearGeometryMode(GraphPtr++, G_CULL_BACK);
		gDPSetBlendMask(GraphPtr++,0xff);

		pp=(float)obj->counter;
		create_modeling_matrix(aff,obj->position,obj->angle);
		if(pp<10.0f) scale=1.0f;
		else		 scale=1.0f-(pp-10.0f)*0.1f;
		scaling_matrix(aff,scale);
		
		if(obj->counter&01)
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
		else
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_XLU_INTER,G_RM_AA_ZB_XLU_INTER);}
		
		vct[0]=0.0f*pp;
		vct[1]=2.0f*pp;
		vct[2]=1.0f*pp;
		translate_matrix(aff,aff2,vct);
		if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
		gSPDisplayList(GraphPtr++, itembox_obj_b2);							    		     		         
		vct[0]=0.8f*pp;
		vct[1]=2.3f*pp;
		vct[2]=0.5f*pp;
		translate_matrix(aff,aff2,vct);
		if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
		gSPDisplayList(GraphPtr++, itembox_obj_b5);							    		     		         
		vct[0]=0.8f*pp;
		vct[1]=1.2f*pp;
		vct[2]=-0.5f*pp;
		translate_matrix(aff,aff2,vct);
		if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
		gSPDisplayList(GraphPtr++, itembox_obj_b3);							    		     		         
	
		if(!(obj->counter&01))
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
		else
		{gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_XLU_INTER,G_RM_AA_ZB_XLU_INTER);}
	
		vct[0]=0.0f*pp;
		vct[1]=1.8f*pp;
		vct[2]=-1.0f*pp;
		translate_matrix(aff,aff2,vct);
		if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
		gSPDisplayList(GraphPtr++, itembox_obj_b6);							    		     		         
		vct[0]=-0.8f*pp;
		vct[1]=0.6f*pp;
		vct[2]=-0.5f*pp;
		translate_matrix(aff,aff2,vct);
		if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
		gSPDisplayList(GraphPtr++, itembox_obj_b1);							    		     		         
		vct[0]=-0.8f*pp;
		vct[1]=2.0f*pp;
		vct[2]=0.5f*pp;
		translate_matrix(aff,aff2,vct);
		if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
		gSPDisplayList(GraphPtr++, itembox_obj_b4);							    		     		         
		gSPSetGeometryMode(GraphPtr++, G_CULL_BACK);
	}
}

void display_itembox_hack (Camera *camera,Object *obj)
{
	FVector     vct;
	FVector     kageposition;
	SVector     kageangle;
	float       pp,scale;
	float 		aff[4][4];
	float 		aff2[4][4];

  	float distance = check_display_range(camera->camera_pos,obj->position,camera->camera_direction[1],0,screen_view_angle[camera-camera1],2000*2000);
  
  	if(distance<0) return;
  	if(distance>600000) return;

		if((obj->sparam==2)&&(distance<100000)) //CLOSE VIEW
		{
	     	kageangle[0]=0;
	     	kageangle[1]=obj->angle[1];
	     	kageangle[2]=0;
	     	kageposition[0]=obj->position[0];
	     	kageposition[1]=obj->fparam+2.0f;
	     	kageposition[2]=obj->position[2];
		    create_modeling_matrix(aff,kageposition,kageangle);
			ScalingMatrix(aff, ib_blender_scale);
		    if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
      	   	gSPDisplayList(GraphPtr++, ibshadow_Gem_mesh); //gfx_itemboxshadow

			kageangle[1]=obj->angle[1]*2;
	     	kageposition[1]=obj->position[1];
		    create_modeling_matrix(aff,kageposition,kageangle);
			ScalingMatrix(aff, ib_blender_scale);
		    if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
			gSPDisplayList(GraphPtr++, ibhatena_Gem_mesh);//itembox_grp_hatena
		}

		if(obj->sparam==5) //FOR SPECIAL IB
        {
		    create_modeling_matrix(aff,obj->position,obj->angle);
			ScalingMatrix(aff, ib_blender_scale);
		    if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
		    gSPDisplayList(GraphPtr++, ibhatena_Gem_mesh);//itembox_grp_hatena
		}

		if(obj->sparam!=3)
		{
			 create_modeling_matrix(aff,obj->position,obj->angle);
			 ScalingMatrix(aff, ib_blender_scale);
		    if(set_matrix(aff,LOADNOPUSH)==FALSE)  return;
    	    gSPClearGeometryMode(GraphPtr++,G_LIGHTING);
    	    gDPSetCombineMode(GraphPtr++,G_CC_MODULATERGBA, G_CC_MODULATERGBA);
  	        
			  if(((obj->angle[1])<deg15)&&((obj->angle[1])>0))
	        {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
  	        else if(((obj->angle[1])>deg1*150)&&((obj->angle[1])<deg1*165))
	        {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
  	        else if(((obj->angle[1])>deg1*80)&&((obj->angle[1])<deg1*95))
	        {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
  	        else if(((obj->angle[1])>deg1*280)&&((obj->angle[1])<deg1*295))
	        {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
	        else
            {
       	        gDPSetBlendMask(GraphPtr++,0xff);
 	            gDPSetRenderMode(GraphPtr++,G_RM_ZB_CLD_SURF,G_RM_ZB_CLD_SURF2);
  	        }
			  
    	    gSPSetGeometryMode(GraphPtr++,G_SHADING_SMOOTH);
			gSPDisplayList(GraphPtr++, &ib_Gem_mesh); //itembox_grp_box
		}
		else
		{
            gSPClearGeometryMode(GraphPtr++,G_LIGHTING);
            gSPClearGeometryMode(GraphPtr++, G_CULL_BACK);
            gDPSetBlendMask(GraphPtr++,0xff);

            pp=(float)obj->counter;
            create_modeling_matrix(aff,obj->position,obj->angle);
            if(pp<10.0f) scale=1.0f;
            else		 scale=1.0f-(pp-10.0f)*0.1f;
            scaling_matrix(aff,scale);
            
            if(obj->counter&01)
            {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
            else
            {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_XLU_INTER,G_RM_AA_ZB_XLU_INTER);}
            
            vct[0]=0.0f*pp;
            vct[1]=2.0f*pp;
            vct[2]=1.0f*pp;
            translate_matrix(aff,aff2,vct);
            if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
            gSPDisplayList(GraphPtr++, itembox_obj_b2);							    		     		         
            vct[0]=0.8f*pp;
            vct[1]=2.3f*pp;
            vct[2]=0.5f*pp;
            translate_matrix(aff,aff2,vct);
            if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
            gSPDisplayList(GraphPtr++, itembox_obj_b5);							    		     		         
            vct[0]=0.8f*pp;
            vct[1]=1.2f*pp;
            vct[2]=-0.5f*pp;
            translate_matrix(aff,aff2,vct);
            if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
            gSPDisplayList(GraphPtr++, itembox_obj_b3);							    		     		         
        
            if(!(obj->counter&01))
            {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);}
            else
            {gDPSetRenderMode(GraphPtr++,G_RM_AA_ZB_XLU_INTER,G_RM_AA_ZB_XLU_INTER);}
        
            vct[0]=0.0f*pp;
            vct[1]=1.8f*pp;
            vct[2]=-1.0f*pp;
            translate_matrix(aff,aff2,vct);
            if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
            gSPDisplayList(GraphPtr++, itembox_obj_b6);							    		     		         
            vct[0]=-0.8f*pp;
            vct[1]=0.6f*pp;
            vct[2]=-0.5f*pp;
            translate_matrix(aff,aff2,vct);
            if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
            gSPDisplayList(GraphPtr++, itembox_obj_b1);							    		     		         
            vct[0]=-0.8f*pp;
            vct[1]=2.0f*pp;
            vct[2]=0.5f*pp;
            translate_matrix(aff,aff2,vct);
            if(set_matrix(aff2,LOADNOPUSH)==FALSE)  return;
            gSPDisplayList(GraphPtr++, itembox_obj_b4);							    		     		         
            gSPSetGeometryMode(GraphPtr++, G_CULL_BACK);
		}

	gSPTexture(GraphPtr++,65535, 65535,0, 0, 1);
}
