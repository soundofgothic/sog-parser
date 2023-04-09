
var int EnterDI_Kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if(EnterDI_Kapitel6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,ItMi_InnosEye_MIS) == FALSE)
		{
			if(Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) == FALSE)
			{
				Wld_InsertItem(ItSe_XardasNotfallBeutel_MIS,"FP_ITEM_SHIP_12");
				SC_InnosEyeVergessen_DI = TRUE;
				B_LogEntry(TOPIC_HallenVonIrdorath,"Ostatniej nocy mia�em dziwny sen. Widzia�em Xardasa, kt�ry kaza� mi przynie�� co� ze sto�u alchemicznego na statku. Bardzo dziwne. Zw�aszcza �e nic nie pi�em przed snem.");
			};
			Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
			if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) == FALSE)
			{
				CreateInvItems(OrkElite_AntiPaladinOrkOberst_DI,ItAt_RockdragonHeart,1);
			};
		};
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);
		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"M�j kapitan, Jorgen, poczeka na mnie na statku.");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"M�j kapitan, Torlof, b�dzie broni� statku tak d�ugo, a� nie wr�c� z wyspy. Dzi�ki niemu stan� si� silniejszy i zr�czniejszy.");
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"M�j kapitan, Jack, poczeka na mnie na statku. Wygl�da na przestraszonego i mam nadziej�, �e poradzi sobie. Potrzebuj� jego pomocy!");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"W czasie mojej nieobecno�ci Lee obejmie dow�dztwo na statku. Dzi�ki niemu b�d� si� lepiej pos�ugiwa� broni� jedno- i dwur�czn�.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Dzi�ki Miltenowi mog� zwi�kszy� moj� magiczn� moc.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Milten poka�e mi tak�e, jak tworzy� runy.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Niestety, wydaje mi si�, �e stan Lestera znacznie si� pogorszy� na tej tajemniczej wyspie.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Mario dziwnie si� zachowuje. Od jakiego� czasu w og�le si� nie odzywa.");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Wilk mo�e mnie nauczy�, jak strzela� z �uku i kuszy.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Vatras, Mag Wody, nie tylko mo�e mnie uleczy�, ale tak�e sporo nauczy� o warzeniu mikstur");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Vatras mo�e mi tak�e pom�c pozna� nowe kr�gi magii.");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Bennet mo�e mi pokaza�, jak wyku� bro�.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Diego s�u�y mi rad� i amunicj�. Nauczy mnie tak�e, jak otwiera� zamki i strzela� z kuszy oraz �uku.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"W czasie naszej podr�y Gorn nie zmru�y� oka. Pilnuje naszego statku. Wiem, �e mog� mu zaufa�.");
			Log_AddEntry(TOPIC_MyCrew,"Dzi�ki Gornowi b�d� si� lepiej pos�ugiwa� broni� dwur�czn�.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lares obieca� nauczy� mnie skradania i walki broni� jednor�czn�. Pomo�e mi tak�e sta� si� zr�czniejszym.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Jedyne, na czym tak naprawd� zale�y Biffowi, to pieni�dze. Musz� na niego uwa�a�.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Angar jest bardzo niecierpliwy. Nie wiem, czy nie wyruszy sam do walki.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Girion jest niezmiernie cierpliwy. Dobra cecha u nauczyciela pos�ugiwania si� broni�.");
		};
		IntroduceChapter(KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav",6000);
		EnterDI_Kapitel6 = TRUE;
	};
};

