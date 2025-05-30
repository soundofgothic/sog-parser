
func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var C_Npc ScrollTrader;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes,"Aby stworzy� run�, potrzeba zwoju z zakl�ciem i pewnych sk�adnik�w. Dzi�ki nim oraz pustemu kamieniowi runicznemu mog� na runicznym stole stworzy� w�a�ciw� run�.");
	if(Npc_IsDead(Gorax) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if(Npc_IsDead(Isgaroth) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if(Npc_IsDead(Engor) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if(Npc_IsDead(Orlan) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	}
	else if(Npc_IsDead(Cronos_ADW) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Cronos_ADW);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Light,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa ��WIAT�O�: 1 z�ota moneta.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firebolt,1);
		B_LogEntry(TOPIC_TalentRunes,"Rruna �OGNISTA STRZA�A�: 1 siarka.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icebolt,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �LODOWA STRZA�A�: 1 kwarcyt");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �LECZENIE LEKKICH RAN�: 1 ro�lina lecznicza.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGobSkel,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �TWORZENIE SZKIELETU GOBLINA�: 1 ko�� goblina.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_InstantFireball,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �KULA OGNIA�: 1 smo�a");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Zap,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �MA�A B�YSKAWICA`: 1 ska�a krystaliczna.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumWolf,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �PRZYZWANIE WILKA�: 1 sk�ra wilka.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Windfist,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �PIʌ� WICHRU�: 1 w�giel.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Sleep,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �SEN`: 1 bagienne ziele.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MediumHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �LECZENIE �REDNICH RAN�: 1 ziele lecznicze.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightningFlash,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �B�YSKAWICA�: 1 ska�a krystaliczna i 1 kwarcyt.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ChargeFireBall,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �DU�A KULA OGNIA�: 1 siarka i 1 smo�a.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumSkel,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �TWORZENIE SZKIELETU�: 1 ko�� szkieletu.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Fear,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �STRACH�: 1 czarna per�a.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceCube,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �BRY�A LODU�: 1 kwarcyt i 1 akwamaryn.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ThunderBall,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �PIORUN KULISTY�: 1 siarka i 1 ska�a krystaliczna.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGol,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa `OBUDZENIE GOLEMA`: 1 serce kamiennego golema.");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_HarmUndead,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �ZNISZCZENIE O�YWIE�CA�: 1 woda �wi�cona.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Pyrokinesis,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa `DU�A BURZA OGNISTA�: 1 siarka i 1 j�zyk ognistego jaszczura.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firestorm,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �MA�A BURZA OGNISTA�: 1 smo�a i 1 siarka.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceWave,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �LODOWA FALA�: 1 kwarcyt i 1 akwamaryn.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumDemon,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �PRZYZWANIE DEMONA�: 1 serce demona.");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_FullHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �LECZENIE CIʯKICH RAN� : 1 korze� leczniczy.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firerain,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �DESZCZ OGNIA�: 1 siarka i 1 j�zyk ognistego jaszczura");
	};
	if(spell == SPL_BreathOfDeath)
	{
		PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_BreathOfDeath,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �TCHNIENIE �MIERCI�: 1 w�giel i 1 czarna per�a");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MassDeath,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa ��MIERTELNA FALA�: 1 ko�� szkieletu i 1 czarna per�a");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ArmyOfDarkness,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �ARMIA CIEMNO�CI�: 1 ko�� szkieletu, 1 czarna per�a, 1 serce kamiennego golema i 1 serce demona. ");
	};
	if(spell == SPL_Shrink)
	{
		PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Shrink,1);
		B_LogEntry(TOPIC_TalentRunes,"Runa �ZMNIEJSZENIE POTWORA�: 1 ko�� goblina i 1 kie� trolla.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Whirlwind,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Whirlwind);
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Waterfist,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Waterfist);
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icelance,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Icelance);
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Geyser,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Geyser);
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Thunderstorm,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Thunderstorm);
	};
	PrintScreen(PRINT_LearnRunes,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

