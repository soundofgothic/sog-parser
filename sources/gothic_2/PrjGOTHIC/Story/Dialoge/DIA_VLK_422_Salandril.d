
instance DIA_Salandril_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_PICKPOCKET(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_Salandril_PICKPOCKET_Condition;
	information = DIA_Salandril_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};


var int DIA_Salandril_PICKPOCKET_perm;

func int DIA_Salandril_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (DIA_Salandril_PICKPOCKET_perm == FALSE) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,Dialog_Back,DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItems(self,ItKe_Salandril,1);
		B_GiveInvItems(self,other,ItKe_Salandril,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
};


instance DIA_Salandril_Hallo(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Hallo_Condition;
	information = DIA_Salandril_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Hallo_Info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//Witaj, w�drowcze. Szukasz doskona�ej mikstury?
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//Mam �wietny wyb�r po rozs�dnych cenach. A moje mikstury s� o wiele lepsze od tych, kt�re stara si� sprzedawa� Zuris.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Salandril sprzedaje mikstury. Jego sklep znajduje si� w g�rnym mie�cie.");
};


instance DIA_Salandril_Trank(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Trank_Condition;
	information = DIA_Salandril_Trank_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Trank_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Salandril_KLOSTER) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trank_Info()
{
	AI_Output(self,other,"DIA_Salandril_Trank_13_00");	//S�ysza�em, �e by�e� z paladynami w G�rniczej Dolinie. Jestem pod wra�eniem.
	AI_Output(self,other,"DIA_Salandril_Trank_13_01");	//Nie �piesz si� i spokojnie obejrzyj m�j towar. Dobrze si� sk�ada, bo akurat mam co� wyj�tkowego na sprzeda�.
	CreateInvItems(self,ItPo_Perm_DEX,1);
};


instance DIA_Salandril_Trade(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 9;
	condition = DIA_Salandril_Trade_Condition;
	information = DIA_Salandril_Trade_Info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int DIA_Salandril_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Salandril_KLOSTER) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//Poka� mi swoje towary.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//Z przyjemno�ci�, czcigodny Bracie.
		if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//Z przyjemno�ci�, szlachetny Panie.
	};
};


instance DIA_Salandril_KAP3_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP3_EXIT_Condition;
	information = DIA_Salandril_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KLOSTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_KLOSTER_Condition;
	information = DIA_Salandril_KLOSTER_Info;
	description = "Masz uda� si� do klasztoru, w kt�rym zostaniesz os�dzony!";
};


func int DIA_Salandril_KLOSTER_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//Masz uda� si� do klasztoru, w kt�rym zostaniesz os�dzony!
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//Co? Nie ma mowy! Ci n�dzni magowie nie maj� nawet cienia dowodu przeciwko mnie!
	if((hero.guild == GIL_KDF) && (SC_KnowsProspektorSalandril == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//A co z tymi fa�szywymi udzia�ami w kopalni, kt�re mo�na wsz�dzie kupi�? Widnieje na nich tw�j podpis. Jeste� winny!
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//Mam rozkazy do wykonania i albo ze mn� p�jdziesz, albo ci� do tego zmusz�.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//CO? Przeci�gn� ci� przez ca�e miasto i poka��, jak nale�y si� do mnie zwraca�!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Salandril_GehinsKloster(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_GehinsKloster_Condition;
	information = DIA_Salandril_GehinsKloster_Info;
	description = "No, to teraz p�jdziesz do klasztoru, czy b�dziemy si� dalej bawi�?";
};


func int DIA_Salandril_GehinsKloster_Condition()
{
	if(((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running)) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_KnowsInfo(other,DIA_Salandril_KLOSTER))
	{
		return TRUE;
	};
};

func void DIA_Salandril_GehinsKloster_Info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//No, to teraz p�jdziesz do klasztoru, czy b�dziemy si� dalej bawi�?
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//B�dziesz tego �a�owa�! Cholera! P�jd� do tego twojego klasztoru, ale nie my�l, �e ujdzie ci to na sucho.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;
};


instance DIA_Salandril_Verschwinde(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Verschwinde_Condition;
	information = DIA_Salandril_Verschwinde_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Salandril_Verschwinde_Condition()
{
	if((MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Verschwinde_Info()
{
	B_Verschwinde_Stimme13();
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP4_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP4_EXIT_Condition;
	information = DIA_Salandril_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP5_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP5_EXIT_Condition;
	information = DIA_Salandril_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP6_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP6_EXIT_Condition;
	information = DIA_Salandril_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

