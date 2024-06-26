
instance DIA_GornNW_nach_DJG_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 999;
	condition = DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information = DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_nach_DJG_AllDragonsDead(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 59;
	condition = DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information = DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Odpr�y�e� si� wreszcie?";
};


func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if(Gorn_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Odpr�y�e� si� wreszcie?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Jasne! Przecie� smoki gryz� ziemi�, nie?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Sprawa jest troch� bardziej skomplikowana...
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//Jak zwykle. Daj zna�, gdyby m�j top�r m�g� ci si� na co� przyda�.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Potrzebuj� twojej pomocy.";
};


func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Gorn_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Potrzebuj� twojej pomocy.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Nie dziwi mnie to! Co mog� dla ciebie zrobi�?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Pop�yniesz ze mn� na pewn� wysp�, �eby skopa� par� ty�k�w?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//Zawsze wiedzia�e�, jak mnie zach�ci�! Co mam robi�?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Gorn bardzo si� zapali�, kiedy powiedzia�em mu o wyspie. Je�li b�d� potrzebowa� jego pomocy, ch�tnie ze mn� pop�ynie.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Mam ju� zebran� za�og�, ale zastanawiam si�, czy mimo to nie wzi�� ci� ze sob�.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Gdyby� musia� kogo� wyrzuci�, �eby zrobi� miejsce dla mnie, pozb�d� si� najs�abszego.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//Podczas takiej wyprawy przydadz� si� zaprawieni w boju wojownicy.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Dam ci zna�, gdy przyjdzie pora.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Chc�, �eby� ze mn� pop�yn��. Czekaj na mnie na przystani.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Chc�, �eby� ze mn� pop�yn��. Czekaj na mnie na przystani.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Masz statek? Ho, ho! Jedno ci powiem - z tob� nie mo�na si� nudzi�!
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Dam ci zna�, gdy przyjdzie pora.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//W porz�dku.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};


instance DIA_GornNW_nach_DJG_LeaveMyShip(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information = DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Mo�e jednak lepiej b�dzie, je�li tu zostaniesz.";
};


func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if((Gorn_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Mo�e jednak lepiej b�dzie, je�li tu zostaniesz.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Mam ci� pu�ci� samego? Hmmm. Nie jestem zachwycony, ale przecie� to twoja wojna. Gdyby� zmieni� zdanie, wiesz, gdzie mnie szuka�.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornNW_nach_DJG_StillNeedYou(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information = DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent = TRUE;
	description = "Jednak b�dziesz mi potrzebny.";
};


func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if(((Gorn_IsOnBoard == LOG_OBSOLETE) || (Gorn_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Jednak b�dziesz mi potrzebny.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//No prosz�. A ju� my�la�em, �e zdechn� tu z nud�w, podczas gdy ty b�dziesz si� dobrze bawi�. Do zobaczenia.
	self.flags = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Fighter_nach_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 900;
	condition = DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

