#ifndef STRUCT_H_
#define STRUCT_H_

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

#endif