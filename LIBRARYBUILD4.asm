/*
These are default functions that overwrite existing game code calls.
If the defined functions have not been made in an external codebase, it will use the default.
*/

.ifndef gameCode
.definelabel gameCode, gameCodeDefault
.endif

.ifndef titleMenu
.definelabel titleMenu, titleMenuDefault
.endif

.ifndef MapStartup
.definelabel MapStartup, MapStartupDefault
.endif

.ifndef DisplayObject
.definelabel DisplayObject, DisplayObjectDefault
.endif

.ifndef CollideObject
.definelabel CollideObject, CollideObjectDefault
.endif

.ifndef ItemboxCollideCheck
.definelabel ItemboxCollideCheck, ItemboxCollideCheckDefault
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


.ifndef MiniMapDraw
.definelabel MiniMapDraw, MiniMapDrawDefault
.endif

.ifndef KWKumo_Alloc_Hook
.definelabel KWKumo_Alloc_Hook, KWKumo_Alloc_Hook_Default
.endif

.ifndef KWChart_Kumo_Hook
.definelabel KWChart_Kumo_Hook, KWChart_Kumo_Hook_Default
.endif

.ifndef BalloonCheck
.definelabel BalloonCheck, BalloonCheckDefault
.endif