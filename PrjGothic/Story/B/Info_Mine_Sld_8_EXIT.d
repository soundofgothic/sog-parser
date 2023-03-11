
instance Info_Mine_Sld_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Sld_8_EXIT_Condition;
	information = Info_Mine_Sld_8_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Sld_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co mam zrobi�, �eby do was do��czy�?";
};


func int Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00");	//Co mam zrobi�, �eby do was do��czy�?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01");	//Je�li chcesz pracowa� w Kotle musisz najpierw wyrobi� sobie znajomo�ci w Nowym Obozie.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02");	//Po prostu id� tam i pogadaj z lud�mi.
};


instance Info_Mine_Sld_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Sld_8_WichtigePersonen_Condition;
	information = Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01");	//Okyl rozkazuje w Kotle, Lee rz�dzi w Obozie.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02");	//Najlepiej porozmawiaj z obydwoma.
};


instance Info_Mine_Sld_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Mine_Sld_8_DasLager_Condition;
	information = Info_Mine_Sld_8_DasLager_Info;
	permanent = 1;
	description = "Co s�ycha� w obozie?";
};


func int Info_Mine_Sld_8_DasLager_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00");	//Co s�ycha� w obozie?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01");	//Pilnujemy wej�cia do kopalni.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02");	//Tylko nasi ludzie mog� wej�� do �rodka.
};


instance Info_Mine_Sld_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Sld_8_DieLage_Condition;
	information = Info_Mine_Sld_8_DieLage_Info;
	permanent = 1;
	description = "Wszystko w porz�dku?";
};


func int Info_Mine_Sld_8_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01");	//Co si� g�upio pytasz? Wszystko pod kontrol�.
};

func void B_AssignAmbientInfos_Mine_Sld_8(var C_Npc slf)
{
	Info_Mine_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
};

