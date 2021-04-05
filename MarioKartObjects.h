extern short CreateObjectRadius(float localPosition[], short localRotation[], short localID, float radius);
extern short CreateObjectRotation(float localPosition[], short localRotation[], short objectID);
extern short CreateObject(float localPosition[], short objectID);
extern short CreateObjectSimple(int XPosition, int YPosition, int ZPosition, int Rotation, int objectID);
extern void UpdateObjectVelocity(Object* InputObject);
extern void UpdateObjectGravity(Object* InputObject);
extern void UpdateBump(Object* InputObject);