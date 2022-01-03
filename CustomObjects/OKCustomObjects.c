#include "../MainInclude.h"



/*
81020000 03E0
81020002 0008
81020004 2400
81021244 03E0
81021246 0008
81021248 2400*/




void DisplayCoinSprite()
{

			for(int currentSprite = 1; (currentSprite <= CoinCount[0]) & (currentSprite <= 8); currentSprite++)
			{
				KWSprite((currentSprite* 4) + 30,220,16,16,(ushort*)&ok_RedCoinSprite);
			}

			if ((CoinCount[0] != 0) && (CoinCount[0] < 8))
			{
				KWSprite(21,219,16,16,(ushort*)&lit_numberSpriteX);
				KWSprite(11,219,16,16,(ushort*)&lit_numberSprite+(CoinCount[0]*0x100));
				return;
			}
			if (CoinCount[0] >= 8)
			{
				KWSprite(21,219,16,16,(ushort*)&lit_numberSpriteX);
				KWSprite(11,219,16,16,(ushort*)&lit_numberSprite8);
			}
 
}




short FindOKObject()
{
	for (int CurrentObject = 0; CurrentObject < 100; CurrentObject++)
	{		
		if(OKObjectArray[CurrentObject].SubBehaviorClass == SUBBEHAVIOR_DEAD)
		{
			return (short)CurrentObject;
		}
	}
	return -1;
}

void ClearOKObject(short ObjectID)
{	
	OKObjectArray[ObjectID].PlayerTarget = 0;
	OKObjectArray[ObjectID].PathTarget = 0;
	OKObjectArray[ObjectID].TargetDistance = 0;
	OKObjectArray[ObjectID].TurnStatus = 0;
	OKObjectArray[ObjectID].SearchStatus = 0;
	OKObjectArray[ObjectID].WanderStatus = 0;
	OKObjectArray[ObjectID].EMPTYSTATUS = 0;
	OKObjectArray[ObjectID].SubBehaviorClass = SUBBEHAVIOR_DEAD;
	OKObjectArray[ObjectID].ObjectData.position[0] = 0;
	OKObjectArray[ObjectID].ObjectData.position[1] = 0;
	OKObjectArray[ObjectID].ObjectData.position[2] = 0;	
	OKObjectArray[ObjectID].ObjectData.angle[0] = 0;
	OKObjectArray[ObjectID].ObjectData.angle[1] = 0;
	OKObjectArray[ObjectID].ObjectData.angle[2] = 0;
	OKObjectArray[ObjectID].ObjectData.velocity[0] = 0;
	OKObjectArray[ObjectID].ObjectData.velocity[1] = 0;
	OKObjectArray[ObjectID].ObjectData.velocity[2] = 0;
	OKObjectArray[ObjectID].ObjectData.radius = 0;
	OKObjectArray[ObjectID].ObjectData.sparam = 0;
	OKObjectArray[ObjectID].ObjectData.fparam = 0;
	OKObjectArray[ObjectID].ObjectData.flag = 0;
	OKObjectArray[ObjectID].ObjectData.counter = 0;
	OKObjectArray[ObjectID].ObjectData.category = 0;
}

bool TestCollideSphere(float SourcePosition[], float SourceRadius, float TargetPosition[], float TargetRadius)
{
	
	GlobalFloatA = SourceRadius + TargetRadius;
	
	GlobalFloatB = SourcePosition[0] - TargetPosition[0];
	GlobalFloatC = SourcePosition[1] - TargetPosition[1];
	GlobalFloatD = SourcePosition[2] - TargetPosition[2];
	if ((GlobalFloatB * GlobalFloatB) + (GlobalFloatC * GlobalFloatC) + (GlobalFloatD * GlobalFloatD) > (GlobalFloatA * GlobalFloatA))
	{
		return false;
	}
	
	return true; 
}

bool TestCollideBox(float SourcePosition[], short SourceSize[], short SourceAngle[], float TargetPosition[], float TargetRadius)
{
	
	float TempPosition[3];
	short TempAngle[3];

	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		TempPosition[CurrentVector] = TargetPosition[CurrentVector] - SourcePosition[CurrentVector];

		
		if (CurrentVector == 1)
		{
			TempAngle[CurrentVector] = SourceAngle[CurrentVector] * -1;
		}
		else
		{
			TempAngle[CurrentVector] = SourceAngle[CurrentVector];
		}
	}	
	RotateVector(TempPosition,TempAngle);
	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		GlobalFloatA = (SourceSize[CurrentVector] / 2) + TargetRadius;
		GlobalFloatB = TempPosition[CurrentVector];
		if ((GlobalFloatB > GlobalFloatA) || (GlobalFloatB < GlobalFloatA * -1))
		{
			return false;
		}
	}
	return true;
}

void OKObjectCollision(OKObject *InputObject)
{
	if (g_gameMode == 0)
	{
		GlobalShortA = 8;
	}
	else
	{
		GlobalShortA = g_playerCount;
	}


	GlobalBoolA = false; //Use for tracking movements of all 4 players for sound

	for (int CurrentPlayer = 0; CurrentPlayer < GlobalShortA; CurrentPlayer++)
	{		
		//Test the collision
		objectPosition[0] = InputObject->ObjectData.position[0];
		objectPosition[1] = InputObject->ObjectData.position[1];
		objectPosition[2] = InputObject->ObjectData.position[2];
		if(TestCollideSphere(objectPosition, (float)(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].Hitbox / 100) ,GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
		{
			DebugPosition[0] = objectPosition[0];
			DebugPosition[1] = objectPosition[1];
			DebugPosition[2] = objectPosition[2];
			MasterStatus(CurrentPlayer,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].StatusClass);
			MasterEffect(CurrentPlayer,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].EffectClass);						
		}

		

		if(TestCollideSphere(objectPosition, (float)(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundRadius) ,GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
		{
			GlobalBoolA = true;	
		}
		
	}

	if (OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundID != 0xFFFFFFFF)
	{
		if ((OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].SoundPlaying == 0) && (GlobalBoolA))
		{
			OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].SoundPlaying = 1;
			if(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundType == 0 && g_playerCount == 1)
			{
				NaPlyLevelStart(0,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundID); //Play globally
			}
			else
			{
				NaSceneLevelStart(objectPosition,ZeroVector,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundID); //Play directionally
			}
		}
		else
		{
			if ((OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].SoundPlaying == 1) && (!GlobalBoolA))
			{
				OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].SoundPlaying = 0;
				if(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundType == 0 && g_playerCount == 1)
				{
					NaPlyLevelStop(0,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundID); //Play globally
				}
				else
				{
					NaSceneLevelStop(objectPosition,OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[InputObject->ListIndex].ObjectIndex].SoundID); //Play directionally
				}
			}
		}
	}
	
}

void LoadSkeleton() 
{
	
}
void DrawOKSub(OKModel* ThisModel, int CurrentPlayer, int CurrentType)
{
	for (int CurrentModel = 0; CurrentModel < (int)OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].OKModelCount; CurrentModel++)
	{
		uint* MeshAddress = (uint*)GetRealAddress(0x0A000000 |ThisModel->MeshAddress);
		if (OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].CameraAlignToggle == 0x01)
		{		
			objectAngle[0] = 0;
			objectAngle[1] = 0;
			objectAngle[2] = 0;

			
			float sinB = sinT(GlobalCamera[CurrentPlayer]->camera_direction[1]-(DEG1 * 180));
			float cosB = cosT(GlobalCamera[CurrentPlayer]->camera_direction[1]-(DEG1 * 180));

			AffineMatrix[0][0] =  cosB;
			AffineMatrix[1][0] =  0.0f;
			AffineMatrix[2][0] =  sinB;
			AffineMatrix[0][1] =  0.0f;
			AffineMatrix[1][1] =  1.0f;
			AffineMatrix[2][1] =  0.0f;
			AffineMatrix[0][2] = -sinB;
			AffineMatrix[1][2] =  0.0f;
			AffineMatrix[2][2] =  cosB;
			AffineMatrix[0][3] =  0.0f;
			AffineMatrix[1][3] =  0.0f;
			AffineMatrix[2][3] =  0.0f;
			AffineMatrix[3][3] =  1.0f; 

			AffineMatrix[3][0] = (float)objectPosition[0];
			AffineMatrix[3][1] = (float)objectPosition[1];
			AffineMatrix[3][2] = (float)objectPosition[2];
		}
		else
		{
			objectAngle[0] = (short)OKObjectArray[GlobalShortA].ObjectData.angle[0];
			objectAngle[1] = (short)(OKObjectArray[GlobalShortA].ObjectData.angle[1] * -1);
			objectAngle[2] = (short)OKObjectArray[GlobalShortA].ObjectData.angle[2];	

			CreateModelingMatrix(AffineMatrix,objectPosition,objectAngle);
		}
		

		
		ScalingMatrix(AffineMatrix,((float)(ThisModel->MeshScale) / 100));

		if(SetMatrix(AffineMatrix,0) != 0)
		{
			for (int CurrentMesh = 0; CurrentMesh < ThisModel->MeshCount; CurrentMesh++)
			{
				*(long*)*graphPointer = (long)(0x06000000);
				*graphPointer = *graphPointer + 4;
				*(long*)*graphPointer = (long)(0x0A000000 | MeshAddress[CurrentMesh]);
				*graphPointer = *graphPointer + 4;
			}	
		}
	}
}

void DrawOKObjectLoop(OKModel* ThisModel, int Player, int Type)
{
	*(long*)*graphPointer = (long)(0x06000000);
	*graphPointer = *graphPointer + 4;
	*(long*)*graphPointer = (long)(0x0A000000 | ThisModel->TextureAddress);
	*graphPointer = *graphPointer + 4;
	for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectHeader.ObjectCount; CurrentObject++)
	{
		if(OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray[CurrentObject].ListIndex].ObjectIndex == Type)
		{
			if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
			{
				if(TestCollideSphere(OKObjectArray[CurrentObject].ObjectData.position, (float)(OverKartRAMHeader.ObjectHeader.ObjectTypeList[Type].RenderRadius) ,GlobalPlayer[Player].position, GlobalPlayer[Player].radius))
				{
				
					

					uint* MeshAddress = (uint*)GetRealAddress(0x0A000000 |ThisModel->MeshAddress);
					if (OverKartRAMHeader.ObjectHeader.ObjectTypeList[Type].CameraAlignToggle == 0x01)
					{		
						objectAngle[0] = 0;
						objectAngle[1] = 0;
						objectAngle[2] = 0;

						
						float sinB = sinT(GlobalCamera[Player]->camera_direction[1]-(DEG1 * 180));
						float cosB = cosT(GlobalCamera[Player]->camera_direction[1]-(DEG1 * 180));

						AffineMatrix[0][0] =  cosB;
						AffineMatrix[1][0] =  0.0f;
						AffineMatrix[2][0] =  sinB;
						AffineMatrix[0][1] =  0.0f;
						AffineMatrix[1][1] =  1.0f;
						AffineMatrix[2][1] =  0.0f;
						AffineMatrix[0][2] = -sinB;
						AffineMatrix[1][2] =  0.0f;
						AffineMatrix[2][2] =  cosB;
						AffineMatrix[0][3] =  0.0f;
						AffineMatrix[1][3] =  0.0f;
						AffineMatrix[2][3] =  0.0f;
						AffineMatrix[3][3] =  1.0f; 

						AffineMatrix[3][0] = (float)objectPosition[0];
						AffineMatrix[3][1] = (float)objectPosition[1];
						AffineMatrix[3][2] = (float)objectPosition[2];
					}
					else
					{
						objectAngle[0] = (short)OKObjectArray[CurrentObject].ObjectData.angle[0];
						objectAngle[1] = (short)(OKObjectArray[CurrentObject].ObjectData.angle[1] * -1);
						objectAngle[2] = (short)OKObjectArray[CurrentObject].ObjectData.angle[2];	

						CreateModelingMatrix(AffineMatrix,objectPosition,objectAngle);
					}
					

					
					ScalingMatrix(AffineMatrix,((float)(ThisModel->MeshScale) / 100));

					if(SetMatrix(AffineMatrix,0) != 0)
					{
						for (int CurrentMesh = 0; CurrentMesh < ThisModel->MeshCount; CurrentMesh++)
						{
							*(long*)*graphPointer = (long)(0x06000000);
							*graphPointer = *graphPointer + 4;
							*(long*)*graphPointer = (long)(0x0A000000 | MeshAddress[CurrentMesh]);
							*graphPointer = *graphPointer + 4;
						}	
					}
				}		
			}
		}
		
	}
}

void DrawOKObjects(Camera* LocalCamera)
{
	
	if (scrollLock)
	{
		int CurrentPlayer = (*(long*)&LocalCamera - (long)&g_Camera1) / 0xB8;

		for (int CurrentType = 0; CurrentType < OverKartRAMHeader.ObjectHeader.ObjectTypeCount; CurrentType++)
		{
			if (*(uint*)(&OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].ObjectAnimations) == 0xFFFFFFFF)			
			{
				if (OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].ZSortToggle == 0)
				{
					for (int CurrentModel = 0; CurrentModel < (int)OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].OKModelCount; CurrentModel++)
					{
						OKModel* ThisModel = (OKModel*)GetRealAddress(0x0A000000 | (int)&OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].ObjectModel[CurrentModel]);
						DrawOKObjectLoop(ThisModel, CurrentPlayer, CurrentType);
					}	
						
					for (int CurrentModel = 0; CurrentModel < (int)OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].OKXLUCount; CurrentModel++)
					{
						OKModel* ThisModel = (OKModel*)GetRealAddress(0x0A000000 | (int)&OverKartRAMHeader.ObjectHeader.ObjectTypeList[CurrentType].ObjectXLU[CurrentModel]);
						DrawOKObjectLoop(ThisModel, CurrentPlayer, CurrentType);
					}				
				}
			}
			else
			{	
				for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectHeader.ObjectCount; CurrentObject++)
				{
					if (OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray[CurrentObject].ListIndex].ObjectIndex == CurrentType)
					{
						if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
						{
							
							objectPosition[0] = (float)OKObjectArray[CurrentObject].ObjectData.position[0];
							objectPosition[1] = (float)OKObjectArray[CurrentObject].ObjectData.position[1];
							objectPosition[2] = (float)OKObjectArray[CurrentObject].ObjectData.position[2];

							if(TestCollideSphere(objectPosition, (float)(OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray[CurrentObject].ListIndex].ObjectIndex].RenderRadius) ,GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
							{
							
								objectAngle[0] = (short)OKObjectArray[CurrentObject].ObjectData.angle[0];
								objectAngle[1] = (short)(OKObjectArray[CurrentObject].ObjectData.angle[1] * -1);
								objectAngle[2] = (short)OKObjectArray[CurrentObject].ObjectData.angle[2];	
								CreateModelingMatrix(AffineMatrix,objectPosition,objectAngle);


								ScalingMatrix(AffineMatrix,0.10);

								if(SetMatrix(AffineMatrix,0) != 0)
								{

									GlobalUIntA = GetRealAddress(0x0A000000 | *(uint*)(&OverKartRAMHeader.ObjectHeader.ObjectTypeList[0].ObjectAnimations));				
									OKAnimationTable* AnimationTable = (OKAnimationTable*)(GlobalUIntA);
									AnimationTable->SkeletonOffset = GetRealAddress(AnimationTable->SkeletonOffset);
									AnimationTable->WalkAnimation = GetRealAddress(AnimationTable->WalkAnimation);
									Hierarchy* Skeleton = (Hierarchy*)(AnimationTable->SkeletonOffset) ;
									AnimePtr* WalkAnime = (AnimePtr*)(&AnimationTable->WalkAnimation);
									WalkAnime[0]->param = (short*)(GetRealAddress((int)WalkAnime[0]->param));
									WalkAnime[0]->table = (ushort*)(GetRealAddress((int)WalkAnime[0]->table));

									DrawLocalSkeletonShape(Skeleton,WalkAnime,0,AnimationTimer);
								}
							}
						}
					}
				}
				

			}
		}


		
		//Make Zbuffer
		for (int ThisObject = 0; ThisObject < OverKartRAMHeader.ObjectHeader.ObjectCount; ThisObject++)
		{
			if (OverKartRAMHeader.ObjectHeader.ObjectTypeList[OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray[ThisObject].ListIndex].ObjectIndex].ZSortToggle != 0)
			{			
				OKObjectArray[ThisObject].ZBuffer = CalcDistance(GlobalPlayer[CurrentPlayer].position, OKObjectArray[ThisObject].ObjectData.position);
			}
			else
			{
				OKObjectArray[ThisObject].ZBuffer = -1;
			}	
		}
		
		for (int ThisPass = 0; ThisPass < OverKartRAMHeader.ObjectHeader.ObjectCount; ThisPass++)
		{
			GlobalIntA = 0;
			GlobalShortA = -1;
			for (int SubObject = 0; SubObject < OverKartRAMHeader.ObjectHeader.ObjectCount; SubObject++)
			{
				if (GlobalIntA < OKObjectArray[SubObject].ZBuffer)
				{
					GlobalIntA = OKObjectArray[SubObject].ZBuffer;
					GlobalShortA = SubObject;
				}
			}
			if (GlobalShortA != -1)
			{
				OKObjectArray[GlobalShortA].ZBuffer = -1;
				int Type = OverKartRAMHeader.ObjectHeader.ObjectList[OKObjectArray[GlobalShortA].ListIndex].ObjectIndex;

				if(TestCollideSphere(
					OKObjectArray[GlobalShortA].ObjectData.position, 
					(float)(OverKartRAMHeader.ObjectHeader.ObjectTypeList[Type].RenderRadius),
					GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius)
				)
				{
					if(OKObjectArray[GlobalShortA].SubBehaviorClass != SUBBEHAVIOR_DEAD)
					{
						for (int CurrentModel = 0; CurrentModel < OverKartRAMHeader.ObjectHeader.ObjectTypeList[Type].OKModelCount; CurrentModel++)
						{
							DrawOKSub(
								(OKModel*)GetRealAddress(0x0A000000 | (int)&OverKartRAMHeader.ObjectHeader.ObjectTypeList[Type].ObjectModel[CurrentModel]), 
								CurrentPlayer, Type
							);
						}
					}		
				}
			}
			
		}
			
		
		
	}
}


void CheckOKObjects()
{	
	
	if (scrollLock)
	{
		for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectHeader.ObjectCount; CurrentObject++)
		{
			if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
			{
				Misbehave((OKObject*)&OKObjectArray[CurrentObject]);
				OKObjectCollision((OKObject*)&OKObjectArray[CurrentObject]);
			}
		}
	}
}