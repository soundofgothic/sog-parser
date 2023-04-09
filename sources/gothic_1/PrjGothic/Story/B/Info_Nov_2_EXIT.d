
instance Info_Nov_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_2_EXIT_Condition;
	information = Info_Nov_2_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Nov_2_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_2_EinerVonEuchWerden_Condition;
	information = Info_Nov_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chc� do was do��czy�.";
};


func int Info_Nov_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_2_EinerVonEuchWerden_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00");	//Chc� do was do��czy�.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01");	//Chcesz powiedzie�, �e postanowi�e� s�u�y� �ni�cemu? Otwiera si� przed tob� droga wiecznej szcz�liwo�ci!
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02");	//Id�! Porozmawiaj z Cor Kalomem. On oceni, w jakich zadaniach najlepiej si� sprawdzisz.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_2_WichtigePersonen_Condition;
	information = Info_Nov_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto wami dowodzi?";
};


func int Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_2_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00");	//Kto wami dowodzi?
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01");	//Y'Berion, Cor Kalom i Cor Agnar s� naszymi duchowymi przyw�dcami.
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02");	//Dzi�ki nim mo�emy nawi�zywa� kontakt ze �ni�cym. W trakcie inwokacji to w�a�nie oni staj� przed jego obliczem.
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_2_DasLager_Condition;
	information = Info_Nov_2_DasLager_Info;
	permanent = 1;
	description = "Co powinienem wiedzie� o tym miejscu?";
};


func int Info_Nov_2_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00");	//Co powinienem wiedzie� o tym miejscu?
	AI_Output(self,other,"Info_Nov_2_DasLager_02_01");	//To miejsce wiary, bracie. Nie posiadamy wiele, ale ch�tnie dzielimy si� ze wszystkimi, kt�rzy chc� s�ucha� nauk �ni�cego.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_02");	//Porozmawiaj z kt�rym� z Guru. Niech jego s�owa wzbogac� twoj� dusz�.
};


instance Info_Nov_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_2_DieLage_Condition;
	information = Info_Nov_2_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_Nov_2_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_Nov_2_DieLage_02_01");	//Nie mam czasu. Mam jeszcze mn�stwo pracy.
};

func void B_AssignAmbientInfos_Nov_2(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

