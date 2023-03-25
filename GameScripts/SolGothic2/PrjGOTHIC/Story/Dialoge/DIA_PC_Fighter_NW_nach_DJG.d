
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
	description = "Odprê¿y³eœ siê wreszcie?";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Odprê¿y³eœ siê wreszcie?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Jasne! Przecie¿ smoki gryz¹ ziemiê, nie?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Sprawa jest trochê bardziej skomplikowana...
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//Jak zwykle. Daj znaæ, gdyby mój topór móg³ ci siê na coœ przydaæ.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Potrzebujê twojej pomocy.";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Potrzebujê twojej pomocy.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Nie dziwi mnie to! Co mogê dla ciebie zrobiæ?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Pop³yniesz ze mn¹ na pewn¹ wyspê, ¿eby skopaæ parê ty³ków?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//Zawsze wiedzia³eœ, jak mnie zachêciæ! Co mam robiæ?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Gorn bardzo siê zapali³, kiedy powiedzia³em mu o wyspie. Jeœli bêdê potrzebowa³ jego pomocy, chêtnie ze mn¹ pop³ynie.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Mam ju¿ zebran¹ za³ogê, ale zastanawiam siê, czy mimo to nie wzi¹æ ciê ze sob¹.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Gdybyœ musia³ kogoœ wyrzuciæ, ¿eby zrobiæ miejsce dla mnie, pozb¹dŸ siê najs³abszego.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//Podczas takiej wyprawy przydadz¹ siê zaprawieni w boju wojownicy.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Dam ci znaæ, gdy przyjdzie pora.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Chcê, ¿ebyœ ze mn¹ pop³yn¹³. Czekaj na mnie na przystani.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Chcê, ¿ebyœ ze mn¹ pop³yn¹³. Czekaj na mnie na przystani.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Masz statek? Ho, ho! Jedno ci powiem - z tob¹ nie mo¿na siê nudziæ!
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Dam ci znaæ, gdy przyjdzie pora.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//W porz¹dku.
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
	description = "Mo¿e jednak lepiej bêdzie, jeœli tu zostaniesz.";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Mo¿e jednak lepiej bêdzie, jeœli tu zostaniesz.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Mam ciê puœciæ samego? Hmmm. Nie jestem zachwycony, ale przecie¿ to twoja wojna. Gdybyœ zmieni³ zdanie, wiesz, gdzie mnie szukaæ.
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
	description = "Jednak bêdziesz mi potrzebny.";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Jednak bêdziesz mi potrzebny.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//No proszê. A ju¿ myœla³em, ¿e zdechnê tu z nudów, podczas gdy ty bêdziesz siê dobrze bawi³. Do zobaczenia.
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

