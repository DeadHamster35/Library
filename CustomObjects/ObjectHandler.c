#include "../MainInclude.h"



void BombThrowRolloverWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
	
	CheckHit((int)PlayerID, BombThrowRolloverHT);
		
	SetBombThrowRollover(Kart,PlayerID);
}


void RolloverWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, RolloverHT);
		
	SetRollover(Kart,PlayerID);
}


void WheelSpinWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, WheelSpinHT);
		
	SetWheelspin(Kart,PlayerID);
}

void BrokenWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, BrokenHT);
		
	SetBroken(Kart,PlayerID);
	
}

void ThunderWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, ThunderHT);
		
	SetThunder(Kart,PlayerID);
}

void SpinWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, SpinHT);
		
	SetSpin(Kart,PlayerID);
}
void BombRolloverWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, BombRolloverHT);
		
	SetBombRollover(Kart,PlayerID);
}

void ProWheelSpinWrap(Player* Kart, char Kno)
{
	int PlayerID = (*(long*)&Kart - (long)&g_PlayerStructTable) / 0xDD8;
		
	CheckHit((int)PlayerID, ProWheelSpinHT);
		
	SetProWheelSpin(Kart,PlayerID);
}
