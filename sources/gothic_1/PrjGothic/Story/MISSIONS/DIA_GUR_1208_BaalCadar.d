
instance DIA_BaalCadar_Exit(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 999;
	condition = DIA_BaalCadar_Exit_Condition;
	information = DIA_BaalCadar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

func void DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalCadar_Ansprechbar;
var int BaalCadar_Sakrileg;

instance DIA_BaalCadar_NoTalk(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 2;
	condition = DIA_BaalCadar_NoTalk_Condition;
	information = DIA_BaalCadar_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalCadar_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalCadar_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_BaalCadar_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalCadar_NoTalk);
	Info_AddChoice(DIA_BaalCadar_NoTalk,DIALOG_ENDE,DIA_BaalCadar_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Wszystko w porz�dku, kolego?",DIA_BaalCadar_NoTalk_Imp);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Niech �ni�cy b�dzie z tob�!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Cze��! Jestem tu nowy!",DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00");	//Cze��! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00");	//Niech �ni�cy b�dzie z tob�!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_02_01");	//(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00");	//Wszystko w porz�dku, kolego?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Imp_02_01");	//(Wzdycha)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalCadar_SleepSpell(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 1;
	condition = DIA_BaalCadar_SleepSpell_Condition;
	information = DIA_BaalCadar_SleepSpell_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalCadar_SleepSpell_Condition()
{
	var C_Npc Nov1336;
	var C_Npc Nov1340;
	var C_Npc Nov1345;
	Nov1336 = Hlp_GetNpc(NOV_1336_Novize);
	Nov1340 = Hlp_GetNpc(NOV_1340_Novize);
	Nov1345 = Hlp_GetNpc(NOV_1345_Novize);
	if(Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep))
	{
		return 1;
	};
};

func void DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00");	//Co ty wyprawiasz? Pr�buj� medytowa� z moimi uczniami.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01");	//Kto ci� nauczy� wykorzystywa� magiczne moce �ni�cego?
	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//Nikt. To by�o ca�kiem proste!
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03");	//Wygl�dasz mi na poj�tnego ucznia. B�d� twoim mistrzem.
	BaalCadar_Ansprechbar = TRUE;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Cadar ma mnie za poj�tnego ucznia!");
	B_GiveXP(XP_ImpressBaalCadar);
};


instance Gur_1208_BaalCadar_Teach(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_Teach_Condition;
	information = Gur_1208_BaalCadar_Teach_Info;
	permanent = 1;
	description = "Chcia�bym zwi�kszy� pot�g� moich zakl��!";
};


func int Gur_1208_BaalCadar_Teach_Condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01");	//Chcia�bym zwi�kszy� pot�g� moich zakl��!
	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02");	//Kluczem do tego jest si�a twego ducha.
	if(log_baalcadartrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Guru Baal Cadar pomo�e mi zwi�kszy� moj� mana.");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
};

func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};


instance Gur_1208_BaalCadar_FIRSTTEST(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information = Gur_1208_BaalCadar_FIRSTTEST_Info;
	important = 0;
	permanent = 0;
	description = "Naucz mnie wykorzystywa� magi� runiczn�.";
};


func int Gur_1208_BaalCadar_FIRSTTEST_Condition()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01");	//Naucz mnie wykorzystywa� magi� runiczn�.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02");	//Wielu pozna�o j�zyk runiczny, ale tylko kilku rozumie natur� ich magii.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03");	//Spr�buj� ci j� wyja�ni�.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Cadar wprowadzi mnie w kr�gi magii runicznej.");
};


instance Gur_1208_BaalCadar_KREIS1(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS1_Condition;
	information = Gur_1208_BaalCadar_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = "Jestem got�w, by przyst�pi� do Pierwszego Kr�gu:";
};


func int Gur_1208_BaalCadar_KREIS1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,Gur_1208_BaalCadar_FIRSTTEST) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01");	//Jestem got�w, by przyst�pi� do Pierwszego Kr�gu:
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02");	//S�uchaj mnie uwa�nie:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03");	//Dawno temu �ni�cy przyby� tutaj i zes�a� ludziom prorocz� wizj�.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04");	//Jednak wielu z nich nie chcia�o zobaczy� jego pot�gi. Nie chcia�o uwierzy�. Za�lepia�a ich chciwo�� rudy.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05");	//Tylko Y'Berion, wraz z garstk� towarzyszy us�ucha� g�osu �ni�cego. Tak powsta�o Bractwo.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06");	//W chwili, w kt�rej po raz pierwszy wst�pili na �cie�k� zbawienia, powsta� r�wnie� Pierwszy Kr�g. Magia runiczna staje si� zrozumia�a dla ka�dego, kto pod��a �ladem �ni�cego.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS2(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS2_Condition;
	information = Gur_1208_BaalCadar_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = "Jestem got�w, by przyst�pi� do Drugiego Kr�gu.";
};


func int Gur_1208_BaalCadar_KREIS2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01");	//Jestem got�w, by przyst�pi� do Drugiego Kr�gu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02");	//Zatem s�uchaj uwa�nie:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03");	//�ni�cy wskaza� Y'Berionowi i jego uczniom miejsce, w kt�rym mieli si� osiedli�.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04");	//Wybrani pracowali bez przerwy, dniem i noc�, niebaczni na niebezpiecze�stwa i zm�czenie. Co chwila przybywali do nich nowi ludzie, gotowi wys�ucha� nauk �ni�cego.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05");	//Wsp�lnie spr�bowali przez modlitw� zjednoczy� si� duchowo ze �ni�cym.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06");	//Narodzi� si� Drugi Kr�g.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS3(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS3_Condition;
	information = Gur_1208_BaalCadar_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = "Jestem got�w, by przyst�pi� do Trzeciego Kr�gu.";
};


func int Gur_1208_BaalCadar_KREIS3_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01");	//Jestem got�w, by przyst�pi� do Trzeciego Kr�gu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02");	//Zapami�taj sobie:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03");	//Zsy�ane przez �ni�cego wizje by�y co raz wyra�niejsze, ale Bractwo nie dysponowa�o si�� wystarczaj�c� by nawi�za� kontakt.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04");	//Jeden z Guru, alchemik, znalaz� rozwi�zanie. Przygotowa� nap�j sporz�dzony z wydzieliny z wn�trzno�ci pe�zaczy. Bracia wypili go przed rozpocz�ciem mod��w i ich duchowe si�y zjednoczy�y si� po raz pierwszy.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05");	//W tym samym czasie nasi Nowicjusze wyruszyli do innych oboz�w, by g�osi� tam nauki �ni�cego i wyprowadzi� niewiernych z b��d�w poga�stwa.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06");	//W ten spos�b zamkn�� si� Trzeci Kr�g.
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS4(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS4_Condition;
	information = Gur_1208_BaalCadar_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = "Jestem got�w, by przyst�pi� do Czwartego Kr�gu.";
};


func int Gur_1208_BaalCadar_KREIS4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01");	//Jestem got�w, by przyst�pi� do Czwartego Kr�gu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02");	//D�ugi czas up�yn�� od chwili za�o�enia Obozu. Wiele si� tutaj zmieni�o.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03");	//Nasza wiara umocni�a si� i rozprzestrzeni�a.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04");	//I nie zapomnieli�my o naszym celu. Nie ustali�my w naszych wysi�kach, by przyzwa� �ni�cego do tego �wiata.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05");	//Trwa�o�� i niezmienno�� naszej wiary symbolizuje Czwarty Kr�g.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06");	//Teraz wiesz ju� wszystko, co cz�onek Bractwa powinien wiedzie� o magii. By�e� poj�tnym uczniem.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};
};


instance Gur_1208_BaalCadar_SELLSTUFF(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information = Gur_1208_BaalCadar_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Gur_1208_BaalCadar_SELLSTUFF_Condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) != GIL_None))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if(log_baalcadarsell == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
		B_LogEntry(GE_TraderPSI,"Guru Baal Cadar sprzedaje runy, magiczne zwoje, napoje, amulety i pier�cienie.");
		log_baalcadarsell = TRUE;
	};
	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01");	//Chcia�bym zdoby� ksi�gi traktuj�ce o magii.
};

