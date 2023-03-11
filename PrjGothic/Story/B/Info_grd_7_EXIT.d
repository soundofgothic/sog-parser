
instance Info_grd_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_grd_7_EXIT_Condition;
	information = Info_grd_7_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_grd_7_EXIT_Condition()
{
	return 1;
};

func void Info_grd_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_grd_7_EinerVonEuchWerden(C_Info)
{
	nr = 1;
	condition = Info_grd_7_EinerVonEuchWerden_Condition;
	information = Info_grd_7_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co mam zrobi�, �eby zosta� jednym ze stra�nik�w Gomeza?";
};


func int Info_grd_7_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00");	//Co mam zrobi�, �eby zosta� jednym ze stra�nik�w Gomeza?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01");	//Ty?! Chyba �artujesz. My�lisz, �e mo�esz tu przyj�� i tak od razu dosta� si� na sam szczyt?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02");	//Stra�nicy Gomeza to najlepsi z najlepszych.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03");	//B�dziesz musia� powoli pi�� si� do g�ry, i udowodni� swoj� lojalno�� jako Cie�.
};


instance Info_grd_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_grd_7_WichtigePersonen_Condition;
	information = Info_grd_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_grd_7_WichtigePersonen_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_grd_7_WichtigePersonen_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01");	//Thorus trzyma r�k� na pulsie. Diego jest jego porucznikiem.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02");	//Je�li naprawd� chcesz do czego� doj��, powiniene� porozmawia� w�a�nie z nimi.
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_grd_7_DasLager(C_Info)
{
	nr = 1;
	condition = Info_grd_7_DasLager_Condition;
	information = Info_grd_7_DasLager_Info;
	permanent = 1;
	description = "Wszyscy tutaj pracuj� dla Gomeza?";
};


func int Info_grd_7_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00");	//Wszyscy tutaj pracuj� dla Gomeza?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01");	//Nie. Wi�kszo�� z tych ludzi to zwykli Kopacze.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02");	//Dla Gomeza pracuj� tylko Cienie... No i my - Stra�nicy.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"WSTECZ",Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Czym si� zajmuj� stra�nicy?",Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Jak� funkcj� pe�ni� Cienie?",Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Co robi� Kopacze?",Info_grd_7_DasLager_Buddler);
};

func void Info_grd_7_DasLager_Zurueck()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

func void Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00");	//Czym si� zajmuj� Stra�nicy?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01");	//Pilnujemy porz�dku w Obozie i dbamy o bezpiecze�stwo Kopaczy.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02");	//Gomez wyp�aca nam �o�d. Dodatkowo, Kopacze p�ac� za ochron�. To ca�kiem lukratywne zaj�cie!
};

func void Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00");	//Jak� funkcj� pe�ni� Cienie?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01");	//Cienie dbaj� o to, �eby ludzie wype�niali polecenia Gomeza.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02");	//Wi�kszo�� z nich to zwyk�e lizusy, pr�buj�ce pi�� si� do g�ry. Je�li chcesz doj�� do czego� w tej kolonii, powiniene� zacz�� jako Cie�.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03");	//Jak ods�u�ysz swoje bez �adnej wpadki, kto wie? Mo�e zostaniesz jednym z nas.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04");	//Jak ju� b�dziesz u Gomeza, nikt z kolonii nie b�dzie ci uprzykrza� �ycia.
};

func void Info_grd_7_DasLager_Buddler()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00");	//Co robi� Kopacze?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01");	//Dobre pytanie! Te krety nie powinny by� nigdy wypuszczane z kopalni.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02");	//Po jakim� czasie sp�dzonym pod ziemi�, Kopacze wychodz� na g�r�, �eby przepu�ci� sw�j urobek.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03");	//Jak ju� wszystko wydadz� - wracaj� do kopalni. I tak przez ca�e �ycie.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04");	//Wygl�dasz mi na kogo� stworzonego do czego� wi�cej ni� machanie kilofem. Pogadaj z Thorusem, je�li jeszcze tego nie zrobi�e�.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_grd_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_grd_7_DieLage_Condition;
	information = Info_grd_7_DieLage_Info;
	permanent = 1;
	description = "Co s�ycha�?";
};


func int Info_grd_7_DieLage_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00");	//Co s�ycha�?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01");	//O tobie? Nic. Dop�ki nie do��czysz do kt�rego� z oboz�w, ludzie b�d� ci� ignorowali, ch�opcze.
};

func void B_AssignAmbientInfos_grd_7(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_grd_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc = Hlp_GetInstanceID(slf);
};

