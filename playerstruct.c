#include "Struct.h"
typedef struct{
	unsigned short   flag;
	unsigned short   status;
	short    rank;
	unsigned short   point;
	short    rap;
	unsigned int   weapon;
	short    item;

	float  position[3];
	float  old_position[3];
    	short  direction[3];
	float  velocity[3];
	short    link_doshin;
	short    kage_ang;
	short  	 handling_flag;
	unsigned short   hit_flag;
	short    angle_y[4];
	short    angle_z[4];
	float  up_vector[3];
	float  gravity_xz[3];   //800F69FC

	float    radius;
	float    ground;

	short   sterrangle;
	short   shake_flag;
	int   	nowsterr;
	float   turbo_power;

	float	f_grip,r_grip;
	float   force;
	float   grip;
	float   speed,taco;  //F6A28


	float  	accelcount;
	float 	power_down,power;

	short   slipcount,sterr_count;
	short   offsetsterr_flag,old_direction,thunder_timer,spin_timer,offsetsterr_timer;
	unsigned short  talk;
	float 	offsetsterr_speed;
	unsigned int    slip_flag;
	short 	slipang,jumpcount;  //f6a60
	short   kartpitch; //f6a64
	short   erase;
	short   jugemu_timer;
	short   jugemu_flag;
	short 	roll[4],pitch[4];
	short   turbo_timer;
	unsigned short  water_flag;
	short 	bomb_timer,slipstream_timer;
	float   slipstream_power;

	float   maxadd_power;  //800F6A78
	float   jump,jmp_acc,jmp_speed;
	unsigned short  bump_status;
	short	sterracc; //////NOT USE

	float 	mass,gravity ;

	float  power_cont,shake;

	short  hitcount; //800f6a9c

	Bump	 bump;
	Matrix  align2;  //800F6aE0
	Matrix  align;

	Tire    tire_FL;//800F6B28
	Tire    tire_FR;
	Tire    tire_RL;
	Tire    tire_RR;

    float	mid_front,mid_rear;  //800F6B88
	int		chasesp_sterr;
	short   drift_count,kartroll;  //800F6B96
	float	allrear_grip,brake_time;
	float	max_power,acc_maxcount;
	float	spark_x,spark_z;
	short	chasepoint;
	unsigned short  hangflag;
	float 	offsetsize;// 800F6BB4
	short   stopsetrr_count,powerstack_count;
	float	old_speed,mid_left;
	short  	hit_sterr,roliover_time;
	short	broken_timer,drift_turbo_timer;
	float	mid_right;


	int 	tcol_count;  //800f6BD0
	unsigned short  dir[4],deg[4];
	unsigned short 	kart,wallhitcount;
	Smoke gass[10];
	Smoke smoke[10];
	Smoke letter[10];
	Smoke spark[10];

	Sus     sus;


}     CAR, *CARPTR;
