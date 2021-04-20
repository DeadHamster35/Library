#ifndef STRUCT_H_
#define STRUCT_H_

typedef	float	RotateMtx[3][3];			/* 3x3 rotation matrix					*/
typedef 	float	AffineMtx[4][4];			/* 4x4 affine transformation matrix		*/
typedef 	float	Matrix[3][3];			/* 4x4 affine transformation matrix		*/

typedef unsigned char    uchar;
typedef unsigned short   ushort;
typedef unsigned int     uint;

typedef struct Bump{

	unsigned short 	flag_xy;
	unsigned short 	flag_yz;
	unsigned short 	flag_zx;

	unsigned short 	last_xy;
	unsigned short 	last_yz;
	unsigned short 	last_zx;

	float    			distance_xy;
	float    			distance_yz;	   
	float    			distance_zx;	   

	float  			bump_xy[3];
	float  			bump_yz[3];
	float  			bump_zx[3];

	int				dummy;

} Bump;

typedef struct Tire{
	float 			Position[3];
	unsigned char 		Status;			 //true =hit!!! false=not hit!!!
	unsigned char 		LastAxis;
	unsigned short 	LastPointer;
	float 			Height;
}    Tire;

typedef struct Smoke{
	float 			trx,try,trz;
	float 			scale;
	unsigned short 	lrflag,number;
	float 			type,dev;
	short 			flag,timer,ang;
	float 			fwork1,fwork2,fwork3,fwork4,fwork5;
	short 			swork1,swork2,swork3,swork4,swork5;
int 					dummy;
}Smoke;

typedef struct Sus{
	short 	flag,flag1; 
	float 	position,accele;
	short 	broken,jump_timer;  
	float 	jump_l,jump_firstspeed,jmp_acc_l;
	short 	gachon_timer,broken_timer; 
	float 	swing_firstspeed,gachon_firstspeed,bound_firstspeed,broken_firstspeed,y_grv;
	short 	bound_timer,swing_timer,swing_flag,bound,swing;
}Sus;


typedef struct Player{
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


} Player;


typedef struct Object{

	short	category;
	short	flag;
	short	counter;
	short	sparam;

	float   	fparam;
	float  	radius;

	short	angle[3];

	float 	position[3];
	float	velocity[3];

	Bump    	bump;

} Object;

typedef struct Controller{

	short			AnalogX;
	short			AnalogY;

	unsigned short		ButtonHeld;
	unsigned short		ButtonPressed;
	unsigned short		ButtonReleased;
	unsigned short  	AnalogHeld;
	unsigned short  	AnalogPressed;
	unsigned short  	AnalogReleased;

} Controller;

typedef struct Shake{
	float	cam_firstspeed,x2;
	short	cam_timer,aaaaaaa; 
	float	offset_look,z2,z3; 
}Shake;

typedef struct Camera {
	float 			camera_pos[3];
	float 			lookat_pos[3];
	float 			up_vector[3];
	short 			camera_direction[3];
	unsigned short   	flag;
	short   			chase_direction;
	float 			camera_vector[3];
	float 			lookat_vector[3];
	float 			velocity[3];   
	Bump	 			bump;
	Shake			shake;
	short    			old_chase_direction;	
	short    			watch,stickdeg;
	float    			screen_view_angle;
} Camera;

typedef struct Viewport{
	short	ScaleWidth;
	short	ScaleHeight;
	short	ScaleDepth;
	short	ScalePad;
	short	TranslateWidth;
	short	TranslateHeight;
	short	TranslateDepth;
	short	TranslatePad;
} Viewport;

typedef struct Screen{
	Controller	*cont;
	Camera	     *camera;
	Player	     *kart;
	AffineMtx		*matrix;
	Viewport		viewport;
	float 	   	screen_aspect;
	float      	screen_angle;
	short      	horizon;
	short      	pad;
	short      	width;
	short      	height;
	short	   	posx;
	short      	posy;
	short      	flag;
	short      	camera_direction;
	short      	camera_point;
} Screen;

typedef struct Marker{
	short 	Position[3];
	short	Group;
} Marker;

#endif