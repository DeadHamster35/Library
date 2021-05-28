#ifndef STRUCT_H_
#define STRUCT_H_

//Player Flag
#define MOTOR_ON	   		0x0010  
#define IS_BOMB      		0x0040
#define IS_GHOST			0x0100
#define IS_GP_OPENING		0x0200
#define IS_RACE_FINISH		0x0800
#define IS_CPU_PLAYER		0x1000
#define NO_CONTROLS			0x2000
#define IS_PLAYER			0x4000
#define EXISTS				0x8000

//Player Status Flag
#define P1_DMA_SPRITE		0x0001
#define P1_DRAW_SPRITE		0x0002
#define P1_FLIP_SPRITE		0x0004
#define P1_DRAW_PARTICLES	0x0008
#define P2_DMA_SPRITE		0x0010
#define P2_DRAW_SPRITE		0x0020
#define P2_FLIP_SPRITE		0x0040
#define P2_DRAW_PARTICLES	0x0080
#define P3_DMA_SPRITE		0x0100
#define P3_DRAW_SPRITE		0x0200
#define P3_FLIP_SPRITE		0x0400
#define P3_DRAW_PARTICLES	0x0800
#define P4_DMA_SPRITE		0x1000
#define P4_DRAW_SPRITE		0x2000
#define P4_FLIP_SPRITE		0x4000
#define P4_DRAW_PARTICLES	0x8000

//Player Weapon Flag
#define HIT_BANANA      	0x00000001
#define HIT_REDSHELL    	0x00000002
#define HIT_GREENSHELL  	0x00000004
#define PRESS_SAVESPIN		0x00000080  
#define PRESS_SQUISH    	0x00000100
#define USE_MUSHROOM    	0x00000200
#define USE_BOO				0x00000800
#define USE_FEATHER			0x00001000
#define USE_STAR            0x00002000
#define HIT_LIGHTNING      	0x00004000
#define PRESS_BOOSTJUMP	    0x00008000
#define HIT_TORNADO         0x00020000
#define USE_BANANA	        0x00040000
#define HIT_BOAT			0x00080000 
#define HIT_CRITTER			0x00200000
#define HIT_BOMB			0x00400000
#define PRESS_BOOSTPAD		0x00800000
#define HIT_BOMB_THROW		0x01000000
#define USE_STARTDASH		0x02000000
#define PRESS_BECOME_BOMB	0x04000000
#define PRESS_IS_BOMB		0x08000000
#define PRESS_STARTSPIN		0x10000000

//Player Handling Flag
#define    REVERSE_GEAR		0x0001
#define    STEER_RIGHT		0x0002
#define    STEER_LEFT		0x0004
#define    REVERSE_ACCEL	0x0008
#define    CPU_SIMPLE_KART	0x0010
#define    ACCELERATE		0x0020
#define    START_SPIN_RIGHT	0x0040
#define    START_SPIN_LEFT	0x0080
#define    LANDING_DUST		0x0100
#define    BOO_SMOKE_EFFECT	0x0200
#define    TROPHYJUMP_START	0x0400
#define    TROPHYJUMP_END	0x0800
#define    TROPHYJUMP_STARS	0x1000
#define    TROPHYJUMP_KEEP	0x2000
#define    SPINOUT_SWERVE	0x4000
#define    BALLOON_CUT		0x8000

//Player Talk Flag
#define MUSIC_NOTE			0x0020
#define CRASH				0x0040
#define WHIRRR				0x0080
#define POOMP     			0x0100
#define BOING				0x0800
#define FLASH				0x1000

//Player Slip Flag
#define IS_BRAKING	 		0x00000001
#define IS_JUMPING 			0x00000002
#define IS_BOOSTJUMP_ZONE	0x00000004
#define IS_IN_AIR 			0x00000008
#define IS_DRIFTING			0x00000010
#define IS_AB_SPINNING		0x00000020
#define SPINOUT_RIGHT 		0x00000040
#define SPINOUT_LEFT 		0x00000080
#define IS_DRIFT_BOOSTING	0x00000100   
#define IS_STAR 			0x00000200    
#define IS_TUMBLING			0x00000400
#define IS_SPINNING_OUT		0x00000800  
#define ON_CENTER_LINE		0x00001000 
#define IS_TURBO_BOOSTING	0x00002000
#define IS_START_SPINNING	0x00004000  
#define IS_BONKING      	0x00008000
#define IS_WALL_TUMBLING  	0x00010000   
#define LIGHTNING_SPIN		0x00020000
#define DISABLE_SPIN	 	0x00040000
#define IS_FEATHER_JUMPING	0x00080000
#define IS_BOOST_JUMPING	0x00100000
#define IS_SLIP_STREAMING	0x00200000
#define IS_WRONG_WAY		0x00400000    
#define IS_TORNADO_JUMPING	0x00800000
#define IS_VERTICAL_HIT		0x01000000  
#define IS_MOMENTUM_HIT		0x02000000
#define IS_SQUISHED			0x04000000
#define IS_UNSQUISHED		0x08000000
#define IS_HEIGHT_JUMPING	0x10000000		
#define IS_DRIFT_STEERING	0x20000000
#define IS_LIGHTNING_HIT	0x40000000
#define IS_BOO				0x80000000

//Player Jugemu (Lakitu) Flag
#define IS_IN_WATER			0x0001
#define ON_LAKITU_ROD 		0x0002
#define IS_FADING_OUT		0x0004	
#define OUT_OF_BOUNDS  		0x0008
#define IS_FROZEN      		0x0010
#define IS_MELTING 			0x0020
#define IS_ALL_MELTING		0x0040
#define HAS_ICE_CUBE		0x0080
#define LAKITU_CAMERA  		0x0100
#define LAVA_EFFECT   		0x1000
#define WATER_EFFECT		0x2000

//Player Water Flag
#define SUBMERGED		0x0001
#define HALF_SUBMERGED	0x0002
#define SPLASH_START 	0x0004
#define SPLASH_DIVE  	0x0008


typedef	float	RotateMtx[3][3];			/* 3x3 rotation matrix					*/
typedef 	float	AffineMtx[4][4];			/* 4x4 affine transformation matrix		*/
typedef 	float	Matrix[3][3];			/* 4x4 affine transformation matrix		*/

typedef unsigned char    	uchar;
typedef unsigned short   	ushort;
typedef unsigned int     	uint;
typedef long long			int64;
typedef unsigned long long	uint64;

typedef struct Bump{

	unsigned short 	flag_xy;
	unsigned short 	flag_yz;
	unsigned short 	flag_zx;

	unsigned short 	last_xy;
	unsigned short 	last_yz;
	unsigned short 	last_zx;

	float    		distance_xy;
	float    		distance_yz;	   
	float    		distance_zx;	   

	float  			bump_xy[3];
	float  			bump_yz[3];
	float  			bump_zx[3];

	int				dummy;

} Bump;

typedef struct Tire{
	float 			Position[3];			//Tire Location
	unsigned char 	Status;					//Tire Surface
	unsigned char 	LastAxis;
	unsigned short 	LastPointer;
	float 			Height;
	int  			Dummy;					//0000 0000 0000 00001:KAGE ON
} Tire;

typedef struct Smoke{
	float 			trx,try,trz;						//Particle Location[3]
	float 			scale;								//Particle Scale
	unsigned short 	lrflag,number;						//Left-Right Flag (Left=1;Right=0) //Case Number Flag
	float 			type,dev;							//Particle Type //Dev? (Left-Right Flipped?)
	short 			flag,timer,ang;						//On-Off Flag //Destroy Timer //Particle Angle
	float 			fwork1,fwork2,fwork3,fwork4,fwork5;	//Animation Values?
	short 			swork1,swork2,swork3,swork4,swork5;	//Color Value[3] //Alpha //Dithering Noise
	int 			dummy;
} Smoke;

typedef struct Sus{
	short 	flag,flag1; 
	float 	position,accele;
	short 	broken,jump_timer;  
	float 	jump_l,jump_firstspeed,jmp_acc_l;
	short 	gachon_timer,broken_timer; 
	float 	swing_firstspeed,gachon_firstspeed,bound_firstspeed,broken_firstspeed,y_grv;
	short 	bound_timer,swing_timer,swing_flag,bound,swing;
} Sus;


typedef struct Player{
	unsigned short   flag; 					//800F6990 //Player, Comp, Ghost, Etc.
	unsigned short   status; 				//800F6992 //Kart DMA
	short    rank; 							//800F6994 //Current Rank
	unsigned short   point; 				//800F6996 //Current Points
	short    rap; 							//800F6998 //Current Lap
	unsigned int   weapon; 					//800F699C //Item Use & Item Hit Activators
	short    item; 							//800F69A0 //Current Item

	float  position[3];						//800F69A4 //Kart Position
	float  old_position[3];					//800F69B0 //Kart Previous Position
    short  direction[3];					//800F69BE //Kart Forward Direction
	float  velocity[3];						//800F69C4 //Kart Velocity
	short    link_doshin;					//800F69D0 //Indicator Which Thwomp Flattened Kart / Resets On Thwomp Animation Finish
	short    kage_ang;						//800F69D2 //Kart Shadow Rotation Angle (Only In Air)
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
	short   turbo_timer;					//800F6A6C //Boost State Timer
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
	float	max_power,acc_maxcount;			//800F6BA0 //Max Power? //800F6BA4 //Max Acceleration
	float	spark_x,spark_z;
	short	chasepoint;						//800F6BB0 //Path Point for Lakitu Placement
	unsigned short  hangflag;				//800F6BB2 //Lakitu Rescue Flag
	float 	offsetsize;// 800F6BB4
	short   stopsetrr_count,powerstack_count;
	float	old_speed,mid_left;
	short  	hit_sterr,roliover_time;
	short	broken_timer,drift_turbo_timer;
	float	mid_right;


	int 	tcol_count;  //800f6BD0
	unsigned short  dir[4],deg[4];
	unsigned short 	kart,wallhitcount;		//800F6BE4 //Character //800F6BE6 //Timer Wallhit
	Smoke gass[10];
	Smoke smoke[10];
	Smoke letter[10];						//800F7188 //[1] Comic FX //800F71D0 //[2] Speech Bubble
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

//Lakitu Animation Bit Flag
#define ANM_PLAYING			0x00002000
#define ANM_REVERSE			0x00004000

//Lakitu Alpha Bit Flag
#define ANM_ALPHA_VISIBLE	0x00000001
#define ANM_ALPHA_DITHER	0x00000002

//Lakitu Event Flag
#define LAKITU_START		1
#define LAKITU_GOAL			2
#define LAKITU_RESCUE		3
#define LAKITU_LAP2			4
#define LAKITU_LAPFINAL		5
#define LAKITU_REVERSE		6

typedef struct AnmObject_Lakitu{
		float		scale;
		float		pos[3];
		float		pos_offset[3];
		float		unknown[3];
		float		pos_anm_offset[3];
		float		unknown2[3];
		float		unknown3[4];
		unsigned long	anm_start_counter;
		long      	anm_bit_flag;
		long      	alpha_bit_flag;
		long		unknown4;
		long		colormode_copy;
		long		image_address_ptr;
		long		colormode;
		long		image_address_offset;
		long		unknown5;
		long		render_mode;
		long		unknown6;
		long		unknown_ptr;
		long		unknown_ptr2;
		float		unknown7[4];
		long      	status_flag;
		unsigned short	movement_counter;
		short      	movement_offset_counter;
		long		unknown8;
		ushort		alpha_dither;
		short		unknown9;
		long      	anm_progress_counter;
		long      	unknown_counter;
		short      	unknown10;
		short      	movement_offset_flag;
		short      	unknown11;
		short      	unknown12;
		short      	angle;
		short      	unknown13;
		float		unknown14[4];
		long      	active_flag;
		char      	anm_state_countdown;
		short      	unknown15;
		short      	unknown16;
		char      	anm_frame_count;
		char      	anm_frame_count_copy;
		short      	unknown17;
		short      	unknown18;
		char      	event_flag;
		char      	anm_frame_offsetX;
		char      	anm_frame_offsetY;
		long      	unknown_state_flag;
} AnmObject_Lakitu;

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


typedef struct Stats{

	float 	FGrip[5][8];
	float 	*FGripPointer[5];
	float 	RGrip[5][8];
	float	*RGripPointer[5];
	float 	MaxPower[5][8];
	float	*MaxPowerPointer[5];
	float 	AccelerationCount[5][8];
	float	*AccelerationCountPointer[5];

	float 	Mass[8];
	float	Gravity[8];
	float	Friction[8];
	float	MaxSpeed[8];
	float	Radius[8];

	float 	SlipDownFT[8][15];
	float 	SlipDownRT[8][15];
	float	*SlipDownRTPointer[8];
	float	*SlipDownFTPointer[8];

	float 	PowerDownFT[8][15];
	float 	PowerDownRT[8][15];
	float	*PowerDownRTPointer[8];
	float	*PowerDownFTPointer[8];

	float	Acceleration[8][10];
	float	*AccelerationPointer[8];

	float	Brake[8][15];
	float	*BrakePointer[8];

	float	SlipAngle[8][15];
	float	*SlipAnglePointer[8];

	float	SteerSpeed[8][15];
	float	*SteerSpeedPointer[8];

	float	ProOffsetAngle[8];
	float	SteerSpeedReturn[8];
	float 	KartSteerLoss[8];
	float	PowerRecover[8];
	float	PowerBandAcceleration[8];

	float	DriftKartFSpeed[8];
	float	DriftKartAcceleration[8];
	float	WingKartFSpeed[8];
	float	WingKartAcceleration[8];
	float	StormKartFSpeed[8];
	float	StormKartAcceleration[8];
	float	RollKartFSpeed[8];
	float	RollKartAcceleration[8];
	float	HeightJumpKartFSpeed[8];
	float	HeightJumpKartAcceleration[8];

	int AccelerationOnOffFlag[8];
	int AccelerationIncFlag[8];
	int AccelerationTime[8];
	int AccelerationFlag[8];
	int PowerBandAccelerationInt[8];
	int PowerBandTimer[8];

	int BrakeOnOffFlag[8];
	int BrakeIncFlag[8];
	int BrakeTimer[8];
	int BrakeFlag[8];
	int FullBrakeAccelerationInt[8];
	int FullBrakeTimer[8];

	
} Stats;

typedef struct POSXY{
    short x,y;
    short dummy1,dummy2;
} POSXY;


typedef struct PlayerTextureTable{
	uint		TextureOffset[8];
} PlayerTextureTable;

typedef struct ObjBlock{
    int kind;
    int pattern,pattern2;
    int disp_x,disp_y;
    char pri,disp_on;
    int sd_number;//seq_data_number
    int work1,work2;
    float workf1;
} ObjBlock;

#endif
