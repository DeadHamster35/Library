#include "../library/Struct.h"
#include "../library/OKStruct.h"

extern void ObjectBehaviorWander(OKObject* InputObject);
extern void Misbehave(OKObject* InputObject);
extern void ObjectSubBehaviorTurnTarget(float InputPosition[3], short InputAngle, float TargetPosition[3], short ToleranceAngle);