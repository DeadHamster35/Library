extern void InitialCustomParticleBuffer();
extern short AddCustomParticleBuffer(Vector pos,SVector angle,Vector velo,float scale,short category,char filtermode);
extern void DeleteCustomParticleBuffer(CustomParticle *particle);

extern short ParticleCreate_Local(short category, int player, bool screen_share, short angle, Vector pos, float scale, float speed_forward, float speed_up, short rotationadd, ushort rndoffset, char filtermode, uchar anim_speed, uchar loopcount, uchar xflip, uint RGBA);

extern void MoveCustomParticle();
extern void DrawCustomParticle(int player);