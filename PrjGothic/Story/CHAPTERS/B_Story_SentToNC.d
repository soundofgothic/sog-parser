
func void B_Story_SentToNC()
{
	var C_Npc angar;
	var C_Npc YBerion;
	var C_Npc gorn;
	angar = Hlp_GetNpc(GUR_1202_CorAngar);
	Npc_ExchangeRoutine(angar,"start");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	Npc_ExchangeRoutine(YBerion,"dead");
	gorn = Hlp_GetNpc(PC_Fighter);
	PrintDebugNpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	B_LogEntry(CH3_EscapePlanNC,"Y'Berion nie �yje, niech jego dusza spoczywa w spokoju! W swych ostatnich s�owach duchowy przyw�dca Bractwa ca�� nadziej� na ocalenie kolonii pok�ada� w magach z Kr�gu Wody.");
	B_LogEntry(CH3_EscapePlanNC,"Podj��em decyzj�. Udam si� do Nowego Obozu, by wesprze� Mag�w Wody. Cor Angar da� mi klucze do skrzyni w laboratorium Cor Kaloma. Tam ma si� znajdowa� znaleziony przeze mnie kamie� ogniskuj�cy wraz ze staro�ytnym almanachem. Cor Angar uwa�a, �e przy ich pomocy magowie z Nowego Obozu maj� szans� osi�gn�� sw�j cel.");
	CreateInvItem(self,ItArRuneTeleport5);
	B_GiveInvItems(self,hero,ItArRuneTeleport5,1);
	CorAngar_SendToNC = TRUE;
};

