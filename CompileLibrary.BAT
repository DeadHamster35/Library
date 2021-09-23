
::  Custom Level Code
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomCourses\CustomLevels.c" -o "Library\CustomCourses\CustomLevels.o"
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomCourses\CustomSurfaces.c" -o "Library\CustomCourses\CustomSurfaces.o"


::  Custom Object Code
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomObjects\OKBehaviors.c" -o "Library\CustomObjects\OKBehaviors.o" 
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomObjects\OKCustomObjects.c" -o "Library\CustomObjects\OKCustomObjects.o"


::  Music and Sound Code
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\MusicSound\CustomSounds.c" -o "Library\MusicSound\CustomSounds.o"
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\MusicSound\MusicControl.c" -o "Library\MusicSound\MusicControl.o"


::  Player Code
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\Player\MarioKartStats.c" -o "library\Player\MarioKartStats.o"
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\Player\PlayerChecks.c" -o "library\Player\PlayerChecks.o"
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\Player\PlayerEffects.c" -o "library\Player\PlayerEffects.o"


::  Generic Code
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\LibraryVariables.c" -o "library\LibraryVariables.o" 
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\MarioKart3D.c" -o "library\MarioKart3D.o"
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\MarioKartMenu.c" -o "library\MarioKartMenu.o" 
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\MarioKartObjects.c" -o "library\MarioKartObjects.o"
ARMIPS\bin\mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\SharedFunctions.c" -o "library\SharedFunctions.o" 