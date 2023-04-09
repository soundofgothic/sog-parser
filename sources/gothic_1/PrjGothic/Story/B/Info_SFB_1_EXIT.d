
instance Info_SFB_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_SFB_1_EXIT_Condition;
	information = Info_SFB_1_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_SFB_1_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_SFB_1_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_SFB_1_EinerVonEuchWerden_Condition;
	information = Info_SFB_1_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "W jaki spos�b mog� do��czy� do zwi�zku Kret�w?";
};


func int Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00");	//W jaki spos�b mog� do��czy� do Kret�w?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01");	//Do��czy� do nas? Tylko sobie nie my�l, �e skoro nikt nas nie pilnuje, nie musimy tutaj harowa� w pocie czo�a.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02");	//Je�li wyobra�asz sobie, �e b�dziesz tu zbija� b�ki, to grubo si� mylisz, przyjacielu.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03");	//No, ale je�li wci�� uwa�asz, �e to praca w sam raz dla ciebie, porozmawiaj ze Swineyem. �atwo go poznasz - pali na okr�g�o.
};


instance Info_SFB_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_SFB_1_WichtigePersonen_Condition;
	information = Info_SFB_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01");	//Kto dowodzi? Rozejrzyj si�! Na pewno nie ci, kt�rzy tyraj� ca�y dzie� przy zbieraniu rudy! Ha!
};


instance Info_SFB_1_DasLager(C_Info)
{
	nr = 2;
	condition = Info_SFB_1_DasLager_Condition;
	information = Info_SFB_1_DasLager_Info;
	permanent = 1;
	description = "Co to jest?";
};


func int Info_SFB_1_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00");	//Co to jest?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01");	//A na co ci to wygl�da? Kr�lewski pa�ac?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02");	//Je�li naprawd� chcesz pracowa� w Wolnej Kopalni, musisz najpierw pokaza� ludziom w Kotle, na co ci� sta�.
};


instance Info_SFB_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_SFB_1_DieLage_Condition;
	information = Info_SFB_1_DieLage_Info;
	permanent = 1;
	description = "Jak si� masz?";
};


func int Info_SFB_1_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01");	//A jak my�lisz? Fatalnie, jak zwykle zreszt�. Nic do jedzenia a mn�stwo do zrobienia! Psia ma�!
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02");	//Jedyn� osob�, kt�ra si� tu nie przepracowuje jest Swiney. Okyl awansowa� go na oficjalnego przedstawiciela Kret�w. Teraz facet kr�ci si� tu przez ca�y dzie�, uwa�aj�c �eby nie pobrudzi� sobie r�czek.
};

func void B_AssignAmbientInfos_SFB_1(var C_Npc slf)
{
	Info_SFB_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc = Hlp_GetInstanceID(slf);
};

