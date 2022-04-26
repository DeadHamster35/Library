#include "../MainInclude.h"



void BombThrowRolloverWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
	
	CheckHit((int)PlayerID);
		
	SetBombThrowRollover(Kart,PlayerID);
}


void RolloverWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetRollover(Kart,PlayerID);
}


void WheelSpinWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetWheelspin(Kart,PlayerID);
}

void BrokenWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetBroken(Kart,PlayerID);
	
}

void ThunderWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetThunder(Kart,PlayerID);
}

void SpinWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetSpin(Kart,PlayerID);
}
void BombRolloverWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetBombRollover(Kart,PlayerID);
}

void ProWheelSpinWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID);
		
	SetProWheelSpin(Kart,PlayerID);
}
