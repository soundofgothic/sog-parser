
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Teraz mog�:");
	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� zwierz�tom k�y.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� zwierz�tom pazury.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...oprawia� zwierz�ta.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...zdejmowa� sk�r� jaszczur�w.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� serca golemom i demonom.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� rogi cieniostworom.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� ognistym jaszczurom j�zyki.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� krwiopijcom skrzyd�a.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� krwiopijcom ��d�a.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� zwierz�tom �uwaczki.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� pe�zaczom pancerze.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...usuwa� smoczym z�baczom rogi.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		CreateInvItems(SwampDragon,ItAt_DragonScale,12);
		CreateInvItems(RockDragon,ItAt_DragonScale,12);
		CreateInvItems(FireDragon,ItAt_DragonScale,12);
		CreateInvItems(IceDragon,ItAt_DragonScale,12);
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...zbiera� smocze �uski ze sk�r zabitych smok�w.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		CreateInvItems(SwampDragon,ItAt_DragonBlood,2);
		CreateInvItems(RockDragon,ItAt_DragonBlood,2);
		CreateInvItems(FireDragon,ItAt_DragonBlood,2);
		CreateInvItems(IceDragon,ItAt_DragonBlood,2);
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...magazynowa� krew zabitych smok�w.");
	};
	PrintScreen(PRINT_LearnTakeAnimalTrophy,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	return TRUE;
};

