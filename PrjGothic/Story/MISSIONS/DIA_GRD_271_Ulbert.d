
instance GRD_271_ULBERT_Exit(C_Info)
{
	npc = GRD_271_Ulbert;
	nr = 999;
	condition = GRD_271_ULBERT_Exit_Condition;
	information = GRD_271_ULBERT_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_KEY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_KEY_Condition;
	information = GRD_271_ULBERT_KEY_Info;
	important = 0;
	permanent = 0;
	description = "Co si� znajduje w sk�adowisku?";
};


func int GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_KEY_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01");	//Co si� znajduje w sk�adowisku?
	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02");	//Nie tw�j interes!
};


instance GRD_271_ULBERT_TRICK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_TRICK_Condition;
	information = GRD_271_ULBERT_TRICK_Info;
	important = 0;
	permanent = 0;
	description = "Za�o�� si�, �e zasch�o ci w ustach od tej ci�kiej pracy.";
};


func int GRD_271_ULBERT_TRICK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_key))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_TRICK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01");	//Za�o�� si�, �e zasch�o ci w ustach od tej ci�kiej pracy.
	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02");	//Jeszcze jak! Ch�tnie bym si� czego� napi�. Mo�e m�g�by� mnie czym� pocz�stowa�, co?
	Log_CreateTopic(CH2_StorageShed,LOG_MISSION);
	Log_SetTopicStatus(CH2_StorageShed,LOG_RUNNING);
	B_LogEntry(CH2_StorageShed,"Ulbert pilnuje sk�adowiska w Starej Kopalni. Musz� mu przynie�� co� do picia.");
};


instance GRD_271_ULBERT_DRINK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRINK_Condition;
	information = GRD_271_ULBERT_DRINK_Info;
	important = 0;
	permanent = 0;
	description = "(daj co� do picia)";
};


func int GRD_271_ULBERT_DRINK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && (Npc_HasItems(hero,ItFoBeer) || Npc_HasItems(hero,ItFoWine) || Npc_HasItems(hero,ItFoBooze)))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRINK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01");	//Prosz� bardzo, na zdrowie!
	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02");	//Dzi�ki.
	if(Npc_HasItems(hero,ItFoBeer))
	{
		B_GiveInvItems(hero,self,ItFoBeer,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBeer);
	}
	else if(Npc_HasItems(hero,ItFoWine))
	{
		B_GiveInvItems(hero,self,ItFoWine,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoWine);
	}
	else if(Npc_HasItems(hero,ItFoBooze))
	{
		B_GiveInvItems(hero,self,ItFoBooze,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBooze);
	};
};


instance GRD_271_ULBERT_DRUNK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRUNK_Condition;
	information = GRD_271_ULBERT_DRUNK_Info;
	important = 0;
	permanent = 0;
	description = "To jak z tym sk�adowiskiem? Jest tam co� ciekawego?";
};


func int GRD_271_ULBERT_DRUNK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drink))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01");	//To jak z tym sk�adowiskiem? Jest tam co� ciekawego?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02");	//Kilka skrzy�, w kt�rych przechowujemy zapasy. Niestety, gdzie� si� nam zapodzia� klucz.
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03");	//Zapodzia�?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04");	//Za�o�� si�, �e to sprawka Alepha. Temu cz�owiekowi nie mo�na ufa�.
	B_LogEntry(CH2_StorageShed,"Pocz�stowany trunkiem Ulbert powiedzia� mi, �e zgubi� gdzie� klucz do skrzy�. Pono� jeden z Kopaczy imieniem Aleph mia� z tym co� wsp�lnego!");
};


instance GRD_271_ULBERT_LOCK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_LOCK_Condition;
	information = GRD_271_ULBERT_LOCK_Info;
	important = 0;
	permanent = 0;
	description = "(odci�gnij Ulberta)";
};


func int GRD_271_ULBERT_LOCK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_LOCK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01");	//S�uchaj, Ian i pozostali siedz� teraz na dole i zajadaj� si� pieczonym mi�sem.
	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02");	//Co? Beze mnie? No nie! Ju� ja im poka��!
	B_LogEntry(CH2_StorageShed,"Odci�gni�cie Ulberta od sk�adowiska nie by�o zbyt trudne. Nie jest to szczeg�lnie inteligentny cz�owiek.");
	Npc_ExchangeRoutine(self,"away");
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_ANGRY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_ANGRY_Condition;
	information = GRD_271_ULBERT_ANGRY_Info;
	important = 1;
	permanent = 0;
};


func int GRD_271_ULBERT_ANGRY_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_lock) && (Npc_GetDistToWP(hero,"OM_CAVE1_49") < 600))
	{
		return TRUE;
	};
};

func void GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01");	//Hej, ty! Tam nie by�o �adnego pieczonego mi�sa!
	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02");	//Eee... C�, widocznie si� pomyli�em. �ycz� mi�ego dnia!
	B_GiveXP(XP_LureUlbertAway);
	B_LogEntry(CH2_StorageShed,"Spotka�em ponownie Ulberta. Ten g�upol nie zorientowa� si� nawet, �e wystrychn��em go na dudka!");
	Log_SetTopicStatus(CH2_StorageShed,LOG_SUCCESS);
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

