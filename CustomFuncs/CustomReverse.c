#include "../library/LibraryVariables.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"

void reverse_HACK(void)
{
	//runkart: branch over reverse max speed limit
	*(uint*)(0x8002E420) = 0x10000015; //orig: 24010001
	//manual_stick_drive: branch over reverse accel count
	*(uint*)(0x80037FEC) = 0x1000006B; //orig: 55E0006B

	int i;
	static char runOnce[4] = {0,0,0,0};
	static short zoomTemp[4];
	Controller *cont;
	Player *car;

	for(i=0; i<g_playerCount; i++)
	{
		
		if(!(GlobalPlayer[i].slip_flag&IS_BOOST_JUMPING) && !(GlobalPlayer[i].slip_flag&IS_BOOSTJUMP_ZONE))
		{
			cont = (Controller *)&GlobalController[i];
			car = (Player *)&GlobalPlayer[i];

			if( (GlobalController[i]->AnalogY <= -50) && (GlobalPlayer[i].speed <= 1) && ((GlobalController[i]->ButtonHeld &BTN_B) == BTN_B) )
			{
					GlobalPlayer[i].handling_flag |= REVERSE_GEAR;

					if(runOnce[i] == 0) //set temp zoom var
					{
						zoomTemp[i] = g_zoomLevelPlayer[i];
						runOnce[i] = 1;
					}
			}

			if((GlobalPlayer[i].handling_flag &REVERSE_GEAR) == REVERSE_GEAR)
			{

				if(((GlobalController[i]->ButtonHeld &BTN_B ) != BTN_B) || (GlobalController[i]->AnalogY > -30))
				{
					/*
					//Instant stop:
					GlobalPlayer[i].handling_flag &= ~REVERSE_GEAR;
					GlobalPlayer[i].accelcount = 0;
					g_zoomLevelPlayer[i] = zoomTemp[i]; //cam reset
					runOnce[i] = 0;
					*/

					///*
					//mimic brake
					
					if(GlobalPlayer[i].speed > 1)
					{
						accele_off(car,2);
						check_accele_off(car);

						if((GlobalController[i]->ButtonHeld &BTN_A) == BTN_A)
						{
							car->slip_flag=car->slip_flag|IS_BRAKING;
							breake_on(car);
							check_brake_on(car);
						}
						else
						{
							car->slip_flag &= ~IS_BRAKING;
							car->brake_time=0;
							check_brake_off(car);
						}
					}
					else
					{
						GlobalPlayer[i].handling_flag &= ~REVERSE_GEAR;
						g_zoomLevelPlayer[i] = zoomTemp[i]; //cam reset
						runOnce[i] = 0;
					}
					//*/
				}
				else
				{
					GlobalPlayer[i].brake_time = 0;
					accele_on(car);
					check_accele_on(car);
					g_zoomLevelPlayer[i] = 1; //forced cam zoom out
				}
			}
		}
	}
}