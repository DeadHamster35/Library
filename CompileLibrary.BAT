cd library

echo Folder: Library 
echo/



cd CustomCourses
::  Custom Level Code

set ListCustomCourses= "CustomLevels.c" "CustomSurfaces.c"

(for %%a in (%ListCustomCourses%) do (
   echo Working on %%a 
..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))

cd ..


cd CustomObjects
::  Custom Object Code

set ListCustomObjects= "OKBehaviors.c" "OKCustomObjects.c" "ObjectHandler.c"

(for %%a in (%ListCustomObjects%) do (
   echo Working on %%a 
..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))

cd ..


cd CustomParticles
::  Custom Particles Code

set ListCustomParticles= "CustomParticles.c"

(for %%a in (%ListCustomParticles%) do (
   echo Working on %%a 
..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))

cd ..


cd MusicSound
::  Music and Sound Code

set ListMusicSound= "CustomSounds.c" "MusicControl.c"

(for %%a in (%ListMusicSound%) do (
   echo Working on %%a 
..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))

cd ..


cd Player
::  Players

set ListPlayer= "MarioKartStats.c" "Pathfinding.c" "PlayerChecks.c" "PlayerEffects.c"

(for %%a in (%ListPlayer%) do (
   echo Working on %%a 
..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))

cd ..




cd Gametypes
::  GameTypes

set ListGT= "CTF.c" "Soccer.c" "GameTypesGeneric.c"

(for %%a in (%ListGT%) do (
   echo Working on %%a 
..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))


cd GBI
::Gametypes GBI Data

set ListGBIGBI= "SNet.c"
(for %%a in (%ListGBIGBI%) do (
   echo Working on %%a 
..\..\..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c %%a
))

cd ..
cd ..


::  Generic Code

set ListGeneric= "LibraryVariables.c" "MarioKart3D.c" "MarioKartMenu.c" "MarioKartObjects.c" "Precode.c" "PreSwitch.c" "SharedFunctions.c" "CrashScreenEnhanced.c" 

(for %%a in (%ListGeneric%) do (
   echo Working on %%a 
..\ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -static-libgcc -static-libstdc++ -G0 -c %%a
))

cd ..