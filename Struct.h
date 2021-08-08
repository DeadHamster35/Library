#ifndef STRUCT_H_
#define STRUCT_H_

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//                                          'CODING DEFINES'                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//Bool
#define TRUE  	1
#define FALSE	0
#define	ON		1
#define	OFF		0

//Operators
#define	equ		==
#define	nequ	!=
#define	lt		<
#define	gt		>
#define	lte		<=
#define	gte		>=
#define and		&&
#define or		||

//Matrix
typedef	float RotateMtx[3][3]; // 3x3 rotation matrix				
typedef float AffineMtx[4][4]; // 4x4 affine transformation matrix		
typedef float Matrix[3][3];	   // 4x4 affine transformation matrix	
typedef	float splinemtx[1][4];

//Vectors
typedef float Vector[3];
typedef char CVector[3];
typedef short SVector[3];   
typedef unsigned short USVector[3];                            
typedef float FVector[3]; 

//Arrays: 4 humans
typedef char CArray4[4];
typedef short SArray4[4];
typedef int IArray4[4];
typedef unsigned char UCArray4[4];
typedef unsigned short USArray4[4];
typedef unsigned int UIArray4[4];
typedef float FArray4[4];
//Arrays: all 8 players
typedef char CArray8[8];
typedef short SArray8[8];
typedef int IArray8[8];
typedef unsigned char UCArray8[8];
typedef unsigned short USArray8[8];
typedef unsigned int UIArray8[8];
typedef float FArray8[8];

//Vars
typedef unsigned char    	uchar;
typedef unsigned short   	ushort;
typedef unsigned int     	uint;
typedef unsigned long 		ulong;
typedef long long			int64;
typedef unsigned long long	uint64;

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//                                          ORIGINAL STRUCTS                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

typedef struct Bump{
	ushort 	flag_xy;
	ushort 	flag_yz;
	ushort 	flag_zx;
	ushort 	last_xy;
	ushort 	last_yz;
	ushort 	last_zx;
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
	ushort 	LastPointer;
	float 			Height;
	int  			Dummy;					//0000 0000 0000 00001:KAGE ON	
} Tire;

typedef struct Smoke{
	float 			trx,try,trz;						//Particle Location[3]
	float 			scale;								//Particle Scale
	ushort 	lrflag,number;						//Left-Right Flag (Left=1;Right=0) //Case Number Flag
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
	ushort   flag; 					//800F6990 //Player, Comp, Ghost, Etc.
	ushort   status; 				//800F6992 //Kart DMA
	short    rank; 							//800F6994 //Current Rank
	ushort   point; 				//800F6996 //Current Points
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
	ushort   hit_flag;				//800F69D6 //Hit Flag For Walls, Enemies, Thwomps, Etc.
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
	ushort  talk;  					//800F6A46 //Comic FX & Unset Speech Bubbles
	float 	offsetsterr_speed;
	unsigned int    slip_flag;				//800F6A4C //Kart State Effect Flags
	short 	slipang,jumpcount;  			//800F6A50 //Kart Angle //800F6A52 //Air Timer
	short   kartpitch; 						//800F6A64 //Kart Pitch
	short   erase;							//800F6A56 //Kart Transparency Effects
	short   jugemu_timer;					//800F6A58 //Lakitu Rescue Timer
	short   jugemu_flag; 					//800F6A5A //Lakitu Flags & Effects
	short 	roll[4],pitch[4];				//800F6A5C //Kart Roll //800F6A64 //Kart Pitch
	short   turbo_timer;					//800F6A6C //Boost State Timer
	ushort  water_flag;				//800F6A6E //Water & Splash Flag
	short 	bomb_timer,slipstream_timer; 	//800F6A70 //Item/Object Hit Tumble Bounce Counter //800F6A72 //Slipstream Timer
	float   slipstream_power;				//800F6A74 //Slipstream Acceleration
	float   maxadd_power;  					//800F6A78 //Drift Turbo Acceleration
	float   jump,jmp_acc,jmp_speed;			//800F6A7C //Jump //800F6A80 //Jump Acceleration //800F6A84 //Jump Speed
	ushort  bump_status; 			//800F6A88 //Current Surface
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
	ushort  hangflag;				//800F6BB2 //Lakitu Rescue Flag
	float 	offsetsize;// 800F6BB4
	short   stopsetrr_count,powerstack_count;
	float	old_speed,mid_left;
	short  	hit_sterr,roliover_time;
	short	broken_timer,drift_turbo_timer;
	float	mid_right;
	int 	tcol_count;  //800f6BD0
	ushort  dir[4],deg[4];
	ushort 	kart,wallhitcount;		//800F6BE4 //Character //800F6BE6 //Timer Wallhit
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
	float   fparam;
	float  	radius;
	short	angle[3];
	float 	position[3];
	float	velocity[3];
	Bump    bump;
} Object;

typedef struct Controller{
	short		AnalogX;
	short		AnalogY;
	ushort		ButtonHeld;
	ushort		ButtonPressed;
	ushort		ButtonReleased;
	ushort  	AnalogHeld;
	ushort  	AnalogPressed;
	ushort  	AnalogReleased;
} Controller;

typedef struct Shake{
	float		cam_firstspeed,x2;
	short		cam_timer,aaaaaaa; 
	float		offset_look,z2,z3; 
}Shake;

typedef struct Camera {
	float 		camera_pos[3];
	float 		lookat_pos[3];
	float 		up_vector[3];
	ushort 		camera_direction[3];
	ushort  	flag;
	short   	chase_direction;
	float 		camera_vector[3];
	float 		lookat_vector[3];
	float 		velocity[3];   
	Bump		bump;
	Shake		shake;
	short   	old_chase_direction;	
	short   	watch,stickdeg;
	float   	screen_view_angle;
} Camera;

typedef struct Viewport{
	short		ScaleWidth;
	short		ScaleHeight;
	short		ScaleDepth;
	short		ScalePad;
	short		TranslateWidth;
	short		TranslateHeight;
	short		TranslateDepth;
	short		TranslatePad;
} Viewport;

typedef struct Screen{
	Controller	*cont;
	Camera	    *camera;
	Player	    *kart;
	AffineMtx	*matrix;
	Viewport	viewport;
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
	short 		Position[3];
	short		Group;
} Marker;

typedef struct Hud{
    float   	is;             // 8018CA70 item scaling 
    float   	rs;             // 8018CA74 rank scale 
    int     	totaltime;      // 8018CA78 total time 
    int     	laptime;        // 8018CA7C lap time 
    int     	gettime;        // 8018CA80 get lap time 
    int     	timebuf[3];     // 8018CA84 total time buffer 
    int     	laptimebuf[3];  // 8018CA90 lap time buffer 
    int     	plx;            // 8018CA9C player position X 
    int     	ply;            // 8018CAA0 player position Y 
    int     	plz;            // 8018CAA4 player position Z 
    uint    	flag;           // 8018CAA8 status flag 
    short   	flashtm;        // 8018CAAC flash timer 
    short   	mx;             // 8018CAAE speedmeter x  
    short   	my;             // 8018CAB0 speedmeter y
    short   	ix;             // 8018CAB2 item x
    short   	iy;             // 8018CAB4 item y
    short   	addix;          // 8018CAB6 item x
    short   	addiy;          // 8018CAB8 item y
    short   	px;             // 8018CABA player number rank x
    short   	py;             // 8018CABC player number rank y
    short   	tx[5];          // 8018CABE lap time x 
    short   	ty;             // 8018CAC8 lap time y
    short   	cx;             // 8018CACA lap count x
    short   	cx2;            // 8018CACC lap count x
    short   	cx3;            // 8018CACE lap count x
    short   	cy;             // 8018CAD0 lap count y 
    short   	rx;             // 8018CAD2 rank x 
    short   	ry;             // 8018CAD4 rank y
    short   	rgx;            // 8018CAD6 rank goal x 
    short   	rgy;            // 8018CAD8 rank gaol y 
    short   	rank;           // 8018CADA ranking 
    short   	bombx;          // 8018CADC bomb kart panel x 
    short   	bomby;          // 8018CADE bomb kart panel y 
    char    	goalsw;         // 8018CAE0 (0,1,2,3) 
    char    	goal;           // 8018CAE1 (0,1,2,3) 
    char    	lapcnt;         // 8018CAE2 lap counter (0,1,2)
    char    	dispsw;         // 8018CAE3 display (on/off) switch 
    char    	bomb;           // 8018CAE4 if bomb near    
    char    	ghostcnt;       // 8018CAE5 kinoko item count 
    uchar   	item;           // 8018CAE6 special item get 
    uchar   	sp_item;        // 8018CAE7 special item get 
    uchar   	mptr;           // 8018CAE8 speed meter chart pointer 
    uchar   	hptr;           // 8018CAE9 speed meter hari chart pointer 
    uchar   	tptr;           // 8018CAEA lap time chart pointer 
    uchar   	tptr2;          // 8018CAEB lap time chart pointer 
    uchar   	tptr3;          // 8018CAEC lap time chart pointer 
    uchar   	cptr;           // 8018CAED lap count chart pointer 
    uchar   	cptr2;          // 8018CAEE lap count chart pointer 
    uchar   	cptr3;          // 8018CAEF lap count chart pointer 
    uchar   	iptr;           // 8018CAF0 item box  chart pointer 
    uchar   	ranksw;         // 8018CAF1 rank display switch 
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

typedef struct AnmObject_Lakitu{
	float		scale;
	float		pos[3];
	float		pos_offset[3];
	float		unknown[3];
	float		pos_anm_offset[3];
	float		unknown2[3];
	float		unknown3[4];
	ulong		anm_start_counter;
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
	ushort		movement_counter;
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

typedef	struct AnmObject{ 			//0x80165C18
//scale
	float	scale;				/* scaling*/
//3D coord
	float	pos[3];				/* 3D main  position */
	float	pos_start[3];		/* 3D start coord */
	float	pos_ende[3];		/* 3D end   coord */
	float	pos_spline[3];		/* 3D spline coord */
//velocity
	float	vel;				/* velocity */
	float	velocity[3];;		/* velocity (vx,vy,vz) */
//ground coord
	float	ground;				/* Ground coord */
//timer
	int	ival;					/* int value */
	int	timer;					/* timer */
	int	anmtm;					/* animation timer */
//flag
	uint	flag;				/* flag */
	uint	evflag;				/* event flag */
	uint	evtrflag;			/* event trigger flag */
//pointer
	ushort	*texaddr;			//rgba (rgb)texture addr,colpal addr
	uchar	*indexaddr;			//index addr
	ushort	*stexaddr;			//rgba (rgb)texture start addr,colpal start addr
	uchar	*sindexaddr;		//index start addr
	long	*shape;				/* polygon shape address */
	long	*vtxaddr;			/* vertex address */
	long	*svtxaddr;			/* source vertex address */
	short	*sptbaddr;			/* spline table address */
	short	*sptbtopaddr;		/* spline table top address */
//stack
	short	stack[8];			/* stack buffer */
	ushort	pointkazu;			/* spline point no kazu */
	ushort	spptptr; 			/* spline point pointer */
	ushort	spstep;				/* spline from point to point no frame wari */
	ushort	spstepadd;			/* spline frame */
//2D coord
	short	ix;					/* 2D x coord */
	short	iy;	        		/* 2D y coord */
//alpha value
	short	alpha;				/* alpha value */
//tmp
	short	input;				/* input */
	short	output;				/* output */
//animation
	short	anmptr;				/* anmation success pointer */
	short	anmptrbak;			/* anmation success pointer (return)*/
//float value
	short	fvaltm; 			/* timer */
//short value
	short	svaltm; 			/* timer */
//strategy
	short	mvptr;				/* move success pointer */
	short	mvtm;				/* move success timer */
//texture & kage angle
	ushort	texang[3];			/* texture angle */
	ushort	kageang[3];			/* kage angle */
//direction
	ushort	ang[3];				/* angle */
	ushort	addangy;			/* add angle y */
	ushort	destangy;			/* destination angle y */
//collision
	ushort	r;					/* radius */
//flag
	char	alloc;				/* memory alloc flag */
	char	anmtrig;			/* animation initial trigger */
	char	anmloop;			/* animation loop counter */
	char	fvaltrig;			/* trigger */
	char	fvalloop;			/* loop counter */
	char	svaltrig;			/* trigger */
	char	svalloop;			/* loop counter */
	char	player;				/* player number*/
	char	anmnum;				/* animation pattern number */
	char	anmnumbak;			/* animation pattern number */
	char	anmcnt;				/* animation counter */
	uchar	type;				/* object type (object name)*/
	uchar	chartptr;			/* time chart number */
	uchar	stackptr; 			/* stack buffer */
	uchar	anmtype;			/* anmation type number */
	uchar	texsizex;			//texture size (x)
	uchar	texsizey;				//texture size (y)
	uchar	fvalptr;			/* success pointer */
	uchar	svalptr;			/* success pointer */
	uchar	mvtype;				/* move success type */
	uchar	spptr; 				/* spline pointer */
	uchar	mappoint;			/* map area number */
} AnmObject;

typedef struct POSXY{
    short 		x,y;
    short 		dummy1,dummy2;
} POSXY;


typedef struct PlayerTextureTable{
	uint		TextureOffset[8];
} PlayerTextureTable;

typedef struct ObjBlock{
    int 		kind;
    int 		pattern,pattern2;
    int 		disp_x,disp_y;
    char 		pri,disp_on;
    int 		sd_number;//seq_data_number
    int 		work1,work2;
    float 		workf1;
} ObjBlock;

typedef struct FaceStruct{
	ushort 		flag; //1st. bit   =shadow bit (1=shadow) //higher 3BIT = face up vector
	ushort 		status; //Surface ID
	short 		minx;
	short 		miny;
	short 		minz;
	short 		maxx;
	short 		maxy;
	short 		maxz;
	long 		*p1;
	long 		*p2;
	long 		*p3;
	float 		sola;
	float 		solb;
	float 		solc;
	float 		sold;
} FaceStruct;

typedef struct CenterPathStruct{
	short 		pointx;
	short 		pointy;
	short 		pointz;
	short 		unknown;
} CenterPathStruct;

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

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//                                          CUSTOM STRUCTS                                       //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

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
	float 	FGrip[5][8];						//0x800E2360
	float 	*FGripPointer[5];					//0x800E2400
	float 	RGrip[5][8];						//0x800E2414
	float	*RGripPointer[5];					//0x800E24B4
	float 	MaxPower[5][8];						//0x800E24C8
	float	*MaxPowerPointer[5];				//0x800E2568
	float 	AccelerationCount[5][8];			//0x800E257C
	float	*AccelerationCountPointer[5];		//0x800E261C
	float 	Mass[8];							//0x800E2630
	float	Gravity[8];							//0x800E2650
	float	Friction[8];						//0x800E2670
	float	MaxSpeed[8];						//0x800E2690
	float	Radius[8];							//0x800E26B0
	float 	SlipDownFT[8][15];					//0x800E26D0
	float 	SlipDownRT[8][15];					//0x800E28B0
	float	*SlipDownRTPointer[8];				//0x800E2A90
	float	*SlipDownFTPointer[8];				//0x800E2AB0
	float 	PowerDownFT[8][15];					//0x800E2AD0
	float 	PowerDownRT[8][15];					//0x800E2CB0
	float	*PowerDownRTPointer[8];				//0x800E2E90
	float	*PowerDownFTPointer[8];				//0x800E2EB0
	float	Acceleration[8][10];				//0x800E2ED0
	float	*AccelerationPointer[8];			//0x800E3010
	float	Brake[8][15];						//0x800E3030
	float	*BrakePointer[8];					//0x800E3210
	float	SlipAngle[8][15];					//0x800E3230
	float	*SlipAnglePointer[8];				//0x800E3410
	float	SteerSpeed[8][15];					//0x800E3430
	float	*SteerSpeedPointer[8];				//0x800E3610
	float	ProOffsetAngle[8];					//0x800E3630
	float	SteerSpeedReturn[8];				//0x800E3650
	float 	KartSteerLoss[8];					//0x800E3670
	float	PowerRecover[8];					//0x800E3690
	float	PowerBandAcceleration[8];			//0x800E36B0
	float	DriftKartFSpeed[8];					//0x800E36D0
	float	DriftKartAcceleration[8];			//0x800E36F0
	float	WingKartFSpeed[8];					//0x800E3710
	float	WingKartAcceleration[8];			//0x800E3730
	float	StormKartFSpeed[8];					//0x800E3750
	float	StormKartAcceleration[8];			//0x800E3770
	float	RollKartFSpeed[8];					//0x800E3790
	float	RollKartAcceleration[8];			//0x800E37B0
	float	HeightJumpKartFSpeed[8];			//0x800E37D0
	float	HeightJumpKartAcceleration[8];		//0x800E37F0
} Stats;

typedef struct EepromRecords{
	uchar first[3],
		  second[3],
		  third[3],
		  fourth[3],
		  fifth[3],
		  bestLap[3],
		  recordExists, // 00 01
		  padding[4], //ffffffff
		  checksum;
} EepromRecords;

typedef struct Eeprom{ //RAM mirror not actual eeprom!
	EepromRecords *records[16];
	uchar 	trophy50cc, //00 empty - 01 mush bron - 02 mush silv - 03 mush gold - 04 flow bron - 08 flow silv - 0c flow gold - 10 star bron - 20 star silv - 30 star gold - 40 spec bron - 80 spec silv - C0 spec gold
			trophy100cc,
			trophy150cc,
			trophyExtra,
			audioMode,
			padding;
	short   trophyChecksum;
	uchar	backup1[53];
	short	backup1Checksum;
	uchar   backup2[53];
	short 	backup2Checksum;
	uchar   unknown[4],
	        backupAudioMode,
			backupPadding,
			backupRecordsChecksum;
} Eeprom;

#endif
