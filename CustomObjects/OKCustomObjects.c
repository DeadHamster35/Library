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
	//Draw the coin sprite based on the number of coins held. 
	//For Red Coin mode specific

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
	//This parses the object list and returns the first unused object.

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
	//Reset all the variables for an OKObject.

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
	//Does a collision test using pythagorean maths. 

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

bool TestCollideSphereAngled(float SourcePosition[], float SourceRadius, short SourceAngle[], short BoxPosition[], float TargetPosition[], float TargetRadius)
{
	float TranslatedPosition[3];
	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		TranslatedPosition[CurrentVector] = (float)BoxPosition[CurrentVector];
	}

	RotateVector(TranslatedPosition, SourceAngle);
	
	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		TranslatedPosition[CurrentVector] += SourcePosition[CurrentVector];
	}
	return TestCollideSphere(TranslatedPosition, SourceRadius, TargetPosition, TargetRadius);
}

bool TestCollideBox(float SourcePosition[], short SourceAngle[], short BoxPosition[], short BoxSize[], short BoxAngle[], float BoxScale, float TargetPosition[], float TargetRadius)
{
	//Does a test on a collision with a box of arbitrary length width and height.
	
	float TranslatedPosition[3];
	float TempPosition[3];
	short TempAngle[3];

	//Rotate the hitbox's relative position based on the object.
	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		TranslatedPosition[CurrentVector] = (float)BoxPosition[CurrentVector];
	}
	RotateVector(TranslatedPosition, SourceAngle);

	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		//Create a vector based on the position of the target and the position of the hitbox.
		//to get the Hitbox's absolute position, add the relative/rotated position to the object's origin.
		TempPosition[CurrentVector] = TargetPosition[CurrentVector] - (SourcePosition[CurrentVector] + TranslatedPosition[CurrentVector]);

		//Invert the Y Angle for whatever reason IDK
		//Add the BoxAngle to the Source Position Angle.
		//For now Box's are static and cannot be rotated. Values will be 0
		if (CurrentVector == 1)
		{
			TempAngle[CurrentVector] = (SourceAngle[CurrentVector] * -1) + (BoxAngle[CurrentVector] * -1);
		}
		else
		{
			TempAngle[CurrentVector] = SourceAngle[CurrentVector] + BoxAngle[CurrentVector];
		}
	}	
	// Rotate the Vector by the angle of the box.
	RotateVector(TempPosition,TempAngle);
	for (int CurrentVector = 0; CurrentVector < 3; CurrentVector++)
	{
		//Take both sides of the box from the center
		//If the position is greater than or less than the sides, return false.
		GlobalFloatA = ((BoxScale * BoxSize[CurrentVector]) / 2) + TargetRadius;
		GlobalFloatB = TempPosition[CurrentVector];
		if ((GlobalFloatB > GlobalFloatA) || (GlobalFloatB < GlobalFloatA * -1))
		{
			return false;
		}
	}
	//If we have not returned false from the prior checks, we must be inside the confines of the box. 
	return true;
}

void OKObjectReaction(OKObject* InputObject, short ResultType, int Player)
{
	switch (ResultType)
	{
		case REACTION_NONE:
		{
			break;
		}
		case REACTION_DEAD:
		{
			InputObject->SubBehaviorClass = BEHAVIOR_DEAD;				
			break;
		}
		case REACTION_BOUNCE:
		{
			//Cheap reversal bounce; inaccurate for geometry
			//but good enough for objects colliding.
			
			
			if (InputObject->ObjectData.velocity[0] > InputObject->ObjectData.velocity[2])
			{
				InputObject->ObjectData.velocity[2] *= -1;
			}
			else
			{
				InputObject->ObjectData.velocity[0] *= -1;
			}
			break;
		}
		case REACTION_BALL:
		{
			if (Player != -1)
			{
				InputObject->ObjectData.velocity[0] = 0;
				InputObject->ObjectData.velocity[1] = 5;
				//InputObject->ObjectData.velocity[2] = ObjectType->Hitbox + GlobalPlayer[Player].radius;
				
				MakeAlignVector(InputObject->ObjectData.velocity, GlobalPlayer[Player].direction[1] + GlobalPlayer[Player].slipang);

				objectVelocity[0] = 0;
				objectVelocity[1] = 0;
				objectVelocity[2] = 5;
				MakeAlignVector(objectVelocity, GlobalPlayer[Player].direction[1] + GlobalPlayer[Player].slipang);
				InputObject->AngularVelocity[0] = objectVelocity[0];
				InputObject->AngularVelocity[1] = objectVelocity[1];
				InputObject->AngularVelocity[2] = objectVelocity[2];
			}
			else
			{
				//Cheap reversal bounce; inaccurate for geometry
				//but good enough for objects colliding.
				if (InputObject->ObjectData.velocity[0] > InputObject->ObjectData.velocity[2])
				{
					InputObject->ObjectData.velocity[2] *= -1;
				}
				else
				{
					InputObject->ObjectData.velocity[0] *= -1;
				}
			}
		}
	}
}

void OKObjectCollision(OKObject *InputObject)
{
	GlobalShortB = *(int*)(*OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].ObjectHitbox); // Get Hitbox Count
	GlobalAddressA = *OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].ObjectHitbox + 4;
	OKCollisionSphere* HitBox = (OKCollisionSphere*)(GlobalAddressA);

	//PlayerCount
	if (g_gameMode == 0)
	{
		GlobalShortA = 8;  
	}
	else
	{
		GlobalShortA = g_playerCount;
	}
	
	objectAngle[0] = 0;
	objectAngle[1] = 0;
	objectAngle[2] = 0;
	GlobalBoolA = false; //Use for tracking movements of all 4 players for sound

	for (int CurrentPlayer = 0; CurrentPlayer < GlobalShortA; CurrentPlayer++)
	{	
		for (int ThisBox = 0; ThisBox < GlobalShortB; ThisBox++)
		{

			GlobalBoolA = false;
			if (HitBox[ThisBox].Type == 0)
			{
				if (!TestCollideSphereAngled(InputObject->ObjectData.position,
				((float)HitBox[ThisBox].Size[0] / 100), InputObject->ObjectData.angle, 
				HitBox->Position, GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
				{
					return;
				}
			}
			else
			{
				
				if (!TestCollideBox(InputObject->ObjectData.position, InputObject->ObjectData.angle, 
				HitBox->Position, HitBox->Size, objectAngle, ((float)HitBox->Scale / 100),
				GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius) )				
				{
					return;
				}
			}
			
			if(GlobalPlayer[CurrentPlayer].slip_flag & STAR)
			{
				OKObjectReaction(InputObject, HitBox[ThisBox].DamagedResult, CurrentPlayer);
			}
			else
			{
				OKObjectReaction(InputObject, HitBox[ThisBox].CollisionResult, CurrentPlayer);
			}

			MasterStatus(CurrentPlayer,HitBox[ThisBox].StatusClass);
			MasterEffect(CurrentPlayer,HitBox[ThisBox].EffectClass);	
			
		}
	}

	if (InputObject->SubBehaviorClass != SUBBEHAVIOR_DEAD) //Do not do item checks if player destroyed OKObject in previous loop
	{	
		/*
		for (int ThisObject = 0; ThisObject < 100; ThisObject++)
		{
			if (!(g_SimpleObjectArray[ThisObject].flag&EXISTOBJ))
			{
				continue;
			}
			if (!(g_SimpleObjectArray[ThisObject].flag&HITOBJ))
			{
				continue;
			}

			if(TestCollideSphere(InputObject->ObjectData.position, (float)(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].Hitbox) ,g_SimpleObjectArray[ThisObject].position, g_SimpleObjectArray[ThisObject].radius))
			{
				if (g_SimpleObjectArray[ThisObject].category != TSHELL)
				{
					KillObject((Object*)&g_SimpleObjectArray[ThisObject]);
				}

				//OKObjectReaction(InputObject, ThisType, true, -1);

			}
		}
		*/
	}

	if (OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundID != 0xFFFFFFFF)
	{
		if ((InputObject->SoundPlaying == 0) && (GlobalBoolA))
		{
			InputObject->SoundPlaying = 1;
			if(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundType == 0 && g_playerCount == 1)
			{
				NaPlyLevelStart(0,OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundID); //Play globally
			}
			else
			{
				NaSceneLevelStart(objectPosition,ZeroVector,OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundID); //Play directionally
			}
		}
		else
		{
			if ((InputObject->SoundPlaying == 1) && (!GlobalBoolA))
			{
				InputObject->SoundPlaying = 0;
				if(OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundType == 0 && g_playerCount == 1)
				{
					NaPlyLevelStop(0,OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundID); //Play globally
				}
				else
				{
					NaSceneLevelStop(objectPosition,OverKartRAMHeader.ObjectTypeList[InputObject->TypeIndex].SoundID); //Play directionally
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
	for (int CurrentModel = 0; CurrentModel < (int)OverKartRAMHeader.ObjectTypeList[CurrentType].OKModelCount; CurrentModel++)
	{
		uint* MeshAddress = (uint*)GetRealAddress(ObjectSegment |ThisModel->MeshAddress);
		if (OverKartRAMHeader.ObjectTypeList[CurrentType].CameraAlignToggle == 0x01)
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
		

		
		ScalingMatrix(AffineMatrix,1.0);

		if(SetMatrix(AffineMatrix,0) != 0)
		{
			for (int CurrentMesh = 0; CurrentMesh < ThisModel->MeshCount; CurrentMesh++)
			{
				*(long*)*graphPointer = (long)(0x06000000);
				*graphPointer = *graphPointer + 4;
				*(long*)*graphPointer = (long)(ObjectSegment | MeshAddress[CurrentMesh]);
				*graphPointer = *graphPointer + 4;
			}	
		}
	}
}

void DrawOKObjectLoop(OKModel* ThisModel, int Player, int Type)
{
	// Add the Texture Draw F3D code
	*(long*)*graphPointer = (long)(0x06000000);
	*graphPointer = *graphPointer + 4;
	*(long*)*graphPointer = (long)(ObjectSegment | ThisModel->TextureAddress);
	*graphPointer = *graphPointer + 4;

	//Now we have to parse for each individual object, and normalize the model to the location and angle.

	for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectCount; CurrentObject++)
	{
		if(OKObjectArray[CurrentObject].TypeIndex == Type)
		{
			if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
			{
				//We use the sphere collision test to see if the character is within render radius.

				if(TestCollideSphere(OKObjectArray[CurrentObject].ObjectData.position, (float)(OverKartRAMHeader.ObjectTypeList[Type].RenderRadius) ,GlobalPlayer[Player].position, GlobalPlayer[Player].radius))
				{
				
					

					uint* MeshAddress = (uint*)GetRealAddress(ObjectSegment |ThisModel->MeshAddress);

					
					objectPosition[0] = (float)OKObjectArray[CurrentObject].ObjectData.position[0];
					objectPosition[1] = (float)OKObjectArray[CurrentObject].ObjectData.position[1];
					objectPosition[2] = (float)OKObjectArray[CurrentObject].ObjectData.position[2];
					if (OverKartRAMHeader.ObjectTypeList[Type].CameraAlignToggle == 0x01)
					{		
						//If the CameraAlignToggle flag is enabled, then we align the object to the camera directly.

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

						//Otherwise we use the object's angle to get a perspective normalized view.

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
							*(long*)*graphPointer = (long)(ObjectSegment | MeshAddress[CurrentMesh]);
							*graphPointer = *graphPointer + 4;
						}	
					}
				}		
			}
		}
		
	}
}

bool SkeletalMatrix(OKSkeleton* Skeleton, Object ObjectData, int FrameCount, int CurrentFrame)
{
	int Frame = (int)(CurrentFrame / 2);
		
	GlobalUIntA = Skeleton->AnimationOffset + 8;
	short* PositionData = (short*)((GetRealAddress(ObjectSegment | Skeleton->AnimationOffset)));
	SVector* AngleData = (SVector*)((GetRealAddress(ObjectSegment | GlobalUIntA)));

	GlobalUIntA += (FrameCount * 6);
	if (FrameCount % 2 == 1)
	{
		GlobalUIntA += 2;
	}

	SVector* TranslationData = (SVector*)((GetRealAddress(ObjectSegment | GlobalUIntA)));

	GlobalUIntA += (FrameCount * 6);
	if (FrameCount % 2 == 1)
	{
		GlobalUIntA += 2;
	}

	SVector* ScalingData = (SVector*)((GetRealAddress(ObjectSegment | GlobalUIntA))); 

	
	objectPosition[0] = ObjectData.position[0] + ( (float)(Skeleton->MeshScale) * ((float)(PositionData[0] / 100) ) ) + ( (float)(Skeleton->MeshScale) * ((float)(TranslationData[Frame][0]) / 100) );

	objectPosition[1] = ObjectData.position[1] + ( (float)(Skeleton->MeshScale) * ((float)(PositionData[1] / 100) ) ) + ( (float)(Skeleton->MeshScale) * ((float)(TranslationData[Frame][1]) / 100) );

	objectPosition[2] = ObjectData.position[2] + ( (float)(Skeleton->MeshScale) * ((float)(PositionData[2] / 100) ) ) + ( (float)(Skeleton->MeshScale) * ((float)(TranslationData[Frame][2]) / 100) );

	objectAngle[0] = (short)ObjectData.angle[0] + (AngleData[Frame][0]);
	objectAngle[1] = (short)(ObjectData.angle[1] * -1) + (AngleData[Frame][1]);
	objectAngle[2] = (short)ObjectData.angle[2] + (AngleData[Frame][2] * -1);	

	CreateModelingMatrix(AffineMatrix,objectPosition,objectAngle);

	//Now apply the scaling size of the object to the matrix and add the drawing code of the 3D model to the F3D. 
	ScaleMatrixXYZFixed(AffineMatrix,ScalingData[Frame]);
	ScalingMatrix(AffineMatrix, Skeleton->MeshScale);

	return SetMatrix(AffineMatrix,0);
}

void DrawOKAnimationLoop(OKSkeleton* Skeleton, int CurrentPlayer, int Type)
{
	bool TextureDrawn = false;	

	for (int CurrentNode = 0; CurrentNode < Skeleton->NodeCount; CurrentNode++)
	{	
		GlobalAddressB = ( GetRealAddress(ObjectSegment | Skeleton->NodeOffset) + (CurrentNode * 12));
		OKNode *ThisNode = (OKNode*)(GlobalAddressB); 
		for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectCount; CurrentObject++)
		{
			if(OKObjectArray[CurrentObject].TypeIndex == Type)
			{
				if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
				{

					//We use the sphere collision test to see if the character is within render radius.
					if(TestCollideSphere(OKObjectArray[CurrentObject].ObjectData.position, (float)(OverKartRAMHeader.ObjectTypeList[Type].RenderRadius) ,GlobalPlayer[CurrentPlayer].position, GlobalPlayer[CurrentPlayer].radius))
					{
						if (!TextureDrawn)
						{
							TextureDrawn = true;
							gSPDisplayList(GraphPtrOffset++,(ThisNode->TextureOffset | ObjectSegment));							
						}
						uint *MeshPointer = (uint*)GetRealAddress(ThisNode->MeshOffset | ObjectSegment);
						if(SkeletalMatrix(Skeleton, OKObjectArray[CurrentObject].ObjectData, OKObjectArray[CurrentObject].AnimationMax, OKObjectArray[CurrentObject].AnimationFrame) != 0)
						{
							for (int ThisMesh = 0; ThisMesh < ThisNode->MeshCount; ThisMesh++)
							{
								gSPDisplayList(GraphPtrOffset++, (MeshPointer[ThisMesh] | ObjectSegment));
							}
						}
					}
				}
			}
						
		}

		TextureDrawn = false; //reset texture for next node.
	}
	for (int ThisChild = 0; ThisChild < Skeleton->ChildCount; ThisChild++)
	{
		DrawOKAnimationLoop((OKSkeleton*)GlobalAddressA, CurrentPlayer, Type);
		GlobalAddressA += 20;
	}
}

void DrawOKObjects(Camera* LocalCamera)
{
	
	if (scrollLock)
	{
		int CurrentPlayer = (*(long*)&LocalCamera - (long)&g_Camera1) / 0xB8;


		//For efficiency, we sort the objects by textures when possible.
		//This means running through each object TYPE, and drawing each piece of the model.
		 


		for (int CurrentType = 0; CurrentType < OverKartRAMHeader.ObjectTypeCount; CurrentType++)
		{
			//For each object type, we first check if the object uses animations or not

			if (*(uint*)(&OverKartRAMHeader.ObjectTypeList[CurrentType].ObjectAnimations) == 0xFFFFFFFF)			
			{
				//When not using animations, we loop through the model count and draw each Opaque geometry.
				//We will draw transparent geometry if the ZSortToggle flag is not active. Otherwise we'll draw it later.
				//Each piece is then normalized to the object's location and angle by the DrawOKObjectLoop function.

				for (int CurrentModel = 0; CurrentModel < (int)OverKartRAMHeader.ObjectTypeList[CurrentType].OKModelCount; CurrentModel++)
				{
					OKModel* ThisModel = (OKModel*)GetRealAddress(ObjectSegment | (int)&OverKartRAMHeader.ObjectTypeList[CurrentType].ObjectModel[CurrentModel]);
					DrawOKObjectLoop(ThisModel, CurrentPlayer, CurrentType);
				}	
				if (OverKartRAMHeader.ObjectTypeList[CurrentType].ZSortToggle == 0)
				{	
					for (int CurrentModel = 0; CurrentModel < (int)OverKartRAMHeader.ObjectTypeList[CurrentType].OKXLUCount; CurrentModel++)
					{
						OKModel* ThisModel = (OKModel*)GetRealAddress(ObjectSegment | (int)&OverKartRAMHeader.ObjectTypeList[CurrentType].ObjectXLU[CurrentModel]);
						DrawOKObjectLoop(ThisModel, CurrentPlayer, CurrentType);
					}				
				}
			}
			else
			{	
				GlobalIntA = GetRealAddress( ObjectSegment | *OverKartRAMHeader.ObjectTypeList[CurrentType].ObjectAnimations);		
				uint* AnimationOffsets = (uint*)(GlobalIntA);
				GlobalIntA = GetRealAddress( ObjectSegment | AnimationOffsets[0]);
				GlobalIntA += 4; //skip past the framecount, we stored this earlier.
				GlobalAddressA = GlobalIntA + 20; //ooohhhh you.
				OKSkeleton* Skeleton = (OKSkeleton*)(GlobalIntA); 
				DrawOKAnimationLoop(Skeleton, CurrentPlayer, CurrentType);
				
				//If the object is animated....we currently don't support it. :)
				//But we'll still try.
			}
		}


		
		//Make Zbuffer

		

		


		for (int ThisObject = 0; ThisObject < OverKartRAMHeader.ObjectCount; ThisObject++)
		{
			//The following code parses the list of objects and checks for a Z-sort toggle flag.
			//If the flag is on it calculates the distance to the player and stores this in the Z-Buffer value.
			//If the flag is off, the value is set to -1.

			if (OverKartRAMHeader.ObjectTypeList[OKObjectArray[ThisObject].TypeIndex].ZSortToggle != 0)
			{			
				OKObjectArray[ThisObject].ZBuffer = CalcDistance(GlobalPlayer[CurrentPlayer].position, OKObjectArray[ThisObject].ObjectData.position);
			}
			else
			{
				OKObjectArray[ThisObject].ZBuffer = -1;
			}	
		}
		
		for (int ThisPass = 0; ThisPass < OverKartRAMHeader.ObjectCount; ThisPass++)
		{
			//Now, a second pass is made through the objects, and each pass does a loop through the objects again.
			//It checks the distance of each objects, and finds the largest value. This is the object in the "back" of the Zbuffer.
			//Since these objects should be rendered first, as we move towards the front, we render it now and then set the distance to -1.
			//No check will return an object with -1 as the largest, so each pass will ignore these objects.

			GlobalIntA = 0;
			GlobalShortA = -1;
			for (int SubObject = 0; SubObject < OverKartRAMHeader.ObjectCount; SubObject++)
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


				//Since we've already gotten the distance to the player, we can use that for the render-radius check.
				if ((float)(OverKartRAMHeader.ObjectTypeList[OKObjectArray[GlobalShortA].TypeIndex].RenderRadius) < OKObjectArray[GlobalShortA].ZBuffer)
				{
					if(OKObjectArray[GlobalShortA].SubBehaviorClass != SUBBEHAVIOR_DEAD)
					{
						for (int CurrentModel = 0; CurrentModel < OverKartRAMHeader.ObjectTypeList[OKObjectArray[GlobalShortA].TypeIndex].OKXLUCount; CurrentModel++)
						{
							DrawOKSub(
								(OKModel*)GetRealAddress(ObjectSegment | (int)&OverKartRAMHeader.ObjectTypeList[OKObjectArray[GlobalShortA].TypeIndex].ObjectXLU[CurrentModel]), 
								CurrentPlayer, OKObjectArray[GlobalShortA].TypeIndex
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
	//Parse the object list and run the behavior and collision code. 
	if (scrollLock)
	{
		for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectCount; CurrentObject++)
		{
			if (*OverKartRAMHeader.ObjectTypeList[OKObjectArray[CurrentObject].TypeIndex].ObjectAnimations != 0xFFFFFFFF)
			{				
				OKObjectArray[CurrentObject].AnimationFrame++;
				if ((OKObjectArray[CurrentObject].AnimationFrame / 2) >= OKObjectArray[CurrentObject].AnimationMax)
				{
					OKObjectArray[CurrentObject].AnimationFrame = 0;
				}
			}		

			if(OKObjectArray[CurrentObject].SubBehaviorClass != SUBBEHAVIOR_DEAD)
			{
				Misbehave((OKObject*)&OKObjectArray[CurrentObject]);
				OKObjectCollision((OKObject*)&OKObjectArray[CurrentObject]);
			}
		}
	}
}