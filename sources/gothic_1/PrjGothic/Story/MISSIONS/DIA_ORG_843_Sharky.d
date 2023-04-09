
instance Org_843_Sharky_Exit(C_Info)
{
	npc = ORG_843_Sharky;
	nr = 999;
	condition = Org_843_Sharky_Exit_Condition;
	information = Org_843_Sharky_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_843_Sharky_Exit_Condition()
{
	return 1;
};

func void Org_843_Sharky_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_843_Sharky_Fisk(C_Info)
{
	npc = ORG_843_Sharky;
	nr = 2;
	condition = Org_843_Sharky_Fisk_Condition;
	information = Org_843_Sharky_Fisk_Info;
	permanent = 0;
	description = "Fisk ze Starego Obozu szuka nowego partnera do interes�w.";
	trade = 1;
};


func int Org_843_Sharky_Fisk_Condition()
{
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Org_843_Sharky_Fisk_Info()
{
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00");	//Fisk ze Starego Obozu szuka nowego partnera do interes�w.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_01");	//A dlaczego m�wisz o tym w�a�nie mi?
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_02");	//Pomy�la�em, �e zainteresuje ci� mo�liwo�� zarobienia paru bry�ek rudy.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_03");	//Czemu nie... Powiedz Fiskowi, �e mo�e na mnie liczy�.
};


instance Org_843_Sharky_TRADE(C_Info)
{
	npc = ORG_843_Sharky;
	condition = Org_843_Sharky_TRADE_Condition;
	information = Org_843_Sharky_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Przyda�oby mi si� kilka drobiazg�w.";
	trade = 1;
};


func int Org_843_Sharky_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,Org_843_Sharky_GREET))
	{
		return TRUE;
	};
};

func void Org_843_Sharky_TRADE_Info()
{
	AI_Output(other,self,"Org_843_Sharky_TRADE_Info_15_01");	//Przyda�oby mi si� kilka drobiazg�w.
};


instance Org_843_Sharky_GREET(C_Info)
{
	npc = ORG_843_Sharky;
	condition = Org_843_Sharky_GREET_Condition;
	information = Org_843_Sharky_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Cze��, jak leci?";
};


func int Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};

func void Org_843_Sharky_GREET_Info()
{
	AI_Output(other,self,"Org_843_Sharky_GREET_Info_15_01");	//Cze��, jak leci?
	AI_Output(self,other,"Org_843_Sharky_GREET_Info_10_02");	//Chcesz co� kupi�?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Szkodnik Sharky handluje broni� i innymi dobrami. Przebywa zwykle na terenie Nowego Obozu.");
};

