#include "../GameVariables/NTSC/GameOffsets.h"
#include "../LibraryVariables.h"

static uchar cpuItemSpawn;
int itemMax = 16; // 15 (0x10) + custom 
static uchar cpuOffscrStrat;
static uchar cpuItemtable, cpuStrat, cpuGoldShroom, cpuBananaAggression;

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   ENEMY ONLY                                           //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//action_start_check action_end_check

static int collisionSensor(Player *car , Object *obj, float multiplier)
{
   	float dx,dy,dz,radius,distance;
	float radius2;

	radius = (car->radius+obj->radius)*multiplier;

	dx=obj->position[0]-car->position[0];
	if(dx>radius){return(FALSE);}
	if(dx<-radius){return(FALSE);}

	dy=obj->position[1]-car->position[1];
	if(dy>radius){return(FALSE);}
	if(dy<-radius){return(FALSE);}

	dz=obj->position[2]-car->position[2];
	if(dz>radius){return(FALSE);}
	if(dz<-radius){return(FALSE);}

	radius2=radius*radius;
	distance=dx*dx+dy*dy+dz*dz;
	if(distance<0.1f){return(FALSE);}
	if(distance>radius2){return(FALSE);}

	return(TRUE);
}

static int collisionSensorKarts(Player *car , Player *obj, float multiplier)
{
   	float dx,dy,dz,radius,distance;
	float radius2;

	radius = (car->radius+obj->radius)*multiplier;

	dx=obj->position[0]-car->position[0];
	if(dx>radius){return(FALSE);}
	if(dx<-radius){return(FALSE);}

	dy=obj->position[1]-car->position[1];
	if(dy>radius){return(FALSE);}
	if(dy<-radius){return(FALSE);}

	dz=obj->position[2]-car->position[2];
	if(dz>radius){return(FALSE);}
	if(dz<-radius){return(FALSE);}

	radius2=radius*radius;
	distance=dx*dx+dy*dy+dz*dz;
	if(distance<0.1f){return(FALSE);}
	if(distance>radius2){return(FALSE);}

	return(TRUE);
}

static uchar cpuMove;

void enemy_control_HACK (void) 
{
	if(cpuMove == 0)
	{
		for(int i = 0; i<8; i++)
		{
			if(!(GlobalPlayer[i].flag &IS_PLAYER))
			{
				GlobalPlayer[i].velocity[0] = 0;
				GlobalPlayer[i].velocity[2] = 0;
			}
		}	
		
	}
	enemy_control();
}


void enemy_item_number_set_HACK(ItemType *i_ptr, int item_num)
{
    switch(item_num) 
    {
	case ib_banana:		i_ptr->item_num = EI_BANANA_SET; break;
	case ib_bananas:    i_ptr->item_num = EI_SUPER_BANANA_SET; break;
	case ib_gshell:		i_ptr->item_num = EI_G_SHELL_SET; break;
	case ib_gshells:    i_ptr->item_num = EI_SUPER_G_SHELL_SET; break;
	case ib_rshell: 	i_ptr->item_num = EI_R_SHELL_SET; break;
	case ib_rshells: 	i_ptr->item_num = EI_SUPER_R_SHELL_SET; break;
    case ib_bshell:     i_ptr->item_num = EI_B_SHELL_SET; break; 
	case ib_thunder:	i_ptr->item_num = EI_THUNDER_SET; break;
	case ib_fakeib:		i_ptr->item_num = EI_FAKE_IBOX_SET; break;
	case ib_star:		i_ptr->item_num = EI_STAR_SET; break;
	case ib_ghost:		i_ptr->item_num = EI_TERESA_SET; break;
	case ib_mush1: 		i_ptr->item_num = EI_KINOKO1_SET; break;
	case ib_mush2:		i_ptr->item_num = EI_KINOKO2_SET; break;
	case ib_mush3:		i_ptr->item_num = EI_KINOKO3_SET; break;
	case ib_mushG:		if(cpuGoldShroom == 1){i_ptr->item_num = EI_KINOKOC_SET;}
						else{i_ptr->item_num = EI_KINOKO3_SET;}  
						break; 
	case ib_feather:	i_ptr->item_num = EI_HANE_SET; break;
	default: i_ptr->item_num = EI_BANANA_SET; break; //fail save
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void enemy_item_move_HACK(int num) //arg2
{
    Player *kart;
	Object *obj_ptr;    
	ItemType *i_ptr;
	Point *c_ptr;
	Bananabunsh *bananabunsh_ptr;
	Banana *banana_ptr;

	//Supershell *supershell_ptr;
	int ans;
	Object *obj_sense_ptr; 
	static USArray8 wait = {150,150,150,150,150,150,150,150};
    int bananacount;
    //short bananacount2;
	float speed;
	float vect[3];

	//float limmit;
	//float distance,merikomi;
	//float d[3];

	kart = &GlobalPlayer[num]; //(num * 0xDD8) + (uint)(0x800DC4DC); //GlobalPlayer[num] kartpointer
	
	if(kart->flag &IS_PLAYER){return;} //Failsave Player & autopilot users get no cpu items
	if( (g_gameMode == TT) || (oga_drivers_point_camera_mode == 1) || (kart->flag & IS_RACE_FINISH)){return;}

	if(g_hudStruct[0].totaltime <= 2) //Remove CPU items at start, when counter not used (func doesn't run before race start -> time)
	{
		for(int i=0; i<8;i++)
		{
			i_ptr = &g_enemyItemStruct[i];
			i_ptr->item_num = EI_NULL;
			temp[i] = hitCountIbox[i];
		}
		return;
	}

	//i_ptr = (num * 0x10) + &g_enemyItemStruct[0]; //enemy item struct
	i_ptr = &g_enemyItemStruct[num];
	


	switch (i_ptr->item_num) 
	{ 
		case EI_NULL:
			//if(debugValues2[1] == 1){return;} //item debug 

			if(cpuItemSpawn == 0) //get item per timer
			{
				if(
					(g_playerPathPointTotalTable[num] > 100+num*20) //don't get items instantly
					&& (i_ptr->time > 600) //spawn counter
					&& (i_ptr->kosuu < 3) //limiter max 3 per race?
					&& (g_GameLapTable[num] < 3) //don't get items when finnished
				  ) 
				{
					enemy_item_number_set_HACK(i_ptr, kwgetitem_enemy(g_GameLapTable[num],g_playerPosition[num]));
				} 
			}
			else //get item when hitting IB
			{	
				if(g_courseID == TOAD_TP) //Fix for courses like Toads
				{
					if((g_playerPathPointTotalTable[num] > 100+num*20) && (i_ptr->time > 600) && (i_ptr->kosuu < 3) && (g_GameLapTable[num] < 3)) 
					{
						enemy_item_number_set_HACK(i_ptr, kwgetitem_enemy((short)g_GameLapTable[num],(short)g_playerPosition[num]));
					} 
				}
				else //get item when hitting IB
				{
					if((g_startingIndicator >= 3) && (temp[num] != hitCountIbox[num]))
					{
						if(wait[num] > 0) //immitate roulette wait time
						{	
							wait[num]--;
						}
						else
						{
							enemy_item_number_set_HACK(i_ptr, kwgetitem_enemy((short)g_GameLapTable[num],(short)g_playerPosition[num]));
							temp[num] = hitCountIbox[num];
							wait[num] = 150;
						}
					}
				}	
			}
			break;

        case EI_BANANA_SET:
			//temp_t7 = num * 4;
            if (
				//(g_GameLapTable[num] > 0) &&
				(g_playerPosition[enemy_target_player] < g_playerPosition[num])
				//&& (g_playerPosition[enemy_target_player] == 0)
			   )
			{
				if(cpuBananaAggression == 2) //Always attack
				{
					BANANATHROW:
					switch(kart->kart)
					{
						case DK:
							if (exist_area_chk(old_oga_area[num], old_oga_area[enemy_target_player], 0x28, 2, center_line_max) > 0)
							{i_ptr->item_num = EI_BANANA_NAGE_SET;}
							break;
						case PEACH:
							if (exist_area_chk(old_oga_area[num], old_oga_area[enemy_target_player], 4, 2, center_line_max) > 0)
							{i_ptr->item_num = EI_BANANA_NAGE_SET;}
							break;
						default:
							if (exist_area_chk(old_oga_area[num], old_oga_area[enemy_target_player], 0xA, 2, center_line_max) > 0)
							{i_ptr->item_num = EI_BANANA_NAGE_SET;}
							break;
					}
				}
				else if(cpuBananaAggression == 1)//Attack top 3
				{
					if(g_playerPosition[enemy_target_player] < 3){goto BANANATHROW;}
				}
				else if(cpuBananaAggression == 0) //Attack 1st
				{
					if(g_playerPosition[enemy_target_player] == 0){goto BANANATHROW;}
				}
            }
			if (i_ptr->item_num == EI_BANANA_SET) 
			{
                i_ptr->obj_num = put_banana(kart); //put_banana(kart, i_ptr->item_num, &D_801643B8);
                //temp_v1_3 = i_ptr->obj_num;
                if ((i_ptr->obj_num >= 0) && ( i_ptr->obj_num < 0x64)) 
				{
                    kart->weapon = kart->weapon | USE_BANANA;
                    i_ptr->item_num = EI_BANANA_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
                } 
				else 
				{
                    i_ptr->item_num = EI_NULL;
                    i_ptr->time = 0;
                }
            }
            break;
        case EI_BANANA_HOLD:
            //temp_a3 = (i_ptr->obj_num * 0x70) + &D_8015F9B8; g_SimpleObjectArray[i_ptr->obj_num]
            if (((g_SimpleObjectArray[i_ptr->obj_num].flag & EXISTOBJ) == 0) || (g_SimpleObjectArray[i_ptr->obj_num].category != BANANA) || (g_SimpleObjectArray[i_ptr->obj_num].sparam != 0) || (num != g_SimpleObjectArray[i_ptr->obj_num].angle[0])) 
			{
                i_ptr->item_num = EI_NULL;
                i_ptr->time = 0;
                kart->weapon = kart->weapon & 0xFFFBFFFF;
            }
            else if (i_ptr->count4 < i_ptr->time) 
			{
                i_ptr->item_num = EI_BANANA_SHOOT;
            }
            break;
        case EI_BANANA_SHOOT: 
            //temp_a3_2 = (i_ptr->unk2 * 0x70) + &D_8015F9B8;
            //if (((temp_a3_2->unk2 & 0x8000) == 0) || (temp_a3_2->unk0 != 6) || (temp_a3_2->unk6 != 0) || (num != temp_a3_2->unk10)) 
			if (((g_SimpleObjectArray[i_ptr->obj_num].flag & EXISTOBJ) == 0) || (g_SimpleObjectArray[i_ptr->obj_num].category != BANANA) || (g_SimpleObjectArray[i_ptr->obj_num].sparam != 0) || (num != g_SimpleObjectArray[i_ptr->obj_num].angle[0])) 
			{
                //NOTHING SAME AS BELOW!
				//if (num != g_SimpleObjectArray[i_ptr->obj_num].angle[0]){}
				//i_ptr->time = 0;
                //i_ptr->item_num = EI_NULL;
				//break;
            } 
			else 
			{
                g_SimpleObjectArray[i_ptr->obj_num].sparam = 1;
                g_SimpleObjectArray[i_ptr->obj_num].velocity[0] = 0.0f;
                g_SimpleObjectArray[i_ptr->obj_num].velocity[1] = 0.0f;
                g_SimpleObjectArray[i_ptr->obj_num].velocity[2] = 0.0f;
                if (tenuki_flg[num] == 1) 
				{
                    //sp28 = temp_a3_2;
                    g_SimpleObjectArray[i_ptr->obj_num].position[1] = (CheckHight(kart->position[0], kart->position[1] + 30.0f, kart->position[2]) + (g_SimpleObjectArray[i_ptr->obj_num].radius + 1.0f)); //30 war ohne f
                }
            }
            kart->weapon = kart->weapon & 0xFFFBFFFF;
            i_ptr->time = 0;
            i_ptr->item_num = EI_NULL;
            break; 

		case EI_BANANA_NAGE_SET:
			//enemy_item_move(num); //rather run original func in this case
			i_ptr->obj_num = put_banana(kart); // temp_s0->unk2 = func_802B2D70(sp2C, temp_a1);
			//temp_v1_4 = temp_s0->unk2;
			if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 100)) 
			{
				obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];//temp_a3_3 = (temp_v1_4 * 0x70) + &D_8015F9B8; g_SimpleObjectArray[i_ptr->obj_num];
				obj_ptr->sparam = 4;
				kart->weapon |= USE_BANANA; //kart->unkC = (s32) (sp2C->unkC | 0x40000);
				i_ptr->item_num = EI_BANANA_NAGE_MOVE; //0x23 == 35 NOT  34 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				i_ptr->time = 0;
				i_ptr->kosuu++;
				//temp_t7_2 = D_80163478 * 2; //enemy_target_player
				//c_ptr = (((s32) (*(&D_80164438 + temp_t7_2) + 0x1E) % (s32) *(&D_801645C8 + (*(&D_801645B0 + temp_t7_2) * 2))) * 8) + *(&D_80164550 + (D_801645B0 * 4));
				//ushort temp_t7_2 = enemy_target_player*2;
				c_ptr = (Point*) ((((int) (*(&old_oga_area[0] + enemy_target_player*2) + 0x1E) % (int) *(&center_line_max_BP[0] + (*(&oga_BP_line[0] + enemy_target_player*2) * 2))) * 8) + (int) *(&center_line_BP[0] + (oga_BP_line[0] * 4)));
				//c_ptr = (int)(old_oga_area[enemy_target_player] + 30) % ( (int) center_line_max_BP[oga_BP_line[enemy_target_player]] + center_line_BP[oga_BP_line[0]]);
				obj_ptr->velocity[0] = ((c_ptr->p.pointx - kart->position[0]) / 20.0);
				obj_ptr->velocity[1] = (((c_ptr->p.pointy - kart->position[1]) / 20.0) + 4.0);
				obj_ptr->velocity[2] = ((c_ptr->p.pointz - kart->position[2]) / 20.0);
				obj_ptr->position[1] = kart->position[1];
				Na_EnmVoice_Start(num,SE_ENM_VOICE_THROW);	//func_800C92CC(arg0 & 0xFF, 0x29008009, temp_t7_2, obj_ptr);
				NAEnmTrgStart(obj_ptr->position,obj_ptr->velocity,SE_KART_ITEM_THROW_HIGH);//func_800C98B8(sp2C + 0x14, sp2C + 0x34, 0x19018014);
			} 
			else
			{
				i_ptr->time = 0;     //temp_s0->unk4 = 0;
				i_ptr->item_num = EI_NULL; // temp_s0->unk0 = 0;
			}
			break;	
		case EI_BANANA_NAGE_MOVE:	
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
			obj_ptr->velocity[1] -= 0.4;
			obj_ptr->position[0] += obj_ptr->velocity[0];
			obj_ptr->position[1] += obj_ptr->velocity[1];
			obj_ptr->position[2] += obj_ptr->velocity[2];
			if(i_ptr->time > 20) 
			{
				i_ptr->item_num = EI_BANANA_NAGE_END;
			}			
			break;
		case EI_BANANA_NAGE_END:
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
			obj_ptr->sparam = 1;
			obj_ptr->position[1] = 2.7+CheckHight(obj_ptr->position[0],obj_ptr->position[1]+30.0,obj_ptr->position[2]);
			kart->weapon |= USE_BANANA;
			i_ptr->item_num = EI_NULL;
			i_ptr->time = 0;
			break;

        case EI_SUPER_BANANA_SET: 
            if (g_simpleObjectCount < 0x50) 
			{
                i_ptr->obj_num = set_super_banana(kart);
                if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 0x64)) 
				{
                    i_ptr->item_num = EI_SUPER_BANANA_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0x3C);
                } 
				else {i_ptr->item_num = EI_NULL;}
            } 
			else {i_ptr->item_num = EI_BANANA_SET;}
            break; 	
		case EI_SUPER_BANANA_HOLD:
			bananabunsh_ptr = (Bananabunsh*) &g_SimpleObjectArray[i_ptr->obj_num];

			bananacount = 0;
			if (bananabunsh_ptr->banana5 != -1) {bananacount = 1;}
			if (bananabunsh_ptr->banana4 != -1) {bananacount = 1;}
			if (bananabunsh_ptr->banana3 != -1) {bananacount = 1;}
			if (bananabunsh_ptr->banana2 != -1) {bananacount = 1;}
			if (bananabunsh_ptr->banana1 != -1) {bananacount = 1;}

			if ((bananabunsh_ptr->category != SBANANA) || (bananacount == 0) || (num != bananabunsh_ptr->owner)) //check delete  || (bananabunsh_ptr->sparam != 6) 
			{
                i_ptr->item_num = EI_NULL;
				i_ptr->time = 0;
            }
			else if (i_ptr->count4 < i_ptr->time) 
			{
                i_ptr->item_num = EI_SUPER_BANANA_SHOOT;
                i_ptr->count1 = 0;
                i_ptr->time = 0;
            }
			break;

		case EI_SUPER_BANANA_SHOOT: 
            if ((i_ptr->time % 0x96) == 0) 
			{
				bananabunsh_ptr = (Bananabunsh*) &g_SimpleObjectArray[i_ptr->obj_num];

				bananacount = 0; //prior bananacount2
				if (bananabunsh_ptr->banana5 != -1) {bananacount = 1;}
				if (bananabunsh_ptr->banana4 != -1) {bananacount = 1;}
				if (bananabunsh_ptr->banana3 != -1) {bananacount = 1;}
				if (bananabunsh_ptr->banana2 != -1) {bananacount = 1;}
				if (bananabunsh_ptr->banana1 != -1) {bananacount = 1;}

			    if ((bananabunsh_ptr->category != SBANANA)  || (bananacount == 0) || (num != bananabunsh_ptr->owner) || (i_ptr->count1 >= 5)) //check delete   || (bananabunsh_ptr->sparam != 6) 
				{
                    i_ptr->item_num = EI_NULL;
					i_ptr->time = 0;
                }
				//else if ((i_ptr->count1 < 5) && (bananacount == 1))	
				else
				{			
					if (g_playerPosition[enemy_target_player] < g_playerPosition[num])
					{
						if(cpuBananaAggression == 2) //Always attack
						{
							SUPERBANANATHROW:
							switch(kart->kart)
							{
								case DK:
									if (exist_area_chk(old_oga_area[num], old_oga_area[enemy_target_player], 0x28, 2, center_line_max) > 0)
									{i_ptr->item_num = EI_SUPER_BANANA_NAGE; i_ptr->count2 = 0; i_ptr->count3 = 0; i_ptr->time = 0;} //i_ptr->count3 = 300; 
									break;
								case PEACH:
									if (exist_area_chk(old_oga_area[num], old_oga_area[enemy_target_player], 4, 2, center_line_max) > 0)
									{i_ptr->item_num = EI_SUPER_BANANA_NAGE; i_ptr->count2 = 0; i_ptr->count3 = 0; i_ptr->time = 0;}
									break;
								default:
									if (exist_area_chk(old_oga_area[num], old_oga_area[enemy_target_player], 0xA, 2, center_line_max) > 0)
									{i_ptr->item_num = EI_SUPER_BANANA_NAGE; i_ptr->count2 = 0; i_ptr->count3 = 0; i_ptr->time = 0;}
									break;
							}
						}
						else if(cpuBananaAggression == 1)//Attack top 3
						{
							if(g_playerPosition[enemy_target_player] < 3){goto SUPERBANANATHROW;}
						}
						else if(cpuBananaAggression == 0) //Attack 1st
						{
							if(g_playerPosition[enemy_target_player] == 0){goto SUPERBANANATHROW;}
						}
					}

					if(i_ptr->item_num == EI_SUPER_BANANA_SHOOT)
					{
						release_banana(bananabunsh_ptr); //maybe change lane*******************************************************************************************
						i_ptr->count1++;
					}	
				}
            }
            break;     

		case EI_SUPER_BANANA_NAGE:
			if(i_ptr->count3 > 0)
			{
				i_ptr->count3--;
			}
			else
			{
				bananabunsh_ptr = (Bananabunsh*) &g_SimpleObjectArray[i_ptr->obj_num];
				banana_ptr = 0; //No use just kills compiler warning !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

				/*bananacount = 0; //prior bananacount2
                */
				if(i_ptr->count2 == 2){bananabunsh_ptr->bananacounter-=1;}
				     if(bananabunsh_ptr->banana5!=-1){banana_ptr=(Banana *)&g_SimpleObjectArray[bananabunsh_ptr->banana5]; if(i_ptr->count2 == 2){bananabunsh_ptr->banana5=-1;};}
				else if(bananabunsh_ptr->banana4!=-1){banana_ptr=(Banana *)&g_SimpleObjectArray[bananabunsh_ptr->banana4]; if(i_ptr->count2 == 2){bananabunsh_ptr->banana4=-1;};}
				else if(bananabunsh_ptr->banana3!=-1){banana_ptr=(Banana *)&g_SimpleObjectArray[bananabunsh_ptr->banana3]; if(i_ptr->count2 == 2){bananabunsh_ptr->banana3=-1;};}
				else if(bananabunsh_ptr->banana2!=-1){banana_ptr=(Banana *)&g_SimpleObjectArray[bananabunsh_ptr->banana2]; if(i_ptr->count2 == 2){bananabunsh_ptr->banana2=-1;};}
				else if(bananabunsh_ptr->banana1!=-1){banana_ptr=(Banana *)&g_SimpleObjectArray[bananabunsh_ptr->banana1]; if(i_ptr->count2 == 2){bananabunsh_ptr->banana1=-1;};}

				//if ((bananabunsh_ptr->category != SBANANA) || (bananacount == 0) || (i_ptr->count1 >= 5)) //check delete || (bananabunsh_ptr->sparam != 6) 
				if ((bananabunsh_ptr->category != SBANANA) || (num != bananabunsh_ptr->owner) || (i_ptr->count1 >= 5)) //check delete || (bananabunsh_ptr->sparam != 6) 
				//maybe also check banana itself? Should be -1 though if not available
				{
					i_ptr->item_num = EI_NULL;
					i_ptr->time = 0;
				}
				else //proceed
				{
					if (g_playerPosition[enemy_target_player] < g_playerPosition[num]) //player in front of enemy
					{
						switch(i_ptr->count2) //nage
						{
							case 0: 
								i_ptr->count1++;
								i_ptr->time = 0;
								banana_ptr->sparam = 1;
								kart->weapon |= USE_BANANA; 
								c_ptr = (Point*) ((((int) (*(&old_oga_area[0] + enemy_target_player*2) + 0x1E) % (int) *(&center_line_max_BP[0] + (*(&oga_BP_line[0] + enemy_target_player*2) * 2))) * 8) + (int) *(&center_line_BP[0] + (oga_BP_line[0] * 4)));
								banana_ptr->velocity[0] = ((c_ptr->p.pointx - kart->position[0]) / 20.0);
								banana_ptr->velocity[1] = (((c_ptr->p.pointy - kart->position[1]) / 20.0) + 4.0);
								banana_ptr->velocity[2] = ((c_ptr->p.pointz - kart->position[2]) / 20.0);
								banana_ptr->position[1] = kart->position[1];
								Na_EnmVoice_Start(num,SE_ENM_VOICE_THROW);	//func_800C92CC(arg0 & 0xFF, 0x29008009, temp_t7_2, obj_ptr);
								NAEnmTrgStart(banana_ptr->position,banana_ptr->velocity,SE_KART_ITEM_THROW_HIGH);//func_800C98B8(sp2C + 0x14, sp2C + 0x34, 0x19018014);
								i_ptr->count2++;
								break;
							case 1:
								banana_ptr->velocity[1] -= 0.4;
								banana_ptr->position[0] += banana_ptr->velocity[0];
								banana_ptr->position[1] += banana_ptr->velocity[1];
								banana_ptr->position[2] += banana_ptr->velocity[2];
								if(i_ptr->time > 20){i_ptr->count2++;}	
								break;
							case 2:
								//banana_ptr->sparam = 4;
								banana_ptr->position[1] = 2.7+CheckHight(banana_ptr->position[0],banana_ptr->position[1]+30.0,banana_ptr->position[2]);
								//kart->weapon |= USE_BANANA;
								//bananabunsh_ptr->bananacounter-=1;
								//     if(i_ptr->count1 == 0){bananabunsh_ptr->banana5=-1;}
								//else if(i_ptr->count1 == 1){bananabunsh_ptr->banana4=-1;}
								//else if(i_ptr->count1 == 2){bananabunsh_ptr->banana3=-1;}
								//else if(i_ptr->count1 == 3){bananabunsh_ptr->banana2=-1;}
								//else if(i_ptr->count1 == 4){bananabunsh_ptr->banana1=-1;}
								//if(bananabunsh_ptr->banana5!=-1){bananabunsh_ptr->banana5=-1;}
								//else if(bananabunsh_ptr->banana4!=-1){bananabunsh_ptr->banana4=-1;}
								//else if(bananabunsh_ptr->banana3!=-1){bananabunsh_ptr->banana3=-1;}
								//else if(bananabunsh_ptr->banana2!=-1){bananabunsh_ptr->banana2=-1;}
								//else if(bananabunsh_ptr->banana1!=-1){bananabunsh_ptr->banana1=-1;}
								i_ptr->count3 = 0x96;
								i_ptr->count2 = 0;
								break;
						}	
					}
					else{i_ptr->item_num = EI_SUPER_BANANA_SHOOT; i_ptr->time = 0;} //player behind enemy go back
				}
			}
			break;

        case EI_G_SHELL_SET:
            //if (g_simpleObjectCount < 0x50) 
			//{
                i_ptr->obj_num = set_gshell(kart);
                //temp_v1_5 = i_ptr->obj_num;
                if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 0x64)) 
				{
                    i_ptr->item_num = EI_G_SHELL_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
                } 
				else {i_ptr->item_num = EI_NULL;}
            //} 
			//else {i_ptr->item_num = EI_NULL;}
            break; 
        case EI_G_SHELL_HOLD: 
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != GSHELL) || (obj_ptr->sparam != 0) || (num != obj_ptr->angle[2])) 
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
                //break; goto block_194;
            }
            else if (i_ptr->count4 < i_ptr->time) 
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_G_SHELL_SHOOT;
            }
            break;
        case EI_G_SHELL_SHOOT: 
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != GSHELL) || (obj_ptr->sparam != 0) || (num != obj_ptr->angle[2])) 
			{
                i_ptr->item_num = EI_NULL;
                i_ptr->time = 0;
            } 
			else 
			{
               // obj_ptr->sparam = 1; original
            
				if(kart->rank == 0) //definitely shoot backwards
				{
					SHOOTGSBACK:
					speed =	8.0f;
					if(kart->speed > speed) {speed = kart->speed * 1.2f;}
					vect[0]=0;
					vect[1]=0;
					vect[2]=-speed;
					MakeAlignVector(vect,(kart->direction[1]+kart->slipang));
					obj_ptr->velocity[0]=vect[0];
					obj_ptr->velocity[1]=vect[1];
					obj_ptr->velocity[2]=vect[2];
					obj_ptr->sparam=2;		//START MOVE!!!!!
					NAPlyTrgStart((uchar)obj_ptr->angle[2],SE_KART_ITEM_THROW);
					NAPlyVoiceStart((uchar)(obj_ptr->angle[2]),(uint)((kart->kart)*0x10+SE_VOICE_SHOT));
					kame_blue_hibasira_set((int) i_ptr->obj_num);
				} 
				else //decide front / back
				{
					if(g_playerPosition[num] == g_playerPosition[enemy_target_player] -1){goto SHOOTGSBACK;} //if player directly behind CPU fire backwards
					else{obj_ptr->sparam = 1;} //front
				}
				i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
			}
            break; 

		///////////////////////////////////////////////////////////////////////////////
		case EI_SUPER_G_SHELL_SET:
			if (g_simpleObjectCount < 0x50) 
			{
                i_ptr->obj_num = set_super_shell(kart,SGSHELL);
                if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 0x64)) 
				{
                    i_ptr->item_num = EI_SUPER_G_SHELL_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
                } 
				else {i_ptr->item_num = EI_NULL;}
            } 
			else {i_ptr->item_num = EI_G_SHELL_SET;} //EI_NULL
            break; 
		case EI_SUPER_G_SHELL_HOLD:
			//obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
			//supershell_ptr = (i_ptr->obj_num * 0x70) + (Supershell*) &g_SimpleObjectArray[0];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != SGSHELL) || (obj_ptr->counter == 0) || (num != obj_ptr->angle[2]))
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
            }
            else if (i_ptr->count4 < i_ptr->time) 
			{
                i_ptr->time = 0;
				i_ptr->count1 = 0;
                i_ptr->item_num = EI_SUPER_G_SHELL_SHOOT;
            }
            break;
		case EI_SUPER_G_SHELL_SHOOT:
			if ((i_ptr->time % 0xA) == 0) 
			{
				obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
                if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != SGSHELL) || (obj_ptr->counter == 0) || (num != obj_ptr->angle[2]))
				{
					i_ptr->item_num = EI_NULL;
					i_ptr->time = 0;
				} 
				else 
				{
					if (i_ptr->count1 < 3) 
					{
						if(cpuStrat == 0)
						{
							SHOOTTRIPLEGREEN:
							obj_ptr->fparam += 1;
							i_ptr->time = 0;
							i_ptr->count1++;
							break;
						} 
						else 
						{
							if(kart->rank != 0){goto SHOOTTRIPLEGREEN;}
						}
					}
					else
					{
						i_ptr->time = 0;
                		i_ptr->item_num = EI_NULL;
					}
				}
			}
			break;

		case EI_SUPER_R_SHELL_SET:	
			if (g_simpleObjectCount < 0x50) 
			{
                i_ptr->obj_num = set_super_shell(kart,SRSHELL);
                if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 0x64)) 
				{
                    i_ptr->item_num = EI_SUPER_R_SHELL_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
                } 
				else {i_ptr->item_num = EI_NULL;}
            } 
			else {i_ptr->item_num = EI_R_SHELL_SET;} //EI_NULL
            break; 
		case EI_SUPER_R_SHELL_HOLD:
			//obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
			//supershell_ptr = (i_ptr->obj_num * 0x70) + (Supershell*) &g_SimpleObjectArray[0];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != SRSHELL) || (obj_ptr->counter == 0) || (num != obj_ptr->angle[2]))
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
            }
            else if (i_ptr->count4 < i_ptr->time) 
			{
                i_ptr->time = 0;
				i_ptr->count1 = 0;
				i_ptr->count2 = -1; //kartrank_bak
				i_ptr->count3 = 0; //failed action (kart rank == kartrank_bak) counter 
                i_ptr->item_num = EI_SUPER_R_SHELL_SHOOT;
            }
            break;
		case EI_SUPER_R_SHELL_SHOOT:
			if ((i_ptr->time % 0xA) == 0) 
			{
				obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
                if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != SRSHELL) || (obj_ptr->counter == 0) || (num != obj_ptr->angle[2]))
				{
					i_ptr->item_num = EI_NULL;
					i_ptr->time = 0;
				} 
				else 
				{
					if (i_ptr->count1 < 3) 
					{
						if(cpuStrat == 0)
						{
							SHOOTTRIPLERED:
							if(kart->rank != i_ptr->count2) //Don't hit same enemy more than once -> make sure enemy has been passed
							{
								obj_ptr->fparam += 1;
								i_ptr->time = 0;
								i_ptr->count1++;
								i_ptr->count2 = kart->rank;
								i_ptr->count3 = 0;
							}
							else
							{
								if(i_ptr->count3 > 9*3){i_ptr->count2 = -1; i_ptr->count3 = 0;} //Failsave if enemy wasn't passed -> reset kartrank_bak/count2 after X action fails
								else{i_ptr->count3++;} //or: (g_playerPathPointTotalTable[num] > 100+num*20) 
							}
							//break;
						} 
						else 
						{
							if(kart->rank != 0){goto SHOOTTRIPLERED;} //hold as 1st
						}
					}
					else
					{
						i_ptr->time = 0;
                		i_ptr->item_num = EI_NULL;
					}
				}
			}
			break;

		///////////////////////////////////////////////////////////////////////////////

        case EI_R_SHELL_SET: // switch 1
            //if (g_simpleObjectCount < 0x50) 
			//{
                i_ptr->obj_num = set_rshell(kart);
                //temp_v1_6 = i_ptr->unk2;
                if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 0x64)) 
				{
                    i_ptr->item_num = EI_R_SHELL_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
                } 
				else {i_ptr->item_num = EI_NULL;}
            //} 
			//else {i_ptr->item_num = EI_NULL;}
            break; //goto block_194;
        case EI_R_SHELL_HOLD: // switch 1
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != RSHELL) || (obj_ptr->sparam != 0) || (num != obj_ptr->angle[2])) 
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
                //goto block_194;
            }
            else if (i_ptr->count4 < i_ptr->time)
			{
                //i_ptr->item_num = EI_R_SHELL_SHOOT;
                if(cpuStrat == 0){i_ptr->item_num = EI_R_SHELL_SHOOT;}
				else
				{
					if(kart->rank != 0){i_ptr->item_num = EI_R_SHELL_SHOOT;} 
				}
            }
            break;
        case EI_R_SHELL_SHOOT: // switch 1
            check_item_number(i_ptr); //why ?????????????????????
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != RSHELL) || (obj_ptr->sparam != 0) || (num != obj_ptr->angle[2])) 
			{
                i_ptr->item_num = EI_NULL;
                i_ptr->time = 0;
            } 
			else 
			{
                obj_ptr->sparam = 1;
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
            }
            break;


        case EI_FAKE_IBOX_SET: // switch 1
            i_ptr->obj_num = put_fake_itembox(kart);
            //temp_v1_9 = i_ptr->unk2;
            if ((i_ptr->obj_num  >= 0) && (i_ptr->obj_num  < 0x64)) 
			{
                i_ptr->item_num = EI_FAKE_IBOX_HOLD;
                i_ptr->time = 0;
                i_ptr->kosuu++;
                i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
            } 
			else {i_ptr->item_num = EI_NULL;}
            break;
        case EI_FAKE_IBOX_HOLD:
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != FAKEIBOX) || (obj_ptr->sparam != 0) || (num != (int) obj_ptr->velocity[0])) 
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
                //break; //goto block_194;
            }
            else if (i_ptr->count4 < i_ptr->time) 
			{
                i_ptr->item_num = EI_FAKE_IBOX_SHOOT;
                //break; //goto block_194;
            }
            break;
        case EI_FAKE_IBOX_SHOOT:
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != FAKEIBOX) || (obj_ptr->sparam != 0) || (num != (int) obj_ptr->velocity[0])) 
			{
                //if (num != obj_ptr->angle[0]) 
				i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
            } 
			else 
			{
                //sp28 = obj_ptr;
                release_fake_itembox(obj_ptr);
                if (tenuki_flg[num] == 1) 
				{
                    //sp28 = obj_ptr;
                    obj_ptr->position[1] = (float) (CheckHight(obj_ptr->position[0], (float) ((double) obj_ptr->position[1] + 30.0), obj_ptr->position[2]) + obj_ptr->radius);
                }
            }
            i_ptr->time = 0;
            i_ptr->item_num = EI_NULL;
            break;


        case EI_THUNDER_SET: 
            use_thunder(kart);
            Na_EnmThunder_Start(num & 0xFF);
            SetThunderEnemy();
            i_ptr->time = 0;
            i_ptr->item_num = EI_THUNDER_END;
            i_ptr->kosuu++;
            break; 
        case EI_THUNDER_END:
            if (i_ptr->time >= 0xF1) 
			{
                Na_EnmThunder_Stop((uchar) num);
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
            }
            break;


        case EI_STAR_SET: 
            kart->weapon = kart->weapon | USE_STAR;
            i_ptr->time = 0;
            i_ptr->kosuu++;
			if(cpuItemSpawn == CPU_TIMER){i_ptr->item_num = EI_STAR_END;}
			else{i_ptr->item_num = EI_NULL;}
            break; 
        case EI_STAR_END:
            if ((kart->slip_flag & IS_STAR) == 0) {i_ptr->item_num = EI_NULL;}
            i_ptr->time = 0;
            break; 


        case EI_TERESA_SET: 
			if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
				for(int j=0;j<MAX_OBJECT;j++)
					{
						obj_sense_ptr = (Object*)(0x8015F9B8 + (0x70 * j));
						if(!(GlobalPlayer[num].slip_flag &IS_SQUISHED))
						{
							if((g_SimpleObjectArray[j].flag &EXISTOBJ) && (g_SimpleObjectArray[j].flag &HITOBJ))
							{
								if((ans=collisionSensor(kart,obj_sense_ptr,4))==TRUE) //check if item hit incoming b4 really colliding
								{
									//if((cpuItemSpawn != 0) && (g_SimpleObjectArray[j].category == IBOX)){i_ptr->item_num = EI_NULL; goto LOOSEBOO;} // Loose feather before hitting new IB when not item count
									kart->weapon |= USE_BOO;
									i_ptr->kosuu++;
									i_ptr->time = 0;
									if(cpuItemSpawn == CPU_TIMER){i_ptr->item_num = EI_TERESA_END;}
									else{i_ptr->item_num = EI_NULL;}

									//switch(obj_sense_ptr->category) //check items are on the move not hold!
								}
							}
						} 
					}
			}
            //kart->weapon = kart->weapon | USE_BOO;
            //i_ptr->time = 0;
            //i_ptr->item_num = EI_TERESA_END;
            //i_ptr->kosuu++;
            break; //goto block_194;
        case EI_TERESA_END: // switch 1
            //if ((kart->slip_flag << 0) >= 0) 
			if(!(kart->slip_flag & IS_BOO)) {i_ptr->item_num = EI_NULL;}
            i_ptr->time = 0;
            break; //goto block_194;


        case EI_KINOKO1_SET: // switch 1
			if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
				kart->weapon = kart->weapon | USE_MUSHROOM;
				i_ptr->time = 0;
				i_ptr->item_num = EI_NULL;
				i_ptr->kosuu++;
			}
			else{i_ptr->time = 0;}
            break; //goto block_194;
        case EI_KINOKO2_SET: // switch 1
			if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
				if (i_ptr->time >= 0x3D) 
				{
					kart->weapon = kart->weapon | USE_MUSHROOM;
					i_ptr->time = 0;
					i_ptr->item_num = EI_KINOKO1_SET;
					//break; //goto block_194;
				}
			}
			else{i_ptr->time = 0;}
            break;// break;
        case EI_KINOKO3_SET: // switch 1
			if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
				if (i_ptr->time >= 0x3D) 
				{
					kart->weapon = kart->weapon | USE_MUSHROOM;
					i_ptr->time = 0;
					i_ptr->item_num = EI_KINOKO2_SET;
					//break; //goto block_194;
				}
			}
			else{i_ptr->time = 0;}
            break;// break;
        case EI_KINOKOC_SET: // switch 1
            if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
				i_ptr->time = 0;
				i_ptr->item_num = EI_KINOKOC_SET2;
				//i_ptr->count4 = 0x258; 
				i_ptr->count4 = MakeRandomLimmit(600); //Random limit 1 to 6 shrooms
				if(i_ptr->count4 < 0x3C * 4){i_ptr->count4 = 0xF0;} //minimum 4 shrooms
			}
			else{i_ptr->time = 0;}
            break;// goto block_194;
        case EI_KINOKOC_SET2: // switch 1
            if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
				if ((i_ptr->time % 0x3C) == 0) 
				{
					kart->weapon = kart->weapon | USE_MUSHROOM;
					if (i_ptr->count4 < i_ptr->time) 
					{
						i_ptr->time = 0;
						i_ptr->item_num = EI_NULL;
					}
				}
			}
			else{i_ptr->time = 0;}
            break;

		case EI_HANE_SET:
			if(!(kart->slip_flag &IS_LIGHTNING_HIT))
			{
					for(int j=0;j<MAX_OBJECT;j++) //check for item
					{
						obj_sense_ptr = (Object*)(0x8015F9B8 + (0x70 * j));
						if(!(GlobalPlayer[num].slip_flag &IS_SQUISHED))
						{
							if((g_SimpleObjectArray[j].flag &EXISTOBJ) && (g_SimpleObjectArray[j].flag &HITOBJ))
							{
								if((ans=collisionSensor(kart,obj_sense_ptr,4))==TRUE) //check if item hit incoming b4 really colliding
								{
									if((cpuItemSpawn != CPU_TIMER) && ((g_SimpleObjectArray[j].category == IBOX) || (g_SimpleObjectArray[j].category == SIBOX)) )
									{goto LOOSEFEATHER;} // Loose feather before hitting new IB when not item count

									kart->weapon |= USE_FEATHER;
									LOOSEFEATHER:
									i_ptr->item_num = EI_NULL;
									i_ptr->kosuu++;
									i_ptr->time = 0;

									//switch(obj_sense_ptr->category) //check items are on the move not hold!
								}
							}
						} 
					}
					for(int j=0; j<8; j++) //check for kart with star
					{
						if(num == j){continue;}
						if(GlobalPlayer[num].slip_flag &IS_SQUISHED){continue;}
						//if(!(GlobalPlayer[j].slip_flag &IS_STAR)){continue;}

						if((GlobalPlayer[j].flag &EXISTS) && (GlobalPlayer[j].slip_flag &IS_STAR))
						{
							if((ans=collisionSensorKarts(kart,&GlobalPlayer[j],4))==TRUE) //check if item hit incoming b4 really colliding
							{
								kart->weapon |= USE_FEATHER;
								i_ptr->item_num = EI_NULL;
								i_ptr->kosuu++;
								i_ptr->time = 0;
							}
						}

						
					}
			}		
			break;


		case EI_B_SHELL_SET: // switch 1
            //if (g_simpleObjectCount < 0x50) 
			//{
                i_ptr->obj_num = set_tshell(kart);
                //temp_v1_6 = i_ptr->unk2;
                if ((i_ptr->obj_num >= 0) && (i_ptr->obj_num < 0x64)) 
				{
                    i_ptr->item_num = EI_B_SHELL_HOLD;
                    i_ptr->time = 0;
                    i_ptr->kosuu++;
                    i_ptr->count4 = (short) ((MakeRandomLimmit(3) * 0x14) + 0xA);
                } 
				else {i_ptr->item_num = EI_NULL;}
            //} 
			//else {i_ptr->item_num = EI_NULL;}
            break; //goto block_194;

        case EI_B_SHELL_HOLD: // switch 1
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != TSHELL) || (obj_ptr->sparam != 0) || (num != obj_ptr->angle[2])) 
			{
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
                //goto block_194;
            }
            else if (i_ptr->count4 < i_ptr->time)
			{
                i_ptr->item_num = EI_B_SHELL_SHOOT;
                //goto block_194;
            }
            break;

        case EI_B_SHELL_SHOOT: // switch 1
            check_item_number(i_ptr); //why ?????????????????????
            //obj_ptr = (i_ptr->obj_num * 0x70) + &g_SimpleObjectArray[0];
			obj_ptr = &g_SimpleObjectArray[i_ptr->obj_num];
            if (((obj_ptr->flag & EXISTOBJ) == 0) || (obj_ptr->category != TSHELL) || (obj_ptr->sparam != 0) || (num != obj_ptr->angle[2])) 
			{
                i_ptr->item_num = EI_NULL;
                i_ptr->time = 0;
            } 
			else 
			{
                obj_ptr->sparam = 1;
                i_ptr->time = 0;
                i_ptr->item_num = EI_NULL;
            }
            break;


		default: break;

    }//end switch

	if (i_ptr->time < 10000){i_ptr->time++;}
	if ((kart->slip_flag & 0x80002200) != 0){i_ptr->time = 0;} //IS_BOO/IS_TURBO_BOOSTING/IS_STAR


	

}

//void balbal (void) {}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   PLAYER ONLY                                          //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
void execute_item_HACK(Player *car) //static
{
/*
.org 0x11C890 JAL execute_item_HACK
*/
	
	int num=car-&GlobalPlayer[0];

 	switch(car->item)
	{
	case  ib_gshell:    set_gshell(car); break;
	case  ib_rshell:    set_rshell(car); break;
	case  ib_bshell:    set_tshell(car); break;
	case  ib_banana:    put_banana(car); break;
	case  ib_bananas:   set_super_banana(car); break;
	case  ib_mush1:     car->weapon=car->weapon|USE_MUSHROOM; break;	
	case  ib_mush2:     car->weapon=car->weapon|USE_MUSHROOM; break;	
	case  ib_mush3:     car->weapon=car->weapon|USE_MUSHROOM; break;	
	case  ib_mushG:     car->weapon=car->weapon|USE_MUSHROOM; break;	
	case  ib_ghost:     car->weapon=car->weapon|USE_BOO; break;	
	case  ib_star:	    car->weapon=car->weapon|USE_STAR; break;
	case  ib_thunder:   use_thunder(car); break;
 	case  ib_fakeib:    put_fake_itembox(car); break;
	case  ib_gshells:   set_super_shell(car,SGSHELL); break;
	case  ib_rshells:   set_super_shell(car,SRSHELL); break;
    case  ib_feather:   car->weapon=car->weapon|USE_FEATHER; break;
	}		  
   	kwanm_useditem(num);
}


void mariogp_movekart_HACK(Player *car,Camera *camera,char kno ,char place)
{
ushort answer = 0;

		if(!(car->flag&NO_CONTROLS))
		{
			switch(g_screenSplitA) //check if cpu in screen
			{ 
				case FULL_SCREEN:
					answer=viewport(car,&g_Camera1,select_bumpKart,0); //camera1	
				break;

				case UP_DOWN_SCREEN:
				case RIGHT_LEFT_SCREEN:
					if((answer=viewport(car,&g_Camera1,select_bumpKart,0))==DONE){break;}
					answer=viewport(car,&g_Camera2,select_bumpKart,0);
				break;

				case FOUR_PARTS_SCREEN:
					if((answer=viewport(car,&g_Camera1,select_bumpKart,0))==DONE){break;}
					if((answer=viewport(car,&g_Camera2,select_bumpKart,0))==DONE){break;}
					if((answer=viewport(car,&g_Camera3,select_bumpKart,0))==DONE){break;}
					answer=viewport(car,&g_Camera4,select_bumpKart,0);
				break;
			}


			
			switch (cpuOffscrStrat)
			{
			case 0: //human
				//if(answer==DONE || (car->flag&IS_GHOST)==IS_GHOST || g_gameMode==BA 
				//||(car->jugemu_flag&ON_LAKITU_ROD) || (car->jugemu_flag&OUT_OF_BOUNDS) || 
				//enemy_tenuki_kinsi_flg[(uchar)kno]==1) //CPU on screen: Norm strat
				//{   
					car->slip_flag &=~ON_CENTER_LINE;
				//}
				if  (  ((car->slip_flag&SPINOUT_LEFT)==SPINOUT_LEFT)
					|| ((car->slip_flag&SPINOUT_RIGHT)==SPINOUT_RIGHT)
					|| ((car->slip_flag&IS_WALL_TUMBLING)==IS_WALL_TUMBLING)
					|| ((car->slip_flag&IS_START_SPINNING)==IS_START_SPINNING)
					|| ((car->slip_flag&IS_FEATHER_JUMPING)==IS_FEATHER_JUMPING)
					|| ((car->slip_flag&IS_TORNADO_JUMPING)==IS_TORNADO_JUMPING)
					|| ((car->slip_flag&IS_VERTICAL_HIT)==IS_VERTICAL_HIT)
					|| ((car->slip_flag&IS_MOMENTUM_HIT)==IS_MOMENTUM_HIT)
					|| ((car->slip_flag&LIGHTNING_SPIN)==LIGHTNING_SPIN)
					|| ((car->handling_flag&TROPHYJUMP_END)==TROPHYJUMP_END)
				    )
				{spin_kart(car,camera,place,kno);}
				else{RunKart(car,camera,place,kno);}
				break;
			
			case 1: //combined
				if(answer==DONE || (car->flag&IS_GHOST)==IS_GHOST || g_gameMode==BA 
				||(car->jugemu_flag&ON_LAKITU_ROD) || (car->jugemu_flag&OUT_OF_BOUNDS) || 
				enemy_tenuki_kinsi_flg[(uchar)kno]==1) //CPU on screen: Norm strat
				{   
					RUNKART:
					car->slip_flag &=~ON_CENTER_LINE;
				
					if  (  ((car->slip_flag&SPINOUT_LEFT)==SPINOUT_LEFT)
					|| ((car->slip_flag&SPINOUT_RIGHT)==SPINOUT_RIGHT)
					|| ((car->slip_flag&IS_WALL_TUMBLING)==IS_WALL_TUMBLING)
					|| ((car->slip_flag&IS_START_SPINNING)==IS_START_SPINNING)
					|| ((car->slip_flag&IS_FEATHER_JUMPING)==IS_FEATHER_JUMPING)
					|| ((car->slip_flag&IS_TORNADO_JUMPING)==IS_TORNADO_JUMPING)
					|| ((car->slip_flag&IS_VERTICAL_HIT)==IS_VERTICAL_HIT)
					|| ((car->slip_flag&IS_MOMENTUM_HIT)==IS_MOMENTUM_HIT)
					|| ((car->slip_flag&LIGHTNING_SPIN)==LIGHTNING_SPIN)
					|| ((car->handling_flag&TROPHYJUMP_END)==TROPHYJUMP_END)
				    )
					{spin_kart(car,camera,place,kno);}
					else{RunKart(car,camera,place,kno);}
				}
				else
				{
					if(GlobalPlayer[0].rank < 3){RunKartSimple(car,camera,place,kno);}
					else{goto RUNKART;}
				}
				break;

			case 2: //cheating
				if(answer==DONE || (car->flag&IS_GHOST)==IS_GHOST || g_gameMode==BA 
				||(car->jugemu_flag&ON_LAKITU_ROD) || (car->jugemu_flag&OUT_OF_BOUNDS) || 
				enemy_tenuki_kinsi_flg[(uchar)kno]==1) //CPU on screen: Norm strat
				{   
					car->slip_flag &=~ON_CENTER_LINE;
					if  (  ((car->slip_flag&SPINOUT_LEFT)==SPINOUT_LEFT)
						|| ((car->slip_flag&SPINOUT_RIGHT)==SPINOUT_RIGHT)
						|| ((car->slip_flag&IS_WALL_TUMBLING)==IS_WALL_TUMBLING)
						|| ((car->slip_flag&IS_START_SPINNING)==IS_START_SPINNING)
						|| ((car->slip_flag&IS_FEATHER_JUMPING)==IS_FEATHER_JUMPING)
						|| ((car->slip_flag&IS_TORNADO_JUMPING)==IS_TORNADO_JUMPING)
						|| ((car->slip_flag&IS_VERTICAL_HIT)==IS_VERTICAL_HIT)
						|| ((car->slip_flag&IS_MOMENTUM_HIT)==IS_MOMENTUM_HIT)
						|| ((car->slip_flag&LIGHTNING_SPIN)==LIGHTNING_SPIN)
						|| ((car->handling_flag&TROPHYJUMP_END)==TROPHYJUMP_END)
				    	)
					{spin_kart(car,camera,place,kno);}
					else{RunKart(car,camera,place,kno);}
				}
				else{RunKartSimple(car,camera,place,kno);}
				break;	

			} //end switch
		
			//loadFont();
			//printStringNumber(0,0,"offscr",cpuOffscrStrat);
			//printStringNumber(0,10,"setval",settingsValues2[3]);
			

		}
		else
		{ //OPENING KART STRATAGY
			if((car->flag&IS_GP_OPENING)==IS_GP_OPENING)
			{
				opening_kart(car,kno);
				openkart(car,camera,place,kno);
			}
			//else if (debugFlag == 1)
			//{

			//}
			else
			{
				if((car->flag&IS_ACTION)){RunKart(car,camera,place,kno);}
				else
				{
					if((car->flag&IS_PLAYER)!=IS_PLAYER){car->accelcount=50;}
					car->slip_flag &=~IS_IN_AIR;
				}
			}
		}
}

void kwanm_roulette_HACK(int num) 
{
    int ZpressedFlag;

	//kwanm_roulette(num);return;

    ZpressedFlag = 0;
    if ((GlobalController[num]->ButtonPressed & BTN_Z) != 0){ZpressedFlag = 1;}
    if (UnknFlagShroomsTT != 0) {kwanm_start(itemboxallocptr[num], 0);}

    switch (g_hudAnimStruct[itemboxallocptr[num]].anmptr) 
    {
    case 1:
        kwanm_roulette_init(itemboxallocptr[num], num);
        break;
    case 2:
        if ((g_screenSplitA == 0) || (onlineFlag)) //1p & online
        {
            kwadd_sval(&g_hudStruct[num].addiy, 0x40, 4);
            if (g_hudStruct[num].addiy == 0x40) 
            {
                kwanm_next(itemboxallocptr[num]);
            }
        } 
        else if (g_screenSplitA == 3) //4p
        {
            if ((num == 0) || (num == 2)) 
            {
                kwadd_sval(&g_hudStruct[num].addix, 0x80, 8);
                if (g_hudStruct[num].addix == 0x80)
                {
                    kwanm_next(itemboxallocptr[num]);
                }
            } 
            else 
            {
                kwsub_sval(&g_hudStruct[num].addix, -0x80, 8);
                if (g_hudStruct[num].addix == -0x80) 
                {
                    kwanm_next(itemboxallocptr[num]);
                }
            }
        } 
        else if(g_screenSplitA == 1) //2p ud
		{
			kwadd_sval(&g_hudStruct[num].addix, 0x80, 8);
			if (g_hudStruct[num].addix == 0x80) 
			{
				kwanm_next(itemboxallocptr[num]);
			}
		}
		else if(g_screenSplitA == 2) //2p lr
        {
      
			if(num == 0)
			{
				kwadd_sval(&g_hudStruct[num].addix, 0x80, 8);
				if (g_hudStruct[num].addix == 0x80) 
				{
					kwanm_next(itemboxallocptr[num]);
				}
			}
			else
			{
				kwadd_sval(&g_hudStruct[num].addix, -0x80, 8);
				if (g_hudStruct[num].addix == -0x80) 
				{
					kwanm_next(itemboxallocptr[num]);
				}
			}
        }
        break;
    case 3:
        //kwanm_forward(itemboxallocptr[num], 1, 0xF, 1, 2, 2); // 0xF limiter so change
		kwanm_forward(itemboxallocptr[num], 1, itemMax, 1, 2, 2);
        break;
    case 4:
        kwanm_forward(itemboxallocptr[num], 1, 6, 1, 8, 1);
        break;
    case 5:
        kwanm_forward(itemboxallocptr[num], 1, 4, 1, 0x10, 1);
        break;
    case 6:
        g_hudAnimStruct[itemboxallocptr[num]].anmnum = kwanm_randomitem(itemboxallocptr[num], num);
        g_hudAnimStruct[itemboxallocptr[num]].timer = 8;
        g_hudAnimStruct[itemboxallocptr[num]].chartptr = 2;
        kwanm_next(itemboxallocptr[num]);
        //g_hudStruct[num] = (void *) (uchar) num; //what the fuck is this senseless shit again?!
        NaPlyLevelStop((uchar) num, 0x100FE1C);
        NaPlyLevelStart((uchar) num, 0x100FE47);
        break;
    case 7:
        kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0, 8, 0xA); 
        break;
    case 9:
		kwanm_clrevflag(itemboxallocptr[num], 4);
        kwchart_off(itemboxallocptr[num]);
        g_hudAnimStruct[itemboxallocptr[num]].anmnum = 0;
        kwanm_next(itemboxallocptr[num]);
        break;
    case 10:
        kwanm_wait(itemboxallocptr[num], 0x14);
        break;
    case 11:
        if ((g_screenSplitA == 0) || (onlineFlag)) //1p & online
        {
            if (kwsub_sval(&g_hudStruct[num].addiy, 0, 4) != 0) 
			{
                kwanm_next(itemboxallocptr[num]);
            }
        } else if (g_screenSplitA == 3) //4p
        {
            if ((num == 0) || (num == 2)) 
            {
                kwsub_sval(&g_hudStruct[num].addix, 0, 8);
                if (g_hudStruct[num].addix == 0) 
                {
                    kwanm_next(itemboxallocptr[num]);
                }
            } else 
            {
                kwadd_sval(&g_hudStruct[num].addix, 0, 8);
                if (g_hudStruct[num].addix == 0) 
                {
                    kwanm_next(itemboxallocptr[num]);
                }
            }
        } else if (kwsub_sval(&g_hudStruct[num].addix, 0, 8) != 0) 
        {
            kwanm_next(itemboxallocptr[num]);
        }
        break;
    case 12:
        kwanm_finish(itemboxallocptr[num]);
        break;
    case 20:
		if (g_hudAnimStruct[itemboxallocptr[num]].input == 0xB) 
		{
            kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0, 8, 0xA);
        } 
		else 
		{
            kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0xB, 8, 0xA);
        }
        break;
    case 21:
        kwanm_jump(itemboxallocptr[num], 8);
        g_hudAnimStruct[itemboxallocptr[num]].chartptr = 2;
        break;
    case 30:
        if (g_hudAnimStruct[itemboxallocptr[num]].input == 0xB) 
        {
            kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0, 8, 0xA);
        } else 
        {
            kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0xB, 8, 0xA);
        }
        break;
    case 31:
        kwanm_jump(itemboxallocptr[num], 9);
        break;
    case 40:
        if (g_hudAnimStruct[itemboxallocptr[num]].input == 0xD) 
        {
            kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0xE, 8, 0xA);
        } else {
            kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0xD, 8, 0xA);
        }
        break;
    case 41:
        kwanm_jump(itemboxallocptr[num], 8);
        break;
    case 50:
        kwanm_swap(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input, 0, 8, 0x64);
        break;
    }

    if (kwanm_bitcheckevflag(itemboxallocptr[num], 2) != 0) 
    {
        if (g_hudAnimStruct[itemboxallocptr[num]].spstep == 0) 
		{
            kwanm_useditem(num);
        } else 
        {
            g_hudAnimStruct[itemboxallocptr[num]].spstep = g_hudAnimStruct[itemboxallocptr[num]].spstep -1;
        }
    }
    if (g_hudAnimStruct[itemboxallocptr[num]].timer >= 0) 
    {
        if (g_hudAnimStruct[itemboxallocptr[num]].timer > 0) 
        {
            g_hudAnimStruct[itemboxallocptr[num]].timer = g_hudAnimStruct[itemboxallocptr[num]].timer - 1;
        } 
		else 
        {
            if (g_hudAnimStruct[itemboxallocptr[num]].chartptr != 1) 
            {
                if (g_hudAnimStruct[itemboxallocptr[num]].chartptr != 2) 
                {
                    if (g_hudAnimStruct[itemboxallocptr[num]].chartptr != 3) 
                    {

                    } 
					else if (g_hudAnimStruct[itemboxallocptr[num]].output == 0) 
                    {
                        if (kwanm_bitoffcheckevflag(itemboxallocptr[num], 1) != 0) 
                        {
                            if (g_hudAnimStruct[itemboxallocptr[num]].input == 0xB) 
                            {
                                if (kwsteal_item(itemboxallocptr[num], num) != 0) 
                                {
                                    kwanm_jump(itemboxallocptr[num], 0x14);
                                    g_hudAnimStruct[itemboxallocptr[num]].chartptr = 0;
                                } 
								else 
								{
                                    kwanm_jump(itemboxallocptr[num], 9);
                                }
                            } 
                            else if ((g_hudAnimStruct[itemboxallocptr[num]].input == 0xD) || (g_hudAnimStruct[itemboxallocptr[num]].input == 0xE)) 
                            {
                                g_hudAnimStruct[itemboxallocptr[num]].input  = g_hudAnimStruct[itemboxallocptr[num]].input - 1;
                                kwanm_setoutput(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input);
                                g_hudAnimStruct[itemboxallocptr[num]].chartptr = 3;
                                kwanm_jump(itemboxallocptr[num], 0x28);
                            } 
							else 
							{
                                kwanm_jump(itemboxallocptr[num], 9);
                            }
                        } 
						else 
						{
                            kwanm_clrevflag(itemboxallocptr[num], 1);
                            kwanm_jump(itemboxallocptr[num], 0x1E);
                            g_hudAnimStruct[itemboxallocptr[num]].chartptr = 0;
                        }
                    }
                } 
				else 
                {
                    kwanm_setoutput(itemboxallocptr[num], g_hudAnimStruct[itemboxallocptr[num]].input);
                    g_hudAnimStruct[itemboxallocptr[num]].chartptr = 3;
                }
            } 
            else if (ZpressedFlag != 0) 
            {
                kwchart_off(itemboxallocptr[num]);
                kwanm_jump(itemboxallocptr[num], 6);
            }
        } 
    }

	if(g_hudAnimStruct[itemboxallocptr[num]].anmnum < 0x10) //standard items
	{
		g_hudAnimStruct[itemboxallocptr[num]].texaddr = (ushort*) itemboxtbl_pal[(uchar) g_hudAnimStruct[itemboxallocptr[num]].anmnum];
    	g_hudAnimStruct[itemboxallocptr[num]].indexaddr = (uchar*) itemboxtbl_idx[(uchar) g_hudAnimStruct[itemboxallocptr[num]].anmnum];
	}
	else //added custom items
	{
		if(g_hudAnimStruct[itemboxallocptr[num]].anmnum == 0x10) //feather
		{
			g_hudAnimStruct[itemboxallocptr[num]].texaddr = (ushort*) 0x80501A40; //load into RAM then point u idio!!!!! 80165F88 PJ64 roulette p1 in p2
    		g_hudAnimStruct[itemboxallocptr[num]].indexaddr = (uchar*) 0x80501540;//(int*) &ItemFeatherPalROM;
		}
		
	}
    
    GlobalPlayer[num].item = g_hudAnimStruct[itemboxallocptr[num]].output;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//MARK: -                                   ENEMY & PLAYER                                       //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

uchar kwgetitem_sub_HACK(short rank, short pflag) 
{
/*
.org 0x07BB60 JAL kwgetitem_sub_HACK
.org 0x07BB98 JAL kwgetitem_sub_HACK
*/
	//static int wait = 0;
	//pflag 0:player 1:cpu ... unused here same for both
	//if(pflag == 1){return (0);}; //debug return for cpu

	//Item Probabilites:
	uchar itemProbs[26][20] =
    {   
/*		
		 										   1  1  1  1  1  1
		 1  2  3  4  5  6  7  8  9  A  B  C  E  F  0  1  2  3  4  5
		 -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		 B  B  G  G  R  R  B  T  F  S  G  M  M  M  F  C  C  C  C  C
		 A  A  S  S  S  S  S  H  A  T  H  U  U  U  E  U  U  U  U  U 
		 N  N  H  H  H  H  H  U  K  A  O  S  S  S  A  S  S  S  S  S  
 		 A  A  E  E  E  E  E  N  E  R  S  H  H  H  T  T  T  T  T  T 
		 N  N  L  L  L  L  L  D        T           H  O  O  O  O  O  
		 A  A  L  L  L  L  L  E  I           3  G  E  M  M  M  M  M 
		    S     S     S     R  B              O  R  1  2  3  4  5
																	  Mode Rank
*/	/*	{30,05,30,05,05,00,00,00,10,00,05,10,00,00,00,00,00,00,00,00},//GP 1st Human without feather
		{00,05,05,10,15,20,00,05,05,05,05,05,15,05,00,00,00,00,00,00},//GP 2nd
		{00,00,00,10,20,20,00,05,00,10,00,05,20,10,00,00,00,00,00,00},//GP 3rd
		{00,00,00,00,15,20,05,10,00,15,00,05,20,10,00,00,00,00,00,00},//GP 4th
		{00,00,00,00,10,20,05,10,00,15,00,05,25,10,00,00,00,00,00,00},//GP 5th
		{00,00,00,00,00,20,10,15,00,20,00,00,25,10,00,00,00,00,00,00},//GP 6th
		{00,00,00,00,00,20,10,20,00,30,00,00,10,10,00,00,00,00,00,00},//GP 7th
		{00,00,00,00,00,20,15,20,00,30,00,00,05,10,00,00,00,00,00,00},//GP 8th */
	  /*{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST
		{50,50,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},//GP 8th TEST*/
		/////////////////////////////////////////////////////////////
		{20,05,20,05,05,00,00,00,10,00,10,10,00,00,15,00,00,00,00,00},//GP 1st Human with feather
		{00,05,05,10,15,20,00,05,05,05,05,00,15,05,05,00,00,00,00,00},//GP 2nd
		{00,00,00,10,25,20,00,05,00,10,00,00,20,10,00,00,00,00,00,00},//GP 3rd
		{00,00,00,00,20,20,05,10,00,15,00,00,20,10,00,00,00,00,00,00},//GP 4th
		{00,00,00,00,10,20,05,10,00,15,00,00,25,10,00,00,00,00,00,00},//GP 5th
		{00,00,00,00,00,20,10,15,00,20,00,00,25,10,00,00,00,00,00,00},//GP 6th
		{00,00,00,00,00,20,10,20,00,30,00,00,10,10,00,00,00,00,00,00},//GP 7th
		{00,00,00,00,00,20,15,20,00,30,00,00,05,10,00,00,00,00,00,00},//GP 8th
		/////////////////////////////////////////////////////////////
		{25,05,30,05,05,00,00,00,10,00,05,00,00,00,15,00,00,00,00,00},//GP 1st CPU with feather
		{20,05,25,10,15,00,00,00,05,00,05,05,00,00,10,00,00,00,00,00},//GP 2nd
		{20,05,20,10,20,00,00,00,05,00,05,10,00,00,05,00,00,00,00,00},//GP 3rd
		{20,00,05,10,30,05,05,00,05,00,05,10,00,00,05,00,00,00,00,00},//GP 4th
		{20,00,00, 8,30,10,05,01,00,05,00,10,10,00,01,00,00,00,00,00},//GP 5th
		{10,00,00,00,30,19,10,05,00,05,00,05,15,00,01,00,00,00,00,00},//GP 6th
		{05,00,00,00,30,20,10,05,00,10,00,05,10,05,00,00,00,00,00,00},//GP 7th
		{00,00,00,00,30,20,15,10,00,10,00,00,05,10,00,00,00,00,00,00},//GP 8th
/*		
		 										   1  1  1  1  1  1
		 1  2  3  4  5  6  7  8  9  A  B  C  E  F  0  1  2  3  4  5
		 -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		 B  B  G  G  R  R  B  T  F  S  G  M  M  M  F  C  C  C  C  C
		 A  A  S  S  S  S  S  H  A  T  H  U  U  U  E  U  U  U  U  U 
		 N  N  H  H  H  H  H  U  K  A  O  S  S  S  A  S  S  S  S  S  
 		 A  A  E  E  E  E  E  N  E  R  S  H  H  H  T  T  T  T  T  T 
		 N  N  L  L  L  L  L  D        T           H  O  O  O  O  O  
		 A  A  L  L  L  L  L  E  I           3  G  E  M  M  M  M  M 
		    S     S     S     R  B              O  R  1  2  3  4  5
																	  Mode Rank
*/      {20,10,30,05,05,00,00,00,10,00,05,10,00,00,05,00,00,00,00,00},//VS2 1st with feather
		{00,05,00,05,05,15,05,15,00,15,00,00,15,20,00,00,00,00,00,00},//VS2 2nd
		/////////////////////////////////////////////////////////////
		{30,05,30,00,05,00,00,00,10,00,05,10,00,00,05,00,00,00,00,00},//VS3 1st with feather
		{05,05,00,10,15,15,00,05,05,05,05,05,20,05,00,00,00,00,00,00},//VS3 2nd
		{00,00,00,00,10,20,10,15,00,15,00,00,20,10,00,00,00,00,00,00},//VS3 3rd
		/////////////////////////////////////////////////////////////
		{30,05,30,00,05,00,00,00,10,00,05,10,00,00,05,00,00,00,00,00},//VS4 1st with feather
		{05,05,05,10,15,15,00,00,05,05,05,05,25,00,00,00,00,00,00,00},//VS4 2nd
		{00,05,00,05,10,15,05,10,05,10,00,05,25,05,00,00,00,00,00,00},//VS4 3rd
		{00,00,00,00,00,20,10,15,00,20,00,00,25,10,00,00,00,00,00,00},//VS4 4th
		/////////////////////////////////////////////////////////////
		{10,05,05,20,20,00,00,00,15,20,05,00,00,00,00,00,00,00,00,00} //BA

		//sum of numbers in each line has to be 100!!!
	};

	//generate random number 1-100
	float rand;
	uchar number;
	
	rand = (ushort) MakeRandom();
	rand = (rand/65536.0f)*100;
	number = (uchar)rand + 1;

	/*
		if too many pathpoints between kart and first kart and back at field get rocket
		goto ROCKET;
	*/

	//choose correct array line for mode & players
	short tempRank = 0;

    if (g_gameMode == GP)
	{
		if(pflag == 0){tempRank = rank;}
		else //cpu
		{
			if(cpuItemtable == 1){tempRank = rank +8;} //own table
			else{tempRank = rank;} //human table
		}
	}
	else if (g_gameMode == VS)
	{
		if (g_playerCount == 2){tempRank = rank+16;}
		else if (g_playerCount == 3){tempRank = rank+18;}
		else if (g_playerCount == 4){tempRank = rank+21;}
    } 
	else if (g_gameMode == BA){tempRank = rank+25;} 
	else{tempRank = rank;} //TT (like GP like in original)

	//Create array with summarized probabilities of itemProbs array
	static uchar sum[20];

	for(int k = 0; k<20; k++){sum[k] = 0;} //zero sum array for correct count
	for(int i = 0; i < 20; i++) //number of available different items i
	{
		for(int j = 0; j <= i; j++) //sum of array elements j lte as current item i
		{
			sum[i] = sum[i] + itemProbs[tempRank][j];
		}
	}

	//decide which item to choose
	uchar decision;

	/* debug print
	sum1 = sum[0]; sum2 = sum[1]; sum3 = sum[2]; sum4 = sum[3]; sum5 = sum[4];
	sum6 = sum[5]; sum7 = sum[6]; sum8 = sum[7]; sum9 = sum[8]; sum10 = sum[9];
	sum11 = sum[10]; sum12 = sum[11]; sum13 = sum[12]; sum14 = sum[13]; sum15 = sum[14];
	sum16 = sum[15]; sum17 = sum[16]; sum18 = sum[17]; sum19 = sum[18]; sum20 = sum[19];
	*/

	     if(number <= sum[0]){decision = 1;} //Banana
	else if(number <= sum[1]){decision = 2;} //Bananas
	else if(number <= sum[2]){decision = 3;} //GShell
	else if(number <= sum[3]){decision = 4;} //GShells
	else if(number <= sum[4]){decision = 5;} //RShell
	else if(number <= sum[5]){decision = 6;} //RShells
	else if(number <= sum[6]){decision = 7;} //BShell
	else if(number <= sum[7]){decision = 8;} //Thunder
	else if(number <= sum[8]){decision = 9;} //Fake IB
	else if(number <= sum[9]){decision = 10;} //Star
	else if(number <= sum[10]){decision = 11;} //Ghost
	else if(number <= sum[11]){decision = 12;} //Mushroom
									   // 13 empty cause it's 2 mushrooms
	else if(number <= sum[12]){decision = 14;} //3 Mushrooms
	else if(number <= sum[13]){decision = 15;} //Gold Mushroom
	else if(number <= sum[14]){decision = 16;} //Feather
	else if(number <= sum[15]){decision = 17;} //Custom 1
	else if(number <= sum[16]){decision = 18;} //Custom 2
	else if(number <= sum[17]){decision = 19;} //Custom 3
	else if(number <= sum[18]){decision = 20;} //Custom 4
	else if(number <= sum[19]){decision = 21;} //Custom 5
	else{decision = 16;}
	
	return(decision);
	
	/*
	ROCKET:
	decision = ;
	return(decision);
	*/
	
    
}








/* hack itembox pics
8007ABFC,code,kwanm_roulette_start nope
800723A4,code,kwanm_start
80072388,code,kwanm_trig

8007AC9C,code,kwanm_useditem
8007ADA8,code,kwgetitem_sub
8007AF40,code,kwgetitem
8007AF78,code,kwgetitem_enemy
8007AFB0,code,kwanm_randomitem
8007B040,code,kwsteal_item
8007B254,code,kwanm_roulette_init
8007B34C,code,kwanm_roulette
8007BB9C,code,kwchart_itemboxanm


80165C18
80165CE3

801BF818 0x0D01FED8 TEXTure 0x500            801BD818 0x0D01DED8 paletete 0x200
glabel func_8006EE7C 
glabel func_8007B254 8007B254,code,kwanm_roulette_init

8004E6C4,code,kwdisplay_itemboxs

kwanm

extern kwanmstruct	kwanm[animlistmax];

AnmObject->texaddr/indexaddr
80165CBA 3 shorts am stück 2 weapon 1 animation trigger

4player p1 
8016611A 3 shorts wie oben texture poitner at 8016614A


anmptr trigger
anmnum

glabel func_8006EE7C kwinit_itembox
glabel func_8007B254 kwanm_roulette_init
*/
