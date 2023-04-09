
func void ZS_Ebr_HangAround()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Ebr_HangAround");
	ObservingPerception();
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"THRONE",1);
	};
};

func void ZS_Ebr_HangAround_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Ebr_HangAround_Loop");
	AI_Wait(self,1);
};

func void ZS_Ebr_HangAround_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Ebr_HangAround_End");
	AI_UseMob(self,"THRONE",-1);
};

