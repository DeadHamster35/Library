

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

.definelabel decodeMIO0, 0x800400D0 ;MIO0 File A0 = input, A1 = output
.definelabel DMA, 0x80001158
.definelabel decodeTKMK, 0x800405D0
.definelabel GetFramebuffer, 0x802A7658
.definelabel CheckBump, 0x802ADDC8
.definelabel CheckBump2, 0x802AD950
.definelabel loadCourse, 0x802AA918
.definelabel BumpVelocity, 0x802AC114
.definelabel CalcBumpVelocity, 0x802AC098
.definelabel ScrollMapImage, 0x802AF7B4
.definelabel MakeWaterVertex, 0x802AF8BC
.definelabel ramCopy, 0x800D7FE0
.definelabel CheckArea, 0x802ABD40

.definelabel readControllers, 0x80000A28
.definelabel InitControllers, 0x800008A4

.definelabel DMABuffer, 0x80020000
.definelabel DrawBuffer, 0x80021244

.definelabel CheckDMA, 0x80020524
.definelabel CheckDMA2P, 0x8002088C
.definelabel CheckDMA3P, 0x80020BF4
.definelabel CheckDMA4P, 0x80020F1C

.definelabel SmokeDisp, 0x8006E5AC
.definelabel SmokeDisp2P, 0x8006E634
.definelabel SmokeDisp3P, 0x8006E6BC
.definelabel SmokeDisp4P, 0x8006E744

.definelabel CheckHight, 0x802AE1C0
.definelabel KWCheckRadiusXZ, 0x80041608

.definelabel deleteObjectBuffer, 0x8029E854
.definelabel addObjectBuffer, 0x8029EC88

.definelabel CollisionCylinder, 0x8029EEB8
.definelabel CollisionSphere, 0x8029FB80

.definelabel RouletteStart, 0x8007ABFC

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
.definelabel sinT, 0x802B8018
.definelabel cosT, 0x802B8038
.definelabel sinF, 0x800D60F0
.definelabel cosF, 0x800D62B0
.definelabel CheckCone, 0x802B8058
.definelabel CheckDisplayRange, 0x802B80D0
.definelabel RotateLightMatrix, 0x802B8414
.definelabel SetUpVector, 0x802B8614
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

.definelabel printNumber, 0x80057524
.definelabel printString, 0x800577A4
.definelabel printStringBinary, 0x80057908
.definelabel printStringNumber, 0x800577D0
.definelabel printStringUnsignedNumber, 0x80057814
.definelabel printStringHex, 0x80057858
.definelabel printStringUnsignedHex, 0x800578B0
.definelabel printStringUnsignedBinary, 0x80057960
.definelabel FillRect1ColorF, 0x80098DF8
.definelabel SetFadeOutB, 0x8009E208
.definelabel SetObjBlock, 0x8009E650
.definelabel InitObjBlock, 0x8009E620
.definelabel DoObjBlock, 0x800A7A4C

.definelabel DOBPSelTurnIn, 0x800AAB90
.definelabel DOBPSelTurnOut, 0x800AAA9C

.definelabel DOBPSelAnimeKuppa, 0x800AA69C

.definelabel SegmentTable, 0x80150258
.definelabel g_CfbPtrs, 0x801502A8

.definelabel GraphPtr, 0x80150298
.definelabel GraphPtrOffset, 0x80150298
.definelabel KWLookCamera, 0x800418AC
.definelabel KWLookCameraPitch, 0x800418E8
.definelabel KWSprite, 0x8004C364
.definelabel KWSpriteScale, 0x8004CA58
.definelabel KWSpriteDiv, 0x8004C91C
.definelabel KWSpriteTile32B, 0x8004C6FC
.definelabel DrawLineHorizontal, 0x8004C024
.definelabel DrawLineVertical, 0x8004C148
.definelabel KWLoadTextureBlockI4b, 0x80044DA0
.definelabel KWLoadTextureBlockRGBA16B, 0x80043D50
.definelabel SprDrawClip, 0x8004B97C
.definelabel SprDrawClipST, 0x8004BA98
.definelabel StockNumberSprites, 0x0D00C558
.definelabel DecodeMapImage1, 0x802A84F4

.definelabel BumpObject, 0x802B4E30

.definelabel SetSegment, 0x802A7B94

.definelabel OoBCheck, 0x802ABDF4

.definelabel SetStar, 0x8008F778
.definelabel ResetStar, 0x8008F86C
.definelabel SetTurbo, 0x8008D3C4
.definelabel SetWing, 0x8008D570
.definelabel SetStorm, 0x8008D7B0
.definelabel SetThunder, 0x8008DF98
.definelabel ThunderWorld, 0x8009E5BC
.definelabel VSGhost , 0x8008F8E4
.definelabel SetVSGhost, 0x8008FA38
.definelabel ResetVSGhost, 0x8008FB30

.definelabel SetFastOoB, 0x80090868
.definelabel CallLakitu, 0x80090868
.definelabel SetLakitu, 0x80090778
.definelabel LakituCheck, 0x8002C17C
.definelabel HangLakitu, 0x80090970
.definelabel LakituIceBehavior, 0x800797E8
.definelabel ShakeCamera, 0x8001CA10
.definelabel ShakeHitCamera, 0x8001CA24

.definelabel CheckWaterLevel, 0x802AAB4C
.definelabel CheckSplash, 0x8002C4F8

// NOP out splash func
.definelabel CheckSplashJAL1, 0x8002E4A8
.definelabel CheckSplashJAL2, 0x8002F340
.definelabel CheckSplashJAL3, 0x8003939C

// NOP out BGM fanfares func
.definelabel CheckFinalLapFanfareJAL, 0x8028F344
.definelabel CheckPlayStarBGMJAL, 0x8008F820

// Edit cloud call func
.definelabel CloudTypeMapCheck1, 0x80070560
.definelabel CloudTypeMapCheck2, 0x80070564
.definelabel CloudAmountMapCheck1, 0x80078DD8
.definelabel CloudAmountMapCheck2, 0x80078DE0
.definelabel Snow3DAllocMapCheck1, 0x80070784
.definelabel Snow3DAllocMapCheck2, 0x80070788
.definelabel Snow3DDisplayAfterMapCheck1, 0x80058B58
.definelabel Snow3DDisplayAfterMapCheck2, 0x80058B5C

.definelabel initializePlayer, 0x800393C0
.definelabel DelayInitialMap, 0x80002DAC

.definelabel TexBuffLoadP, 0x800996BC
.definelabel GrayScaleTexBuf3, 0x8009B0A4
.definelabel GrayScaleTexBufRGB, 0x8009B538
.definelabel FadeMain, 0x8009CA2C
.definelabel FadeMain2, 0x8009CA6C
.definelabel SetFadeOut, 0x8009DFE0
.definelabel PutPylon, 0x8029ABD4
.definelabel PutObject, 0x8029ED38
.definelabel g_fadeOutFlag, 0x800DC5C0
.definelabel g_fadeOutCounter, 0x800DC5C4


.definelabel asm_itemJump1A, 0x8007B084  //3C058016
.definelabel asm_itemJump1B, 0x8007B098  //84A543BA

.definelabel asm_itemJump2A, 0x8007AFC0  //3C058016
.definelabel asm_itemJump2B, 0x8007AFD4  //84A543BA

.definelabel Sqrtf, 0x800CE140

.definelabel colorFont, 0x800930D8
.definelabel loadFont, 0x80057710

.definelabel g_SegmentA, 0x80117974
;;
;;

.definelabel g_resetToggle, 0x800DC50C
.definelabel g_startingIndicator, 0x800DC510
.definelabel g_DebugSection, 0x800DC514
.definelabel g_DebugMode, 0x800DC520
.definelabel g_NewSequenceMode, 0x800DC524
.definelabel g_NextSequenceMode, 0x800DC528
.definelabel g_screenSplitA, 0x800DC52C
.definelabel g_screenSplitB, 0x800DC530
.definelabel g_playerCount, 0x800DC538
.definelabel g_raceClass, 0x800DC548
.definelabel g_gameTimer, 0x800DC598
.definelabel g_courseID,  0x800DC5A0
.definelabel g_loadedcourseFlag, 0x800DC5A4
.definelabel g_gameMode, 0x800DC53C
.definelabel g_DispFrame, 0x800DC55C
.definelabel g_mirrorMode, 0x800DC604
.definelabel g_DebugBars, 0x800DC662

.definelabel PathTable, 0x800DC8D0

.definelabel g_courseFaceStructPtr, 0x8015F580
.definelabel g_courseFaceMaxIndex, 0x8015F588

.definelabel GlobalStat, 0x800E2360 
.definelabel gravity, 0x800E2650
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
.definelabel g_cupArray0, 0x800F2BB4
.definelabel g_cupArray1, 0x800F2BBC
.definelabel g_cupArray2, 0x800F2BC4
.definelabel g_cupArray3, 0x800F2BCC
.definelabel g_cupArrayB, 0x800F2BD4

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

.definelabel g_bannerTexture, 0x801F2750
.definelabel g_previewTexture, 0x8020E460
.definelabel g_mapTexture, 0x8018D240
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

.definelabel lastLoadedAddress, 0x8015F728
.definelabel g_TrialTime, 0x8015F898
.definelabel g_lap2Time, 0x8015F89C
.definelabel g_lap3Time, 0x8015F8A0

.definelabel g_SimpleObjectArray, 0x8015F9B8

.definelabel g_progressValue, 0x8016328A

.definelabel g_CourseObstacle, 0x8016359C

.definelabel g_playerPosition, 0x801643B8
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

.definelabel g_hudStruct, 0x8018CA70

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
.definelabel g_hudCharpicRankX, 0x8018D028
.definelabel g_hudCharpicRankY, 0x8018D050 

.definelabel g_hudCharpicRankX1, 0x8018D027
.definelabel g_hudCharpicRankX2, 0x8018D02B
.definelabel g_hudCharpicRankX3, 0x8018D02F 
.definelabel g_hudCharpicRankX4, 0x8018D033 
.definelabel g_hudCharpicRankY1, 0x8018D050 
.definelabel g_hudCharpicRankY2, 0x8018D054 
.definelabel g_hudCharpicRankY3, 0x8018D058 
.definelabel g_hudCharpicRankY4, 0x8018D05C 

.definelabel asm_DisableEngineSound, 0x800E9F74
.definelabel asm_DisableHUD, 0x80059D08 //0C016A67
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

.definelabel asm_CupCount, 0x8028E3C6
.definelabel songID, 0x8028ECE6
.definelabel asm_SongA, 0x8028EC9C
.definelabel asm_SongB, 0x8028F9C4
//802B8B70

.definelabel g_courseTable, 0x802B8D80

.definelabel PlayerOK, 0x8018EDE8
.definelabel player1OK, 0x8018EDE8
.definelabel player2OK, 0x8018EDE9
.definelabel player3OK, 0x8018EDEA
.definelabel player4OK, 0x8018EDEB


.definelabel DrawText, 0x800936EC 
.definelabel textDrawPtr, 0x80093788
.definelabel textDraw, 0x800939FC

.definelabel GetWordLength, 0x80093034

.definelabel g_RNG, 0x802BA290

.definelabel g_CharacterSelections, 0x800E86A8

.definelabel g_player1Character, 0x8018EDE4 // 1 = Mario, 2 = Luigi, etc.
.definelabel g_player2Character, 0x8018EDE5
.definelabel g_player3Character, 0x8018EDE6
.definelabel g_player4Character, 0x8018EDE7

.definelabel g_menuMultiplayerSelection, 0x8018EDF3 // 1 to 4 players

.definelabel g_placedBadGPadvance, 0x8028EFF0 // 0x10 = Retry; 0x00 = Advance
.definelabel g_P1TopSpeed, 0x800F6BA4 

.definelabel g_menuUpdateTimer1, 0x8018DEEB
.definelabel g_menuUpdateTimer2, 0x8018DF03
.definelabel g_menuUpdateTimer3, 0x8018DF1B
.definelabel g_menuUpdateTimer4, 0x8018DF33

.definelabel g_menuPreviewValue1, 0x8018DBB7
.definelabel g_menuPreviewValue2, 0x8018DBDF
.definelabel g_menuPreviewValue3, 0x8018DC07
.definelabel g_menuPreviewValue4, 0x8018DC2F



.definelabel g_zoomFOVPlayer1, 0x80150131
.definelabel g_zoomFOVPlayer2, 0x80150135 
.definelabel g_zoomFOVPlayer3, 0x80150139 
.definelabel g_zoomFOVPlayer4, 0x8015013D 

.definelabel g_zoomLevelPlayer, 0x80164678 
.definelabel g_zoomLevelPlayer1, 0x80164679 
.definelabel g_zoomLevelPlayer2, 0x8016467B 
.definelabel g_zoomLevelPlayer3, 0x8016467D 
.definelabel g_zoomLevelPlayer4, 0x8016467F 

.definelabel g_ReplayFlag, 0x8015F891 
.definelabel g_screenViewAngle, 0x80150130

.definelabel g_sfxPause, 0x803B17A3 // 20 - paused; 00 playing

.definelabel g_SequenceTable, 0x803B8FB0
.definelabel g_InstrumentTable, 0x803B90B0
.definelabel g_RawAudio, 0x803B9260


.definelabel g_surfaceCheckP1, 0x800F6A88

.definelabel g_gamePausedFlag, 0x800EA16C

.definelabel MakeBodyColor, 0x80022F14
.definelabel MakeBodyColorAdjust, 0x80023038


.definelabel RunKart, 0x8002D268
.definelabel RunKartSimple, 0x8002F35C
.definelabel g_playerEcho, 0x800E9F90 // 0x1E - Wall; 0x41 - Room; 0x55 - Tunnel
.definelabel AnimatedLakituStruct, 0x80165CF8

.definelabel g_StarUseCounter, 0x8018D930 
.definelabel g_GhostUseCounter, 0x8018D950
.definelabel g_GhostUseTimer, 0x8018D970
.definelabel g_sfxPointer, 0x803B7080 
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
.definelabel g_skyboxToggle, 0x800DC5B4 
.definelabel g_daytimeToggle, 0x800DC518

.definelabel GlobalWeight, 0x802B8790

.definelabel g_skyColorTopTable, 0x802B8AD0
.definelabel g_skyColorBotTable, 0x802B8BCC

.definelabel g_skyColorTop00, 0x802B8AD0
.definelabel g_skyColorTop01, 0x802B8ADC   
.definelabel g_skyColorTop02, 0x802B8AE8   
.definelabel g_skyColorTop03, 0x802B8AF4   
.definelabel g_skyColorTop04, 0x802B8B00  
.definelabel g_skyColorTop05, 0x802B8B0C   
.definelabel g_skyColorTop06, 0x802B8B18   
.definelabel g_skyColorTop07, 0x802B8B24    
.definelabel g_skyColorTop08, 0x802B8B30   
.definelabel g_skyColorTop09, 0x802B8B3C    
.definelabel g_skyColorTop0A, 0x802B8B48   
.definelabel g_skyColorTop0B, 0x802B8B54   
.definelabel g_skyColorTop0C, 0x802B8B60   
.definelabel g_skyColorTop0D, 0x802B8B6C  
.definelabel g_skyColorTop0E, 0x802B8B78
.definelabel g_skyColorTop0F, 0x802B8B84
.definelabel g_skyColorTop10, 0x802B8B90
.definelabel g_skyColorTop11, 0x802B8B9C
.definelabel g_skyColorTop12, 0x802B8BA8
.definelabel g_skyColorTop13, 0x802B8BB4

.definelabel g_SnowParticleTex, 0x801C8D10
.definelabel g_MRCloudTexPtr, 0x8016D6FC

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
.definelabel g_rankUpdateFinishFlag, 0x8016348C

//fog
.definelabel g_fogToggleBanshee, 0x800DC5BD
.definelabel fogLevelA, 0x802B87B0
.definelabel fogLevelB, 0x802B87B4
.definelabel g_fogR, 0x801625EF
.definelabel g_fogG, 0x801625F3
.definelabel g_fogB, 0x801625F7


.definelabel KBGNumber, 0x800E86A0
.definelabel KBGChange, 0x800E86A4


//lightning flags
.definelabel g_lightningFlag, 0x800EA168
.definelabel g_playerFlagLightning, 0x800E9F24
.definelabel lightningTime, 0x8008E302 

.definelabel g_lightningFlagPlayer1, 0x800E9F24
.definelabel g_lightningFlagPlayer2, 0x800E9F25
.definelabel g_lightningFlagPlayer3, 0x800E9F26
.definelabel g_lightningFlagPlayer4, 0x800E9F27
.definelabel g_lightningFlagPlayer5, 0x800E9F28
.definelabel g_lightningFlagPlayer6, 0x800E9F29
.definelabel g_lightningFlagPlayer7, 0x800E9F2A
.definelabel g_lightningFlagPlayer8, 0x800E9F2B

//offroad flags
.definelabel g_playerFlagOffroad, 0x80165330

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
.definelabel g_kartGPpoints, 0x8018D9C8

//multiplayer points
.definelabel g_2PRacePoints, 0x8000031C
.definelabel g_3PRacePoints, 0x8000031E
.definelabel g_4PRacePoints, 0x80000321
.definelabel g_2PBattlePoints, 0x80000333
.definelabel g_3PBattlePoints, 0x80000335
.definelabel g_4PBattlePoints, 0x80000338

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
.definelabel g_simpleObjectScreenCount, 0x80150112
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
.definelabel KWSet2Color, 0x8004B1C8
.definelabel KWDisplayFireParticleSub, 0x8005477C
.definelabel FireParticleAllocArray, 0x8018C870
.definelabel FireParticleCounter, 0x80183E6C

.definelabel EffectAllocArray1, 0x8018C1B0
.definelabel EffectAllocArray2, 0x8018C3F0
.definelabel EffectAllocArray3, 0x8018C630
.definelabel KWGetStar, 0x800773D8
.definelabel KWChartStar, 0x80077640
.definelabel KWDisplayStar, 0x80054BE8

.definelabel RGBAFallingLeaf, 0x0D028DD8
.definelabel RGBAQuestionMark, 0x0D001EE8
.definelabel RGBALeaf, 0x0D0291D8
.definelabel FallingRockGFX_U, 0x8029CBE8
.definelabel FallingRockGFX_L, 0x8029CBEC
.definelabel FallingRockShadowGFX_U, 0x8029CB9C
.definelabel FallingRockShadowGFX_L, 0x8029CBA8
.definelabel ShadowModel, 0x0D007B98
.definelabel HoleModel, 0x0D007C10
.definelabel ItemBoxModel, 0x0D003288
.definelabel MoveFallingRock, 0x8029D188

.definelabel g_eeprom_struct, 0x8018EB90

.definelabel g_ViewportStruct, 0x8015F490
.definelabel g_Viewport1, 0x8015F490
.definelabel g_Viewport2, 0x8015F4D0
.definelabel g_Viewport3, 0x8015F510
.definelabel g_Viewport4, 0x8015F550

.definelabel g_2PweaponModifierP1, 0x80165F5D
.definelabel g_2PweaponModifierP2, 0x8016603D
.definelabel g_2PweaponModifierP3, 0x8016611D
.definelabel g_2PweaponModifierP4, 0x801661FD
.definelabel g_2PweaponModifierP5, 0x801662DD
.definelabel g_2PweaponModifierP6, 0x801663BD
.definelabel g_2PweaponModifierP7, 0x8016649D
.definelabel g_2PweaponModifierP8, 0x8016657D

.definelabel g_4PweaponModifierP1, 0x8016611D
.definelabel g_4PweaponModifierP2, 0x801661FD
.definelabel g_4PweaponModifierP3, 0x801662DD
.definelabel g_4PweaponModifierP4, 0x801663BD

.definelabel g_koopaWaves, 0x8015F8E8 

.definelabel titleProgressButton, 0x8018EE04

.definelabel kwtexture2D_a4_xlu_pt, 0x8004A2F4
.definelabel kwtexture2D_a4_bl, 0x8004A258
.definelabel kwscale2D, 0x800420A8
.definelabel kwtexture2D_a4_xlu_bl, 0x8004A384
.definelabel kwdisplay_zanzou, 0x8004EB38
.definelabel kwtexture2D_rgba_xl, 0x800465B8
.definelabel kwsprite_xlu, 0x8004C9D8
.definelabel kwsprite_ci8_xlu_pt, 0x8004E3F4
.definelabel spr_draw_ci8, 0x8004DF5C
.definelabel kwsprite_ia8_xlu_pt, 0x8004D044
.definelabel kwtexture2D_ci8_xlu_pt, 0x80047B9C
.definelabel kwsprite_sub, 0x8004C268

.definelabel GetCupStatus, 0x800B54C0
.definelabel g_RAMtrophies, 0x8018ED10

.definelabel lost_ghost, 0x80162DF8

.definelabel reset_shadow_flag, 0x802977E4
.definelabel collision_check_routin, 0x802A0450
.definelabel collision_egg, 0x8029F408
.definelabel collision_tree, 0x8029F69C
.definelabel collision_pakkun, 0x8029F2FC
.definelabel collision_mkanban, 0x8029F1F8
.definelabel kill_object, 0x8029FDC8
.definelabel set_broken, 0x8008DABC
.definelabel set_shadow_flag, 0x802977B0
.definelabel kwhit_tree, 0x80077AB0

.definelabel kwdisplay_totaltime, 0x8004FA78
.definelabel kwprintlaptime, 0x8004F7F4
.definelabel kwdisplay_enemycar, 0x800514BC
.definelabel kwdisplay_kaopanel, 0x80050320
.definelabel kwdisplay_radarmap, 0x8004EE54
.definelabel kwdisplay_radarsline, 0x8004F020
.definelabel kwdisplay_radarplayer, 0x8004F3E4
.definelabel kwdisplay_itemboxs, 0x8004E6C4
.definelabel kwdisplay_ranks, 0x800590D4

.definelabel g_battleBalloonCt, 0x8018D8C0

.definelabel g_kartGPrank, 0x8018D9D0

.definelabel g_screenBorders, 0x80001E64 // disable 2400
.definelabel g_debugScreenLines, 0x801657B2

.definelabel g_demoFlag, 0x800DC51C
.definelabel g_cupLevel, 0x8018EE0B 
.definelabel g_gamePausedFlagPlayer, 0x800DC5FD 

.definelabel raceBombs1, 0x8000985B // 5 disable
.definelabel raceBombs2, 0x8001C40B 
.definelabel kill_bomb_kart, 0x8008FC1C //Collision kart2kart
.definelabel accele_on, 0x80030FC8 //Reverse Acceleration
.definelabel check_accele_on, 0x80030E00 //Reverse Acceleration
.definelabel accele_off, 0x80031F48 //Reverse Acceleration
.definelabel check_accele_off, 0x80030C34 //Reverse Acceleration
.definelabel check_brake_on, 0x8003221C
.definelabel breake_on, 0x800323E4
.definelabel check_brake_off, 0x80032050
