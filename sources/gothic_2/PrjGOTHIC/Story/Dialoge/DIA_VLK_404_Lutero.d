
instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Nazywam si� Lutero. Zajmuj� si� skupem i sprzeda�� najr�niejszych rzeczy.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Co mo�esz mi zaoferowa�?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//Mam tu wyj�tkowo rzadkie i niespotykane towary. Jeszcze nigdy nie zdarzy�o mi si� zawie�� oczekiwa� klienta.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Lutero sprzedaje w g�rnym mie�cie rzadkie towary.");
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Wynocha st�d! Nie masz co robi�? Znajd� sobie jak�� prac�, darmozjadzie - tylko jak najdalej st�d!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Czego tu szukasz, nowicjuszu? Czy nie powiniene� przebywa� w klasztorze?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "Szukasz czego� konkretnego?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Szukasz czego� konkretnego?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Tak, potrzebne mi s� pazury z�bacza.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Jednak nie chodzi mi o jakiekolwiek pazury. To musi by� co� specjalnego, szpony pot�nej bestii, kt�ra zabi�a dziesi�tki my�liwych, albo co� takiego.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Gdzie mog� znale�� z�bacze?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Kilka z nich zamieszkuje t� wysp�, ale wi�kszo�� grasuje w G�rniczej Dolinie.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//Co z tego b�d� mia�?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Mog� dla ciebie znale�� kamie� runiczny.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Mog� da� ci pier�cie� nietykalno�ci.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Zobacz�, co si� da zrobi�.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"Kupiec Lutero poszukuje pazur�w wyj�tkowo silnego z�bacza.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "Mam tu dla ciebie pazury bardzo niezwyk�ego z�bacza.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if((Npc_HasItems(other,ItAt_ClawLeader) >= 1) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//Mam tu dla ciebie pazury bardzo niezwyk�ego z�bacza.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Moi klienci si� uciesz�.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nie mam tutaj kamienia runicznego. Ale wiem, gdzie go mo�na znale��.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//W drodze z miasta do gospody, b�dziesz przechodzi� pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Jest tam jaskinia, w kt�rej jeden z moich przyjaci� ukry� skrzyni� z kamieniem runicznym. Oto klucz.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Oto pier�cie�, kt�ry ci obieca�em.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_Lutero_PICKPOCKET(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return C_Beklauen(58,65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

