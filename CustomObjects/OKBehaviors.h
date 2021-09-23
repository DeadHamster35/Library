#ifndef OKBehaviorsH
#define OKBehaviorsH
#include "../MainInclude.h"
extern void ObjectBehaviorWander(OKObject* InputObject);
extern void Misbehave(OKObject* InputObject);
extern short ObjectSubBehaviorTurnTarget(float InputPosition[3], short InputAngle, float TargetPosition[3], short ToleranceAngle);
#endif