extern short CreateObjectRadius(float localPosition[], short localRotation[], short localID, float radius);
extern short CreateObjectRotation(float localPosition[], short localRotation[], short objectID);
extern short CreateObject(float localPosition[], short objectID, float radius);
extern short CreateObjectSimple(int XPosition, int YPosition, int ZPosition, int Rotation, int objectID);
extern void UpdateObjectVelocity(void* Object);
