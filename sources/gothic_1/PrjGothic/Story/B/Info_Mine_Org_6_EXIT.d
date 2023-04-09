
instance Info_Mine_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_6_EXIT_Condition;
	information = Info_Mine_Org_6_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Org_6_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_Mine_Condition;
	information = Info_Mine_Org_6_Mine_Info;
	permanent = 1;
	description = "Co si� dzieje w kopalni?";
};


func int Info_Mine_Org_6_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00");	//Co si� dzieje w kopalni?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01");	//W kopalni? Kto tam siedzi - ju� nie wyjdzie. Kto nie siedzi - nie wejdzie.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02");	//Ciesz si�, �e ci� tam nie ma.
};


instance Info_Mine_Org_6_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_WichtigePersonen_Condition;
	information = Info_Mine_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_Mine_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01");	//Mi nikt nie rozkazuje, ale trzeba wiedzie�, jak do tego doj��.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01");	//A ja ty to osi�gn��e�?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02");	//Tajemnica zawodowa. Ale mi�dzy nami m�wi�c - dla Szkodnika to �aden problem.
};


instance Info_Mine_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_DieLage_Condition;
	information = Info_Mine_Org_6_DieLage_Info;
	permanent = 1;
	description = "Nie wygl�dasz mi na kogo�, kto by si� przepracowywa�.";
};


func int Info_Mine_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00");	//Nie wygl�dasz mi na kogo�, kto by si� przepracowywa�.
	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01");	//Ja, pracowa�? Jakby mi si� chcia�o pracowa�, nie trafi�bym pod Barier�, kapujesz?
};

func void B_AssignAmbientInfos_Mine_Org_6(var C_Npc slf)
{
	Info_Mine_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
};

