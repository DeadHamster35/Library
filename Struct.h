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
	int  			Dummy;              //0000 0000 0000 00001:KAGE ON
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
	unsigned short   flag; 					//800F6690 //Player, Comp, Ghost, Etc.
	unsigned short   status; 				//800F6692 //Kart DMA
	short    rank; 							//800F6694 //Current Rank
	unsigned short   point; 				//800F6696 //Current Points
	short    rap; 							//800F6698 //Current Lap
	unsigned int   weapon; 					//800F669C //Item Use & Item Hit Activators
	short    item; 							//800F66A0 //Current Item

	float  position[3];						//800F66A4 //Kart Position
	float  old_position[3];					//800F66B0 //Kart Previous Position
    short  direction[3];					//800F66BE //Kart Forward Direction
	float  velocity[3];						//800F66C4 //Kart Velocity
	short    link_doshin;					//800F66D0 //Indicator Which Thwomp Flattened Kart / Resets On Thwomp Animation Finish
	short    kage_ang;						//800F66D2 //Kart Shadow Rotation Angle (Only In Air)
	short  	 handling_flag; 				//800F69D4 //Control Flags & Trophy Scene Effects
	unsigned short   hit_flag;				//800F69D6 //Hit Flag For Walls, Enemies, Thwomps, Etc.
	short    angle_y[4];					//800F69D8 //Kart Angle Y
	short    angle_z[4];					//800F69E0 //Kart Angle X
	float  up_vector[3];					//800F69E0 //Kart Up Direction
	float  gravity_xz[3];   				//800F69F4 //Kart Gravity

	float    radius;						//800F6A00 //Kart Collision Radius
	float    ground;						//800F6A04 //Kart Shadow Height Position

	short   sterrangle;						//800F6A08 //Current Steering Angle
	short   shake_flag;						//800F6A0A //Kart Engine Shake Flag
	int   	nowsterr;						//800F6A0C //Steering Angle Input
	float   turbo_power;					//800F6A10 //Boost Acceleration

	float	f_grip,r_grip;					//800F6A14 //Kart Front Grip //800F6A18 // Kart Rear Grip
	float   force;							//800F6A1C //Kart Current Input Force Until Max Speed
	float   grip;							//800F6A20 //Kart Main Grip
	float   speed,taco;  					//800F6A24 //Kart Speedometer //800F6A28 //Kart Tachometer


	float  	accelcount;						//800F6A2C //Kart Acceleration
	float 	power_down,power;				//800F6A30 //Kart Downwards Acceleration //800F6A34 //Kart Power?

	short   slipcount,sterr_count;			//800F6A38 //Kart Tumble Timer (Counter) //800F6A3A // Kart Steering Counter?
	short   offsetsterr_flag,old_direction,thunder_timer,spin_timer,offsetsterr_timer;
	unsigned short  talk;  					//800F6A46 //Comic FX & Unset Speech Bubbles
	float 	offsetsterr_speed;
	unsigned int    slip_flag;				//800F6A4C //Kart State Effect Flags
	short 	slipang,jumpcount;  			//800F6A50 //Kart Angle //800F6A52 //Air Timer
	short   kartpitch; 						//800F6A64 //Kart Pitch
	short   erase;							//800F6A56 //Kart Transparency Effects
	short   jugemu_timer;					//800F6A58 //Lakitu Rescue Timer
	short   jugemu_flag; 					//800F6A5A //Lakitu Flags & Effects
	short 	roll[4],pitch[4];				//800F6A5C //Kart Roll //800F6A64 //Kart Pitch
	short   turbo_timer;					//800F6A5C //Boost State Timer
	unsigned short  water_flag;				//800F6A6E //Water & Splash Flag
	short 	bomb_timer,slipstream_timer; 	//800F6A70 //Item/Object Hit Tumble Bounce Counter //800F6A72 //Slipstream Timer
	float   slipstream_power;				//800F6A74 //Slipstream Acceleration

	float   maxadd_power;  					//800F6A78 //Drift Turbo Acceleration
	float   jump,jmp_acc,jmp_speed;			//800F6A7C //Jump //800F6A80 //Jump Acceleration //800F6A84 //Jump Speed
	unsigned short  bump_status; 			//800F6A88 //Current Surface
	short	sterracc; //////NOT USE			//800F6A8A //Steering Angle Input Short

	float 	mass,gravity ;					//800F6A8C //Kart Mass //800F6A90 //Kart Gravity

	float  power_cont,shake;				//800F6A94 //Acceleration Control? Unsure //800F6A98 //Kart Engine Shake Height

	short  hitcount; 						//800F6A9C //Kart Bonk Timer

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


typedef struct Hud{
		float				itemSize;
		float				rankSize;
		int					timeTotal;
		int					timeLap;
		int					timeLapUnsure; //not sure. Those are not numbered for lap1, lap2, lap3 I believe !!!
		int					timeTotal1;
		int					timeTotal2;
		int					timeTotal3;
		int					timeLap1;
		int					timeLap2;
		int					timeLap3;
		int					playerX;
		int					playerY;
		int					playerZ;
		unsigned int		statusFlag;
		short				timeBlink;
		short				speedmeterX;
		short				speedmeterY;
		short				itemX;
		short				itemY;
		short				itemX2;
		short				itemY2;
		short				numberRankX;
		short				numberRankY;
		short				timeX;
		short				timeX2;
		short				timeX3;
		short				timeX4;
		short				timeX5;
		short				timeY;
		short				lapX;
		short				lapX2;
		short				lapX3;
		short				lapY;
		short 				rankX;
		short				rankY;
		short				rankX2;
		short				rankY2;
		short				rank;
		short				bombX;
		short 				bombY;
		char				finlineAnim1;
		char				finlineAnim2;
		char				lapCount;
		char				hudSwitch;
		char				bombSight;
		char				ghostTimer;
		unsigned char		item1;
		unsigned char		item2;
		unsigned char		speedmeterAnim1;
		unsigned char		speedmeterAnim2;
		unsigned char		timeAnim1;
		unsigned char		timeAnim2;
		unsigned char		timeAnim3;
		unsigned char		lapAnim1;
		unsigned char		lapAnim2;
		unsigned char		lapAnim3;
		unsigned char		itemAnim;
		unsigned char		rankToggle;
} Hud;

typedef struct Lakitu{
		char		unknown;
		char		activeFlag; //busy
		short		unknown3;
		long		unknown4;
		long		unknown5;
		char      	pickupFlag;
		char		unknownFlag;
		char		reverseFlag;
		//much more
} Lakitu;

typedef struct Skycolor{
		short	R1,G1,B1,R2,G2,B2;
		short	dummy[120];
		short	R3,G3,B3,R4,G4,B4;
} Skycolor;

typedef struct Playercolor{
		short	R;
        short   dummy[7];
        short   G;
        short   dummy2[7];
        short   B;
        short   dummy3[7];
        short	D;
        short   dummy4[7];
        short   P;
        short   dummy5[7];
        short   Y;
} Playercolor;

#endif
