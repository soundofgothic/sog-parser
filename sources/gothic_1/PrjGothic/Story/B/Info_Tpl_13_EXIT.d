
instance Info_Tpl_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_13_EXIT_Condition;
	information = Info_Tpl_13_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_13_EinerVonEuchWerden_Condition;
	information = Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chc� zosta� �wi�tynnym Stra�nikiem, tak jak ty!";
};


func int Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Chc� zosta� �wi�tynnym Stra�nikiem, tak jak ty!
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//Czy masz poj�cie, jakich wyrzecze� wymaga�a ode mnie s�u�ba wybra�com �ni�cego w �wi�tynnej Stra�y?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Chyba nie my�lisz, �e przyjdziesz tu i tak po prostu otrzymasz najwy�sze wyr�nienie?!
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Zanim cho�by zaczniesz o tym my�le�, powiniene� lepiej pozna� najwa�niejsze nauki �ni�cego.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//To powinno zaj�� ci troch� czasu i przywr�ci� odrobin� zdrowego rozs�dku.
};


instance Info_Tpl_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_13_WichtigePersonen_Condition;
	information = Info_Tpl_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu rz�dzi?";
};


func int Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Nasi Guru s� wybra�cami �ni�cego! �ni�cy posiada w�adz� nad �yciem ka�dego z nas, a Guru objawiaj� nam jego wol�.
};


instance Info_Tpl_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_13_DasLager_Condition;
	information = Info_Tpl_13_DasLager_Info;
	permanent = 1;
	description = "Chcia�bym rozejrze� si� wewn�trz �wi�tyni �ni�cego...";
};


func int Info_Tpl_13_DasLager_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00");	//Chcia�bym rozejrze� si� wewn�trz �wi�tyni �ni�cego...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01");	//To nie do pomy�lenia! Niewierny w �wi�tyni! Dop�ki nie przysi�gniesz wype�nia� wol� �ni�cego, nie b�dzie ci wolno wej�� do jego domu modlitwy!
};


instance Info_Tpl_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_13_DieLage_Condition;
	information = Info_Tpl_13_DieLage_Info;
	permanent = 1;
	description = "Jak leci?";
};


func int Info_Tpl_13_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//Odk�d zosta�em jednym z wybranych obro�c�w wiary czuj� si� tak wspaniale, jak nigdy dot�d w moim �yciu!
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//To chyba bardzo odpowiedzialna funkcja?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Jako niewierny nie jeste� w stanie tego zrozumie�...
};

func void B_AssignAmbientInfos_Tpl_13(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

