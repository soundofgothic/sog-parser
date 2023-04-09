
instance Info_Nov_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_5_EXIT_Condition;
	information = Info_Nov_5_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Nov_5_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_5_EinerVonEuchWerden_Condition;
	information = Info_Nov_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "W jaki spos�b mog� do was do��czy�?";
};


func int Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//W jaki spos�b mog� do was do��czy�?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Nic prostszego. Porozmawiaj z m�odszymi Guru. Oni ci ch�tnie pomog�.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Spodoba ci si� tutaj, uwierz mi.
};


instance Info_Nov_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_5_WichtigePersonen_Condition;
	information = Info_Nov_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Guru sprawuj� kontrol� nad ca�ym obozem, ale je�li nie b�dziesz si� wychyla�, zostawi� ci� w spokoju.
};


instance Info_Nov_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_5_DasLager_Condition;
	information = Info_Nov_5_DasLager_Info;
	permanent = 1;
	description = "Co mo�esz mi powiedzie� o tym obozie?";
};


func int Info_Nov_5_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_5_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Co mo�esz mi powiedzie� o tym obozie?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//To najwspanialsze miejsce w ca�ej cholernej kolonii.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//Nawet je�li nie wierzysz w nauki �ni�cego, dostaniesz dzienn� racj� jedzenia i ziela. Wystarczy tylko zg�osi� si� do Fortuno.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Gdzie go znajd�?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//Pod laboratorium Cor Kaloma, w pobli�u dziedzi�ca wielkiej �wi�tyni.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_5_DieLage_Condition;
	information = Info_Nov_5_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_Nov_5_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Nie mog� narzeka�. Jeste� tu nowy, prawda?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Dopiero co przyby�em.
};

func void B_AssignAmbientInfos_Nov_5(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

