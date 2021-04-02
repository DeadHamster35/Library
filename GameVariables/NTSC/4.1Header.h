long VersionNumber;

//0x04 Course Header
long Seg6Start;
long Seg6End;
long Seg47Start;
long Seg47End;
long Seg9Start;
long Seg9End;
long Seg47RSP;
long VertCount;
long Seg7RSP;
long Seg7Size;
long Seg9RSP;
long Flags;

//0x34 Menu Header
long PreviewOffset;
long BannerOffset;

//0x3C OK64 Header

long SkyData;
long CreditString;
long GhostData;
long CustomAssembly;
long ModData;
long MapData;
long ObjectData;
short g_EchoStart;//
short g_EchoStop;
char tempo1;//
char tempo2;//
char tempo3;//
char tempo4;
long Music;
short PathCount;



//MAP subheader

short MapX;
short MapY;
short StartX;
short StartY;
short Height;
short Width;
short ColorR;
short ColorG;
short ColorB;
short Buffer;
