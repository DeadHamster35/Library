#include "../library/LibraryVariables.h"
#include "../library/GameVariables/NTSC/GameOffsets.h"

/*/INFO: Nop original collision_object_to_kart_HACK func!

NOP
8100156C 0000
8100156E 0000
81001818 0000
8100181A 0000
810019C0 0000
810019C2 0000
81001BD8 0000
81001BDA 0000
*/




static int collision_tree_HACK(Player *car,Object *obj)
{
   	float dx,dy,dz,vx,vz,radius,distance;
	float velo_dash,velo,merikomi,cos;
	FVector position;

	radius=obj->fparam;
	dx=obj->position[0]-car->position[0];
	if((dx<0)&&(dx<-radius)){return(FALSE);}
	else if(dx>radius){return(FALSE);}
	dz=obj->position[2]-car->position[2];
	if((dz<0)&&(dz<-radius)){return(FALSE);}
	else if(dz>radius){return(FALSE);}
    //Hight
	dy=car->position[1]-obj->position[1];
	if(dy<0){return(FALSE);}
	else if(dy>(float)obj->sparam){return(FALSE);}	
							
	distance=sqrtf(dx*dx+dz*dz);
	if(distance>radius){return(FALSE);}
	set_shadow_flag(car);

	radius=car->radius+obj->radius;
	if((merikomi=distance-radius)>0){return(FALSE);}
    //Carhit
	vx=car->velocity[0];
	vz=car->velocity[2];

	if(car->flag&IS_PLAYER)
    {
			if(car->slip_flag&IS_STAR)
            {
			    obj->flag|=FLYINGOBJ;
			    NAEnmTrgStart (car->position,car->velocity,SE_KART_EXPLOSION);
   			    NAPlyVoiceStart((uchar)(car-GlobalPlayer),car->kart * 0x10+SE_VOICE_YAHHO );
			    return(TRUE);
			}
			else
            {
			    if(!(car->flag&IS_GHOST))
			    NAPlyTrgStart((uchar)(car-GlobalPlayer),SE_KART_HIT_TREE);
			}
	}
	if(!(car->slip_flag&IS_STAR))
    {
        car->slip_flag=car->slip_flag|IS_BONKING;
    }
    position[0]=obj->position[0];
	position[1]=obj->position[1];
	position[2]=obj->position[2];
		
    switch (g_courseID)
    {
		case MARIO_RW:
		case YOSHI_VA:
		case ROYAL_RW:
		case LUIGI_RW:
		    if(car->speed>1.0f)
            {
		        kwhit_tree(position,0);
		    }
		    break;
	}
 
	
    if(distance<0.1f)
	{
	    velo=sqrtf(vx*vx+vz*vz);
	    if(velo<.5f){velo=.5f;}
	    car->velocity[0]=0;
	    car->velocity[2]=0;
		car->position[0]=position[0]-dx*radius*1.2f;
		car->position[2]=position[2]-dz*radius*1.2f;
	}
	else
    {
		velo=sqrtf(vx*vx+vz*vz);
		dx=dx/distance;
		dz=dz/distance;
		if(velo<.25f)
		{
			car->position[0]=position[0]-dx*radius*1.2f;
			car->position[2]=position[2]-dz*radius*1.2f;
			car->velocity[0]=0;
			car->velocity[2]=0;
			return(TRUE);
		}
        else
		{
			cos=(dx*vx+dz*vz)/velo;
			velo_dash=velo*cos* 1.5f;
			car->velocity[0]-=dx*velo_dash;
			car->velocity[2]-=dz*velo_dash;
    		car->position[0]+=dx*merikomi*0.5f;
    		car->position[2]+=dz*merikomi*0.5f;
		}
	}
	return(TRUE);
}

static void collision_check_routin_HACK(Player *car,Object *obj)
{
    int ans;
    short owner;
    float dx,dz,distance;

    Player *kart2;

    switch(obj->category)
    {
        case EGG:
        if(car->slip_flag&IS_BOO) {return;}
	    if(car->flag&IS_GHOST) {return;}
	    collision_egg(car,obj);
	    break;

        case BANANA:
        if((car->slip_flag&IS_BOO) != 0){return;};
        if(((car->slip_flag&IS_SPINNING_OUT) != 0) || ((car->slip_flag&SPINOUT_LEFT) != 0) || ((car->slip_flag&SPINOUT_RIGHT) != 0))
        {return;};
        if((car->weapon&HIT_BANANA) != 0){return;};
        owner=obj->angle[0];
        if((car-GlobalPlayer==owner)&&((obj->flag&MYOBJ) != 0)){return;};	 
	
    
        if((ans=CollisionSphere(car,obj)) == TRUE)
        {
            car->weapon=car->weapon|HIT_BANANA;

            kart2=(Player *)&GlobalPlayer[owner]; //check if banana owner is a player, then play sound
            if(kart2->flag&IS_PLAYER)
            {
		        if(obj->flag&0xf)
			    {
			        if(car-GlobalPlayer!=owner)
			        {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
			    }
		        else
                {
			        dx=obj->position[0]-kart2->position[0];
			        dz=obj->position[2]-kart2->position[2];
			        distance=dx*dx+dz*dz;
			        if(distance<(600*600))
                    {
			            if(car-GlobalPlayer!=owner)
			            {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
			        }
		        }    
            }
            kill_object(obj);
        }
        break;

        case GSHELL:
            if(((car->slip_flag&GSHELLHIT) == GSHELLHIT) || ((car->slip_flag&IS_BOO) == IS_BOO)){return;}
   	        if((car->weapon&HIT_GREENSHELL) == HIT_GREENSHELL){return;}
	        owner=obj->angle[2];
	        if((car-GlobalPlayer==owner) && ((obj->flag&MYOBJ) == MYOBJ)){return;}
		    if((ans=CollisionSphere(car,obj))==TRUE)
		    {
		        car->weapon=car->weapon|HIT_GREENSHELL;
	            NAEnmTrgStart(car->position,car->velocity,SE_KART_EXPLOSION);
			    kart2=(Player *)&GlobalPlayer[owner];
			    if(kart2->flag&IS_PLAYER)
			    {
			        if(car->kart!=owner)
			        {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
			    }
			    kill_object(obj);
		    }
	        break;

        case TSHELL:
   	        if(car->weapon&HIT_REDSHELL){return;}
	        owner=obj->angle[2];
	        if((car-GlobalPlayer==owner)&&(obj->flag&MYOBJ)){return;}
		    if((ans=CollisionSphere(car,obj))==TRUE)
		    {
			    if(!(car->slip_flag&IS_GHOST))
                {
   				    car->weapon=car->weapon|HIT_REDSHELL;
	                NAEnmTrgStart (car->position,car->velocity,SE_KART_EXPLOSION);
				}
			    kart2=(Player *)&GlobalPlayer[owner];
	       	    if(kart2->flag&IS_PLAYER)
                {
			        if(car->kart!=owner)
			        {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
			    }
			    if(car->kart==obj->counter)
                {
			        kill_object(obj);
			    }
		    }
	        break;

        case RSHELL:
            if(car->slip_flag&RSHELLHIT){return;}
   	        if(car->weapon&HIT_REDSHELL){return;}
	        owner=obj->angle[2];
	        if((car-GlobalPlayer==owner)&&(obj->flag&MYOBJ)){return;}
	
		    if((ans=CollisionSphere(car,obj))==TRUE)
		    {
			    if(!(car->slip_flag&IS_GHOST))
                {
   				    car->weapon=car->weapon|HIT_REDSHELL;
	                NAEnmTrgStart (car->position,car->velocity,SE_KART_EXPLOSION);
			    }
			    kart2=(Player *)&GlobalPlayer[owner];
	       		if(kart2->flag&IS_PLAYER)
                {
			        if(car->kart!=owner)
			        {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
			    }
			    kill_object(obj);
		    }
	        break;

        case PAKKUN:
            if(car->slip_flag&IS_BOO) {return;}
		    collision_pakkun(car,obj);
            break;

        case MKANBAN:
            if(car->slip_flag&IS_BOO) {return;}
		    collision_mkanban(car,obj);
            break;

        case TREE1:
	    case TREE2:
	    case TREE3:
	    case TREE4:
	    case TREE5:
        case TREE6:
	    case TREE7:
	    case TREE8:
	    case SABOTEN1:
	    case SABOTEN2:
	    case SABOTEN3:
	    case SNOWTREE:
	    case PALMTREE:
            if(car->slip_flag&IS_BOO) {return;}
		    collision_tree_HACK(car,obj);
            break;

        case IWA:
            if(car->slip_flag&IS_BOO) {return;}
			if(car->flag&IS_GHOST) {return;}

	        if((ans=CollisionSphere(car,obj))==TRUE)
            {
		        NAEnmTrgStart(obj->position,obj->velocity,SE_KART_EXPLOSION_BIG);
		        if(g_gameMode==1){lost_ghost=LOST_GHOST;};

		        if(car->slip_flag&IS_STAR){obj->velocity[1]=10.0f;}
		        else{set_broken(car,car-GlobalPlayer);}
	        }
	        break;
    
        case FAKEIBOX:
            if(car->slip_flag&IS_BOO) {return;}

	        owner=(short)obj->velocity[0];
	        if((car-GlobalPlayer==owner)&&(obj->flag&MYOBJ)) {return;}

	        if((ans=CollisionSphere(car,obj))==TRUE)
	        {
	            car->weapon=car->weapon|HIT_BOMB;
			    kart2=(Player *)&GlobalPlayer[owner];
			    if(kart2->flag&IS_PLAYER)
                {
				    if(obj->flag&0xf)
                    {
				        if(car->kart!=owner)
				        {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
				    }
				    else
                    {
				        dx=obj->position[0]-kart2->position[0];
				        dz=obj->position[2]-kart2->position[2];
				        distance=dx*dx+dz*dz;
				        if(distance<(600*600))
                        {
				            if(car->kart!=owner)
				            {NAPlyVoiceStart((uchar)(owner),(uint)((kart2->kart)*0x10+SE_VOICE_HIT));};
				        }
				    }
			    if(obj->sparam==0)
			    kart2->weapon&=(~USE_BANANA);
			    }
		        obj->sparam=2;          //destroy box into pieces
		        obj->flag=EXISTOBJ;     //other players can't hit box
		        obj->counter=0;         //reset
	        }
            break;

        case SIBOX: //moved from here...
        case HOOTINGBOX:
        case IBOX:
            if((ans=CollisionSphere(car,obj))==TRUE)
       		{
		        obj->sparam=3;          //destroy box into pieces
		        obj->flag=EXISTOBJ;     //other players can't hit box
		        obj->counter=0;         //reset
		        
                switch(obj->category) //...into here
                {
                    case IBOX:
                        if(car->flag&IS_PLAYER){RouletteStart(car-GlobalPlayer,0);}
                        break;

                    case SIBOX:
                        if(car->flag&IS_PLAYER){RouletteStart(car-GlobalPlayer,ib_bshell);}
                        break;

                    case HOOTINGBOX:
                        car->weapon=car->weapon|HIT_BOMB;
                        break;
                }        
		    }
		    else
		    {
		        if(obj->sparam==0)  
		        {	
                    obj->sparam=1;	 //Rise new box
	     		    obj->flag=EXISTOBJ;
		        }	
		    }
	        break;
    }
}


void collision_object_to_kart_HACK(void)
{

int     i,j;
int MAX_OBJECT = 100;
Player *kart;
Object *obj;

	for(i=0;i<8;i++)
	{
		kart = (0x800F6990 + (0xDD8 * i));
		if( ((GlobalPlayer[i].flag &EXISTS) == EXISTS) && ((GlobalPlayer[i].slip_flag &IS_SQUISHED) != IS_SQUISHED) )
		{
			reset_shadow_flag(kart);
			for(j=0;j<MAX_OBJECT;j++)
			{
			obj = (0x8015F9B8 + (0x70 * j));
			if(!(GlobalPlayer[i].slip_flag &IS_SQUISHED))
				{
				if((g_SimpleObjectArray[j].flag &EXISTOBJ) && (g_SimpleObjectArray[j].flag &HITOBJ))
	     			collision_check_routin_HACK(kart,obj);
				} 
			}
		 }
	}
}
