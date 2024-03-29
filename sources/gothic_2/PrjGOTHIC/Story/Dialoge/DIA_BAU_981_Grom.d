
instance DIA_Grom_EXIT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 999;
	condition = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grom_HALLO(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = DIA_Grom_HALLO_Condition;
	information = DIA_Grom_HALLO_Info;
	description = "Wszystko w porz�dku?";
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Ach, witaj nieznajomy w�drowcze. Jestem troch� zaj�ty, wi�c lepiej m�w szybko, czego chcesz.
	Info_ClearChoices(DIA_Grom_HALLO);
	Info_AddChoice(DIA_Grom_HALLO,"Czy s� tutaj jakie� interesuj�ce rzeczy?",DIA_Grom_HALLO_waszusehen);
	Info_AddChoice(DIA_Grom_HALLO,"Co tu porabiasz?",DIA_Grom_HALLO_was);
};

func void DIA_Grom_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//Jest tu co� interesuj�cego?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Interesuj�cego, powiadasz... Tak, interesuj�cy to dobre s�owo. Je�li wejdziesz nieco g��biej w te lasy, mo�esz mie� bardzo niemi�e spotkanie.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//Mieszkaj� tam kud�ate bestie pot�nej postury i wzrostu. Wi�c je�li nie czujesz si� na si�ach, �eby je pokona�, lepiej tam nie id�.
};

func void DIA_Grom_HALLO_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//Wszystko to, czym zwykle zajmuj� si� my�liwi i drwale.
	Info_AddChoice(DIA_Grom_HALLO,Dialog_Back,DIA_Grom_HALLO_BACK);
};

func void DIA_Grom_HALLO_BACK()
{
	Info_ClearChoices(DIA_Grom_HALLO);
};


instance DIA_Grom_AskTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 10;
	condition = DIA_Grom_AskTeacher_Condition;
	information = DIA_Grom_AskTeacher_Info;
	description = "Mo�esz nauczy� mnie czego� o polowaniu?";
};


func int DIA_Grom_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Mo�esz mnie nauczy� czego� o polowaniu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasne. Ale najpierw przynie� mi co� normalnego do jedzenia. Umieram tu z g�odu.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Podziel� si� z tob� swoj� wiedz�, je�li dostan� butelk� mleka, bochenek chleba i kawa�ek t�ustej szynki.
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher,"My�liwy Grom nauczy mnie wszystkiego, co wie, je�li przynios� mu butelk� mleka, bochenek chleba i kawa� szynki.");
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = "Oto jedzenie.";
};


func int DIA_Grom_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_AskTeacher) && Npc_HasItems(other,ItFo_Milk) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Bacon))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	B_GiveInvItems(other,self,ItFo_Milk,1);
	B_GiveInvItems(other,self,ItFo_Bread,1);
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Oto jedzenie.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Doskonale. Co teraz?
	Grom_TeachAnimalTrophy = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grom_TEACHHUNTING(C_Info)
{
	npc = BAU_981_Grom;
	nr = 12;
	condition = DIA_Grom_TEACHHUNTING_Condition;
	information = DIA_Grom_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Naucz mnie, jak powinno si� polowa�.";
};


func int DIA_Grom_TEACHHUNTING_Condition()
{
	if(Grom_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Naucz mnie, jak powinno si� polowa�.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Czego chcia�by� si� nauczy�?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Obedrzyj ze sk�ry",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Usu� k�y",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Usu� serce",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("Usu� �uwaczk�",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,B_BuildLearnString("R�g cieniostwora",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nie mog� ci� nauczy� niczego, czego by� ju� nie wiedzia�.
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Natnij nogi na tyle g��boko, �eby� m�g� bez problemu zdj�� ze zwierz�cia sk�r�. Zaczynaj zawsze od przodu.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Usuwaj�c z�by, musisz bardzo uwa�a�, �eby si� nie po�ama�y.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Serce zwierz�cia mo�esz usun��, wycinaj�c je no�em z klatki piersiowej. Op�aca si� to robi� w przypadku niekt�rych niezwyk�ych lub magicznych zwierz�t.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//�uwaczki pe�zacza lub polnej bestii mo�esz usun��, u�ywaj�c do tego celu jakiej� wytrzyma�ej, metalowej d�wigni. S� bardzo mocno przytwierdzone do czaszki.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Aby wyrwa� r�g cieniostwora, musisz zaprze� si� o czaszk� i ci�gn�� z ca�ej si�y, pomagaj�c sobie przy tym ostrym no�em.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};


instance DIA_Grom_PICKPOCKET(C_Info)
{
	npc = BAU_981_Grom;
	nr = 900;
	condition = DIA_Grom_PICKPOCKET_Condition;
	information = DIA_Grom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Grom_PICKPOCKET_Condition()
{
	return C_Beklauen(75,40);
};

func void DIA_Grom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
	Info_AddChoice(DIA_Grom_PICKPOCKET,Dialog_Back,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

