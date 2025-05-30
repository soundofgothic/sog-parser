
instance DIA_Addon_Skinner_EXIT(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 999;
	condition = DIA_Addon_Skinner_EXIT_Condition;
	information = DIA_Addon_Skinner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skinner_PICKPOCKET(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 900;
	condition = DIA_Addon_Skinner_PICKPOCKET_Condition;
	information = DIA_Addon_Skinner_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Skinner_PICKPOCKET_Condition()
{
	return C_Beklauen(100,200);
};

func void DIA_Addon_Skinner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skinner_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET,Dialog_Back,DIA_Addon_Skinner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skinner_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skinner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

func void DIA_Addon_Skinner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
	B_Say(self,self,"$AWAKE");
};


instance DIA_Addon_Skinner_Hi(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 2;
	condition = DIA_Addon_Skinner_Hi_Condition;
	information = DIA_Addon_Skinner_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skinner_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_00");	//Po co mnie obudzi�e�? Za�o�� si�, �e nawet nie wiesz....
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_01");	//Nie, nie odpowiadaj. Za p�no na wym�wki.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_02");	//Masz teraz dwie mo�liwo�ci. Walczy� ze mn� i moj� Betty... albo spr�bowa� ucieczki.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_03");	//Ja na twoim miejscu pr�bowa�bym ucieka�...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Skinner_Attentat(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 9;
	condition = DIA_Addon_Skinner_Attentat_Condition;
	information = DIA_Addon_Skinner_Attentat_Info;
	permanent = FALSE;
	description = "A co do pr�by zab�jstwa...";
};


func int DIA_Addon_Skinner_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Skinner_Attentat_15_00");	//A co do pr�by zab�jstwa...
	AI_Output(self,other,"DIA_Addon_Skinner_Attentat_08_01");	//Czego ode mnie chcesz?
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
	Info_AddChoice(DIA_Addon_Skinner_Attentat,"Chc� si� pozby� Estebana.",DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice(DIA_Addon_Skinner_Attentat,"Zabij� zdrajc�.",DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");	//Chc� si� pozby� Estebana.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");	//Znakomicie.
	Judas_Counter = Judas_Counter + 1;
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");	//Zabij� zdrajc�.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");	//Cholera.
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

