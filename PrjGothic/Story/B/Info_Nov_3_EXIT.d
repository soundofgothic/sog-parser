
instance Info_Nov_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_3_EXIT_Condition;
	information = Info_Nov_3_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Nov_3_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_3_EinerVonEuchWerden_Condition;
	information = Info_Nov_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak mog� do was do��czy�?";
};


func int Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Jak mog� do was do��czy�?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//To proste. Musisz si� po prostu otworzy�.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Porozmawiaj z Guru, oni wska�� ci drog�!
};


instance Info_Nov_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_3_WichtigePersonen_Condition;
	information = Info_Nov_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Nov_3_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Y'Berion! Chwa�a �ni�cemu! To w�a�nie on sprowadzi� nas do tego wspania�ego miejsca.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Wszystko tutaj powsta�o w rezultacie jego �wi�tych objawie�.
};


instance Info_Nov_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_3_DasLager_Condition;
	information = Info_Nov_3_DasLager_Info;
	permanent = 1;
	description = "Jakie miejsca warto tu odwiedzi�?";
};


func int Info_Nov_3_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_3_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Jakie miejsca warto tu odwiedzi�?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Hmm... mo�e Fortuno? On wydziela darmowe racje bagiennego ziela wszystkim cz�onkom Sekty.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Znajdziesz go pod laboratorium alchemicznym Cor Kaloma.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_3_DieLage_Condition;
	information = Info_Nov_3_DieLage_Info;
	permanent = 1;
	description = "Jak si� masz?";
};


func int Info_Nov_3_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Jak si� masz?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Znakomicie... fantastycznie... wspaniale...
};

func void B_AssignAmbientInfos_Nov_3(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

