#include "../library/SubProgram.h"
#include "../library/SharedFunctions.h"
#include "../library/OKHeader.h"
#include "../library/OKExternal.h"
#include "../library/LibraryVariables.h"
#include "../library/GameVariables/NTSC/OKassembly.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//SeqID: ID of song
//Interp: Framecount
void MusSeqStart(uchar Group, ushort SeqID, uchar Interp)
{
	NAISeqFlagEntry(0x00000000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (ushort)SeqID );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Interp: Framecount
void MusSeqStop(uchar Group, uchar Interp)
{
	NAISeqFlagEntry(0x100000ff | ((uchar)Group << 24) | ((uchar)Interp << 16) );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Volume: Max: 255 - Default: 127 - Half: 75 - Zero: 0
//Interp: Framecount
void MusSeqVolumeChange(uchar Group, uchar Volume, uchar Interp)
{
	NAISeqFlagEntry(0x40000000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (uchar)Volume );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Interp: Framecount
void MusSeqVolumeRecover(uchar Group, uchar Interp)
{
	NAISeqFlagEntry(0x4000007f | ((uchar)Group << 24) | ((uchar)Interp << 16) );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Pitch: Double: 2000 - Default: 1000 - Half: 500 - Zero: 0
//Interp: Framecount
void MusSeqPitchChange(uchar Group, ushort Pitch, uchar Interp)
{
	NAISeqFlagEntry(0x50000000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (ushort)Pitch );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Interp: Framecount
void MusSeqPitchRecover(uchar Group, uchar Interp)
{
	NAISeqFlagEntry(0x50000000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | 1000 );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Tempo: Song-dependent - e.g. Title: 0x1A40 / 0x30 = 0x8C (dec.140)
//Interp: Framecount
void MusSeqTempoDirect(uchar Group, ushort Tempo, uchar Interp)
{
	NAISeqFlagEntry(0xB0000000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (ushort)Tempo );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//TempoAdd: 1: 0x30
//Interp: Framecount
void MusSeqTempoAdd(uchar Group, ushort TempoAdd, uchar Interp)
{
	NAISeqFlagEntry(0xB0001000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (ushort)TempoAdd );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//TempoSub: 1: 0x30
//Interp: Framecount
void MusSeqTempoSub(uchar Group, ushort TempoSub, uchar Interp)
{
	NAISeqFlagEntry(0xB0002000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (ushort)TempoSub );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//TempoPercent: 200: 200%; 100: 100%; 50: 50%
//Interp: Framecount
void MusSeqTempoPercent(uchar Group, ushort TempoPercent, uchar Interp)
{
	NAISeqFlagEntry(0xB0003000 | ((uchar)Group << 24) | ((uchar)Interp << 16) | (ushort)TempoPercent );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Interp: Framecount
void MusSeqTempoRecover(uchar Group, uchar Interp)
{
	NAISeqFlagEntry(0xB0004000 | ((uchar)Group << 24) | ((uchar)Interp << 16) );
}

//Disable: Prevent new sequence: 1 - Allow new sequence: 0
void MusSeqPreventNext(bool Disable)
{
	NAISeqFlagEntry(0xe0000100 | (ushort)Disable );
}

//SoundMode: Wide: 0 - Headphone: 1 - Stereo: 2 - Mono: 3
void MusSeqSoundMode(uchar SoundMode)
{
	NAISeqFlagEntry(0xe0000000 | (uchar)SoundMode );
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
short MusSeqGetCurrentID(uchar Group)
{
	return (short)NAIGetPlayingSeqFlag(Group);
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
int MusSeqGetLoopCounter(uchar Group)
{
	return SeqPlayer[(int)Group].Loopcount;
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
void MusSeqLoopImmediately(uchar Group)
{
	SeqPlayer[(int)Group].Loopcount = 0;
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Channel: 0-15 seperate sequence channels
//Mute: 0: Unmuted - 1: Muted
void MusChanMute(uchar Group, uchar Channel, uchar Mute)
{
	if (Mute == 0)
	{
		SeqPlayer[(int)Group].Channel[(int)Channel]->Playflag ^= CHANNEL_MUTE;
	}
	else
	{
		SeqPlayer[(int)Group].Channel[(int)Channel]->Playflag |= CHANNEL_MUTE;
	}
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Channel: 0-15 seperate sequence channels
float MusChanGetVolume(uchar Group, uchar Channel)
{
	return SeqPlayer[(int)Group].Channel[(int)Channel]->VolumeTarget;
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Channel: 0-15 seperate sequence channels
//Volume: float
void MusChanSetVolume(uchar Group, uchar Channel, float Volume)
{
	SeqPlayer[(int)Group].Channel[(int)Channel]->VolumeTarget = Volume;
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Channel: 0-15 seperate sequence channels
float MusChanGetPitch(uchar Group, uchar Channel)
{
	return SeqPlayer[(int)Group].Channel[(int)Channel]->Pitch;
}

//Group: BGM: 0 - Fanfare: 1 - SFX: 2
//Channel: 0-15 seperate sequence channels
//Pitch: float
void MusChanSetPitch(uchar Group, uchar Channel, float Pitch)
{
	SeqPlayer[(int)Group].Channel[(int)Channel]->Pitch = Pitch;
}