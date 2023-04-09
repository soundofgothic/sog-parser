
instance Info_Jacko_EXIT(C_Info)
{
	npc = Org_862_Jacko;
	nr = 999;
	condition = Info_Jacko_EXIT_Condition;
	information = Info_Jacko_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Jacko_EXIT_Condition()
{
	return 1;
};

func void Info_Jacko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_862_Jacko_GoAway(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GoAway_Condition;
	information = ORG_862_Jacko_GoAway_Info;
	permanent = 1;
	important = 1;
};


func int ORG_862_Jacko_GoAway_Condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN") < 500) && (Kalom_DrugMonopol != LOG_RUNNING) && (Kalom_DrugMonopol != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GoAway_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00");	//Czego tu do cholery szukasz?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance ORG_862_Jacko_GUARD(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GUARD_Condition;
	information = ORG_862_Jacko_GUARD_Info;
	permanent = 0;
	important = 1;
};


func int ORG_862_Jacko_GUARD_Condition()
{
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GUARD_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00");	//Czy�by�my pob��dzili, h�?
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01");	//Cor Kalom wie o waszym ma�ym przedsi�wzi�ciu.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02");	//Co? Dlaczego tu jeste�?
	B_LogEntry(CH1_DrugMonopol,"Znalaz�em miejsce, w kt�rym wytwarzano ziele. Zajmuje si� tym Jacko i dw�ch jego kompan�w.");
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Cor Kalom wys�a� pi�ciu Stra�nik�w �wi�tynnych, kt�rzy maj� was wyko�czy�.",ORG_862_Jacko_GUARD_Templer);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Chc� wiedzie� ile ta informacja jest dla ciebie warta.",ORG_862_Jacko_GUARD_InfoWert);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Aby po�o�y� kres ca�ej tej sprawie!",ORG_862_Jacko_GUARD_Angriff);
};

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//Jestem tu, �eby was ostrzec. Cor Kalom wys�a� pi�ciu Stra�nik�w �wi�tynnych, kt�rzy maj� was wyko�czy�.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//�e jak? Chyba �artujesz!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//Mog� tu by� w ka�dej chwili!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//Niech to szlag! Musimy st�d wia�!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	B_LogEntry(CH1_DrugMonopol,"Przy pomocy zmy�lonych Stra�nik�w �wi�tynnych uda�o mi si� rozp�dzi� t� band� mi�czak�w. Na jaki� czas problem zosta� za�egnany.");
	B_GiveXP(XP_JackoRetired);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00");	//Chc� wiedzie� ile ta informacja jest dla ciebie warta.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01");	//Ach, wi�c o to ci chodzi... No dobrze. Ty zrobisz co� dla mnie - ja zrobi� co� dla ciebie. Prosz�, to ca�a ruda jak� mam przy sobie.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02");	//Musimy ju� i��! Tobie zreszt� te� to radz�!
	B_GiveInvItems(self,other,ItMiNugget,95);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Sprytna gadka pozwoli�a mi rozwi�za� kolejny problem. Jacko uzna�, �e robi si� za gor�co, wi�c postanowi� da� nog�.");
	B_GiveXP(XP_JackoRetired);
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//Aby po�o�y� kres ca�ej tej sprawie!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//Ch�opaki! Chod�cie no tu na chwil�!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};


instance ORG_862_Jacko_Banditencamp(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_Banditencamp_Condition;
	information = ORG_862_Jacko_Banditencamp_Info;
	permanent = 1;
	description = "A wi�c to tutaj si� zaszyli�cie.";
};


func int ORG_862_Jacko_Banditencamp_Condition()
{
	if((Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00");	//A wi�c to tutaj si� zaszyli�cie.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01");	//By� blisko. Stra�nicy z Sekty posiekaliby nas na dzwona.
	AI_StopProcessInfos(self);
};

