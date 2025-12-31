#include "../MainInclude.h"


SVector LinearTranslation, LinearRotation, LinearScaling;



void GetLinear(OKSkeleton* Bone, float Scale, int Frame)
{
    short KeyTime;
    SVector NDistance;
    float   TDistance, RelativeT;
    float   TRatio;

    PolyKeyFrame* PositionData = (PolyKeyFrame*)(GetRealAddress(Bone->PositionData | 0x0A000000));

    if (Bone->PositionCount == 1)
    {
        LinearTranslation[0] = PositionData[0].Data[0];
        LinearTranslation[1] = PositionData[0].Data[1];
        LinearTranslation[2] = PositionData[0].Data[2];
    }
    else
    {
        for (int ThisKey = 0; ThisKey < Bone->PositionCount; ThisKey++)
        {
            KeyTime = PositionData[ThisKey].Time;
            if (Frame < KeyTime)
            {
                NDistance[0] = PositionData[ThisKey].Data[0] - PositionData[ThisKey - 1].Data[0];
                NDistance[1] = PositionData[ThisKey].Data[1] - PositionData[ThisKey - 1].Data[1];
                NDistance[2] = PositionData[ThisKey].Data[2] - PositionData[ThisKey - 1].Data[2];

                TDistance = (float)(PositionData[ThisKey].Time - PositionData[ThisKey - 1].Time);
                RelativeT = (float)(Frame - PositionData[ThisKey - 1].Time); //Get time relative to last keyframe;
                TRatio = (float)((float)RelativeT / (float)TDistance);
                LinearTranslation[0] = PositionData[ThisKey - 1].Data[0] + (short)(NDistance[0] * (TRatio));
                LinearTranslation[1] = PositionData[ThisKey - 1].Data[1] + (short)(NDistance[1] * (TRatio));
                LinearTranslation[2] = PositionData[ThisKey - 1].Data[2] + (short)(NDistance[2] * (TRatio));
                break;
            }
            if (Frame == KeyTime)
            {
                LinearTranslation[0] = PositionData[ThisKey].Data[0];
                LinearTranslation[1] = PositionData[ThisKey].Data[1];
                LinearTranslation[2] = PositionData[ThisKey].Data[2];
                break;
                
            }
            if (Frame > KeyTime)
            {
                continue;
            }
        }
    }

    PolyKeyFrame* RotationData = (PolyKeyFrame*)(GetRealAddress(Bone->RotationData | 0x0A000000));

    if (Bone->RotationCount == 1)
    {
        LinearRotation[0] = RotationData[0].Data[0];
        LinearRotation[1] = RotationData[0].Data[1];
        LinearRotation[2] = RotationData[0].Data[2];
    }
    else
    {
        for (int ThisKey = 0; ThisKey < Bone->RotationCount; ThisKey++)
        {
            KeyTime = RotationData[ThisKey].Time;
            if (Frame < KeyTime)
            {
                NDistance[0] = RotationData[ThisKey].Data[0] - RotationData[ThisKey - 1].Data[0];
                NDistance[1] = RotationData[ThisKey].Data[1] - RotationData[ThisKey - 1].Data[1];
                NDistance[2] = RotationData[ThisKey].Data[2] - RotationData[ThisKey - 1].Data[2];

                TDistance = (float)(RotationData[ThisKey].Time - RotationData[ThisKey - 1].Time);
                RelativeT = (float)(Frame - RotationData[ThisKey - 1].Time); //Get time relative to last keyframe;
                TRatio = (float)((float)RelativeT / (float)TDistance);

                LinearRotation[0] = RotationData[ThisKey - 1].Data[0] + (short)(NDistance[0] * (TRatio));
                LinearRotation[1] = RotationData[ThisKey - 1].Data[1] + (short)(NDistance[1] * (TRatio));
                LinearRotation[2] = RotationData[ThisKey - 1].Data[2] + (short)(NDistance[2] * (TRatio));
                break;
            }
            if (Frame == KeyTime)
            {
                LinearRotation[0] = RotationData[ThisKey].Data[0];
                LinearRotation[1] = RotationData[ThisKey].Data[1];
                LinearRotation[2] = RotationData[ThisKey].Data[2];
                break;
                
            }
            if (Frame > KeyTime)
            {
                continue;
            }
        }
    }

    /*
        if (AnimeData->ScalingCount == 1)
        {
            LinearScaling[0] = AnimeData->ScalingData[0].Data[0];
            LinearScaling[1] = AnimeData->ScalingData[0].Data[1];
            LinearScaling[2] = AnimeData->ScalingData[0].Data[2];
        }
        else
        {
            for (int ThisKey = 0; ThisKey < AnimeData->ScalingCount; ThisKey++)
            {
                KeyTime = AnimeData->ScalingData[ThisKey].Time;
                if (Frame < KeyTime)
                {
                    NDistance[0] = AnimeData->ScalingData[ThisKey].Data[0] - AnimeData->ScalingData[ThisKey - 1].Data[0];
                    NDistance[1] = AnimeData->ScalingData[ThisKey].Data[1] - AnimeData->ScalingData[ThisKey - 1].Data[1];
                    NDistance[2] = AnimeData->ScalingData[ThisKey].Data[2] - AnimeData->ScalingData[ThisKey - 1].Data[2];


                    TDistance = AnimeData->ScalingData[ThisKey].Time - AnimeData->ScalingData[ThisKey - 1].Time;
                    RelativeT = Frame - AnimeData->ScalingData[ThisKey - 1].Time; //Get time relative to last keyframe;
                    TRatio = ((float)RelativeT / (float)TDistance);
                    LinearScaling[0] = AnimeData->ScalingData[ThisKey - 1].Data[0] + (short)(NDistance[0] * (TRatio));
                    LinearScaling[1] = AnimeData->ScalingData[ThisKey - 1].Data[1] + (short)(NDistance[1] * (TRatio));
                    LinearScaling[2] = AnimeData->ScalingData[ThisKey - 1].Data[2] + (short)(NDistance[2] * (TRatio));
                    break;
                }
                if (Frame == KeyTime)
                {
                    LinearScaling[0] = AnimeData->ScalingData[ThisKey].Data[0];
                    LinearScaling[1] = AnimeData->ScalingData[ThisKey].Data[1];
                    LinearScaling[2] = AnimeData->ScalingData[ThisKey].Data[2];
                    break;
                }
                if (Frame > KeyTime)
                {   
                    //continue;
                }
            }
        }
    */
    

    
}


void SkeletalMatrix(OKSkeleton* Bone, float Scale, int Frame)
{
    GetLinear(Bone, Scale, Frame);
    
    objectPosition[0] = (float)LinearTranslation[0] * 0.1f;
    objectPosition[1] = (float)LinearTranslation[1] * 0.1f;
    objectPosition[2] = (float)LinearTranslation[2] * 0.1f;
    
	
	objectAngle[0] = LinearRotation[0];
    objectAngle[1] = LinearRotation[1];
    objectAngle[2] = LinearRotation[2];


    CreateModelingMatrix(AffineMatrix, objectPosition, objectAngle);
    
    //ScaleMatrixXYZFixed(GlobalAffine,LinearScaling);
    SetMatrix(AffineMatrix, 3);
                  
}

void DrawSkeleton(OKSkeleton* BoneData, int CurrentFrame)
{
	uint* NodeArray = (uint*) BoneData->NodeOffset;
	SkeletalMatrix(BoneData, 0.1f, CurrentFrame);
	uint LastTextureOffset = 0;
	for (int CurrentNode = 0; CurrentNode < BoneData->NodeCount; CurrentNode++)
	{	
		OKNode* ThisNode = (OKNode*)NodeArray[CurrentNode];
        
        if (ThisNode->MeshCount == 0)
        {
            continue;
        }


		if (LastTextureOffset != ThisNode->TextureOffset)
		{
			//skip reloading identical textures
            
			if (ThisNode->TextureOffset != 0)
			{
				LastTextureOffset = ThisNode->TextureOffset;
                uint TargetTexture = GetRealAddress(ThisNode->TextureOffset | 0x0A000000);
                gSPDisplayList(GraphPtrOffset++, TargetTexture);						
			}
			
		}

		uint* MeshOffsets = (uint*)(GetRealAddress(ThisNode->MeshOffset | 0x0A000000));
		for (int CurrentMesh = 0; CurrentMesh < ThisNode->MeshCount; CurrentMesh++)
		{	
			gSPDisplayList(GraphPtrOffset++, MeshOffsets[CurrentMesh]);
		}
        
	}

	
	for (int ThisChild = 0; ThisChild < BoneData->ChildCount; ThisChild++)
	{
		GlobalAddressA += sizeof(OKSkeleton);
		OKSkeleton* Skeletor = (OKSkeleton*)GlobalAddressA;
		DrawSkeleton(Skeletor, CurrentFrame);		
	}

    gSPPopMatrix(GraphPtrOffset++,G_MTX_MODELVIEW);

}

int CheckDraw(int Player, int Object, float RenderRadius)
{
    OKObject* LocalObject = (OKObject*)&OKObjectArray[Object];
    
    return TestCollideSphere (
        LocalObject->ObjectData.position, RenderRadius,
        GlobalPlayer[Player].position, GlobalPlayer[Player].radius
    );
}


void DrawAnimeObject(int ObjectTypeIndex, int PlayerIndex, int ForceRender)
{
    OKObjectType* LocalType = (OKObjectType*)&OverKartRAMHeader.ObjectTypeList[ObjectTypeIndex];
    
    for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectCount; CurrentObject++)
    {
        OKObject* LocalObject = (OKObject*)&OKObjectArray[CurrentObject];
        if((ForceRender != 0) || (CheckDraw(PlayerIndex, CurrentObject, LocalType->RenderRadius) != 0))
        {

            SetLocalMatrix(CurrentObject,ObjectTypeIndex, PlayerIndex);
            SetMatrix(AffineMatrix,0);
            
            GlobalIntA = GetRealAddress(ObjectSegment | LocalType->ObjectAnimations);		
            GlobalAddressA = *(uint*)(GetRealAddress(GlobalIntA | 0x0A000000));
            
            OKSkeleton* Skeletor = (OKSkeleton*)(GlobalAddressA); 
            DrawSkeleton(Skeletor, LocalObject->AnimationFrame);

            LocalObject->AnimationFrame++;
            if (LocalObject->AnimationFrame > LocalObject->AnimationMax)
            {
                LocalObject->AnimationFrame = 0;
            }
        }
    }
    
}
