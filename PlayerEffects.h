extern void SetAnimMusicNote(char playerID);
extern void SetAnimCrash(char playerID);
extern void SetAnimPoomp(char playerID);
extern void SetAnimBoing(char playerID);
extern void SetAnimExplosion(char playerID);
extern void SetAnimBonkStars(char playerID);
extern void SetAnimLandingDust(char playerID);
extern void SetAnimBooSmoke(char playerID);
extern void SetAnimWaterDrip(char playerID, bool active);
extern void SetAnimSmoking(char playerID, bool active);
extern void DisableOutline(char playerID);


extern void SetMapObjectHit(char playerID);
extern void SetLightningHit(char playerID);
extern void SetShrunken(char playerID, bool active);
extern void SetStarMan(char playerID, bool active);
extern void SetGhostEffect(char playerID, bool active);
extern void SetBooTranslucent(char playerID);
extern void SetBecomeBomb(char playerID);
extern void SetFlattened(char playerID);
extern void SetMushroomBoost(char playerID);
extern void SetSpinOutSaveable(char playerID);
extern void SetSpinOut(char playerID);
extern void SetFailedStart(char playerID);
extern void SetGreenShellHit(char playerID);
extern void SetRedShellHit(char playerID);
extern void SetBonk(char playerID);
extern void ChangeMaxSpeed(char playerID, float SpeedGain);
extern void ChangePlayerSize(char playerID, float ScaleFactor);
extern void SetCamShiftUp(char playerID, float shift);
extern void SetPlayerColor(char playerID, int Colors, float speed);
extern void SetPlayerEcho(char playerID, char echo);
extern void playrandmCharacterSFX(char playerID);
extern void EnableAirControl(char playerID);