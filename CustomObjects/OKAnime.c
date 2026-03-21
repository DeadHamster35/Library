#include "../MainInclude.h"

#define PrintDebug(Address, Value) *(uint *)(Address) = Value


SVector LinearTranslation, LinearRotation, LinearScaling;


//


// Zero + identity
static void Mtx_Identity(AffineMtx* m) {
    // zero everything
    for (int r = 0; r < 4; ++r)
    {
        for (int c = 0; c < 4; ++c)
        {
            (*m)[r][c] = 0.0f;
        }
    }
        

    // set diagonal to 1
    (*m)[0][0] = 1.0f;
    (*m)[1][1] = 1.0f;
    (*m)[2][2] = 1.0f;
    (*m)[3][3] = 1.0f;
}

// Rotate around Z: affects X,Y columns
static void Mtx_RotateZ(AffineMtx* m, short ang) {
    float s = sinT(ang);
    float c = cosT(ang);

    for (int row = 0; row < 4; ++row) {
        float x = (*m)[row][0];
        float y = (*m)[row][1];
        (*m)[row][0] = x * c - y * s;
        (*m)[row][1] = x * s + y * c;
    }
}

// Rotate around Y: affects X,Z columns
static void Mtx_RotateY(AffineMtx* m, short ang) {
    float s = sinT(ang);
    float c = cosT(ang);

    for (int row = 0; row < 4; ++row) {
        float x = (*m)[row][0];
        float z = (*m)[row][2];
        (*m)[row][0] =  x * c + z * s;
        (*m)[row][2] = -x * s + z * c;
    }
}

// Rotate around X: affects Y,Z columns
static void Mtx_RotateX(AffineMtx* m, short ang) {
    float s = sinT(ang);
    float c = cosT(ang);

    for (int row = 0; row < 4; ++row) {
        float y = (*m)[row][1];
        float z = (*m)[row][2];
        (*m)[row][1] = y * c - z * s;
        (*m)[row][2] = y * s + z * c;
    }
}


void CreateAnimeMatrix(AffineMtx* dst,Vector pos, SVector ang)
{
    Mtx_Identity(dst);
    
    Mtx_RotateX(dst, ang[0]);
    Mtx_RotateZ(dst, ang[2]);
    Mtx_RotateY(dst, ang[1]);
        
    
    

    (*dst)[3][0] = pos[0];
    (*dst)[3][1] = pos[1];
    (*dst)[3][2] = pos[2];

}

//
int WrapDelta(int delta)
{
    const int HALF_TURN = 0x8000;   // 32768
    const int FULL_TURN = 0x10000;  // 65536

    while (delta >  HALF_TURN) delta -= FULL_TURN;
    while (delta < -HALF_TURN) delta += FULL_TURN;

    return delta;
}

void GetLinear(OKSkeleton *Bone, float Scale, int Frame)
{
    short KeyTime;
    SVector NDistance;
    float TDistance, RelativeT;
    float TRatio;

    PolyKeyFrame *PositionData = (PolyKeyFrame *)(GetRealAddress(Bone->PositionData | 0x0A000000));


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
                RelativeT = (float)(Frame - PositionData[ThisKey - 1].Time); // Get time relative to last keyframe;
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

    PolyKeyFrame *RotationData = (PolyKeyFrame *)(GetRealAddress(Bone->RotationData | 0x0A000000));
    
    
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
                NDistance[0] = WrapDelta(RotationData[ThisKey].Data[0] - RotationData[ThisKey - 1].Data[0]);
                NDistance[1] = WrapDelta(RotationData[ThisKey].Data[1] - RotationData[ThisKey - 1].Data[1]);
                NDistance[2] = WrapDelta(RotationData[ThisKey].Data[2] - RotationData[ThisKey - 1].Data[2]);

                TDistance = (float)(RotationData[ThisKey].Time - RotationData[ThisKey - 1].Time);
                RelativeT = (float)(Frame - RotationData[ThisKey - 1].Time); // Get time relative to last keyframe;
                TRatio = (float)((float)RelativeT / (float)TDistance);

                LinearRotation[0] = (short)(RotationData[ThisKey - 1].Data[0] + NDistance[0] * (TRatio));
                LinearRotation[1] = (short)(RotationData[ThisKey - 1].Data[1] + NDistance[1] * (TRatio));
                LinearRotation[2] = (short)(RotationData[ThisKey - 1].Data[2] + NDistance[2] * (TRatio));
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
                    LinearScaling[0] = (short)(AnimeData->ScalingData[ThisKey - 1].Data[0] + NDistance[0] * (TRatio));
                    LinearScaling[1] = (short)(AnimeData->ScalingData[ThisKey - 1].Data[1] + NDistance[1] * (TRatio));
                    LinearScaling[2] = (short)(AnimeData->ScalingData[ThisKey - 1].Data[2] + NDistance[2] * (TRatio));
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

void SkeletalMatrix(OKSkeleton *Bone, float Scale, int Frame)
{
    GetLinear(Bone, Scale, Frame);
    
    objectPosition[0] = (float)LinearTranslation[0] * 0.1f;
    objectPosition[1] = (float)LinearTranslation[1] * 0.1f;
    objectPosition[2] = (float)LinearTranslation[2] * 0.1f;

    

    objectAngle[0] = LinearRotation[0];
    objectAngle[1] = LinearRotation[1];
    objectAngle[2] = LinearRotation[2];
    

    CreateAnimeMatrix(&AffineMatrix, objectPosition, objectAngle);
    //ScaleMatrixXYZFixed(GlobalAffine,LinearScaling);
    

    //AffineToMtx(&gDynamicP->objectmodeling[gMatrixCount],AffineMatrix);
    //gSPMatrix(GraphPtrOffset++, K0_TO_PHYS((u32) &(gDynamicP->objectmodeling[gMatrixCount++])), G_MTX_MODELVIEW|G_MTX_MUL|G_MTX_PUSH);
    
    SetMatrix(AffineMatrix, 3);
}

void DrawSkeleton(OKSkeleton *BoneData, int CurrentFrame)
{
    
    OKNode *NodeArray = (OKNode *)(GetRealAddress(0x0A000000 | BoneData->NodeOffset));
    SkeletalMatrix(BoneData, 0.1f, CurrentFrame);
    uint LastTextureOffset = 0;
    for (int CurrentNode = 0; CurrentNode < BoneData->NodeCount; CurrentNode++)
    {
        if (NodeArray[CurrentNode].MeshCount == 0)
        {
            continue;
        }


        if (LastTextureOffset != NodeArray[CurrentNode].TextureOffset)
        {
            // skip reloading identical textures

            LastTextureOffset = NodeArray[CurrentNode].TextureOffset;
            gSPDisplayList(GraphPtrOffset++, NodeArray[CurrentNode].TextureOffset | 0x0A000000);
            
        }

        uint *MeshOffsets = (uint *)(GetRealAddress(NodeArray[CurrentNode].MeshOffset | 0x0A000000));
        

        for (int CurrentMesh = 0; CurrentMesh < NodeArray[CurrentNode].MeshCount; CurrentMesh++)
        {
            gSPDisplayList(GraphPtrOffset++, (MeshOffsets[CurrentMesh] | 0x0A000000));
        }

    }

    for (int ThisChild = 0; ThisChild < BoneData->ChildCount; ThisChild++)
    {
        GlobalAddressA += sizeof(OKSkeleton);
        OKSkeleton *Skeletor = (OKSkeleton *)GlobalAddressA;
        DrawSkeleton(Skeletor, CurrentFrame);
    }

    gSPPopMatrix(GraphPtrOffset++, G_MTX_MODELVIEW);
}

int CheckDraw(int Player, int Object, float RenderRadius)
{
    OKObject *LocalObject = (OKObject *)&OKObjectArray[Object];

    return TestCollideSphere(
        LocalObject->ObjectData.position, RenderRadius,
        GlobalPlayer[Player].position, GlobalPlayer[Player].radius);
}

void DrawAnimeObject(int ObjectTypeIndex, int PlayerIndex, int ForceRender)
{
    OKObjectType *LocalType = (OKObjectType *)&(OverKartRAMHeader.ObjectTypeList[ObjectTypeIndex]);

    for (int CurrentObject = 0; CurrentObject < OverKartRAMHeader.ObjectCount; CurrentObject++)
    {
        OKObject *LocalObject = (OKObject *)&OKObjectArray[CurrentObject];
        if (LocalObject->TypeIndex != ObjectTypeIndex)
        {
            continue;
        }

        
        if ((ForceRender != 0) || (CheckDraw(PlayerIndex, CurrentObject, LocalType->RenderRadius) != 0))
        {
            SetLocalMatrix(CurrentObject, ObjectTypeIndex, PlayerIndex);
            ScalingMatrix(AffineMatrix, (LocalType->ObjectScale * 0.01f));
            SetMatrix(AffineMatrix, 0);

            GlobalIntA = GetRealAddress(0x0A000000 | LocalType->ObjectAnimations);

            GlobalAddressA = GetRealAddress(*(uint *)GlobalIntA | 0x0A000000);
            GlobalAddressA += 4;

            OKSkeleton *Skeletor = (OKSkeleton *)(GlobalAddressA);
            GlobalAddressB = 0x80505500;
            DrawSkeleton(Skeletor, LocalObject->AnimationFrame);
            LocalObject->AnimationFrame++;

            if (LocalObject->AnimationFrame >= LocalObject->AnimationMax)
            {
                LocalObject->AnimationFrame = 0;
            }
        }
    }
}
