
instance Info_Stt_12_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_12_EXIT_Condition;
	information = Info_Stt_12_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Stt_12_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Stt_12_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_12_EinerVonEuchWerden_Condition;
	information = Info_Stt_12_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chcia�bym przy��czy� si� do Cieni.";
};


func int Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_12_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00");	//Chcia�bym przy��czy� si� do Cieni.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01");	//Och. W takim razie powiniene� wiedzie�, �e Gomez nie toleruje b��d�w. Je�li chcesz zosta� jednym z nas, musisz by� got�w p�j�� za nim cho�by w ogie�.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02");	//Tylko nieca�a po�owa z tych, kt�rzy pr�bowali, zosta�a przyj�ta.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03");	//A co si� sta�o z reszt�?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04");	//Pewnie siedz� w Nowym Obozie i pa�aszuj� ry�. He he he.
};


instance Info_Stt_12_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_12_WichtigePersonen_Condition;
	information = Info_Stt_12_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_12_WichtigePersonen_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01");	//Diego jest... jakby to powiedzie� - szefem Cieni, ale to Thorus decyduje, kto mo�e si� spotka� z Gomezem.
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Stt_12_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_12_DasLager_Condition;
	information = Info_Stt_12_DasLager_Info;
	permanent = 1;
	description = "Chcia�bym wiedzie�, co ten ob�z ma do zaoferowania.";
};


func int Info_Stt_12_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00");	//Chcia�bym wiedzie�, co ten ob�z ma do zaoferowania.
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01");	//O to najlepiej zapyta� Kopaczy. Oni i tak nie maj� nic do roboty.
};


instance Info_Stt_12_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_12_DieLage_Condition;
	information = Info_Stt_12_DieLage_Info;
	permanent = 1;
	description = "Cze��. Jak leci?";
};


func int Info_Stt_12_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00");	//Cze��. Jak leci?
	AI_Output(self,other,"Info_Stt_12_DieLage_12_01");	//Czego chcesz?
};

func void B_AssignAmbientInfos_Stt_12(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_12_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc = Hlp_GetInstanceID(slf);
};

