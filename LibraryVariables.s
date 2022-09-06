	.file	1 "LibraryVariables.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.globl	TeamScore
	.section	.bss,"aw",@nobits
	.align	2
	.type	TeamScore, @object
	.size	TeamScore, 4
TeamScore:
	.space	4
	.globl	HitstunTime
	.align	1
	.type	HitstunTime, @object
	.size	HitstunTime, 2
HitstunTime:
	.space	2
	.globl	SpawnTime
	.align	1
	.type	SpawnTime, @object
	.size	SpawnTime, 2
SpawnTime:
	.space	2
	.globl	ObjectiveCount
	.type	ObjectiveCount, @object
	.size	ObjectiveCount, 1
ObjectiveCount:
	.space	1
	.globl	ScoreToWin
	.type	ScoreToWin, @object
	.size	ScoreToWin, 1
ScoreToWin:
	.space	1
	.globl	TeamMode
	.type	TeamMode, @object
	.size	TeamMode, 1
TeamMode:
	.space	1
	.globl	FlagCount
	.type	FlagCount, @object
	.size	FlagCount, 1
FlagCount:
	.space	1
	.globl	SpawnPoint
	.align	2
	.type	SpawnPoint, @object
	.size	SpawnPoint, 48
SpawnPoint:
	.space	48
	.globl	CustomObjectivePoints
	.align	2
	.type	CustomObjectivePoints, @object
	.size	CustomObjectivePoints, 4
CustomObjectivePoints:
	.space	4
	.globl	ObjectivePoints
	.align	2
	.type	ObjectivePoints, @object
	.size	ObjectivePoints, 4
ObjectivePoints:
	.space	4
	.globl	PlayerSpawnPoints
	.align	2
	.type	PlayerSpawnPoints, @object
	.size	PlayerSpawnPoints, 4
PlayerSpawnPoints:
	.space	4
	.globl	GameBase
	.align	2
	.type	GameBase, @object
	.size	GameBase, 480
GameBase:
	.space	480
	.globl	GameFlag
	.align	2
	.type	GameFlag, @object
	.size	GameFlag, 480
GameFlag:
	.space	480
	.globl	Objectives
	.align	2
	.type	Objectives, @object
	.size	Objectives, 32
Objectives:
	.space	32
	.globl	Origin
	.align	2
	.type	Origin, @object
	.size	Origin, 12
Origin:
	.space	12
	.globl	courseChar
	.data
	.align	2
	.type	courseChar, @object
	.size	courseChar, 80
courseChar:
	.word	13
	.word	14
	.word	13
	.word	17
	.word	12
	.word	15
	.word	18
	.word	13
	.word	13
	.word	12
	.word	13
	.word	15
	.word	11
	.word	12
	.word	13
	.word	10
	.word	10
	.word	11
	.word	17
	.word	9
	.globl	courseNames
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"Mario Raceway\000"
	.align	2
$LC1:
	.ascii	"Choco Mountain\000"
	.align	2
$LC2:
	.ascii	"Bowser Castle\000"
	.align	2
$LC3:
	.ascii	"Banshee Boardwalk\000"
	.align	2
$LC4:
	.ascii	"Yoshi Valley\000"
	.align	2
$LC5:
	.ascii	"Frappe Snowland\000"
	.align	2
$LC6:
	.ascii	"Koopa Troopa Beach\000"
	.align	2
$LC7:
	.ascii	"Royal Raceway\000"
	.align	2
$LC8:
	.ascii	"Luigi Raceway\000"
	.align	2
$LC9:
	.ascii	"Moo Moo Farm\000"
	.align	2
$LC10:
	.ascii	"Toad Turnpike\000"
	.align	2
$LC11:
	.ascii	"Kalimari Desert\000"
	.align	2
$LC12:
	.ascii	"Sherbet Land\000"
	.align	2
$LC13:
	.ascii	"Rainbow Road\000"
	.align	2
$LC14:
	.ascii	"Wario Stadium\000"
	.align	2
$LC15:
	.ascii	"Block Fort\000"
	.align	2
$LC16:
	.ascii	"Skyscraper\000"
	.align	2
$LC17:
	.ascii	"Double Deck\000"
	.align	2
$LC18:
	.ascii	"DK Jungle Parkway\000"
	.align	2
$LC19:
	.ascii	"Big Donut\000"
	.data
	.align	2
	.type	courseNames, @object
	.size	courseNames, 80
courseNames:
	.word	$LC0
	.word	$LC1
	.word	$LC2
	.word	$LC3
	.word	$LC4
	.word	$LC5
	.word	$LC6
	.word	$LC7
	.word	$LC8
	.word	$LC9
	.word	$LC10
	.word	$LC11
	.word	$LC12
	.word	$LC13
	.word	$LC14
	.word	$LC15
	.word	$LC16
	.word	$LC17
	.word	$LC18
	.word	$LC19
	.globl	cupChar
	.align	2
	.type	cupChar, @object
	.size	cupChar, 16
cupChar:
	.word	12
	.word	10
	.word	8
	.word	11
	.globl	cupNames
	.section	.rodata.str1.4
	.align	2
$LC20:
	.ascii	"Mushroom Cup\000"
	.align	2
$LC21:
	.ascii	"Flower Cup\000"
	.align	2
$LC22:
	.ascii	"Star Cup\000"
	.align	2
$LC23:
	.ascii	"Special Cup\000"
	.data
	.align	2
	.type	cupNames, @object
	.size	cupNames, 16
cupNames:
	.word	$LC20
	.word	$LC21
	.word	$LC22
	.word	$LC23
	.globl	ScrollValues
	.section	.bss
	.align	2
	.type	ScrollValues, @object
	.size	ScrollValues, 256
ScrollValues:
	.space	256
	.globl	MenuOverflow
	.align	2
	.type	MenuOverflow, @object
	.size	MenuOverflow, 4
MenuOverflow:
	.space	4
	.globl	MenuCup
	.align	2
	.type	MenuCup, @object
	.size	MenuCup, 4
MenuCup:
	.space	4
	.globl	MenuIndex
	.align	2
	.type	MenuIndex, @object
	.size	MenuIndex, 4
MenuIndex:
	.space	4
	.globl	ParameterIndex
	.align	2
	.type	ParameterIndex, @object
	.size	ParameterIndex, 4
ParameterIndex:
	.space	4
	.globl	VersionNumber
	.align	2
	.type	VersionNumber, @object
	.size	VersionNumber, 4
VersionNumber:
	.space	4
	.globl	gpTotalTime
	.align	2
	.type	gpTotalTime, @object
	.size	gpTotalTime, 4
gpTotalTime:
	.space	4
	.globl	MenuToggle
	.type	MenuToggle, @object
	.size	MenuToggle, 1
MenuToggle:
	.space	1
	.globl	MenuButtonHeld
	.align	2
	.type	MenuButtonHeld, @object
	.size	MenuButtonHeld, 8
MenuButtonHeld:
	.space	8
	.globl	ButtonTimer
	.align	2
	.type	ButtonTimer, @object
	.size	ButtonTimer, 4
ButtonTimer:
	.space	4
	.globl	ButtonHolding
	.align	2
	.type	ButtonHolding, @object
	.size	ButtonHolding, 4
ButtonHolding:
	.space	4
	.globl	MenuAngle
	.align	2
	.type	MenuAngle, @object
	.size	MenuAngle, 8
MenuAngle:
	.space	8
	.globl	courseValue
	.data
	.align	1
	.type	courseValue, @object
	.size	courseValue, 2
courseValue:
	.half	-1
	.globl	gpTimeCheck
	.section	.bss
	.align	1
	.type	gpTimeCheck, @object
	.size	gpTimeCheck, 2
gpTimeCheck:
	.space	2
	.globl	hsGP
	.align	1
	.type	hsGP, @object
	.size	hsGP, 2
hsGP:
	.space	2
	.globl	HotSwapID
	.align	1
	.type	HotSwapID, @object
	.size	HotSwapID, 2
HotSwapID:
	.space	2
	.globl	gpCourseIndex
	.align	1
	.type	gpCourseIndex, @object
	.size	gpCourseIndex, 2
gpCourseIndex:
	.space	2
	.globl	AudioLanguage
	.align	1
	.type	AudioLanguage, @object
	.size	AudioLanguage, 2
AudioLanguage:
	.space	2
	.globl	MenuBlink
	.align	1
	.type	MenuBlink, @object
	.size	MenuBlink, 2
MenuBlink:
	.space	2
	.globl	FireParticlePositions
	.align	2
	.type	FireParticlePositions, @object
	.size	FireParticlePositions, 48
FireParticlePositions:
	.space	48
	.globl	currentHeaderAddress
	.align	2
	.type	currentHeaderAddress, @object
	.size	currentHeaderAddress, 4
currentHeaderAddress:
	.space	4
	.globl	scrollLock
	.type	scrollLock, @object
	.size	scrollLock, 1
scrollLock:
	.space	1
	.globl	courseSwapped
	.data
	.align	1
	.type	courseSwapped, @object
	.size	courseSwapped, 2
courseSwapped:
	.half	-1
	.globl	startupSwitch
	.section	.bss
	.align	1
	.type	startupSwitch, @object
	.size	startupSwitch, 2
startupSwitch:
	.space	2
	.globl	raceStatus
	.align	1
	.type	raceStatus, @object
	.size	raceStatus, 2
raceStatus:
	.space	2
	.globl	hsLabel
	.align	1
	.type	hsLabel, @object
	.size	hsLabel, 2
hsLabel:
	.space	2
	.globl	CoinPositions
	.align	2
	.type	CoinPositions, @object
	.size	CoinPositions, 48
CoinPositions:
	.space	48
	.globl	CPUPaths
	.align	2
	.type	CPUPaths, @object
	.size	CPUPaths, 32
CPUPaths:
	.space	32
	.globl	OKObjectArray
	.align	2
	.type	OKObjectArray, @object
	.size	OKObjectArray, 14800
OKObjectArray:
	.space	14800
	.globl	stockCharacterNames
	.section	.rodata.str1.4
	.align	2
$LC24:
	.ascii	"MARIO\000"
	.align	2
$LC25:
	.ascii	"LUIGI\000"
	.align	2
$LC26:
	.ascii	"YOSHI\000"
	.align	2
$LC27:
	.ascii	"TOAD\000"
	.align	2
$LC28:
	.ascii	"D.K.\000"
	.align	2
$LC29:
	.ascii	"WARIO\000"
	.align	2
$LC30:
	.ascii	"PEACH\000"
	.align	2
$LC31:
	.ascii	"BOWSER\000"
	.data
	.align	2
	.type	stockCharacterNames, @object
	.size	stockCharacterNames, 32
stockCharacterNames:
	.word	$LC24
	.word	$LC25
	.word	$LC26
	.word	$LC27
	.word	$LC28
	.word	$LC29
	.word	$LC30
	.word	$LC31
	.globl	stockCourseNames
	.section	.rodata.str1.4
	.align	2
$LC32:
	.ascii	"Bowser's Castle\000"
	.align	2
$LC33:
	.ascii	"Toad's Turnpike\000"
	.align	2
$LC34:
	.ascii	"D.K.'s Jungle Parkway\000"
	.data
	.align	2
	.type	stockCourseNames, @object
	.size	stockCourseNames, 80
stockCourseNames:
	.word	$LC0
	.word	$LC1
	.word	$LC32
	.word	$LC3
	.word	$LC4
	.word	$LC5
	.word	$LC6
	.word	$LC7
	.word	$LC8
	.word	$LC9
	.word	$LC33
	.word	$LC11
	.word	$LC12
	.word	$LC13
	.word	$LC14
	.word	$LC15
	.word	$LC16
	.word	$LC17
	.word	$LC34
	.word	$LC19
	.globl	WhitePaletteF3D
	.section	.bss
	.align	2
	.type	WhitePaletteF3D, @object
	.size	WhitePaletteF3D, 192
WhitePaletteF3D:
	.space	192
	.globl	GreenPaletteF3D
	.align	2
	.type	GreenPaletteF3D, @object
	.size	GreenPaletteF3D, 192
GreenPaletteF3D:
	.space	192
	.globl	BluePaletteF3D
	.align	2
	.type	BluePaletteF3D, @object
	.size	BluePaletteF3D, 192
BluePaletteF3D:
	.space	192
	.globl	RedPaletteF3D
	.align	2
	.type	RedPaletteF3D, @object
	.size	RedPaletteF3D, 192
RedPaletteF3D:
	.space	192
	.globl	WhiteTextPalette
	.align	2
	.type	WhiteTextPalette, @object
	.size	WhiteTextPalette, 8
WhiteTextPalette:
	.space	8
	.globl	GreenTextPalette
	.align	2
	.type	GreenTextPalette, @object
	.size	GreenTextPalette, 8
GreenTextPalette:
	.space	8
	.globl	BlueTextPalette
	.align	2
	.type	BlueTextPalette, @object
	.size	BlueTextPalette, 8
BlueTextPalette:
	.space	8
	.globl	RedTextPalette
	.align	2
	.type	RedTextPalette, @object
	.size	RedTextPalette, 8
RedTextPalette:
	.space	8
	.globl	hex
	.section	.rodata.str1.4
	.align	2
$LC35:
	.ascii	"0123456789ABCDEF\000"
	.data
	.align	2
	.type	hex, @object
	.size	hex, 4
hex:
	.word	$LC35
	.globl	RSPOffset
	.section	.bss
	.align	2
	.type	RSPOffset, @object
	.size	RSPOffset, 4
RSPOffset:
	.space	4
	.globl	RSPNumber
	.align	2
	.type	RSPNumber, @object
	.size	RSPNumber, 4
RSPNumber:
	.space	4
	.globl	tkmPoint
	.data
	.align	2
	.type	tkmPoint, @object
	.size	tkmPoint, 4
tkmPoint:
	.word	ok_TKMSpace
	.globl	graphPointer
	.align	2
	.type	graphPointer, @object
	.size	graphPointer, 4
graphPointer:
	.word	GraphPtrOffset
	.globl	tempPointer
	.align	2
	.type	tempPointer, @object
	.size	tempPointer, 4
tempPointer:
	.word	ok_Pointer
	.globl	sourceAddress
	.align	2
	.type	sourceAddress, @object
	.size	sourceAddress, 4
sourceAddress:
	.word	ok_Source
	.globl	targetAddress
	.align	2
	.type	targetAddress, @object
	.size	targetAddress, 4
targetAddress:
	.word	ok_Target
	.globl	dataLength
	.section	.bss
	.align	2
	.type	dataLength, @object
	.size	dataLength, 4
dataLength:
	.space	4
	.globl	BackupPortraitTable
	.align	2
	.type	BackupPortraitTable, @object
	.size	BackupPortraitTable, 288
BackupPortraitTable:
	.space	288
	.globl	BackupNamePlateTable
	.align	2
	.type	BackupNamePlateTable, @object
	.size	BackupNamePlateTable, 32
BackupNamePlateTable:
	.space	32
	.globl	PlayerShowStats
	.align	2
	.type	PlayerShowStats, @object
	.size	PlayerShowStats, 4
PlayerShowStats:
	.space	4
	.globl	PlayerSteerSelect
	.align	2
	.type	PlayerSteerSelect, @object
	.size	PlayerSteerSelect, 4
PlayerSteerSelect:
	.space	4
	.globl	PlayerEngineSelect
	.align	2
	.type	PlayerEngineSelect, @object
	.size	PlayerEngineSelect, 4
PlayerEngineSelect:
	.space	4
	.globl	PlayerCharacterSelect
	.data
	.align	2
	.type	PlayerCharacterSelect, @object
	.size	PlayerCharacterSelect, 4
PlayerCharacterSelect:
	.ascii	"\000\001\002\003"
	.globl	MenuProgress
	.section	.bss
	.align	2
	.type	MenuProgress, @object
	.size	MenuProgress, 4
MenuProgress:
	.space	4
	.globl	MenuFlash
	.align	2
	.type	MenuFlash, @object
	.size	MenuFlash, 4
MenuFlash:
	.space	4
	.globl	StatsID
	.data
	.type	StatsID, @object
	.size	StatsID, 1
StatsID:
	.byte	-1
	.globl	MenuTimer
	.section	.bss
	.type	MenuTimer, @object
	.size	MenuTimer, 1
MenuTimer:
	.space	1
	.globl	MenuChanged
	.type	MenuChanged, @object
	.size	MenuChanged, 1
MenuChanged:
	.space	1
	.globl	MenuBackup
	.type	MenuBackup, @object
	.size	MenuBackup, 1
MenuBackup:
	.space	1
	.globl	EnginePowerDownFT
	.data
	.align	2
	.type	EnginePowerDownFT, @object
	.size	EnginePowerDownFT, 90
EnginePowerDownFT:
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	3
	.half	3
	.half	0
	.half	0
	.half	3
	.half	0
	.half	3
	.half	3
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	2
	.half	2
	.half	0
	.half	0
	.half	2
	.half	0
	.half	2
	.half	2
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	0
	.half	4
	.half	4
	.half	0
	.half	0
	.half	4
	.half	0
	.half	4
	.half	4
	.globl	EnginePowerDownRT
	.align	2
	.type	EnginePowerDownRT, @object
	.size	EnginePowerDownRT, 90
EnginePowerDownRT:
	.half	0
	.half	0
	.half	0
	.half	3
	.half	0
	.half	0
	.half	0
	.half	9
	.half	9
	.half	0
	.half	0
	.half	9
	.half	0
	.half	9
	.half	9
	.half	0
	.half	0
	.half	0
	.half	2
	.half	0
	.half	0
	.half	0
	.half	8
	.half	8
	.half	0
	.half	0
	.half	8
	.half	0
	.half	8
	.half	8
	.half	0
	.half	0
	.half	0
	.half	4
	.half	0
	.half	0
	.half	0
	.half	10
	.half	10
	.half	0
	.half	0
	.half	10
	.half	0
	.half	10
	.half	10
	.globl	PowerBand
	.align	2
	.type	PowerBand, @object
	.size	PowerBand, 6
PowerBand:
	.half	25
	.half	30
	.half	15
	.globl	SteerValue
	.align	2
	.type	SteerValue, @object
	.size	SteerValue, 6
SteerValue:
	.half	2
	.half	0
	.half	-2
	.globl	SteerAngle
	.align	2
	.type	SteerAngle, @object
	.size	SteerAngle, 6
SteerAngle:
	.half	135
	.half	125
	.half	110
	.globl	AccelerationCurve
	.align	2
	.type	AccelerationCurve, @object
	.size	AccelerationCurve, 60
AccelerationCurve:
	.half	20
	.half	20
	.half	20
	.half	16
	.half	14
	.half	12
	.half	10
	.half	8
	.half	6
	.half	4
	.half	20
	.half	20
	.half	25
	.half	26
	.half	26
	.half	20
	.half	15
	.half	8
	.half	8
	.half	8
	.half	20
	.half	20
	.half	20
	.half	16
	.half	10
	.half	10
	.half	10
	.half	18
	.half	18
	.half	12
	.globl	EngineSpeed
	.align	2
	.type	EngineSpeed, @object
	.size	EngineSpeed, 24
EngineSpeed:
	.half	292
	.half	288
	.half	296
	.half	312
	.half	308
	.half	316
	.half	322
	.half	318
	.half	326
	.half	245
	.half	245
	.half	245
	.globl	EngineClass
	.section	.bss
	.align	2
	.type	EngineClass, @object
	.size	EngineClass, 198
EngineClass:
	.space	198
	.globl	objectIndex
	.align	1
	.type	objectIndex, @object
	.size	objectIndex, 2
objectIndex:
	.space	2
	.globl	objectAngle
	.align	2
	.type	objectAngle, @object
	.size	objectAngle, 6
objectAngle:
	.space	6
	.globl	objectVelocity
	.align	2
	.type	objectVelocity, @object
	.size	objectVelocity, 12
objectVelocity:
	.space	12
	.globl	objectVector
	.align	2
	.type	objectVector, @object
	.size	objectVector, 60
objectVector:
	.space	60
	.globl	objectPosition
	.align	2
	.type	objectPosition, @object
	.size	objectPosition, 12
objectPosition:
	.space	12
	.globl	AffineMatrix2
	.align	2
	.type	AffineMatrix2, @object
	.size	AffineMatrix2, 64
AffineMatrix2:
	.space	64
	.globl	AffineMatrix
	.align	2
	.type	AffineMatrix, @object
	.size	AffineMatrix, 64
AffineMatrix:
	.space	64
	.globl	IFrames
	.align	2
	.type	IFrames, @object
	.size	IFrames, 16
IFrames:
	.space	16
	.globl	CoinCount
	.align	2
	.type	CoinCount, @object
	.size	CoinCount, 16
CoinCount:
	.space	16
	.globl	GlobalPlayercolor
	.data
	.align	2
	.type	GlobalPlayercolor, @object
	.size	GlobalPlayercolor, 32
GlobalPlayercolor:
	.word	g_colorPlayer0R
	.word	g_colorPlayer1R
	.word	g_colorPlayer2R
	.word	g_colorPlayer3R
	.word	g_colorPlayer4R
	.word	g_colorPlayer5R
	.word	g_colorPlayer6R
	.word	g_colorPlayer7R
	.globl	GlobalLightning
	.align	2
	.type	GlobalLightning, @object
	.size	GlobalLightning, 32
GlobalLightning:
	.word	g_lightningFlagPlayer1
	.word	g_lightningFlagPlayer2
	.word	g_lightningFlagPlayer3
	.word	g_lightningFlagPlayer4
	.word	g_lightningFlagPlayer5
	.word	g_lightningFlagPlayer6
	.word	g_lightningFlagPlayer7
	.word	g_lightningFlagPlayer8
	.globl	GlobalLakitu
	.align	2
	.type	GlobalLakitu, @object
	.size	GlobalLakitu, 16
GlobalLakitu:
	.word	g_lakituStatusPlayer1
	.word	g_lakituStatusPlayer2
	.word	g_lakituStatusPlayer3
	.word	g_lakituStatusPlayer4
	.globl	GlobalHud
	.align	2
	.type	GlobalHud, @object
	.size	GlobalHud, 16
GlobalHud:
	.word	g_hudPlayer1
	.word	g_hudPlayer2
	.word	g_hudPlayer3
	.word	g_hudPlayer4
	.globl	GlobalLap
	.align	2
	.type	GlobalLap, @object
	.size	GlobalLap, 32
GlobalLap:
	.word	g_gameLapPlayer1
	.word	g_gameLapPlayer2
	.word	g_gameLapPlayer3
	.word	g_gameLapPlayer4
	.word	g_gameLapPlayer5
	.word	g_gameLapPlayer6
	.word	g_gameLapPlayer7
	.word	g_gameLapPlayer8
	.globl	GlobalPath
	.align	2
	.type	GlobalPath, @object
	.size	GlobalPath, 32
GlobalPath:
	.word	g_PathPointPlayer1
	.word	g_PathPointPlayer2
	.word	g_PathPointPlayer3
	.word	g_PathPointPlayer4
	.word	g_PathPointPlayer5
	.word	g_PathPointPlayer6
	.word	g_PathPointPlayer7
	.word	g_PathPointPlayer8
	.globl	GlobalCamera
	.align	2
	.type	GlobalCamera, @object
	.size	GlobalCamera, 16
GlobalCamera:
	.word	g_Camera1
	.word	g_Camera2
	.word	g_Camera3
	.word	g_Camera4
	.globl	GlobalScreen
	.align	2
	.type	GlobalScreen, @object
	.size	GlobalScreen, 16
GlobalScreen:
	.word	g_Screen1
	.word	g_Screen2
	.word	g_Screen3
	.word	g_Screen4
	.globl	GlobalController
	.align	2
	.type	GlobalController, @object
	.size	GlobalController, 32
GlobalController:
	.word	g_Controller1
	.word	g_Controller2
	.word	g_Controller3
	.word	g_Controller4
	.word	g_ControllerMenu
	.word	g_ControllerGhost1
	.word	g_ControllerGhost2
	.word	g_ControllerGhost3
	.globl	DynFPSModifier
	.align	1
	.type	DynFPSModifier, @object
	.size	DynFPSModifier, 2
DynFPSModifier:
	.half	2
	.globl	AnimationTimer
	.section	.bss
	.align	1
	.type	AnimationTimer, @object
	.size	AnimationTimer, 2
AnimationTimer:
	.space	2
	.globl	OverKartRAMHeader
	.align	2
	.type	OverKartRAMHeader, @object
	.size	OverKartRAMHeader, 28
OverKartRAMHeader:
	.space	28
	.globl	ZeroVector
	.align	2
	.type	ZeroVector, @object
	.size	ZeroVector, 12
ZeroVector:
	.space	12
	.globl	GlobalObjectB
	.align	2
	.type	GlobalObjectB, @object
	.size	GlobalObjectB, 4
GlobalObjectB:
	.space	4
	.globl	GlobalObjectA
	.align	2
	.type	GlobalObjectA, @object
	.size	GlobalObjectA, 4
GlobalObjectA:
	.space	4
	.globl	seconds
	.align	2
	.type	seconds, @object
	.size	seconds, 4
seconds:
	.space	4
	.globl	minutes
	.align	2
	.type	minutes, @object
	.size	minutes, 4
minutes:
	.space	4
	.globl	printOffsetD
	.align	2
	.type	printOffsetD, @object
	.size	printOffsetD, 4
printOffsetD:
	.space	4
	.globl	printOffsetC
	.align	2
	.type	printOffsetC, @object
	.size	printOffsetC, 4
printOffsetC:
	.space	4
	.globl	printOffsetB
	.align	2
	.type	printOffsetB, @object
	.size	printOffsetB, 4
printOffsetB:
	.space	4
	.globl	printOffsetA
	.align	2
	.type	printOffsetA, @object
	.size	printOffsetA, 4
printOffsetA:
	.space	4
	.globl	decimalNumber
	.align	2
	.type	decimalNumber, @object
	.size	decimalNumber, 4
decimalNumber:
	.space	4
	.globl	wholeNumber
	.align	2
	.type	wholeNumber, @object
	.size	wholeNumber, 4
wholeNumber:
	.space	4
	.globl	PerspectiveValue
	.align	1
	.type	PerspectiveValue, @object
	.size	PerspectiveValue, 2
PerspectiveValue:
	.space	2
	.globl	MenuPosition
	.align	2
	.type	MenuPosition, @object
	.size	MenuPosition, 4
MenuPosition:
	.space	4
	.globl	PADCourseValue
	.type	PADCourseValue, @object
	.size	PADCourseValue, 1
PADCourseValue:
	.space	1
	.globl	WeatherCourseValue
	.type	WeatherCourseValue, @object
	.size	WeatherCourseValue, 1
WeatherCourseValue:
	.space	1
	.globl	Snow3DCourseValue
	.type	Snow3DCourseValue, @object
	.size	Snow3DCourseValue, 1
Snow3DCourseValue:
	.space	1
	.globl	CloudCourseValue
	.type	CloudCourseValue, @object
	.size	CloudCourseValue, 1
CloudCourseValue:
	.space	1
	.globl	Snow3DCourseID
	.align	1
	.type	Snow3DCourseID, @object
	.size	Snow3DCourseID, 2
Snow3DCourseID:
	.space	2
	.globl	CloudCourseID
	.align	1
	.type	CloudCourseID, @object
	.size	CloudCourseID, 2
CloudCourseID:
	.space	2
	.globl	CustomWaterHeight
	.align	2
	.type	CustomWaterHeight, @object
	.size	CustomWaterHeight, 8
CustomWaterHeight:
	.space	8
	.globl	StopSwop
	.type	StopSwop, @object
	.size	StopSwop, 1
StopSwop:
	.space	1
	.globl	TempoBool
	.type	TempoBool, @object
	.size	TempoBool, 1
TempoBool:
	.space	1
	.globl	EmulatorPlatform
	.type	EmulatorPlatform, @object
	.size	EmulatorPlatform, 1
EmulatorPlatform:
	.space	1
	.globl	ConsolePlatform
	.type	ConsolePlatform, @object
	.size	ConsolePlatform, 1
ConsolePlatform:
	.space	1
	.globl	CycleCount
	.align	2
	.type	CycleCount, @object
	.size	CycleCount, 8
CycleCount:
	.space	8
	.globl	OldCycle
	.align	2
	.type	OldCycle, @object
	.size	OldCycle, 8
OldCycle:
	.space	8
	.globl	ClockCycle
	.align	2
	.type	ClockCycle, @object
	.size	ClockCycle, 8
ClockCycle:
	.space	8
	.globl	GlobalFrameCount
	.align	2
	.type	GlobalFrameCount, @object
	.size	GlobalFrameCount, 4
GlobalFrameCount:
	.space	4
	.globl	LoopValue
	.align	2
	.type	LoopValue, @object
	.size	LoopValue, 4
LoopValue:
	.space	4
	.globl	FreeSpaceAddress
	.align	2
	.type	FreeSpaceAddress, @object
	.size	FreeSpaceAddress, 4
FreeSpaceAddress:
	.space	4
	.globl	GlobalBoolD
	.type	GlobalBoolD, @object
	.size	GlobalBoolD, 1
GlobalBoolD:
	.space	1
	.globl	GlobalBoolC
	.type	GlobalBoolC, @object
	.size	GlobalBoolC, 1
GlobalBoolC:
	.space	1
	.globl	GlobalBoolB
	.type	GlobalBoolB, @object
	.size	GlobalBoolB, 1
GlobalBoolB:
	.space	1
	.globl	GlobalBoolA
	.type	GlobalBoolA, @object
	.size	GlobalBoolA, 1
GlobalBoolA:
	.space	1
	.globl	GlobalUShortB
	.align	1
	.type	GlobalUShortB, @object
	.size	GlobalUShortB, 2
GlobalUShortB:
	.space	2
	.globl	GlobalUShortA
	.align	1
	.type	GlobalUShortA, @object
	.size	GlobalUShortA, 2
GlobalUShortA:
	.space	2
	.globl	GlobalShortD
	.align	1
	.type	GlobalShortD, @object
	.size	GlobalShortD, 2
GlobalShortD:
	.space	2
	.globl	GlobalShortC
	.align	1
	.type	GlobalShortC, @object
	.size	GlobalShortC, 2
GlobalShortC:
	.space	2
	.globl	GlobalShortB
	.align	1
	.type	GlobalShortB, @object
	.size	GlobalShortB, 2
GlobalShortB:
	.space	2
	.globl	GlobalShortA
	.align	1
	.type	GlobalShortA, @object
	.size	GlobalShortA, 2
GlobalShortA:
	.space	2
	.globl	GlobalFrameChar
	.type	GlobalFrameChar, @object
	.size	GlobalFrameChar, 1
GlobalFrameChar:
	.space	1
	.globl	GlobalCharE
	.type	GlobalCharE, @object
	.size	GlobalCharE, 1
GlobalCharE:
	.space	1
	.globl	GlobalCharD
	.type	GlobalCharD, @object
	.size	GlobalCharD, 1
GlobalCharD:
	.space	1
	.globl	GlobalCharC
	.type	GlobalCharC, @object
	.size	GlobalCharC, 1
GlobalCharC:
	.space	1
	.globl	GlobalCharB
	.type	GlobalCharB, @object
	.size	GlobalCharB, 1
GlobalCharB:
	.space	1
	.globl	GlobalCharA
	.type	GlobalCharA, @object
	.size	GlobalCharA, 1
GlobalCharA:
	.space	1
	.globl	GlobalFloatD
	.align	2
	.type	GlobalFloatD, @object
	.size	GlobalFloatD, 4
GlobalFloatD:
	.space	4
	.globl	GlobalFloatC
	.align	2
	.type	GlobalFloatC, @object
	.size	GlobalFloatC, 4
GlobalFloatC:
	.space	4
	.globl	GlobalFloatB
	.align	2
	.type	GlobalFloatB, @object
	.size	GlobalFloatB, 4
GlobalFloatB:
	.space	4
	.globl	GlobalFloatA
	.align	2
	.type	GlobalFloatA, @object
	.size	GlobalFloatA, 4
GlobalFloatA:
	.space	4
	.globl	GlobalUIntB
	.align	2
	.type	GlobalUIntB, @object
	.size	GlobalUIntB, 4
GlobalUIntB:
	.space	4
	.globl	GlobalUIntA
	.align	2
	.type	GlobalUIntA, @object
	.size	GlobalUIntA, 4
GlobalUIntA:
	.space	4
	.globl	GlobalUInt64
	.align	3
	.type	GlobalUInt64, @object
	.size	GlobalUInt64, 8
GlobalUInt64:
	.space	8
	.globl	GlobalInt64
	.align	3
	.type	GlobalInt64, @object
	.size	GlobalInt64, 8
GlobalInt64:
	.space	8
	.globl	GlobalIntD
	.align	2
	.type	GlobalIntD, @object
	.size	GlobalIntD, 4
GlobalIntD:
	.space	4
	.globl	GlobalIntC
	.align	2
	.type	GlobalIntC, @object
	.size	GlobalIntC, 4
GlobalIntC:
	.space	4
	.globl	GlobalIntB
	.align	2
	.type	GlobalIntB, @object
	.size	GlobalIntB, 4
GlobalIntB:
	.space	4
	.globl	GlobalIntA
	.align	2
	.type	GlobalIntA, @object
	.size	GlobalIntA, 4
GlobalIntA:
	.space	4
	.globl	GlobalAddressD
	.align	2
	.type	GlobalAddressD, @object
	.size	GlobalAddressD, 4
GlobalAddressD:
	.space	4
	.globl	GlobalAddressC
	.align	2
	.type	GlobalAddressC, @object
	.size	GlobalAddressC, 4
GlobalAddressC:
	.space	4
	.globl	GlobalAddressB
	.align	2
	.type	GlobalAddressB, @object
	.size	GlobalAddressB, 4
GlobalAddressB:
	.space	4
	.globl	GlobalAddressA
	.align	2
	.type	GlobalAddressA, @object
	.size	GlobalAddressA, 4
GlobalAddressA:
	.space	4
	.ident	"GCC: (GNU) 10.1.0"
