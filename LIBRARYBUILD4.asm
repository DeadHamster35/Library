.ifndef gameCode
.definelabel gameCode, gameCodeDefault
.endif

.ifndef titleMenu
.definelabel titleMenu, titleMenuDefault
.endif

.ifndef DisplayObject
.definelabel DisplayObject, DisplayObjectDefault
.endif

.ifndef CollideObject
.definelabel CollideObject, CollideObjectDefault
.endif

.ifndef DisplayCrashScreen
.definelabel DisplayCrashScreen, DisplayCrashScreenDefault
.endif

.ifndef RAMCheck
.definelabel RAMCheck, RAMCheckDefault
.endif

.ifndef RAMCheckEnd
.definelabel RAMCheckEnd, RAMCheckEndDefault
.endif

.ifndef PrintMenuFunction
.definelabel PrintMenuFunction, PrintMenuFunctionDefault
.endif


.ifndef DrawPerScreen
.definelabel DrawPerScreen, DrawPerScreenDefault
.endif


.ifndef allRun
.definelabel allRun, allRunDefault
.endif


.ifndef CheckHit
.definelabel CheckHit, CheckHitDefault
.endif


.ifndef ExecuteItemHook
.definelabel ExecuteItemHook, ExecuteItemHookDefault
.endif


  
.ifndef Crash
Crash:
.import "../library/data/test/Crash512.bin"
.align 0x10
CrashEnd:
.endif