
func void B_CheckDeadMissionNPCs()
{
	if(Hlp_GetInstanceID(Org_844_Lefty) == Hlp_GetInstanceID(self))
	{
		if(Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry(CH1_CarryWater,"Po �mierci Lewusa problem wody chyba sam si� rozwi�za�. Nigdy nie lubi�em tego cz�owieka.");
			Log_SetTopicStatus(CH1_CarryWater,LOG_SUCCESS);
			LeftyDead = TRUE;
		};
	};
};

