#Custom Level Code
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomCourses\CustomLevels.c" -o "Library\CustomCourses\CustomLevels.o"
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomCourses\CustomSurfaces.c" -o "Library\CustomCourses\CustomSurfaces.o"


#Custom Object Code
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomObjects\OKBehaviors.c" -o "Library\CustomObjects\OKBehaviors.o" 
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\CustomObjects\OKCustomObjects.c" -o "Library\CustomObjects\OKCustomObjects.o"

#Gametypes
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\Gametypes\CTF.c" -o "Library\CustomObjects\CTF.o" 
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\Gametypes\Soccer.c" -o "Library\CustomObjects\Soccer.o" 
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\Gametypes\GameTypesGeneric.c" -o "Library\CustomObjects\GameTypesGeneric.o" 

#Music and Sound Code
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\MusicSound\CustomSounds.c" -o "Library\MusicSound\CustomSounds.o"
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "Library\MusicSound\MusicControl.c" -o "Library\MusicSound\MusicControl.o"


#Player Code
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\Player\MarioKartStats.c" -o "library\Player\MarioKartStats.o"
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\Player\PlayerChecks.c" -o "library\Player\PlayerChecks.o"
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\Player\PlayerEffects.c" -o "library\Player\PlayerEffects.o"


#Generic Code
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\LibraryVariables.c" -o "library\LibraryVariables.o" 
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\MarioKart3D.c" -o "library\MarioKart3D.o"
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\MarioKartMenu.c" -o "library\MarioKartMenu.o" 
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\MarioKartObjects.c" -o "library\MarioKartObjects.o"
mips64-elf-gcc -Wall -O1 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c "library\SharedFunctions.c" -o "library\SharedFunctions.o" 