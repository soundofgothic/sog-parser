
instance Info_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_3_EXIT_Condition;
	information = Info_Vlk_3_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_3_EinerVonEuchWerden_Condition;
	information = Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co mam zrobi�, �eby do was do��czy�?";
};


func int Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//Co mam zrobi�, �eby do was do��czy�?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//Jestem zwyk�ym Kopaczem. Moje zdanie si� nie liczy. Powiniene� porozmawia� ze Stra�nikami, albo z Cieniami.
};


instance Info_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_3_WichtigePersonen_Condition;
	information = Info_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Vlk_3_WichtigePersonen_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//Gomez. Mieszka w zamku. Ale my - Kopacze - mamy do�� k�opot�w z jego Stra�nikami.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//Lepiej trzyma� si� od nich z daleka. Je�li wejdziesz im w drog� - masz k�opoty.
};


instance Info_Vlk_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_3_DasLager_Condition;
	information = Info_Vlk_3_DasLager_Info;
	permanent = 1;
	description = "Co powinienem tutaj obejrze�?";
};


func int Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//Co warto tutaj obejrze�?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//C�, je�li lubisz hazard, powiniene� zajrze� wieczorem na aren�. Je�li chcesz co� kupi�, id� na targowisko.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//Sprzedaj� tam prawie wszystko. Je�li potrzebujesz mapy - porozmawiaj z Grahamem. Jego chata le�y niemal dok�adnie naprzeciw zamkowej bramy.
};


instance Info_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_3_DieLage_Condition;
	information = Info_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Co si� dzieje?";
};


func int Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Co si� dzieje?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//Sam si� dowiesz w swoim czasie. Miej oczy szeroko otwarte. Pilnuj si� zw�aszcza w nocy.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//Od kilku dni nie wyspa�em si� porz�dnie. A w tej kolonii kto nie �pi, ten pracuje na dwie zmiany!
};

func void B_AssignAmbientInfos_Vlk_3(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

