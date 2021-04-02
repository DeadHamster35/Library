#ifndef STRUCT_H_
#define STRUCT_H_


struct Controller{
	short	AnalogX;
	short	AnalogY;
	unsigned short	ButtonHeld;
	unsigned short	ButtonPressed;
	unsigned short	ButtonReleased;
    unsigned short  AnalogHeld;
    unsigned short  AnalogPressed;
    unsigned short  AnalogReleased;  
};


#endif