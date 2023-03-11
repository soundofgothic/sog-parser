
instance Info_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_2_EXIT_Condition;
	information = Info_Vlk_2_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_2_EinerVonEuchWerden_Condition;
	information = Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chc� do was do��czy�.";
};


func int Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00");	//Chc� do was do��czy�.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01");	//Nie bardzo wiem, czemu mia�by� chcie� na ochotnika pracowa� w kopalni. Ludzi takich jak ty spodziewa�bym si� raczej w zamkowej stra�y.
};


instance Info_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_2_WichtigePersonen_Condition;
	information = Info_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01");	//Fletcher, Bloodwyn i Szakal zbieraj� w Zewn�trznym Pier�cieniu pieni�dze za ochron�. Ka�dy z nich ma sw�j rewir.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02");	//Tak d�ugo jak s� po twojej stronie - jeste� bezpieczny.
};


instance Info_Vlk_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_2_DasLager_Condition;
	information = Info_Vlk_2_DasLager_Info;
	permanent = 1;
	description = "Chcia�bym dowiedzie� si� wi�cej o waszym Obozie.";
};


func int Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00");	//Chcia�bym dowiedzie� si� czego� wi�cej o waszym Obozie.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01");	//Powiniene� pogada� z Cieniami. Oni b�d� mogli powiedzie� ci wi�cej ni� ja. Tylko uwa�aj na siebie. Wi�kszo�ci z nich nie mo�na ufa� do ko�ca.
};


instance Info_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_2_DieLage_Condition;
	information = Info_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "Jak wygl�da �ycie tutaj?";
};


func int Info_Vlk_2_DieLage_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00");	//Jak wygl�da �ycie tutaj?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01");	//Je�li przys�ali ci� Magnaci, powiedz im, �e nie szukam k�opot�w. Ode mnie nikt si� niczego nie dowie.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02");	//Wystarcza mi to, co nam daj�.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03");	//Nikt mnie nie przysy�a! Dopiero co tu przyby�em!
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04");	//��todzi�b, tak? Nowi zawsze pakuj� si� w jakie� paskudne k�opoty. Nie chc� mie� z tob� nic wsp�lnego, jasne?
};

func void B_AssignAmbientInfos_Vlk_2(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

