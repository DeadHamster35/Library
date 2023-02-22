#ifndef STRUCT_H_
#define STRUCT_H_

#include "MainInclude.h"

//LakituRaceSequence
#define LAKITU_RACE_START 		1
#define LAKITU_RACE_APPROACH 		2
#define LAKITU_RACE_RACING		3
#define LAKITU_RACE_FINISH		4
#define LAKITU_RACE_VICTORYLAP	5

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

//Bomb Types
#define BOMBNULL		0
#define BOMBROTATEL		1
#define BOMBROTATER		2
#define BOMBSTOP		3


//Water Types
#define ZWATER		0
#define ZVOID		1
#define ZLAVA		2
#define ZICE		3



#define JR		0x03E00008

typedef float	Vector[3];			/* 	3 floats	*/
typedef short	SVector[3];			/* 	3 shorts	*/
typedef	float	RotateMtx[3][3];			/* 3x3 rotation matrix					*/
typedef 	float	AffineMtx[4][4];			/* 4x4 affine transformation matrix		*/
typedef 	float	Matrix[3][3];			/* 4x4 affine transformation matrix		*/

typedef unsigned char    	uchar;
typedef unsigned short   	ushort;
typedef unsigned int     	uint;
typedef long long			int64;
typedef unsigned long long	uint64;


typedef struct {
    int type;
    int pattern;
    int pos_x,pos_y;
} OBJBlock;

typedef struct Bump //size 0x40
{ 
	ushort 	flag_xy;		//00
	ushort 	flag_yz;		//02
	ushort 	flag_zx;		//04
	ushort 	last_xy;		//06
	ushort 	last_yz;		//08
	ushort 	last_zx;		//0A
	float   distance_xy;	//0C
	float   distance_yz;	//10
	float   distance_zx;	//14
	float   bump_xy[3];		//18 1C 20
	float   bump_yz[3];		//24 28 2C
	float   bump_zx[3];		//30 34 38
	int	    dummy;  		//3C
} Bump;

typedef struct Tire //size: 0x18 * [4] | inside player struct
{
	float 			Position[3];	//00 04 08 Tire Location
	unsigned char 	Status;			//0C Tire Surface
	unsigned char 	LastAxis;		//0D
	ushort 			LastPointer;	//0E
	float 			Height;			//10
	int  			Dummy;			//14 0000 0000 0000 00001:KAGE ON	
} Tire;

typedef struct Smoke //size: 0x48
{
	float 			trx,try,trz;						//00 04 08 Particle Location[3]
	float 			scale;								//0C Particle Scale
	ushort 			lrflag,number;						//10 12 Left-Right Flag (Left=1;Right=0) //Case Number Flag
	float 			type,dev;							//14 18 Particle Type //Dev? (Left-Right Flipped?)
	short 			flag,timer,ang;						//1C 1E 20 On-Off Flag //Destroy Timer //Particle Angle
	//align short
	float 			fwork1,fwork2,fwork3,fwork4,fwork5;	//24 28 2C 30 34 Animation Values?
	short 			swork1,swork2,swork3,swork4,swork5;	//38 3A 3C 3E 40 Color Value[3] //Alpha //Dithering Noise
	//align short										
	int 			dummy;								//44		
} Smoke;

typedef struct Sus // size: 0x40
{	
	short 	flag,flag1; 							//00 02 
	float 	position, accele;						//04 08
	short 	broken, jump_timer;  					//0C 0E
	float 	jump_l, jump_firstspeed, jmp_acc_l;		//10 14 18
	short 	gachon_timer, broken_timer; 			//1C 1E
	float 	swing_firstspeed, gachon_firstspeed,	//20 24
	        bound_firstspeed, broken_firstspeed, 	//28 2C
			y_grv;									//30
	short 	bound_timer, swing_timer,				//34 36
	        swing_flag, bound, swing;				//38 3A 3C
} Sus;

//Custom bit flags example
typedef struct USbit //16 bit
{
    	//8 bit:
	ushort 	offroad : 1;
	ushort 	bot : 1;
	ushort 	superRival : 1;
	ushort 	noTireDMA : 1;	
	ushort 	megaRival : 1;
	ushort 	autopilot : 1;
	ushort 	r5 : 1;
	ushort 	r6 : 1;
	
	//8 bit:
	ushort 	r7 : 1;
	ushort 	r8 : 1;
	ushort 	r9 : 1;
	ushort 	realKart : 5; //2^5 = 32 possibilites/max
} USbit;

//MARK: - Player
typedef struct Player // size: 0xDD8 | location:  0x800F6990 | 0x800F7768 | 0x800F8540 | 0x800F9318 | 0x800FA0F0 | 0x800FAEC8 | 0x800FBCA0 | 0x800FCA78
{ 
	ushort  flag; 							//00 800F6990 //Player, Comp, Ghost, Etc.
	ushort  status; 						//02 800F6992 //Kart DMA
	short   rank; 							//04 800F6994 //Current Rank
	ushort  point; 						//06 800F6996 //Current Points
	short  	rap; 							//08 800F6998 //Current Lap
	USbit 	hoot_flag; //custom	0A 800F699A makes use of empty alignment short
	uint	weapon; 					//0C 800F699C //Item Use & Item Hit Activators
	short   item; 							//10 800F69A0 //Current Item
	uchar 	hamp_flag; //custom	12 800F69A2 makes use of empty alignment short
	uchar 	hamp_flag_old;
	float  	position[3];						//14 18 1C 800F69A4 //Kart Position
	float  	old_position[3];					//20 24 28 800F69B0 //Kart Previous Position
    short  	direction[3];					//2C 2E 30 800F69BC //Kart Forward Direction
	ushort 	litro_flag; //custom 32 800F69C2 makes use of empty alignment short
	float  	velocity[3];						//34 38 3C 800F69C4 //Kart Velocity
	short   link_doshin;					//40 800F69D0 //Indicator Which Thwomp Flattened Kart / Resets On Thwomp Animation Finish
	short   kage_ang;						//42 800F69D2 //Kart Shadow Rotation Angle (Only In Air)
	short  	handling_flag; 				//44 800F69D4 //Control Flags & Trophy Scene Effects
	ushort  hit_flag;						//46 800F69D6 //Hit Flag For Walls, Enemies, Thwomps, Etc.
	short   angle_y[4];					//48 4A 4C 4E 800F69D8 //Kart Angle Y
	short   angle_z[4];					//50 52 54 56 800F69E0 //Kart Angle X
	float  	up_vector[3];					//58 5C 60 800F69E8 //Kart Up Direction
	float  	gravity_xz[3];   				//64 68 6C 800F69F4 //Kart Gravity
	float   radius;						//70 800F6A00 //Kart Collision Radius
	float   ground;						//74 800F6A04 //Kart Shadow Height Position
	short   sterrangle;						//78 800F6A08 //Current Steering Angle
	short   shake_flag;						//7A 800F6A0A //Kart Engine Shake Flag
	int   	nowsterr;						//7C 800F6A0C //Steering Angle Input
	float   turbo_power;					//80 800F6A10 //Boost Acceleration
	float	f_grip,r_grip;					//84 88 800F6A14 //Kart Front Grip //800F6A18 // Kart Rear Grip
	float   force;							//8C 800F6A1C //Kart Current Input Force Until Max Speed
	float   grip;							//90 800F6A20 //Kart Main Grip
	float   speed,taco;  					//94 98 800F6A24 //Kart Speedometer //800F6A28 //Kart Tachometer
	float  	accelcount;						//9C 800F6A2C //Kart Acceleration
	float 	power_down,power;				//A0 A4 800F6A30 //Kart Downwards Acceleration //800F6A34 //Kart Power?
	short   slipcount,sterr_count;			//A8 AA 800F6A38 //Kart Tumble Timer (Counter) //800F6A3A // Kart Steering Counter?
	short   offsetsterr_flag;				//AC
	short	old_direction;					//AE
	short	thunder_timer;					//B0
	short 	spin_timer;						//B2 800F6A42
	short	offsetsterr_timer;				//B4
	ushort  talk;  							//B6 800F6A46 //Comic FX & Unset Speech Bubbles
	float 	offsetsterr_speed;				//B8 
	unsigned int    slip_flag;				//BC 800F6A4C //Kart State Effect Flags
	short 	slipang,jumpcount;  			//C0 C2 800F6A50 //Kart Angle //800F6A52 //Air Timer
	short   kartpitch; 						//C4 800F6A64 //Kart Pitch
	short   erase;							//C6 800F6A56 //Kart Transparency Effects
	short   jugemu_timer;					//C8 800F6A58 //Lakitu Rescue Timer
	short   jugemu_flag; 					//CA 800F6A5A //Lakitu Flags & Effects
	short 	roll[4],pitch[4];				//CC CE D0 D2 | D4 D6 D8 DA 800F6A5C //Kart Roll //800F6A64 //Kart Pitch
	short   turbo_timer;					//DC 800F6A6C //Boost State Timer
	ushort  water_flag;						//DE 800F6A6E //Water & Splash Flag
	short 	bomb_timer,slipstream_timer; 	//E0 E2 800F6A70 //Item/Object Hit Tumble Bounce Counter //800F6A72 //Slipstream Timer
	float   slipstream_power;				//E4 800F6A74 //Slipstream Acceleration
	float   maxadd_power;  					//E8 800F6A78 //Drift Turbo Acceleration
	float   jump,jmp_acc,jmp_speed;			//EC F0 F4 800F6A7C //Jump //800F6A80 //Jump Acceleration //800F6A84 //Jump Speed
	ushort  bump_status; 					//F8 800F6A88 //Current Surface
	short	sterracc; //////NOT USE			//FA 800F6A8A //Steering Angle Input Short
	float 	mass,gravity ;					//FC 100 800F6A8C //Kart Mass //800F6A90 //Kart Gravity
	float  power_cont,shake;				//104 108 800F6A94 //Acceleration Control? Unsure //800F6A98 //Kart Engine Shake Height
	short  hitcount; 						//10C 800F6A9C //Kart Bonk Timer
	//empty short? triclon_flag
	Bump	 bump;							//110
	Matrix  align2;  						//150 800F6aE0
	Matrix  align;							//174
	Tire    tire_FL;						//198 800F6B28 0x18
	Tire    tire_FR;						//1B0
	Tire    tire_RL;						//1C8
	Tire    tire_RR;						//1E0
    float	mid_front,mid_rear;  			//1F8 1FC 800F6B88 800F6B8C
	int		chasesp_sterr;					//200 800F6B90
	short   drift_count,kartroll;  			//204 206 800F6B94 800F6B96
	float	allrear_grip,brake_time;		//208 20C
	float	max_power,acc_maxcount;			//210 214 800F6BA0 Max Power? //800F6BA4 Max Acceleration
	float	spark_x,spark_z;				//218 21C
	short	chasepoint;						//220 800F6BB0 //Path Point for Lakitu Placement
	ushort  hangflag;						//222 800F6BB2 //Lakitu Rescue Flag
	float 	offsetsize;							//224 800F6BB4
	short   stopsetrr_count,powerstack_count; 	//226 228 800F6BB8 800F6BBA
	float	old_speed,mid_left;					//22C 230
	short  	hit_sterr,roliover_time;			//234 236
	short	broken_timer,drift_turbo_timer;		//238 23A
	float	mid_right;							//23C
	int 	tcol_count;  						//240 800f6BD0
	ushort  dir[4],deg[4];						//244 246 248 24A | 24C 24E 250 252 800F6BD4
	ushort 	kart,wallhitcount;					//254 256 800F6BE4 Character MA,LU,YO,TO,DK,WA,PE,BO //800F6BE6 Timer Wallhit
	Smoke gass[10];							//258 800F6BE8
	Smoke smoke[10];						//528 800F6EB8
	Smoke letter[10];						//7F8 800F7188 //[1] Comic FX //800F71D0 //[2] Speech Bubble
	Smoke spark[10];						//AC8 800F7458
	Sus     sus;							//D98 800F7728
} Player;



typedef struct Object{ //size: 0x70
	short	category;		//0
	short	flag;			//2
	short	counter;		//4
	short	sparam;			//6
	float   fparam;			//8
	float  	radius;			//c
	short	angle[3];		//10 12 14
	//alignment short
	float 	position[3];	//18 1c 20
	float	velocity[3];	//24 28 2c
	Bump    bump;			//30
} Object;

typedef struct EnemyItem //SIZE: 8* 0x10 = 0x80 | LOCATION: 801642D8 | 801642E8 | 801642F8 | 80164308 | 80164318 | 80164328 | 80164338 | 80164348
{   
	short	item_num;		//0
	short	obj_num;		//2
	short	time;			//4
	short	limit;			//6
	short	count1;			//8
	short	count2;			//A
	short	count3;			//C
	short	count4;			//E
}EnemyItem;

typedef struct GpResult //size: 0x20 | location: 0x802874D8
{
	short mode;			//00 802874D8 result mode 
	//empty short
	long  timer;		//04 802874DC result_timer 
	long  total_timer;	//08 802874E0 result_timer 
	long  timeend;		//0C 802874E4 timeend 		
	long  pos[3];		//10 802874E8
	char  carmove;		//1C 802874F4 move along trophy path
	char  rank;			//1D 802874F5 result rank 0,1,2,3 			| equals player num in trophy	   
	uchar  kart;		//1E 802874F6 result rank 0,1,2,3,4,5,6,7 
	// empty char
} GpResult;

typedef struct RSPTask{
		OSTask 		task;
		OSMesgQueue	*msgQ;
		OSMesg		msg;
		int 		status;
		int		pad;
}RSPTask;
typedef struct Dynamic{
	Mtx	projection;
	Mtx	projection1;
	Mtx	projection2;
	Mtx	projection3;
	Mtx	projection4;
	Mtx	projection5;
	Mtx	light;
	Mtx	viewing;
	Mtx	viewing1;
	Mtx	viewing2;
	Mtx	viewing3;
	Mtx	modeling[800];
	Mtx	objectmodeling[128];
	Mtx	kagemodeling[8*4];
	Mtx     kmodeling[8*4];
	Mtx effectmodeling[660];	
	Mtx	tmodeling[4];
	Gfx	glist[7500];
	RSPTask rsptask;
} Dynamic;

typedef struct Controller //size: 0x10 * [8] = 0x80 | location: 0x800F6910
{
	short		AnalogX;			//00 
	short		AnalogY;			//02 
	ushort		ButtonHeld;			//04 
	ushort		ButtonPressed;		//06 
	ushort		ButtonReleased;		//08 
	ushort  	AnalogHeld;			//0A 
	ushort  	AnalogPressed;		//0C 
	ushort  	AnalogReleased;		//0E 
} Controller;

typedef struct Shake //size 0x18
{ 
	float		cam_firstspeed,x2; //00 04 80164784
	short		cam_timer,aaaaaaa; //08 0A 8016478C
	float		offset_look,z2,z3; //0C 10 14 80164790
}Shake;

typedef struct Camera //size 0xB8 * 4 = 0x2E0 | location: 0x801646F0 - 0x801649D0 (801646F0, 801647A8, 80164860, 80164918)
{ 
	float 		camera_pos[3];			//00 04 08 801646F0
	float 		lookat_pos[3];			//0C 10 14 801646FC
	float 		up_vector[3];			//18 1C 20 80164708
	ushort 		camera_direction[3];	//24 26 28 80164714
	ushort  	flag;					//2A 8016471A
	short   	chase_direction;		//2C 8016471C
	//alignment short					//2E 8016471E
	float 		camera_vector[3];		//30 34 38 80164720
	float 		lookat_vector[3];		//3C 40 44 8016472C
	float 		velocity[3];   			//48 4C 50 80164738
	Bump		bump;					//50 80164744
	Shake		shake;					//94 80164784
	short   	old_chase_direction;	//AC 8016479C
	short   	watch,stickdeg;			//AE 8016479E
	//alignment short					//B2 801647A2
	float   	screen_view_angle;		//B4 801647A4
} Camera;

typedef struct Viewport //size: 0x10 | location: inside screen struct
{ 
	short		ScaleWidth;			//00 8015F490
	short		ScaleHeight;		//02 8015F492
	short		ScaleDepth;			//04 8015F494
	short		ScalePad;			//06 8015F496
	short		TranslateWidth;		//08 8015F498
	short		TranslateHeight;	//0A 8015F49A
	short		TranslateDepth;		//0C 8015F49C
	short		TranslatePad;		//0E 8015F49E
} Viewport;

typedef struct Screen //size: 0x40 * 4 = 0x100 | location: 0x8015F480 - 0x8015F580 (8015F4C0,8015F500,8015F540)
{
	Controller	*cont;				//00 8015F480
	Camera	    *camera;			//04 8015F484
	Player	    *kart;				//08 8015F488
	AffineMtx	*matrix;			//0C 8015F48C
	Viewport	viewport;			//10 8015F490
	float 	   	screen_aspect;		//20 8015F4A0
	float      	screen_angle;		//24 8015F4A4
	short      	horizon;			//28 8015F4A8
	short      	pad;				//2A 8015F4AA
	short      	width;				//2C 8015F4AC
	short      	height;				//2E 8015F4AE
	short	   	posx;				//30 8015F4B0
	short      	posy;				//32 8015F4B2
	short      	flag;				//34 8015F4B4
	short      	camera_direction;	//36 8015F4B6
	short      	camera_point;		//38 8015F4B8
	//3 alignment shorts			//3A 3C 3E
} Screen;

typedef struct Marker{
	short 	Position[3];
	short	Group;
} Marker;



typedef unsigned long Hierarchy;

typedef struct AnimeRecord{
	short			attr;
	short			code;
	short			start;
	short			loop;
	short			anime_frame;
	short			skeleton_total;
	short		   	*param;
	unsigned short 	*table;
} AnimeRecord,*AnimePtr;


typedef struct Hud	//size: 0x84 | location: 8018CA70 8018CAF4 8018CB78 8018CBFC				| orig:	kwlap struct
{
    float   	is;             // 00 8018CA70 item scaling 
    float   	rs;             // 04 8018CA74 rank scale 
    int     	totaltime;      // 08 8018CA78 total time 
    int     	laptime;        // 0c 8018CA7C lap time 
    int     	gettime;        // 10 8018CA80 get lap time 
    int     	timebuf[3];     // 14 8018CA84 total time buffer 
    int     	laptimebuf[3];  // 20 8018CA90 lap time buffer 
    int     	plx;            // 2c 8018CA9C player position X 
    int     	ply;            // 30 8018CAA0 player position Y 
    int     	plz;            // 34 8018CAA4 player position Z 
    uint    	flag;           // 38 8018CAA8 status flag 
    short   	flashtm;        // 3c 8018CAAC flash timer 
    short   	mx;             // 3e 8018CAAE speedmeter x  
    short   	my;             // 40 8018CAB0 speedmeter y
    short   	ix;             // 42 8018CAB2 item x
    short   	iy;             // 44 8018CAB4 item y
    short   	addix;          // 46 8018CAB6 item x
    short   	addiy;          // 48 8018CAB8 item y
    short   	px;             // 4a 8018CABA player number rank x
    short   	py;             // 4c 8018CABC player number rank y
    short   	tx[5];          // 4e 8018CABE lap time x 
    short   	ty;             // 58 8018CAC8 lap time y
    short   	cx;             // 5a 8018CACA lap count x
    short   	cx2;            // 5c 8018CACC lap count x
    short   	cx3;            // 5e 8018CACE lap count x
    short   	cy;             // 60 8018CAD0 lap count y 
    short   	rx;             // 62 8018CAD2 rank x 
    short   	ry;             // 64 8018CAD4 rank y
    short   	rgx;            // 66 8018CAD6 rank goal x 
    short   	rgy;            // 68 8018CAD8 rank gaol y 
    short   	rank;           // 6a 8018CADA ranking 
    short   	bombx;          // 6c 8018CADC bomb kart panel x 
    short   	bomby;          // 6e 8018CADE bomb kart panel y 
    char    	goalsw;         // 70 8018CAE0 (0,1,2,3) 
    char    	goal;           // 71 8018CAE1 (0,1,2,3) 
    char    	lapcnt;         // 72 8018CAE2 lap counter (0,1,2)
    char    	dispsw;         // 73 8018CAE3 display (on/off) switch 
    char    	bomb;           // 74 8018CAE4 if bomb near    
    char    	ghostcnt;       // 75 8018CAE5 kinoko item count 
    uchar   	item;           // 76 8018CAE6 special item get 
    uchar   	sp_item;        // 77 8018CAE7 special item get 
    uchar   	mptr;           // 78 8018CAE8 speed meter chart pointer 
    uchar   	hptr;           // 79 8018CAE9 speed meter hari chart pointer 
    uchar   	tptr;           // 7a 8018CAEA lap time chart pointer 
    uchar   	tptr2;          // 7b 8018CAEB lap time chart pointer 
    uchar   	tptr3;          // 7c 8018CAEC lap time chart pointer 
    uchar   	cptr;           // 7d 8018CAED lap count chart pointer 
    uchar   	cptr2;          // 7e 8018CAEE lap count chart pointer 
    uchar   	cptr3;          // 7f 8018CAEF lap count chart pointer 
    uchar   	iptr;           // 80 8018CAF0 item box  chart pointer 
    uchar   	ranksw;         // 81 8018CAF1 rank display switch 
	//align short
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
#define LAKITU_RESCUE_ICE	7

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


typedef	struct AnmObject{ //size 0xE0 //0x80165C18 80165CF8 80165DD8 80165EB8 80165F98 80166078 80166158 80166238 80166318 801663F8 801664D8 801665B8 80166698 

	float	scale;				//00 80165C18 scaling
	float	pos[3];				//04 80165C1C 3D main  position
	float	pos_start[3];		//10 80165C28 3D start coord 
	float	pos_ende[3];		//1C 80165C34 3D end   coord 
	float	pos_spline[3];		//28 80165C40 3D spline coord ///////////////////////////////////////velocity
	float	vel;				//34 80165C4C velocity 
	float	velocity[3];		//38 80165C50 velocity (vx,vy,vz) 
	float	ground;				//44 80165C5C Ground coord ///////////////////////////////////////////timer
	int		ival;					//48 80165C60 int value 
	int		timer;					//4C 80165C64 timer 
	int		anmtm;					//50 80165C68 animation timer ////////////////////////////////////////flag
	uint	flag;				//54 80165C6C flag 
	uint	evflag;				//58 80165C70 event flag 
	uint	evtrflag;			//5C 80165C74 event trigger flag /////////////////////////////////pointer
	ushort	*texaddr;			//60 80165C78 rgba (rgb)texture addr,colpal addr
	uchar	*indexaddr;			//64 80165C7C index addr
	ushort	*stexaddr;			//68 80165C80 rgba (rgb)texture start addr,colpal start addr
	uchar	*sindexaddr;		//6C 80165C84 index start addr
	long	*shape;				//70 80165C88 polygon shape address 
	long	*vtxaddr;			//74 80165C8C vertex address 
	long	*svtxaddr;			//78 80165C90 source vertex address 
	short	*sptbaddr;			//7C 80165C94 spline table address 
	short	*sptbtopaddr;		//80 80165C98 spline table top address /////////////////////////////stack
	short	stack[8];			//84 80165C9C stack buffer 
	ushort	pointkazu;			//94 80165CAC spline point no kazu 
	ushort	spptptr; 			//96 80165CAE spline point pointer 
	ushort	spstep;				//98 80165CB0 spline from point to point no frame wari 
	ushort	spstepadd;			//9A 80165CB2 spline frame //////////////////////////////////////////2D coord
	short	ix;					//9C 80165CB4 2D x coord 
	short	iy;	        		//9E 80165CB6 2D y coord ///////////////////////////////////////////alpha value
	short	alpha;				//A0 80165CB8 alpha value /////////////////////////////////////////tmp
	short	input;				//A2 80165CBA input 
	short	output;				//A4 80165CBC output //////////////////////////////////////////////animation
	short	anmptr;				//A6 80165CBE anmation success pointer 
	short	anmptrbak;			//A8 80165CC0 anmation success pointer (return) //////////////////float value
	short	fvaltm; 			//AA 80165CC2 time ////////////////////////////////////////////////short value
	short	svaltm; 			//AC 80165CC4 timer ////////////////////////////////////////////////////strategy
	short	mvptr;				//AE 80165CC6 move success pointer 
	short	mvtm;				//B0 80165CC8 move success timer ///////////////////////////////////////texture & kage angle
	ushort	texang[3];			//B2 80165CCA texture angle 
	ushort	kageang[3];			//B8 80165CD0 kage angle ////////////////////////////////////////////////direction
	ushort	ang[3];				//BE 80165CD6 angle 
	ushort	addangy;			//C4 80165CDC add angle y 
	ushort	destangy;			//C6 80165CDE destination angle y ////////////////////////////////////////collision
	ushort	r;					//C8 80165CE0 radius //////////////////////////////////////////////////////flag
	char	alloc;				//C9 80165CE2 memory alloc flag 
	char	anmtrig;			//CA 80165CE3 animation initial trigger 
	char	anmloop;			//CB 80165CE4 animation loop counter 
	char	fvaltrig;			//CC 80165CE5 trigger 
	char	fvalloop;			//CD 80165CE6 loop counter 
	char	svaltrig;			//CE 80165CE7 trigger 
	char	svalloop;			//CF 80165CE8 loop counter 
	char	player;				//D0 80165CE9 player number
	char	anmnum;				//D1 80165CEA animation pattern number 
	char	anmnumbak;			//D2 80165CEB animation pattern number 
	char	anmcnt;				//D3 80165CEC animation counter 
	uchar	type;				//D4 80165CED object type (object name)
	uchar	chartptr;			//D5 80165CEE time chart number 
	uchar	stackptr; 			//D6 80165CEF stack buffer 
	uchar	anmtype;			//D7 80165CF0 anmation type number 
	uchar	texsizex;			//D8 80165CF1 texture size (x)
	uchar	texsizey;			//D9 80165CF2 texture size (y)
	uchar	fvalptr;			//DA 80165CF3 success pointer 
	uchar	svalptr;			//DB 80165CF4 success pointer 
	uchar	mvtype;				//DC 80165CF5 move success type 
	uchar	spptr; 				//DD 80165CF6 spline pointer 
	uchar	mappoint;			//DE 80165CF7 map area number 
	//uchar 	custom;			//DF makes use of empty alignment char
} AnmObject;

typedef struct SkyColor{
		short	RedHi, GreenHi, BlueHi;
		short	RedLo, GreenLo, BlueLo;
} SkyColor;



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

typedef struct POS_XY_NoBS{
    short x,y;
} POS_XY_NoBS;

typedef struct PlayerTextureTable{
	uint		TextureOffset[8];
} PlayerTextureTable;

#define OBJ_BLOCK_MAX 32

typedef struct ObjBlock //size: 0x28 * 32 = 0x500 | location: 0x8018D9E0
{
    int 		kind;				//00 
    int 		pattern,pattern2;	//04 08
    int 		disp_x,disp_y;		//0C 10
    char 		pri,disp_on;		//14 15
	char 		hootanim;		//custom align
	char		zuul_flag;		//custom align	
    int 		sd_number;			//18 seq_data_number
    int 		work1,work2;		//1C 20
    float 		workf1;				//24
} ObjBlock;

typedef struct FaceStruct{
		unsigned short flag; //1st. bit   =shadow bit (1=shadow) //higher 3BIT = face up vector
		unsigned short status; //Surface ID
		short minx;
		short miny;
		short minz;
		short maxx;
		short maxy;
		short maxz;
		long *p1;
		long *p2;
		long *p3;
		float sola;
		float solb;
		float solc;
		float sold;
} FaceStruct;

typedef struct CenterPathStruct{
		short pointx;
		short pointy;
		short pointz;
		short unknown;
} CenterPathStruct;

#define CHANNEL_MUTE		0x10000000
#define CHANNEL_PAUSE		0x20000000
#define CHANNEL_IDLE		0x40000000
#define CHANNEL_PLAYING		0x80000000

typedef struct SeqChannelStruct{
		int Playflag; 
		char unknown1; 
		char Priority; 
		short unknown3;
		char unknown4; 
		char PanNote; 
		char Pan;
		char unknown6;
		int unknown7;
		int unknown8;
		int unknown9;
		int Loopcount;
		short Instrument;
		short unknown11;
		float Volume;
		float VolumeMultiplicator;
		short unknown12;
		short Looppan;
		float VolumeTarget;
		float Pitch;
		int *unknown13;
		int *Audiotask1note;
		int *Audiotask2note;
		int *unknown14;
		int *Sequencepointer;
		int *Audiotask1loop;
		int *Audiotask2loop;
		int *unknown15;
		int unknown16;
		int unknown17;
		int unknown18;
		int *Currenttracknote;
		int unknown19;
		int unknown20;
		int unknown21;
		int unknown22;
		int unknown23;
		int unknown24;
		uchar Echo;
		uchar Release;
		short unknown25;
		int *unknown26;
		int *unknownselfpointer1;
		int *unknownselfpointer2;
		int unknown27;
		int *unknownselfpointer3;
		int *unknownselfpointer4;
		int *unknownselfpointer5;
		int unknown28;
		int *unknownselfpointer6;
		int *unknownselfpointer7;
		int *unknownselfpointer8;
		int unknown29;
		int *unknownselfpointer9;
		int *unknownselfpointer10;
		int *unknownselfpointer11;
		int unknown30;
		int *unknownselfpointer12;
} SeqChannelStruct;

typedef struct SeqPlayerStruct{
		int Playflag; 
		uchar CurrentID; 
		uchar SubID; 
		short unknown1;
		ushort Tempo;
		short unknown2;
		int Loopcount;
		int unknown3;
		int *RawSequence;
		float VolumeFull;
		float unknown5;
		int unknown6;
		float Volumedodge;
		float VolumeMultiplicator;
		float VolumeTarget;
		SeqChannelStruct *Channel[16];
		int *LoopBranch;
		int unknown7;
		int unknown8;
		int unknown9;
		int unknown10;
		int unknown11;
		int unknown12;
		int *unknown13;
		int *unknown14;
		int *unknownselfpointer1;
		int *unknownselfpointer2;
		int unknown15;
		int *unknownselfpointer3;
		int *unknownselfpointer4;
		int *unknownselfpointer5;
		int unknown16;
		int *unknownselfpointer6;
		int *unknownselfpointer7;
		int *unknownselfpointer8;
		int unknown17;
		int *unknownselfpointer9;
		int *unknownselfpointer10;
		int *unknownselfpointer11;
		int unknown18;
		int *unknownselfpointer912;
		int Empty[29];
} SeqPlayerStruct;

typedef struct CourseHeader {
	uint Seg6Start;      //(0x00) ROM address at which segment 6 file begins
	uint Seg6End;       //(0x04) ROM address at which segment 6 file ends
	uint Seg4Start;      //(0x08) ROM address at which segment 4 file begins
	uint Seg7End;       //(0x0C) ROM address at which segment 7 (not 4) file ends
	uint Seg9Start;      //(0x10) ROM address at which segment 9 file begins
	uint Seg9End;       //(0x14) ROM address at which segment 9 file ends
	uint Seg47Buffer;      //(0x18) RSP address of compressed segments 4 and 7
	uint NumberVerts;        //(0x1C) number of vertices in the vertex file
	uint Segment7Pointer;       //(0x20) RSP address at which segment 7 data begins
	uint Segment7Size;      //(0x24) Size of segment 7 data after decompression, minus 8 bytes for some reason
	uint TextureRSP;   //(0x28) RSP address of texture list
	ushort flag,unused;    //(0x2E) Padding
} CourseHeader;


#endif
