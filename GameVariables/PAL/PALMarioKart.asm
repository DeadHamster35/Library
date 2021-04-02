.definelabel SYSTEM_Region, 0x80000300

.definelabel decodeMIO0, 0x800400B0 ;MIO0 File A0 = input, A1 = output
.definelabel DMA, 0x80001138
.definelabel decodeTKMK, 0x800405B0
.definelabel loadCourse, 0x802AA9B8
.definelabel ramCopy, 0x800D8000

.definelabel sinT, 0x802B80B8
.definelabel cosT, 0x802B80D8
.definelabel sinF, 0x80

.definelabel printNumber, 0x80057504
.definelabel printString, 0x80057784
.definelabel printStringNumber, 0x800577B0
.definelabel drawBox, 0x80098DF8
.definelabel GraphPtr, 0x801502F8

.definelabel initializePlayer, 0x800393A0


.definelabel asm_itemJump1A, 0x8007B064  //3C058016
.definelabel asm_itemJump1B, 0x8007B078  //84A5441A

.definelabel asm_itemJump2A, 0x8007AFA0  //3C058016
.definelabel asm_itemJump2B, 0x8007AFB4  //84A5441A

.definelabel playSound, 0x800C8E38

.definelabel colorFont, 0x800930D8
.definelabel loadFont, 0x800576F0

.definelabel g_SegmentA, 0x80117974
;;
;;

.definelabel nopASM, 0x800026F4
.definelabel asm_tempo1A, 0x800015A4  ;;3C0F8015
.definelabel asm_tempo1ASpeed, 0x800015A7  ;;speed value
.definelabel asm_tempo1B, 0x800015A8  ;;8DEF0174
.definelabel asm_tempo1BSpeed, 0x800015AB  ;; speed value

.definelabel asm_tempo2A, 0x80001A18  ;;3C098015
.definelabel asm_tempo2ASpeed, 0x80001A1B  ;;speed value
.definelabel asm_tempo2B, 0x80001A1C  ;;8D290174
.definelabel asm_tempo2BSpeed, 0x80001A1F  ;; speed value

.definelabel asm_tempo3A, 0x80001C70  ;;3C0A8015
.definelabel asm_tempo3ASpeed, 0x80001C73  ;;speed value
.definelabel asm_tempo3B, 0x80001C74  ;;8D4A0174
.definelabel asm_tempo3BSpeed, 0x80001C77  ;; speed value

.definelabel asm_selectA, 0x800B3924
.definelabel asm_selectB, 0x800B3936
.definelabel asm_selectC, 0x800B39A4
.definelabel asm_selectD, 0x800B39B6
.definelabel asm_selectE, 0x800B3A38
.definelabel asm_selectF, 0x800B3A4E

.definelabel g_resetToggle, 0x800DC52C
.definelabel g_startingIndicator,  0x800DC530
.definelabel g_screenSplitA, 0x800DC54C
.definelabel g_ScreenSplitB, 0x800DC550
.definelabel g_playerCount, 0x800DC558
.definelabel g_raceClass, 0x800DC568
.definelabel g_gameTimer, 0x800DC5B8
.definelabel g_courseID,  0x800DC5C0
.definelabel g_loadedcourseFlag, 0x800DC5C4
.definelabel g_gameMode, 0x800DC55C
.definelabel g_mirrorMode, 0x800DC624


.definelabel gravity_1, 0x800E2670
.definelabel gravity_2, 0x800E2674
.definelabel gravity_3, 0x800E2678
.definelabel gravity_4, 0x800E267C
.definelabel gravity_5, 0x800E2680
.definelabel gravity_6, 0x800E2684
.definelabel gravity_7, 0x800E2688
.definelabel gravity_8, 0x800E268C

.definelabel antialiasToggle, 0x800EB43C
.definelabel antialiasToggleB, 0x800EB46C



.definelabel g_cup0Array0, 0x800F2C14
.definelabel g_cup0Array1, 0x800F2C16
.definelabel g_cup0Array2, 0x800F2C18
.definelabel g_cup0Array3, 0x800F2C1A
.definelabel g_cup1Array0, 0x800F2C1C
.definelabel g_cup1Array1, 0x800F2C1E
.definelabel g_cup1Array2, 0x800F2C20
.definelabel g_cup1Array3, 0x800F2C22
.definelabel g_cup2Array0, 0x800F2C24
.definelabel g_cup2Array1, 0x800F2C26
.definelabel g_cup2Array2, 0x800F2C28
.definelabel g_cup2Array3, 0x800F2C2A
.definelabel g_cup3Array0, 0x800F2C2C
.definelabel g_cup3Array1, 0x800F2C2E
.definelabel g_cup3Array2, 0x800F2C20
.definelabel g_cup3Array3, 0x800F2C22
.definelabel g_cupBArray0, 0x800F2C24
.definelabel g_cupBArray1, 0x800F2C26
.definelabel g_cupBArray2, 0x800F2C28
.definelabel g_cupBArray3, 0x800F2C2A

.definelabel g_cup0preview0, 0x801995A0
.definelabel g_cup0preview1, 0x801995C8
.definelabel g_cup0preview2, 0x80199550
.definelabel g_cup0preview3, 0x80199618


.definelabel g_cup1preview0, 0x80199590
.definelabel g_cup1preview1, 0x80199528
.definelabel g_cup1preview2, 0x80199488
.definelabel g_cup1preview3, 0x80199460


.definelabel g_cup2preview0, 0x80199690
.definelabel g_cup2preview1, 0x80199640
.definelabel g_cup2preview2, 0x80199578
.definelabel g_cup2preview3, 0x801994B0


.definelabel g_cup3preview0, 0x80199720
.definelabel g_cup3preview1, 0x80199500
.definelabel g_cup3preview2, 0x801994D8
.definelabel g_cup3preview3, 0x80199668

.definelabel g_lakituStatus, 0x80165E2E
.definelabel g_lakituSurface, 0x80163378

.definelabel p_Input, 0x800F6975
.definelabel d_Input, 0x800F6974
.definelabel c_Input, 0x800F697A

.definelabel g_player1LocationX, 0x800F6A04
.definelabel g_player1LocationY, 0x800F6A08
.definelabel g_player1LocationZ, 0x800F6A0C
.definelabel g_player1LastLocationX, 0x800F6A10
.definelabel g_player1LastLocationY, 0x800F6A14
.definelabel g_player1LastLocationZ, 0x800F6A18
.definelabel g_player1LocationA, 0x800F6A1C
.definelabel g_player1SpeedX, 0x800F6A24
.definelabel g_player1SpeedY, 0x800F6A28
.definelabel g_player1SpeedZ, 0x800F6A2C
.definelabel g_player1SpeedA, 0x800F6A84
.definelabel g_player1SpeedU1, 0x800F6A88
.definelabel g_player1SpeedU2, 0x800F6A8C
.definelabel g_playerStatus, 0x800F6AB8

.definelabel g_player1CameraX, 0x800F6AC8
.definelabel g_player1CameraY, 0x800F6ACC
.definelabel g_player1CameraZ, 0x800F6AD0
.definelabel g_playerSpriteSize, 0x800F6C14

.definelabel surface_p0, 0x800F6AAE

.definelabel player2X, 0x800F77DC
.definelabel player2Y, 0x800F77E0
.definelabel player2Z, 0x800F77E4
.definelabel player3X, 0x800F88B4
.definelabel player3Y, 0x800F88B8
.definelabel player3Z, 0x800F88BC
.definelabel player4X, 0x800F9384
.definelabel player4Y, 0x800F9388
.definelabel player4Z, 0x800F938C

.definelabel cpu2Speed, 0x800F79DC
.definelabel cpu3Speed, 0x800F87B4
.definelabel cpu4Speed, 0x800F958C

.definelabel boost2, 0x800F77D6
.definelabel boost3, 0x800F85AE
.definelabel boost4, 0x800F9386

.definelabel g_player0State, 0x800F69F0
.definelabel g_player1State, 0x800F77C8
.definelabel g_player2State, 0x800F85A0
.definelabel g_player3State, 0x800F9378
.definelabel g_player4State, 0x800FA150
.definelabel g_player5State, 0x800FAF28
.definelabel g_player6State, 0x800FBD00
.definelabel g_player7State, 0x800FCAD8

.definelabel g_aspectRatio, 0x801501A8
.definelabel g_farClip, 0x801501AC

.definelabel g_player1View 0x8015F514
.definelabel g_player1Section 0x8015F518

.definelabel lastLoadedAddress, 0x8015F788
.definelabel g_TrialTime, 0x8015F8E8
.definelabel g_lap2Time, 0x8015F8EC
.definelabel g_lap3Time, 0x8015F900

.definelabel g_progressValue, 0x801632E8


.definelabel g_playerPosition1, 0x80164418
.definelabel g_playerPosition2, 0x8016441C
.definelabel g_playerPosition3, 0x80164420
.definelabel g_playerPosition4, 0x80164424
.definelabel g_playerPosition5, 0x80164428
.definelabel g_playerPosition6, 0x8016442C
.definelabel g_playerPosition7, 0x80164430
.definelabel g_playerPosition8, 0x80164434

.definelabel g_gameLapPlayer1, 0x801643F0
.definelabel g_gameLapPlayer2, 0x801643F4
.definelabel g_gameLapPlayer3, 0x801643F8
.definelabel g_gameLapPlayer4, 0x801643FC
.definelabel g_gameLapPlayer5, 0x80164400
.definelabel g_gameLapPlayer6, 0x80164404
.definelabel g_gameLapPlayer7, 0x80164408
.definelabel g_gameLapPlayer8, 0x8016440C


.definelabel itemBoolean, 0x80165FBF
.definelabel itemA, 0x80165FBB
.definelabel itemB, 0x80165FBD
.definelabel itemC, 0x80165FEA

.definelabel g_lapCheckA, 0X8018CB41
.definelabel g_lapCheckB, 0x8018CB42

.definelabel asm_DisableEngineSound, 0x800E9F94
.definelabel asm_DisableHUD, 0x80059CE8
.definelabel g_GhostHUDID, 0x8018DB0A


.definelabel g_mlogoY, 0x8018DA50
.definelabel g_mflagID, 0x8018DA90
.definelabel g_mpressstartID, 0x8018DAB8
.definelabel g_mracewayTime, 0x8018DAE0


.definelabel backButton, 0x8018EE43
.definelabel menuScreenC, 0x8018EE4E
.definelabel menuScreenA, 0x8018EE4C
.definelabel menuScreenB, 0x8018EE4D

.definelabel titleDemo, 0x8018EE60

.definelabel g_cupSelect, 0x8018EE69
.definelabel g_courseSelect, 0x8018EE6B
.definelabel g_InGame, 0x8018EE5B

.definelabel asm_CupCount, 0x8028E3C6
.definelabel songID, 0x8028ECE7
.definelabel asm_SongA, 0x8028EC9C
.definelabel asm_SongB, 0x8028F9C4

.definelabel g_skyColorTop, 0x802B8B70

.definelabel player2OK, 0x8018EE49
.definelabel player3OK, 0x8018EE4A
.definelabel player4OK, 0x8018EE4B

.definelabel g_RNG, 0x802BA290




.definelabel g_bannerTexture, 0x801F27B0
.definelabel g_previewTexture, 0x8020E4C0
