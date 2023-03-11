
instance Info_Mine_Grd_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Grd_7_EXIT_Condition;
	information = Info_Mine_Grd_7_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Mine_Grd_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Grd_7_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_Mine_Condition;
	information = Info_Mine_Grd_7_Mine_Info;
	permanent = 1;
	description = "Opowiedz mi o kopalni.";
};


func int Info_Mine_Grd_7_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00");	//Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01");	//Kopacze wydobywaj� tu rud�, a my bronimy ich przed pe�zaczami.
};


instance Info_Mine_Grd_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_WichtigePersonen_Condition;
	information = Info_Mine_Grd_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Mine_Grd_7_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01");	//Ian i Asghan. Je�li szukasz czego� konkretnego - lepiej pogadaj z nimi.
};


instance Info_Mine_Grd_7_Minecrawler(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_Minecrawler_Condition;
	information = Info_Mine_Grd_7_Minecrawler_Info;
	permanent = 1;
	description = "Wiesz co� wi�cej o tych pe�zaczach?";
};


func int Info_Mine_Grd_7_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00");	//Wiesz co� wi�cej o tych pe�zaczach?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01");	//Po mojemu, ca�y ten zwierzyniec nale�a�oby wyt�pi� raz a dobrze.
};


instance Info_Mine_Grd_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_7_DieLage_Condition;
	information = Info_Mine_Grd_7_DieLage_Info;
	permanent = 1;
	description = "Jak si� masz?";
};


func int Info_Mine_Grd_7_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00");	//Jak si� masz?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01");	//Zaczynasz mnie denerwowa�, ch�opcze.
};

func void B_AssignAmbientInfos_Mine_grd_7(var C_Npc slf)
{
	Info_Mine_Grd_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_DieLage.npc = Hlp_GetInstanceID(slf);
};

