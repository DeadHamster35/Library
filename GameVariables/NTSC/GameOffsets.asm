

.definelabel SYSTEM_Region, 0x80000300

.definelabel InitMKCode, 0x80091B78

.definelabel spriteKillA, 0x80020000 //03E00008
//27BDFFA0
.definelabel spriteKillB, 0x80020004 //2400
//AFBF
.definelabel spriteKillC, 0x80021244 //03E00008
//27BDFFE8
.definelabel spriteKillD, 0x80021248 //2400
//AFBF


.definelabel DrawKart, 0x800212B4
.definelabel DrawKart2P, 0x800215DC
.definelabel DrawKart3P, 0x8002186C
.definelabel DrawKart4P, 0x800219BC

.definelabel DrawKartAfter, 0x80021B0C
.definelabel DrawKart2PAfter, 0x80021C78
.definelabel DrawKart3PAfter, 0x80021D40
.definelabel DrawKart4PAfter, 0x80021DA8

.definelabel SmokeDisp, 0x8006E5AC
.definelabel SmokeDisp2P, 0x8006E634
.definelabel SmokeDisp3P, 0x8006E6BC
.definelabel SmokeDisp4P, 0x8006E744
.definelabel SmokeDispAfter, 0x8006E7CC
.definelabel SmokeDispAfter2P, 0x8006E848
.definelabel SmokeDispAfter3P, 0x8006E8C4
.definelabel SmokeDispAfter4P, 0x8006E940

.definelabel OBJCalculation, 0x8006D474



.definelabel decodeMIO0, 0x800400D0 ;MIO0 File A0 = input, A1 = output
.definelabel CrashScreenDrawInfo, 0x80004298
.definelabel CreateDebugThread, 0x800046B8
.definelabel StartDebugThread, 0x80004718
.definelabel DMAROMGhost, 0x80004EF0
.definelabel DMA, 0x80001158
.definelabel decodeTKMK, 0x800405D0
.definelabel GetFramebuffer, 0x802A7658
.definelabel AllocateMemory, 0x802A7B70
.definelabel InitialBump, 0x802AAAAC
.definelabel CheckBump, 0x802ADDC8
.definelabel CheckBump2, 0x802AD950
.definelabel LoadMap, 0x802AA918
.definelabel KillDisplayList, 0x802AAA70
.definelabel InitialRaceSequence, 0x80002A18
.definelabel BumpVelocity, 0x802AC114
.definelabel CalcBumpVelocity, 0x802AC098
.definelabel ScrollMapImage, 0x802AF7B4
.definelabel MakeWaterVertex, 0x802AF8BC
.definelabel ramCopy, 0x800D7FE0
.definelabel MemCpyN64, 0x800D7FE0
.definelabel CheckArea, 0x802ABD40
.definelabel CheckMapBG_ZX, 0x8003F46C
.definelabel CheckMapBG_XY, 0x8003F734
.definelabel CheckMapBG_YZ, 0x8003FBAC

.definelabel readControllers, 0x80000A28
.definelabel InitControllers, 0x800008A4

.definelabel DMABuffer, 0x80020000
.definelabel DrawBuffer, 0x80021244

.definelabel CheckDMA, 0x80020524
.definelabel CheckDMA2P, 0x8002088C
.definelabel CheckDMA3P, 0x80020BF4
.definelabel CheckDMA4P, 0x80020F1C

.definelabel CheckHight, 0x802AE1C0
.definelabel KWCheckRadiusXZ, 0x80041608


.definelabel DisplayKT1, 0x80292464

.definelabel DisplayFlagGate, 0x80297340
.definelabel DisplayShadow, 0x8029794C
.definelabel MoveIWA, 0x8029D188
.definelabel deleteObjectBuffer, 0x8029E854
.definelabel addObjectBuffer, 0x8029EC88

.definelabel CollisionCylinder, 0x8029EEB8
.definelabel CollisionSphere, 0x8029FB80
.definelabel KillObject, 0x8029FDC8

.definelabel RouletteStart, 0x8007ABFC
.definelabel KWAnmStart, 0x800723A4

//math
.definelabel CalcDisplayPosition, 0x802B4F60
.definelabel BrkProgram, 0x802B4FEC
.definelabel SetMatrix, 0x802B4FF8
.definelabel CalcDistance, 0x802B51E8
.definelabel CalcDirection, 0x802B5224
.definelabel CalcDirectionS, 0x802B5258
.definelabel SetFVector, 0x802B529C
.definelabel SetSVector, 0x802B52BC
.definelabel CopyVector, 0x802B52D8
.definelabel CopySVector, 0x802B5304
.definelabel SetVector, 0x802B531C
.definelabel CopyAffine, 0x802B5350
.definelabel CopyLongArray, 0x802B5398
.definelabel LoadIdentAffineMtx, 0x802B53C8
.definelabel TranslateMatrix, 0x802B5450
.definelabel TranslateMatrix2, 0x802B54EC
.definelabel CreateTransAffineMtx, 0x802B5520
.definelabel MakeGuPerspective, 0x802B5564
.definelabel MakeGuLookAt, 0x802B5794
.definelabel CreateMtxRotateX, 0x802B59DC
.definelabel CreateMtxRotateY, 0x802B5A44
.definelabel CreateMtxRotateZ, 0x802B5AAC
.definelabel RotateVector, 0x802B5B14
.definelabel InitialLight, 0x802B5CAC
.definelabel MakeMapLight, 0x802B5D30
.definelabel MakeLight, 0x802B5D64
.definelabel ScalingMatrix, 0x802B5F00
.definelabel CreateModelingMatrix, 0x802B5F74
.definelabel CreateCameraAffineMtx, 0x802B60B4
.definelabel CreateModelAffineMtx2, 0x802B6214
.definelabel NomralizeVector, 0x802B6374
.definelabel MultipleMatrixByVector, 0x802B63B8
.definelabel MultipleAffineMtxByVector, 0x802B6434
.definelabel MakeTopMatrix, 0x802B64B0
.definelabel MakeAlignVector, 0x802B64C4
.definelabel MakeAlignMatrix, 0x802B6540
.definelabel MakeTopAlign, 0x802B68F8
.definelabel MakeRotate, 0x802B6A84
.definelabel MakeAlign, 0x802B6BC0
.definelabel CreateModelAffineMtx, 0x802B6D58
.definelabel MultiAffineMtx, 0x802B71CC
.definelabel AffineToMtx, 0x802B75F8
.definelabel GetAtanTable, 0x802B7790
.definelabel Atan2t, 0x802B7830
.definelabel Atan2f, 0x802B79B8
.definelabel Atan2fx, 0x802B79F0
.definelabel Atan2tx, 0x802B7B50
.definelabel Atanf, 0x802B7C18
.definelabel Atant, 0x802B7C40
.definelabel Asinf, 0x802B7C6C
.definelabel Asint, 0x802B7CA8
.definelabel Acosf, 0x802B7CE8
.definelabel Acost, 0x802B7D28
.definelabel MakeRandom, 0x802B7D94
.definelabel MakeRandomLimmit, 0x802B7E34
.definelabel MakeDirection, 0x802B7F34
.definelabel MakeDirection3D, 0x802B7F7C
.definelabel ChaseDir, 0x800224F0
.definelabel sinT, 0x802B8018
.definelabel cosT, 0x802B8038
.definelabel sinF, 0x800D60F0
.definelabel cosF, 0x800D62B0

.definelabel gBackgroundVtx, 0x802B8890


.definelabel CheckCone, 0x802B8058
.definelabel CheckDisplayRange, 0x802B80D0
.definelabel RotateLightMatrix, 0x802B8414
.definelabel SetUpVector, 0x802B8614
.definelabel SinTable, 0x802BA370
.definelabel CosTable, 0x802BB370
.definelabel AtnTable, 0x802BF370
.definelabel Ipower, 0x80091750
.definelabel Power, 0x800917B0
.definelabel Llog, 0x8009186C
.definelabel Lexp, 0x8009195C
.definelabel Lldexp, 0x80091A6C
.definelabel Ffrexp, 0x80091AC0
.definelabel SwapUint, 0x80091B64

.definelabel SegmentToVirtual, 0x802A7BD4

.definelabel SetPalette, 0x800930D8
.definelabel SetWord, 0x800930E4
.definelabel SetWord2, 0x80093134
.definelabel SetWord2A, 0x80093324
.definelabel SetWord2AP, 0x80093358
.definelabel SetWord3, 0x8009338C
.definelabel SetWord3A, 0x800936B8
.definelabel SetWord3AC, 0x800936EC
.definelabel SetWord3AP, 0x80093720
.definelabel SetWord3ACP, 0x80093754
.definelabel SetWord4, 0x80093788
.definelabel SetWord4A, 0x800939C8
.definelabel SetWord4AP, 0x800939FC

.definelabel KawanoDrawFinal, 0x80093E20

.definelabel KWSetViewportFull, 0x80057C60
.definelabel KWReturnViewport, 0x80057CE4
.definelabel printNumber, 0x80057524
.definelabel printString, 0x800577A4
.definelabel printStringBinary, 0x80057908
.definelabel printStringNumber, 0x800577D0
.definelabel printStringUnsignedNumber, 0x80057814
.definelabel printStringHex, 0x80057858
.definelabel printStringUnsignedHex, 0x800578B0
.definelabel printStringUnsignedBinary, 0x80057960
.definelabel KWDisplay2D, 0x80058C20
.definelabel KWDisplay2DAfter, 0x80058DB4
.definelabel FillRect1ColorF, 0x80098DF8
.definelabel SetFadeOutB, 0x8009E208
.definelabel SetObjBlock, 0x8009E650
.definelabel InitObjBlock, 0x8009E620
.definelabel DoObjBlock, 0x800A7A4C

.definelabel DispOBJBlock, 0x800A81E4

.definelabel DOBPSelTurnIn, 0x800AAB90
.definelabel DOBPSelTurnOut, 0x800AAA9C

.definelabel DOBPSelAnimeKuppa, 0x800AA69C


.definelabel MSelController, 0x800B3B58
.definelabel PSelController, 0x800B3554
.definelabel GSelController, 0x800B29D8
.definelabel TitleController, 0x800B20F4

.definelabel SaveFunc800B45E0, 0x800B45E0
.definelabel SaveFunc800B4670, 0x800B4670
.definelabel SaveFunc800B4CB4, 0x800B4CB4
.definelabel SaveFunc800B559C, 0x800B559C
.definelabel SaveFunc800B5948, 0x800B5948



.definelabel LoadFunc800B4A10, 0x800B4A10

.definelabel ScreenViewAngle, 0x80150130
.definelabel SegmentTable, 0x80150258
.definelabel g_CfbPtrs, 0x801502A8
.definelabel gAffine, 0x801502C0
.definelabel GraphPtr, 0x80150298
.definelabel GraphPtrOffset, 0x80150298
.definelabel KWLookCamera, 0x800418AC
.definelabel KWLookCameraPitch, 0x800418E8
.definelabel KWTexture2DRGBA, 0x800463B0
.definelabel KWTexture2DRGBA32PT, 0x80046720
.definelabel KWTexture2DRGBA32BL, 0x80046794
.definelabel KWTexture2DCI8BL, 0x80047910
.definelabel KWTexture2DCI8AAPT, 0x80047A18
.definelabel KWTexture2DCI8XLUPT, 0x80047B9C
.definelabel KWTexture2DCI8XLUBL, 0x80047C28
.definelabel KWTexture2DCI8AAXLUPT, 0x80047CB4
.definelabel KWTexture3DRGBA32AAZBBL, 0x80046A68
.definelabel KWSprite, 0x8004C364
.definelabel KWSpriteScale, 0x8004CA58
.definelabel KWSpriteDiv, 0x8004C91C
.definelabel KWSpriteTile32B, 0x8004C6FC
.definelabel KWSprite8x8, 0x8004CAD0
.definelabel DrawLineHorizontal, 0x8004C024
.definelabel DrawLineVertical, 0x8004C148
.definelabel KWLoadTextureBlockI4b, 0x80044DA0
.definelabel KWLoadTextureBlockRGBA16B, 0x80043D50
.definelabel SprDrawClip, 0x8004B97C
.definelabel SprDrawClipST, 0x8004BA98
.definelabel StockNumberSprites, 0x0D00C558
.definelabel DecodeMapImage1, 0x802A84F4

.definelabel KWTextureRGBA_SubPT, 0x80045D0C
.definelabel KWTextureRGBA_SubBL, 0x80045E10
.definelabel KWTextureRGBA_SubBLMR, 0x80045F18
.definelabel KWTextureRGBMA_SubBL, 0x80046030
.definelabel KWTextureRGBA32_SubPT, 0x800461A4
.definelabel KWTextureRGBA32_SubBL, 0x800462A8
.definelabel KWTextureCI8_SubPT, 0x80047068
.definelabel KWTextureCI8_SubBL, 0x80047270
.definelabel KWTextureCI8_SubBLMR, 0x8004747C
.definelabel KWTextureCI8_SubBLCutX, 0x8004768C
.definelabel KWTextureIA16_Sub, 0x80048F8C
.definelabel KWTextureIA8_Sub, 0x800492D4
.definelabel KWTextureIA4_Sub, 0x8004961C
.definelabel KWTextureA8_Sub, 0x800497CC
.definelabel KWTextureA4_Sub, 0x80049970

.definelabel KWCreateAffine3D, 0x80042E00
.definelabel KWCreateAffine3D_Board, 0x80042EB8
.definelabel KWCreateAffine3D_IceKage, 0x80042F70
.definelabel KWCreateAffine3D_Hole, 0x80043050
.definelabel KWCreateAffine3D_Anm, 0x80043104

.definelabel KWSetPrimColor, 0x8004B138
.definelabel KWSetEnvColor, 0x8004B180
.definelabel KWSet2Color_, 0x8004B1C8
.definelabel SubColorMode, 0x8004B254
.definelabel SubAlphaMode, 0x8004B2BC
.definelabel ToumeIAMode, 0x8004B310
.definelabel ToumeIMode, 0x8004B35C
.definelabel SmokeMode, 0x8004B3C8
.definelabel SplashMode, 0x8004B414
.definelabel RadarMode, 0x8004B480
.definelabel RankMode, 0x8004B4E8
.definelabel WaterMode, 0x8004B554
.definelabel ColAddMode, 0x8004B5A8
.definelabel IceMode, 0x8004B614
.definelabel SparkMode, 0x8004B6C4
.definelabel Color2Mode, 0x8004B72C

.definelabel BumpObject, 0x802B4E30

.definelabel SetSegment, 0x802A7B94

.definelabel BumpRoutin, 0x802ABF44
.definelabel OoBCheck, 0x802ABDF4

.definelabel SetStar, 0x8008F778
.definelabel ResetStar, 0x8008F86C
.definelabel SetTurbo, 0x8008D3C4
.definelabel SetWing, 0x8008D570
.definelabel ResetWing, 0x8008D760
.definelabel SetStorm, 0x8008D7B0
.definelabel ThunderWorld, 0x8009E5BC
.definelabel VSGhost , 0x8008F8E4
.definelabel SetVSGhost, 0x8008FA38
.definelabel ResetVSGhost, 0x8008FB30
.definelabel SetHeightJump, 0x8008FDF4


.definelabel SetRollover, 0x8008C528
.definelabel SetWheelspin, 0x8008CDC0
.definelabel SetBroken, 0x8008DABC
.definelabel SetThunder, 0x8008DF98
.definelabel SetSpin, 0x8008C73C
.definelabel SetBombThrowRollover, 0x8008EAE0
.definelabel SetBombRollover, 0x8008E6C0
.definelabel SetProWheelSpin, 0x8008D0FC

.definelabel F_80090178, 0x80090178
.definelabel GetLakituSpawnPoint, 0x80090178

.definelabel doGameSelect10, 0x80095574


.definelabel SetFastOoB, 0x80090868
.definelabel CallLakitu, 0x80090868
.definelabel SetLakitu, 0x80090778
.definelabel LakituCheck, 0x8002C17C
.definelabel HangLakitu, 0x80090970
.definelabel LakituIceBehavior, 0x800797E8

.definelabel OGAContTrgChk, 0x80019FB4
.definelabel ShakeCamera, 0x8001CA10
.definelabel ShakeHitCamera, 0x8001CA24

.definelabel CameraControl, 0x8001EE98
.definelabel KartView, 0x8001E45C

.definelabel SlipCheck, 0x8002FCA8
.definelabel AddGravity, 0x8002AB70
.definelabel ProStickAngle, 0x80033AE0

.definelabel KW16GFTimer, 0x80165590
.definelabel KW8GFTimer, 0x80165594
.definelabel KW4GFTimer, 0x80165598
.definelabel KW2GFTimer, 0x8016559C

.definelabel KW64GFCount, 0x801655A4
.definelabel KW32GFCount, 0x801655AC
.definelabel KW16GFCount, 0x801655B4
.definelabel KW8GFCount, 0x801655BC
.definelabel KW4GFCount, 0x801655C4
.definelabel KW2GFCount, 0x801655CC

.definelabel Vtx_KTile8x16, 0x0D0054B0
.definelabel Vtx_KTile16x16, 0x0D005770
.definelabel Vtx_KTile16x16XFlip, 0x0D0057B0
.definelabel Vtx_KTile40x32, 0x0D005C30
.definelabel Vtx_KTile32x32, 0x0D005AE0
.definelabel Vtx_KTile32x32XFlip, 0x0D005B20
.definelabel Vtx_KTile64x64BL, 0x0D0060B0
.definelabel Vtx_KTile64x64XFlipBL, 0x0D006130
.definelabel Vtx_KTile64x96BL, 0x0D0063F0
.definelabel Vtx_KTile96x16, 0x0D006830

.definelabel KWTextureRGBA_AAZBBL_Init, 0x0D0079C8
.definelabel KWTextureIA_AAZBBL_Init, 0x0D007B00


.definelabel CheckWaterLevel, 0x802AAB4C
.definelabel CheckSplash, 0x8002C4F8

// NOP out splash func
.definelabel CheckSplashJAL1, 0x8002E4A8
.definelabel CheckSplashJAL2, 0x8002F340
.definelabel CheckSplashJAL3, 0x8003939C

// NOP out BGM fanfares func
.definelabel LoadKeyStatus, 0x8028DF38
.definelabel CheckFinalLapFanfareJAL, 0x8028F344
.definelabel CheckPlayStarBGMJAL, 0x8008F820

// Edit cloud call func
.definelabel CloudCount1P, 0x8018D1F0
.definelabel CloudCount2P, 0x8018D1F8
.definelabel KWKumo_Alloc, 0x8007055C
.definelabel KWChart_Kumo, 0x80078C70
.definelabel CloudTypeMapCheck1, 0x80070560
.definelabel CloudTypeMapCheck2, 0x80070564
.definelabel CloudAmountMapCheck1, 0x80078DD8
.definelabel CloudAmountMapCheck2, 0x80078DE0
.definelabel Snow3DAllocMapCheck1, 0x80070784
.definelabel Snow3DAllocMapCheck2, 0x80070788
.definelabel Snow3DDisplayAfterMapCheck1, 0x80058B58
.definelabel Snow3DDisplayAfterMapCheck2, 0x80058B5C
.definelabel KWDisplayJugemu, 0x800532A4

.definelabel initializePlayer, 0x800393C0
.definelabel DelayInitialMap, 0x80002DAC
.definelabel DrawLocalSkeletonShape, 0x80004DFC


.definelabel DMA_Base729A30, 0x80099000  //used for preview texture loads
.definelabel TexBuffLoadP, 0x800996BC
.definelabel GrayScaleTexBuf3, 0x8009B0A4
.definelabel GrayScaleTexBufRGB, 0x8009B538
.definelabel FadeMain, 0x8009CA2C
.definelabel FadeMain2, 0x8009CA6C
.definelabel SetFadeOut, 0x8009DFE0
.definelabel PutPylon, 0x8029ABD4
.definelabel PutObject, 0x8029ED38

.definelabel osCreateMesgQueue, 0x800CCD60
.definelabel osRecvMesg, 0x800CD750
.definelabel osPiStartDma, 0x800CDC30
.definelabel osWriteBackDCache, 0x800D1C00
.definelabel osInvalDCache, 0x800CDB80
.definelabel osVISwapBuffer, 0x800CDA10
.definelabel osGetTime, 0x800CDDE0
.definelabel osGetCount, 0x800D11A0
.definelabel osEepromLongRead, 0x800D0190
.definelabel osEepromLongWrite, 0x800D0050
.definelabel osVIBlack, 0x800CC8C0
.definelabel osWritebackDCacheAll, 0x800CD890
.definelabel osSetTime, 0x800CE310
.definelabel osEepromProbe, 0x800CE340

.definelabel g_fadeOutFlag, 0x800DC5C0
.definelabel g_fadeOutCounter, 0x800DC5C4
.definelabel g_fadeOutCounter2, 0x800DC5C8


.definelabel DisplayBackground, 0x802A4A0C


.definelabel asm_itemJump1A, 0x8007B084  //3C058016
.definelabel asm_itemJump1B, 0x8007B098  //84A543BA

.definelabel asm_itemJump2A, 0x8007AFC0  //3C058016
.definelabel asm_itemJump2B, 0x8007AFD4  //84A543BA

.definelabel Sqrtf, 0x800CE140

.definelabel colorFont, 0x800930D8
.definelabel loadFont, 0x80057710

.definelabel g_SegmentA, 0x80117974

;;

.definelabel g_resetToggle, 0x800DC50C
.definelabel g_startingIndicator, 0x800DC510
.definelabel g_DebugSection, 0x800DC514
.definelabel g_DebugMode, 0x800DC520
.definelabel g_DispTimeFlag, 0x800DC660
.definelabel g_SequenceMode, 0x800DC50C
.definelabel g_NewSequenceMode, 0x800DC524
.definelabel g_NextSequenceMode, 0x800DC528
.definelabel g_ScreenSplitA, 0x800DC52C
.definelabel g_ScreenSplitB, 0x800DC530
.definelabel g_playerCount, 0x800DC538
.definelabel g_raceClass, 0x800DC548
.definelabel g_gameTimer, 0x800DC598
.definelabel g_courseID,  0x800DC5A0
.definelabel g_loadedcourseFlag, 0x800DC5A4
.definelabel g_gameMode, 0x800DC53C
.definelabel g_DispFrame, 0x800DC55C
.definelabel g_ScreenFlip, 0x800DC604
.definelabel g_ScreenStretch, 0x800DC608
.definelabel g_DebugBars, 0x800DC662
.definelabel g_ItemSetFlag, 0x800DC648


.definelabel PathTable, 0x800DC8D0
.definelabel PathTableB, 0x800DC780

.definelabel PathLengthTable, 0x800DD9D0

.definelabel KartVtx, 0x800DDBB4

.definelabel gFaceBuffer, 0x8015F580
.definelabel g_courseFaceMaxIndex, 0x8015F588

.definelabel GlobalStat, 0x800E2360 
.definelabel gravity_1, 0x800E2650
.definelabel gravity_2, 0x800E2654
.definelabel gravity_3, 0x800E2658
.definelabel gravity_4, 0x800E265C
.definelabel gravity_5, 0x800E2660
.definelabel gravity_6, 0x800E2664
.definelabel gravity_7, 0x800E2668
.definelabel gravity_8, 0x800E266C

.definelabel antialiasToggle, 0x800EB3DC
.definelabel antialiasToggleB, 0x800EB40C


.definelabel g_CupArray, 0x800F2BB4
.definelabel g_cup0Array0, 0x800F2BB4
.definelabel g_cup0Array1, 0x800F2BB6
.definelabel g_cup0Array2, 0x800F2BB8
.definelabel g_cup0Array3, 0x800F2BBA
.definelabel g_cup1Array0, 0x800F2BBC
.definelabel g_cup1Array1, 0x800F2BBE
.definelabel g_cup1Array2, 0x800F2BC0
.definelabel g_cup1Array3, 0x800F2BC2
.definelabel g_cup2Array0, 0x800F2BC4
.definelabel g_cup2Array1, 0x800F2BC6
.definelabel g_cup2Array2, 0x800F2BC8
.definelabel g_cup2Array3, 0x800F2BCA
.definelabel g_cup3Array0, 0x800F2BCC
.definelabel g_cup3Array1, 0x800F2BCE
.definelabel g_cup3Array2, 0x800F2BD0
.definelabel g_cup3Array3, 0x800F2BD2
.definelabel g_cupBArray0, 0x800F2BD4
.definelabel g_cupBArray1, 0x800F2BD6
.definelabel g_cupBArray2, 0x800F2BD8
.definelabel g_cupBArray3, 0x800F2BDA


.definelabel g_DebugTextPalette, 0x801A6818
.definelabel g_DebugPaletteOffset, 0x801A79D4

.definelabel g_bannerTexture, 0x801F2750
.definelabel g_previewTexture, 0x8020E460
.definelabel g_mapTexture, 0x8018D240
.definelabel g_FadingFlag, 0x8018E7AC
.definelabel g_FadeCounter, 0x8018E7B8
.definelabel g_FadeCounter2, 0x8018E7D0
.definelabel g_mapStartToggle, 0x8004F150 //0C0132B4
.definelabel g_mapScale, 0x8018D2A0
.definelabel g_mapX, 0x8018D2C0
.definelabel g_mapY, 0x8018D2D8
.definelabel g_map2X, 0x8018D2C2
.definelabel g_map2Y, 0x8018D2DA
.definelabel g_startX, 0x8018D2E0
.definelabel g_startY, 0x8018D2E8
.definelabel g_mapHeight, 0x8018D2B8
.definelabel g_mapWidth, 0x8018D2B0
.definelabel g_mapR, 0x8018D300
.definelabel g_mapG, 0x8018D308
.definelabel g_mapB, 0x8018D310

.definelabel g_DEBUG, 0x80430000

.definelabel r_CoursePreviewOffsets, 0x12C60C
.definelabel g_CoursePreviewOffsets, 0x801993FC
.definelabel g_CourseBannerOffsets, 0x801FA860
.definelabel g_BattleBannerOffsets, 0x801F57F8
.definelabel g_BattlePreviewOffsets, 0x801FF3F0
.definelabel g_cup0preview0, 0x80199540
.definelabel g_cup0preview1, 0x80199568
.definelabel g_cup0preview2, 0x801994F0
.definelabel g_cup0preview3, 0x801995B8


.definelabel g_cup1preview0, 0x80199590
.definelabel g_cup1preview1, 0x801994C8
.definelabel g_cup1preview2, 0x80199428
.definelabel g_cup1preview3, 0x80199400


.definelabel g_cup2preview0, 0x80199630
.definelabel g_cup2preview1, 0x801995E0
.definelabel g_cup2preview2, 0x80199518
.definelabel g_cup2preview3, 0x80199450


.definelabel g_cup3preview0, 0x801996D0
.definelabel g_cup3preview1, 0x801994A0
.definelabel g_cup3preview2, 0x80199478
.definelabel g_cup3preview3, 0x80199608

.definelabel g_NintendoLogoOffset, 0x8019F88C
.definelabel CheckContPackMenu, 0x80091D74
.definelabel g_NintendoLogoBorder, 0x800944AC

.definelabel g_lakituStatus, 0x80165DCE
.definelabel g_lakituStatusPlayer1, 0x80165DC2
.definelabel g_lakituStatusPlayer2, 0x80165EA2
.definelabel g_lakituStatusPlayer3, 0x80165F82
.definelabel g_lakituStatusPlayer4, 0x80166062
.definelabel g_lakituSurface, 0x80163318

.definelabel p_Input, 0x800F6914
.definelabel d_Input, 0x800F6914
.definelabel c_Input, 0x800F691A


.definelabel g_PlayerInputTable, 0x800F6910

.definelabel g_Controller1, 0x800F6910
.definelabel g_Controller2, 0x800F6920
.definelabel g_Controller3, 0x800F6930
.definelabel g_Controller4, 0x800F6940
.definelabel g_ControllerMenu, 0x800F6950
.definelabel g_ControllerGhost1, 0x800F6960
.definelabel g_ControllerGhost2, 0x800F6970
.definelabel g_ControllerGhost3, 0x800F6980

.definelabel player1inputX, 0x800F6910
.definelabel player1inputY, 0x800F6912
.definelabel p1Button, 0x800F6914

.definelabel g_player1LocationX, 0x800F69A4
.definelabel g_player1LocationY, 0x800F69A8
.definelabel g_player1LocationZ, 0x800F69AC
.definelabel g_player1LastLocationX, 0x800F69B0
.definelabel g_player1LastLocationY, 0x800F69B4
.definelabel g_player1LastLocationZ, 0x800F69B8
.definelabel g_player1LocationA, 0x800F69BC




.definelabel g_player1SpeedX, 0x800F69C4
.definelabel g_player1SpeedY, 0x800F69C8
.definelabel g_player1SpeedZ, 0x800F69CC
.definelabel g_player1SpeedA, 0x800F6A24
.definelabel g_player1SpeedU1, 0x800F6A28
.definelabel g_player1SpeedU2, 0x800F6A2C
.definelabel g_playerStatus, 0x800F6A58

.definelabel g_player1CameraX, 0x800F6B28
.definelabel g_player1CameraY, 0x800F6B2C
.definelabel g_player1CameraZ, 0x800F6B30
.definelabel g_playerSpriteSize, 0x800F6BB4



.definelabel surface_p0, 0x800F6A4E

.definelabel player2X, 0x800F777C
.definelabel player2Y, 0x800F7780
.definelabel player2Z, 0x800F7784
.definelabel player3X, 0x800F8854
.definelabel player3Y, 0x800F8858
.definelabel player3Z, 0x800F885C
.definelabel player4X, 0x800F9324
.definelabel player4Y, 0x800F9328
.definelabel player4Z, 0x800F932C

.definelabel cpu2Speed, 0x800F797C
.definelabel cpu3Speed, 0x800F8754
.definelabel cpu4Speed, 0x800F952C

.definelabel boost1, 0x800F699E
.definelabel boost2, 0x800F7776
.definelabel boost3, 0x800F854E
.definelabel boost4, 0x800F9326


.definelabel g_PlayerStructTable, 0x800F6990
.definelabel GlobalPlayer,    0x800F6990
.definelabel g_PlayerStruct1, 0x800F6990
.definelabel g_PlayerStruct2, 0x800F7768
.definelabel g_PlayerStruct3, 0x800F8540
.definelabel g_PlayerStruct4, 0x800F9318
.definelabel g_PlayerStruct5, 0x800FA0F0
.definelabel g_PlayerStruct6, 0x800FAEC8
.definelabel g_PlayerStruct7, 0x800FBCA0
.definelabel g_PlayerStruct8, 0x800FCA78



.definelabel gDynamicP, 0x8014EF40
.definelabel g_aspectRatio, 0x80150148
.definelabel g_farClip, 0x8015014C


//140,118  xy width/height
.definelabel g_ScreenStruct, 0x8015F480
.definelabel g_Screen1, 0x8015F480
.definelabel g_Screen2, 0x8015F4c0
.definelabel g_Screen3, 0x8015F500
.definelabel g_Screen4, 0x8015F540
.definelabel g_player1ScreenWidth, 0x8015F4AC
.definelabel g_player1ScreenHeight, 0x8015F4AE
.definelabel g_player1ScreenX, 0x8015F4B0
.definelabel g_player1ScreenY, 0x8015F4B2
.definelabel g_player1View, 0x8015F4B4
.definelabel g_player1Section, 0x8015F4B8

.definelabel g_player2ScreenWidth, 0x8015F4EC
.definelabel g_player2ScreenHeight, 0x8015F4EE
.definelabel g_player2ScreenX, 0x8015F4F0
.definelabel g_player2ScreenY, 0x8015F4F2
.definelabel g_player2View, 0x8015F4F4
.definelabel g_player2Section, 0x8015F4F8

.definelabel g_player3ScreenWidth, 0x8015F52C
.definelabel g_player3ScreenHeight, 0x8015F52E
.definelabel g_player3ScreenX, 0x8015F530
.definelabel g_player3ScreenY, 0x8015F532
.definelabel g_player3View, 0x8015F534
.definelabel g_player3Section, 0x8015F538

.definelabel g_player4ScreenWidth, 0x8015F56C
.definelabel g_player4ScreenHeight, 0x8015F56E
.definelabel g_player4ScreenX, 0x8015F570
.definelabel g_player4ScreenY, 0x8015F572
.definelabel g_player4View, 0x8015F574
.definelabel g_player4Section, 0x8015F578

.definelabel FreeMemoryPointer, 0x8015F728
.definelabel LastMemoryPointer, 0x8015F72C
.definelabel StaticMemoryPointer, 0x8015F734
.definelabel g_ScreenCounter, 0x8015F788
.definelabel g_TrialTime, 0x8015F898
.definelabel g_lap2Time, 0x8015F89C
.definelabel g_lap3Time, 0x8015F8A0


.definelabel g_StaticObjectCount, 0x8015F900
.definelabel g_SimpleObjectArray, 0x8015F9B8

.definelabel g_progressValue, 0x8016328A

.definelabel g_CourseObstacle, 0x8016359C

.definelabel g_PlayerRankTable, 0x801643B8
.definelabel g_playerPosition1, 0x801643B8
.definelabel g_playerPosition2, 0x801643BC
.definelabel g_playerPosition3, 0x801643C0
.definelabel g_playerPosition4, 0x801643C4
.definelabel g_playerPosition5, 0x801643C8
.definelabel g_playerPosition6, 0x801643CC
.definelabel g_playerPosition7, 0x801643D0
.definelabel g_playerPosition8, 0x801643D4

.definelabel g_GameLapTable, 0x80164390
.definelabel g_gameLapPlayer1, 0x80164390
.definelabel g_gameLapPlayer2, 0x80164394
.definelabel g_gameLapPlayer3, 0x80164398
.definelabel g_gameLapPlayer4, 0x8016439C
.definelabel g_gameLapPlayer5, 0x801643A0
.definelabel g_gameLapPlayer6, 0x801643A4
.definelabel g_gameLapPlayer7, 0x801643A8
.definelabel g_gameLapPlayer8, 0x801643AC


.definelabel g_CameraTable, 0x801646F0
.definelabel g_Camera1, 0x801646F0
.definelabel g_Camera2, 0x801647A8
.definelabel g_Camera3, 0x80164860
.definelabel g_Camera4, 0x80164918

.definelabel g_DynamicObjects, 0x80165C18
.definelabel KWAnmNext, 0x80086FD4

.definelabel KWDisplayEvent, 0x800588F4
.definelabel KWDisplayEvent_After, 0x80058B58
.definelabel KWGameEventCommon_VF, 0x8005A71C
.definelabel KWGameEventCommon, 0x8005A74C

.definelabel KWDisplayIceBlock, 0x80052C60
.definelabel KWDisplayIceBlockShadow, 0x80052E30
.definelabel KWDisplayBombKartBT, 0x80056AC0

.definelabel itemBoolean, 0x80165F5F
.definelabel itemA, 0x80165F5B
.definelabel itemB, 0x80165F5D
.definelabel itemC, 0x80165F8A

.definelabel item2Boolean, 0x8016603F
.definelabel item2A, 0x80166603B
.definelabel item2B, 0x80166603D
.definelabel item2C, 0x80166606A

//.definelabel g_TimeLapTable, 0x8018CA70           !!! renamed to g_hudStruct !!!
//.definelabel g_lapCheckA, 0x8018CAE1              !!! removed inside HUD struct now: finlineAnim2 !!! U use this in MarioKartPractice.c
//.definelabel g_lapCheckB, 0x8018CAE2              !!! removed inside HUD struct now: lapCount !!! U use this in MarioKartPractice.c
.definelabel g_hudStruct, 0x8018CA70
.definelabel g_hudPlayer1, 0x8018CA70
.definelabel g_hudPlayer2, 0x8018CAF4
.definelabel g_hudPlayer3, 0x8018CB78
.definelabel g_hudPlayer4, 0x8018CBFC
.definelabel ItemBoxAllocPtr, 0x80183E88
.definelabel KWLap, 0x8018CA70

//hud p1 p2
.definelabel g_hudToggleFlag, 0x80165808
.definelabel g_hudToggleFlagP2, 0x80165832
.definelabel g_hudMapToggle, 0x80165800
.definelabel g_hudMapToggle2, 0x801657E8 //shows with speed
.definelabel g_hudSpeedToggle, 0x80165810
.definelabel g_hudSpeedToggle2, 0x801657E6 //shows with map
.definelabel g_hudLapToggle, 0x801657E4 //00/01 show lap 02 don't show lap/speed

//hud all players
.definelabel g_hudToggle, 0x800DC5B9 
.definelabel g_mapPlayers, 0x8018D15B
.definelabel g_blueLineRankToggle, 0x801657F0

//hud p1 only
.definelabel g_hudCharpicRankToggle, 0x8018D2BF
.definelabel g_hudCharpicRankA, 0x8018D3E3
.definelabel g_hudCharpicRankX1, 0x8018D027 //float
.definelabel g_hudCharpicRankX2, 0x8018D02B
.definelabel g_hudCharpicRankX3, 0x8018D02F 
.definelabel g_hudCharpicRankX4, 0x8018D033 
.definelabel g_hudCharpicRankY1, 0x8018D050 
.definelabel g_hudCharpicRankY2, 0x8018D054 
.definelabel g_hudCharpicRankY3, 0x8018D058 
.definelabel g_hudCharpicRankY4, 0x8018D05C 

.definelabel asm_DisableEngineSound, 0x800E9F74
.definelabel asm_DisableHUD, 0x80059D08 //0C016A67

.definelabel KWVideoFramesYori, 0x80059AC8
.definelabel g_GhostHUDID, 0x8018DAAA

.definelabel g_mlogoY, 0x8018D9F0
.definelabel g_mflagID, 0x8018DA30
.definelabel g_mpressstartID, 0x8018DA58
.definelabel g_mracewayTime, 0x8018DA80


.definelabel KBGNumberNext, 0x8018EDE0
.definelabel menuScreenC, 0x8018EDEE
.definelabel menuScreenA, 0x8018EDEC
.definelabel menuScreenB, 0x8018EDED
.definelabel currentMenu, 0x8018D9E0  //23 main 24 character 25 course 0 ingame

.definelabel titleDemo, 0x8018EE00


.definelabel g_cupSelect, 0x8018EE09
.definelabel g_courseSelect, 0x8018EE0B
.definelabel g_InGameTT, 0x8018EDFB
.definelabel g_InGame, 0x8018EDFC

.definelabel InitializeEndingSequence, 0x80280420
.definelabel EndingSequence, 0x802802AC
.definelabel CheckFinish, 0x8028E3A0
.definelabel asm_CupCount, 0x8028E3C6
.definelabel ResultsSequence, 0x80281548

.definelabel songID, 0x8028ECE6
.definelabel asm_SongA, 0x8028EC9C
.definelabel asm_SongB, 0x8028F9C4
//802B8B70


.definelabel CullDL_Parameters, 0x802B8D04
.definelabel g_courseTable, 0x802B8D80

.definelabel KeystockBuffer, 0x802D2B80
.definelabel KeystockCounter, 0x80162D9C 
.definelabel OGAArea, 0x80162FCE
.definelabel LaneData, 0x801634F8
.definelabel g_RoadWidth, 0x800DCA4C

.definelabel CenterPathBP, 0x80164550
.definelabel SideLPathBP, 0x80164560
.definelabel SideRPathBP, 0x80164570
.definelabel CurvePathDataBP, 0x80164580
.definelabel AnglePathDataBP, 0x80164590
.definelabel ShortCutPathDataBP, 0x801645A0
.definelabel CurrentPathID, 0x801645B0

.definelabel Func_8001A588, 0x8001A588

.definelabel ActionStartCheck, 0x80011B14
.definelabel ActPointPtr, 0x801632B0
.definelabel ActData_Pointer, 0x80162EB8
.definelabel ActionDataNumCustom, 0x80163578
.definelabel g_driftFlg, 0x801630E8
.definelabel g_actionFlg, 0x801632E8

.definelabel AreaBunkatuBP, 0x800100F0
.definelabel SidePointCalcBP, 0x80010218
.definelabel CurveDataCalcBP, 0x800107C4
.definelabel AngleDataCalcBP, 0x80010DBC
.definelabel ShortcutDataCalcBP, 0x80010E6C

.definelabel PlayerOK, 0x8018EDE8
.definelabel player1OK, 0x8018EDE8
.definelabel player2OK, 0x8018EDE9
.definelabel player3OK, 0x8018EDEA
.definelabel player4OK, 0x8018EDEB

.definelabel SetFadeOutTaData, 0x8009E258
.definelabel DrawText, 0x800936EC 
.definelabel textDrawPtr, 0x80093788
.definelabel textDraw, 0x800939FC

.definelabel GetWordLength, 0x80093034

.definelabel g_GFXCounter, 0x802BA270
.definelabel g_PKCounter, 0x802BA274
.definelabel g_RNG, 0x802BA290
.definelabel ExecuteItem, 0x802B2FA0

.definelabel g_CharacterSelections, 0x800E86A8

.definelabel g_player1Character, 0x8018EDE4 // 1 = Mario, 2 = Luigi, etc.
.definelabel g_player2Character, 0x8018EDE5
.definelabel g_player3Character, 0x8018EDE6
.definelabel g_player4Character, 0x8018EDE7

.definelabel g_menuMultiplayerSelection, 0x8018EDF3 // 1 to 4 players

.definelabel g_placedBadGPadvance, 0x8028EFF0 // 0x10 = Retry; 0x00 = Advance
.definelabel g_P1TopSpeed, 0x800F6BA4 

.definelabel BalloonCount, 0x8018D8C0

.definelabel g_menuUpdateTimer1, 0x8018DEEB
.definelabel g_menuUpdateTimer2, 0x8018DF03
.definelabel g_menuUpdateTimer3, 0x8018DF1B
.definelabel g_menuUpdateTimer4, 0x8018DF33

.definelabel g_menuPreviewValue1, 0x8018DBB7
.definelabel g_menuPreviewValue2, 0x8018DBDF
.definelabel g_menuPreviewValue3, 0x8018DC07
.definelabel g_menuPreviewValue4, 0x8018DC2F
.definelabel g_BattlePreviewValue1, 0x8018DAC7
.definelabel g_BattlePreviewValue2, 0x8018DAEF
.definelabel g_BattlePreviewValue3, 0x8018DB17
.definelabel g_BattlePreviewValue4, 0x8018DB3F

.definelabel g_zoomFOVPlayer1, 0x80150131 //20-zoomed in 70-zoomed out
.definelabel g_zoomFOVPlayer2, 0x80150135 
.definelabel g_zoomFOVPlayer3, 0x80150139 
.definelabel g_zoomFOVPlayer4, 0x8015013D 

.definelabel g_zoomLevelPlayer1, 0x80164679 //0-zoomed in 1-zoomed out 2-super close
.definelabel g_zoomLevelPlayer2, 0x8016467B 
.definelabel g_zoomLevelPlayer3, 0x8016467D 
.definelabel g_zoomLevelPlayer4, 0x8016467F 

.definelabel g_ReplayFlag, 0x8015F891 
.definelabel g_screenViewAngle, 0x80150130

.definelabel g_sfxPause, 0x803B17A3 // 20 - paused; 00 playing



//duplicate defines for potential legacy issues.

.definelabel g_MUSTablePointer, 0x803B706C

.definelabel g_MUSSequenceTable, 0x803B8FB0
.definelabel g_MUSInstrumentTable, 0x803B90B0
.definelabel g_MUSRawAudioTable, 0x803B9260
.definelabel g_MUSBankMapTable, 0x803B9310
.definelabel g_sfxPointer, 0x803B7080 



.definelabel g_surfaceCheckP1, 0x800F6A88
.definelabel g_PlayerSurfaceSoundID, 0x800E9E74

.definelabel g_gamePausedFlag, 0x800EA16C
.definelabel OSClockRate, 0x800EA5E0

.definelabel MakePos, 0x8005D794
.definelabel MakeStartup, 0x8005D7D8
.definelabel MakeRDP, 0x8005D800
.definelabel MakeRandomRDP, 0x8005D82C
.definelabel InitRndSmoke, 0x8005DAF4
.definelabel InitRapidSmoke, 0x8005ED48
.definelabel InitSpinSmoke, 0x8005F90C

.definelabel MakeBodyColor, 0x80022F14
.definelabel MakeBodyColorAdjust, 0x80023038


.definelabel RunKart, 0x8002D268
.definelabel RunKartSimple, 0x8002F35C
.definelabel g_playerEcho, 0x800E9F90 // 0x1E - Wall; 0x41 - Room; 0x55 - Tunnel
.definelabel AnimatedLakituStruct, 0x80165CF8

.definelabel g_StarUseCounter, 0x8018D930 
.definelabel g_GhostUseCounter, 0x8018D950
.definelabel g_GhostUseTimer, 0x8018D970
.definelabel ActionData_Pointer, 0x80162EB8
.definelabel MaxPathPoints, 0x80163368
.definelabel g_noSimpleKartFlag, 0x801633F8
.definelabel g_charRadiusTbl, 0x800E26B0

.definelabel SelectNamePlateTable, 0x800E7D54

.definelabel PlayerSelectPositions, 0x800E7108
.definelabel g_StringTableCourseGP, 0x800E7524
.definelabel g_StringTableCourse, 0x800E7574

.definelabel SelectPortraitTable, 0x800E8320
.definelabel TBSeq_psel, 0x800E8320
.definelabel TBSeq_psel_return, 0x800E8340
.definelabel TBSeq_psel_p0, 0x800E8360
.definelabel TBSeq_psel_p1, 0x800E8380
.definelabel TBSeq_psel_p2, 0x800E83A0
.definelabel TBSeq_psel_p3, 0x800E83C0
.definelabel TBSeq_psel_p4, 0x800E83E0
.definelabel TBSeq_psel_p5, 0x800E8400
.definelabel TBSeq_psel_p6, 0x800E8420

//menu
.definelabel menuExtra, 0x8018ED12 //0xFF00 on


.definelabel GlobalMenuHUD, 0x8018D9E0
//title
.definelabel titleBackX, 0x8019BE9C // 8018DA16
.definelabel titleBackY, 0x8019BE9E // 8018DA1A
.definelabel titleBackAnim, 0x8019BE9B
.definelabel titleLogoX, 0x8018D9E0
.definelabel titleLogoY, 0x8018D9F2
.definelabel titleCopyToggle, 0x8018D9EC //F1
.definelabel titleCopyX, 0x8019BEC4
.definelabel titleCopyY, 0x8019BEC6
.definelabel titleCopyChange, 0x8018DA50 //long F0 darker bg 04 show message
.definelabel titlePushToggle, 0x8018DA64
.definelabel titlePushX, 0x8019BEEC
.definelabel titlePushY, 0x8019BEEE
.definelabel titlePushBlink, 0x8019BED0 // setting != 0 puts static texture in front of blinking one

//sky & clouds
.definelabel g_cloudsToggle, 0x801657C8 //00 on 01 off
.definelabel g_skyToggle, 0x800DC5BC
.definelabel gBackgroundFlag, 0x800DC5B4 
.definelabel g_daytimeToggle, 0x800DC518

.definelabel g_BombTable, 0x800DCC08

.definelabel GlobalWeight, 0x802B8790


.definelabel g_skyColorTopTable, 0x802B8AD0
.definelabel g_skyColorBotTable, 0x802B8BCC
.definelabel GlobalSkyColorTop, g_skyColorTopTable;
.definelabel GlobalSkyColorBot, g_skyColorBotTable;

.definelabel g_SnowParticleTex, 0x801C8D10
.definelabel g_MRCloudTexPtr, 0x8016D6FC
.definelabel g_CloudAllocate, 0x8018CC80

.definelabel g_skySnowScale, 0x800EEB3C
.definelabel g_skySnowVelocity, 0x800EEB40
.definelabel g_skySnowSpawnHeight, 0x80077FD8
.definelabel g_skySnowSpawnRadiusDensity, 0x80077FA4
.definelabel g_skySnowSpawnCenterOffset, 0x80077FE8
.definelabel g_skySnowHitGoal, 0x800780A0

.definelabel g_3DSnowSpawnHeight, 0x8007833C
.definelabel g_3DSnowSpawnDistance, 0x80078348
.definelabel g_3DSnowSpawnCone, 0x8007830C
.definelabel g_3DSnowSpawnRadius, 0x80078354
.definelabel g_3DSnowSwayVelocity, 0x80078430
.definelabel g_3DSnowSwayDistance, 0x8007843C
.definelabel g_3DSnowSwayMovement, 0x800EEB50
.definelabel g_3DSnowScale, 0x800EEB48
.definelabel g_3DSnowVelocityUpLim, 0x800EEB58
.definelabel g_3DSnowVelocityLowLim, 0x800EEB60 

.definelabel KWChartSnow, 0x80078838
.definelabel KWChartIceBlock, 0x80079D44

//racer values
.definelabel g_timeLapChange, 0x8015F898
.definelabel g_playerPathPointTable, 0x80164438
.definelabel g_PathPointPlayer1, 0x80164438
.definelabel g_PathPointPlayer2, 0x8016443A
.definelabel g_PathPointPlayer3, 0x8016443C
.definelabel g_PathPointPlayer4, 0x8016443E
.definelabel g_PathPointPlayer5, 0x80164440
.definelabel g_PathPointPlayer6, 0x80164442
.definelabel g_PathPointPlayer7, 0x80164444
.definelabel g_PathPointPlayer8, 0x80164446
.definelabel g_playerPathPointTotalTable, 0x80164450
.definelabel g_playerPathPointCopy, 0x80165320
.definelabel g_rivalOvertakeAllowFlag, 0x801634C0
.definelabel g_EnemyTargetPlayer, 0x80163478
.definelabel g_rankUpdateFinishFlag, 0x8016348C

//fog
.definelabel g_fogToggleBanshee, 0x800DC5BD
.definelabel g_fogR, 0x801625EF
.definelabel g_fogG, 0x801625F3
.definelabel g_fogB, 0x801625F7


.definelabel KBGNumber, 0x800E86A0
.definelabel KBGChange, 0x800E86A4


//lightning flags
.definelabel g_lightningFlag, 0x800EA168
.definelabel g_lightningFlagPlayer1, 0x800E9F24
.definelabel g_lightningFlagPlayer2, 0x800E9F25
.definelabel g_lightningFlagPlayer3, 0x800E9F26
.definelabel g_lightningFlagPlayer4, 0x800E9F27
.definelabel g_lightningFlagPlayer5, 0x800E9F28
.definelabel g_lightningFlagPlayer6, 0x800E9F29
.definelabel g_lightningFlagPlayer7, 0x800E9F2A
.definelabel g_lightningFlagPlayer8, 0x800E9F2B

//offroad flags
.definelabel g_offroadFlagPlayer1, 0x80165330 //short
.definelabel g_offroadFlagPlayer2, 0x80165332 //short
.definelabel g_offroadFlagPlayer3, 0x80165334 //short
.definelabel g_offroadFlagPlayer4, 0x80165336 //short

//waterlevel checks
.definelabel g_waterlevelPlayer, 0x801652A0

//wrongway flags 
.definelabel g_wrongwayFlagPlayer1, 0x80163270 //short
.definelabel g_wrongwayFlagPlayer2, 0x80163272 //short
.definelabel g_wrongwayFlagPlayer3, 0x80163274 //short
.definelabel g_wrongwayFlagPlayer4, 0x80163276 //short

//player shadow flags
.definelabel g_shadowflagPlayer0, 0x800F6B87
.definelabel g_shadowflagPlayer1, 0x800F795F
.definelabel g_shadowflagPlayer2, 0x800F8737
.definelabel g_shadowflagPlayer3, 0x800F950F

//player color timers
.definelabel g_colorPlayer0R, 0x80164B10 //red with kart
.definelabel g_colorPlayer1R, 0x80164B12 //red with kart
.definelabel g_colorPlayer2R, 0x80164B14 //red with kart
.definelabel g_colorPlayer3R, 0x80164B16 //red with kart
.definelabel g_colorPlayer4R, 0x80164B18 //red with kart
.definelabel g_colorPlayer5R, 0x80164B1A //red with kart
.definelabel g_colorPlayer6R, 0x80164B1C //red with kart
.definelabel g_colorPlayer7R, 0x80164B1E //red with kart

//GP points
.definelabel g_playerGPpoints, 0x8018D9C8
.definelabel EtcEnemyDrive, 0x800097E0
.definelabel InitCenterLine, 0x8000F2DC
.definelabel OSMemSize, 0x80000318

//multiplayer points
.definelabel g_2PRacePoints, 0x8000031C
.definelabel g_3PRacePoints, 0x8000031E
.definelabel g_4PRacePoints, 0x80000321
.definelabel g_2PBattlePoints, 0x80000333
.definelabel g_3PBattlePoints, 0x80000335
.definelabel g_4PBattlePoints, 0x80000338

.definelabel AllocDepthBuffer, 0x80000BEC
//course
.definelabel g_mirrorValue, 0x8015F784
.definelabel g_goalBannerPos, 0x8015F8D0
.definelabel g_mooSoundCounter, 0x8015F700
.definelabel g_mooSoundPointer, 0x8015F702
.definelabel g_mooSoundLastDistance, 0x8015F704
.definelabel g_mooSoundPosition, 0x8015F708
.definelabel g_crowdSoundPos1, 0x8015F748
.definelabel g_crowdSoundPos2, 0x8015F758
.definelabel g_crowdSoundPos3, 0x8015F768
.definelabel g_crowdSoundPos4, 0x8015F778
.definelabel g_waterfallSoundPos, 0x8015F738
.definelabel g_waterHeight, 0x8015F8E4
.definelabel g_waterVelocity, 0x8015F8E8
.definelabel g_monitorCounter, 0x802B87D8
.definelabel g_simpleObjectCount, 0x80150110
.definelabel gMatrixCount, 0x80150112
.definelabel g_courseTotalPathPoints, 0x801645C8
.definelabel g_pathPointPointer, 0x80164490

//sound and music
.definelabel playSound, 0x800C8E10
.definelabel NAMusicVolume, 0x800C8F44
.definelabel NAPlyTrgStart, 0x800C9060
.definelabel NAPlyVoiceStart, 0x800C90F4
.definelabel NAEnmTrgStart, 0x800C98B8
.definelabel NAEnmTrgStop, 0x800C99E0
.definelabel NaSeqStart, 0x800C8EAC
.definelabel NaFanStart, 0x800C8EF8
.definelabel NaPlyLevelStart, 0x800C8F80
.definelabel NaPlyLevelStop, 0x800C9018
.definelabel NaSceneLevelStart, 0x800C9D80
.definelabel NaSceneLevelStop, 0x800C9EF4


.definelabel GUPerspective, 0x800CF330
.definelabel GULookAt, 0x800CF648

.definelabel g_musicUserVolumeFlag, 0x800DC5A8 //char 00=full, 01=half, 02=off, 04=disable L button
.definelabel g_musicIDRaceways, 0x8028ECE6 
.definelabel g_musicIDToad, 0x8028ECF6
.definelabel g_musicIDCountry, 0x8028ED06
.definelabel g_musicIDBattle1, 0x8028ED16
.definelabel g_musicIDKalamari, 0x8028ED26
.definelabel g_musicIDKoopa, 0x8028ED36
.definelabel g_musicIDBowser, 0x8028ED46
.definelabel g_musicIDBanshee, 0x8028ED56
.definelabel g_musicIDSnowy, 0x8028ED66
.definelabel g_musicIDRainbow, 0x8028ED76
.definelabel g_musicIDDK, 0x8028ED86
.definelabel g_musicIDBattle2, 0x8028ED96
.definelabel g_musicTempo, 0x803B1518
.definelabel g_fanfareTempo, 0x803B1660

.definelabel NAISeqFlagEntry, 0x800C2A2C
.definelabel NAIGetPlayingSeqFlag, 0x800C3508
.definelabel NAIFxFlagEntry, 0x800C4148
.definelabel SeqPlayer, 0x803B1510

//Cave Fire Particle Stuff
.definelabel CaveFirePos, 0x800E6788
.definelabel KWGetCaveFire, 0x800770F0
.definelabel CaveFireColCheck, 0x800547CC
.definelabel KWChaseSVal, 0x80041288
.definelabel KWChaseIVal, 0x8004132C
.definelabel KWChaseFVal, 0x800413B8
.definelabel KWSet2Color, 0x8004B1C8
.definelabel KWDisplayRank, 0x8004E800
.definelabel KWDisplayFireParticleSub, 0x8005477C
.definelabel FireParticleAllocArray, 0x8018C870
.definelabel FireParticleCounter, 0x80183E6C

.definelabel EffectAllocArray1, 0x8018C1B0
.definelabel EffectAllocArray2, 0x8018C3F0
.definelabel EffectAllocArray3, 0x8018C630
.definelabel KWRank, 0x8018CF98
.definelabel KWGetStar, 0x800773D8
.definelabel KWChartStar, 0x80077640
.definelabel KWDisplayStar, 0x80054BE8

.definelabel RGBAFallingLeaf, 0x0D028DD8
.definelabel RGBAQuestionMark, 0x0D001EE8
.definelabel GoToGameSelect, 0x80290360
.definelabel SearchListFile, 0x80290CAC

.definelabel MakeCollision, 0x80295C6C
.definelabel RGBALeaf, 0x0D0291D8
.definelabel InitialMap, 0x80295D88
.definelabel InitialMapObject, 0x8029DB44
.definelabel SetTreeObject, 0x8029D584
.definelabel SetPakkunObject, 0x8029CC14
.definelabel SetItemBoxObject, 0x8029D830
.definelabel LoadMapData, 0x802AA918
.definelabel SetViewport, 0x802A3730
.definelabel ClearZBuffer, 0x802A3CB0
.definelabel ClearZBuffer2, 0x802A39E0
.definelabel InitRDP, 0x802A3E3C
.definelabel InitialDrawCommon, 0x802A53A4
.definelabel FallingRockGFX_U, 0x8029CBE8
.definelabel FallingRockGFX_L, 0x8029CBEC
.definelabel FallingRockShadowGFX_U, 0x8029CB9C
.definelabel FallingRockShadowGFX_L, 0x8029CBA8
.definelabel DisplayGroupmap, 0x80290DAC
.definelabel ShadowModel, 0x0D007B98
.definelabel HoleModel, 0x0D007C10
.definelabel ItemBoxModel, 0x0D003288
.definelabel MoveFallingRock, 0x8029D188

.definelabel CheckTriangleZX, 0x802AAE4C
.definelabel CheckTriangleXY, 0x802AB288
.definelabel CheckTriangleYZ, 0x802AB6C4

.definelabel CheckTriangleZX_V, 0x802AC760
.definelabel CheckTriangleXY_V, 0x802ACBA4
.definelabel CheckTriangleYZ_V, 0x802AD278

.definelabel SpinKart, 0x8002E594
.definelabel WeaponStatus, 0x8002B830
.definelabel SetStrategy, 0x8002CD48
.definelabel CheckKartHit, 0x8002C7E4
.definelabel PowerCheck, 0x80030150
.definelabel DriftJump, 0x8002AAC0
.definelabel CheckWall, 0x8002C954
.definelabel AccelOn, 0x80030FC8
.definelabel AccelOff, 0x80031F48
.definelabel CheckSlope, 0x802ABDB8
.definelabel SetRolloverFall, 0x8008F494
.definelabel ResetRolloverFall, 0x8008F5A4
.definelabel CalcHeight, 0x802ABE30
.definelabel TirePosition, 0x80029B4C
.definelabel EnemyTirePosition, 0x8002A194
.definelabel SetSlipAngle, 0x8002AE38
.definelabel NaPlyLandStart, 0x800CADD0

.defineLabel gKartSteerSpeedASM, 0x80150154
.defineLabel SteeringSpeedData_RT, 0x800E3610
.defineLabel InitRandSmoke, 0x8005DAF4
.defineLabel JumpSet, 0x8002AA50
.defineLabel ObjCalculation, 0x8006D474
.definelabel DrawShadow, 0x80023C84
