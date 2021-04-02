
typedef struct{
	ushort   flag;
	ushort   status;
	short    rank;
	ushort   point;
	short    rap;
	uint   weapon;
	short    item;

	FVector  position;
	FVector  old_position;
    SVector  direction;
	FVector  velocity;
	short    link_doshin;
	short    kage_ang;
	short  	 handling_flag;
	ushort   hit_flag;
	short    angle_y[4];
	short    angle_z[4];
	FVector  up_vector;
	FVector  gravity_xz;   //800F69FC

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
	ushort  talk;
	float 	offsetsterr_speed;
	uint    slip_flag;
	short 	slipang,jumpcount;  //f6a60
	short   kartpitch; //f6a64
	short   erase;
	short   jugemu_timer;
	short   jugemu_flag;
	short 	roll[4],pitch[4];
	short   turbo_timer;
	ushort  water_flag;
	short 	bomb_timer,slipstream_timer;
	float   slipstream_power;

	float   maxadd_power;  //800F6A78
	float   jump,jmp_acc,jmp_speed;
	ushort  bump_status;
	short	sterracc; //////NOT USE

	float 	mass,gravity ;

	float  power_cont,shake;

	short  hitcount; //800f6a9c

	BUMP	 bump;
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
	ushort  hangflag;
	float 	offsetsize;// 800F6BB4
	short   stopsetrr_count,powerstack_count;
	float	old_speed,mid_left;
	short  	hit_sterr,roliover_time;
	short	broken_timer,drift_turbo_timer;
	float	mid_right;


	int 	tcol_count;  //800f6BD0
	ushort  dir[4],deg[4];
	ushort 	kart,wallhitcount;
	GasSmoku gass[10];
	GasSmoku smoke[10];
	GasSmoku letter[10];
	GasSmoku spark[10];

	Sus     sus;


}     CAR, *CARPTR;
