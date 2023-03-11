
instance Info_Mine_Org_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_7_EXIT_Condition;
	information = Info_Mine_Org_7_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Mine_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Org_7_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_Mine_Condition;
	information = Info_Mine_Org_7_Mine_Info;
	permanent = 1;
	description = "Opowiedz mi o tym obozie.";
};


func int Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00");	//Opowiedz mi o tym obozie.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01");	//Ob�z? Masz na my�li Kocio�? Nie jest tu tak �le jak m�wi�. Krety wydobywaj� rud�, Najemnicy ich pilnuj� a my - Szkodniki - patrzymy im wszystkim na r�ce.
};


instance Info_Mine_Org_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_WichtigePersonen_Condition;
	information = Info_Mine_Org_7_WichtigePersonen_Info;
	permanent = 1;
	description = "W takim razie kto tu rz�dzi.";
};


func int Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00");	//W takim razie kto tu rz�dzi?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01");	//To zale�y, od kogo przyjmujesz rozkazy.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02");	//W ka�dym razie jak Okyl sobie czego� za�yczy, lepiej mu nie odmawia�. Gdy si� wkurzy, potrafi by� bardzo nieprzyjemny.
};


instance Info_Mine_Org_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_DieLage_Condition;
	information = Info_Mine_Org_7_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01");	//Zaczynasz mnie denerwowa�, ch�opcze.
};

func void B_AssignAmbientInfos_Mine_Org_7(var C_Npc slf)
{
	Info_Mine_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
};

