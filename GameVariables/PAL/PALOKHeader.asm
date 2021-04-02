;;These are new custom RAM values
;;0x80400000 - 0x804FFFFF is restricted for OverKart64 functions and data.
;;0x80500000 - 0x805FFFFF is reserved for Custom Course Assembly and data.
;;0X80600000 - 0X80780000 should be safe for any other custom code.
;;The end of RAM is course data, from 0x80800000 backwards.
;;This varies based on the size of data for the current course. Be cautious!

.definelabel ok_ItemChance1, 0x80415000
.definelabel ok_ItemChance2, 0x80415004
.definelabel ok_ItemChance3, 0x80415008
.definelabel ok_ItemChance4, 0x8041500C
.definelabel ok_ItemChance5, 0x80415010
.definelabel ok_ItemChance6, 0x80415014
.definelabel ok_ItemChance7, 0x80415018
.definelabel ok_ItemChance8, 0x8041501C

.definelabel ok_NameOffset, 0x80417000
.definelabel ok_ok_NameEnd, 0x80417004
.definelabel ok_GhostOffset, 0x80417008
.definelabel ok_GhostEnd, 0x8041700C

.definelabel ok_Song, 0x80417010
.definelabel ok_SpeedA, 0x80417011
.definelabel ok_SpeedB, 0x80417012
.definelabel ok_SpeedC, 0x80417013

.definelabel ok_MapOffset, 0x80417014
.definelabel ok_MapEnd, 0x80417018
.definelabel ok_CoordOffset, 0x8041701C
.definelabel ok_CoordEnd, 0x80417020
.definelabel ok_SkyOffset, 0x80417024
.definelabel ok_SkyEnd, 0x80417028
.definelabel ok_ASMOffset, 0x8041702C
.definelabel ok_ASMEnd, 0x80417030

.definelabel ok_Target, 0x80418F40
.definelabel ok_Source, 0x80418F44
.definelabel ok_targetAddress, 0x80418F48
.definelabel ok_sourceAddress, 0x80418F4C


.definelabel ok_ASMJump, 0x80500000
