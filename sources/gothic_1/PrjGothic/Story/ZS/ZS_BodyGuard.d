
func void ZS_BodyGuard()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BodyGuard");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"BODYGUARD"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"BODYGUARD"))
	{
		AI_GotoFP(self,"BODYGUARD");
		AI_AlignToFP(self);
	};
};

func void ZS_BodyGuard_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_BodyGuard_Loop");
	AI_Wait(self,1);
};

func void ZS_BodyGuard_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BodyGuard_End");
};

