
instance DIA_Addon_Pardos_EXIT(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 999;
	condition = DIA_Addon_Pardos_EXIT_Condition;
	information = DIA_Addon_Pardos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Pardos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Pardos_Hi(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_Hi_Condition;
	information = DIA_Addon_Pardos_Hi_Info;
	permanent = FALSE;
	description = "Co z tob¹?";
};


func int DIA_Addon_Pardos_Hi_Condition()
{
	if(Sklaven_Flucht == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_00");	//Co z tob¹?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_01");	//Powoli nadchodzi koniec... Mój koniec... Czy to piêkny letni poranek, czy te¿ gor¹ca noc, podczas której gwiazdy migoc¹ na kryszta³owo czystym niebie?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_02");	//Nie wiem... Gdzie jest majowy deszcz, gdzie jest jesienny wiatr... Nie czujê ich...
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_03");	//Wzrok odchodzi jako pierwszy...
};


instance DIA_Addon_Pardos_save(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_save_Condition;
	information = DIA_Addon_Pardos_save_Info;
	permanent = FALSE;
	description = "Trzymaj siê. Pomoc ju¿ nadchodzi.";
};


func int DIA_Addon_Pardos_save_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Pardos_Hi) && (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_save_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_save_15_00");	//Trzymaj siê. Pomoc ju¿ nadchodzi.
	AI_Output(self,other,"DIA_Addon_Pardos_save_03_01");	//Dziêkujê... Dziêkujê za te koj¹ce s³owa.
};


var int Pardos_Geheilt;

instance DIA_Addon_Pardos_trank(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_trank_Condition;
	information = DIA_Addon_Pardos_trank_Info;
	permanent = FALSE;
	description = "Wypij to. (Daj napój)";
};


func int DIA_Addon_Pardos_trank_Condition()
{
	if((Pardos_Geheilt == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Pardos_save))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_trank_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_15_00");	//Wypij to.
	AI_StandupQuick(self);
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Info_AddChoice(DIA_Addon_Pardos_trank,Dialog_Back,DIA_Addon_Pardos_trank_BACK);
	if(Npc_HasItems(other,ItPo_Health_01))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"Daj esencjê lecznicz¹",DIA_Addon_Pardos_trank_01);
	};
	if(Npc_HasItems(other,ItPo_Health_02))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"Daj ekstrakt leczniczy",DIA_Addon_Pardos_trank_02);
	};
	if(Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"Daj eliksir leczniczy",DIA_Addon_Pardos_trank_03);
	};
	if(Npc_HasItems(other,ItFo_Addon_Meatsoup))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank,"Daj gulasz",DIA_Addon_Pardos_trank_Soup);
	};
};

func void B_SayPardosThanks()
{
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_00");	//Dziêki. Czujê siê jakby lepiej...
};

func void DIA_Addon_Pardos_trank_BACK()
{
	Info_ClearChoices(DIA_Addon_Pardos_trank);
};

func void DIA_Addon_Pardos_trank_01()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,1))
	{
		B_UseItem(self,ItPo_Health_01);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Pardos_trank_02()
{
	if(B_GiveInvItems(other,self,ItPo_Health_02,1))
	{
		B_UseItem(self,ItPo_Health_02);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 2);
};

func void DIA_Addon_Pardos_trank_03()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,3))
	{
		B_UseItem(self,ItPo_Health_03);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 3);
};

func void DIA_Addon_Pardos_trank_Soup()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_soup_15_00");	//Zjedz trochê gulaszu.
	if(B_GiveInvItems(other,self,ItFo_Addon_Meatsoup,1))
	{
		B_UseItem(self,ItFo_Addon_Meatsoup);
	};
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_01");	//Dziêkujê. Powinienem szybko odzyskaæ si³y.
	B_GivePlayerXP(XP_Ambient * 3);
};


instance DIA_Addon_Pardos_perm(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 99;
	condition = DIA_Addon_Pardos_perm_Condition;
	information = DIA_Addon_Pardos_perm_Info;
	permanent = TRUE;
	description = "Jak siê trzymasz?";
};


func int DIA_Addon_Pardos_perm_Condition()
{
	if(Pardos_Geheilt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_perm_15_00");	//Jak siê trzymasz?
	AI_Output(self,other,"DIA_Addon_Pardos_perm_03_01");	//Dziêki twoim staraniom czujê siê znacznie lepiej. Wraca mi dawna si³a.
};

