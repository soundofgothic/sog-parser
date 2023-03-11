
instance Info_Tpl_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_8_EXIT_Condition;
	information = Info_Tpl_8_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_8_EinerVonEuchWerden_Condition;
	information = Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Nie przyda�by si� wam dodatkowy cz�owiek?";
};


func int Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//Nie przyda�by si� wam dodatkowy cz�owiek?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Zawsze ch�tnie przyjmujemy nowych ludzi, ale czeka ci� jeszcze wiele pracy. Tylko najlepsi Nowicjusze mog� zosta� Stra�nikami �wi�tynnymi.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//To najwy�sze wyr�nienie, jakie mo�e spotka� cz�onka Bractwa �ni�cego.
};


instance Info_Tpl_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_8_WichtigePersonen_Condition;
	information = Info_Tpl_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_8_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Naszym �wi�tym obowi�zkiem jest wype�nianie polece� Guru.
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_15_02");	//Kim s� ci Guru?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Najwy�szym z Guru jest ja�nie o�wiecony Y'Berion. Opr�cz niego s� jeszcze Cor Kalom, Cor Angar oraz kilku innych.
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Tpl_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_8_DasLager_Condition;
	information = Info_Tpl_8_DasLager_Info;
	permanent = 1;
	description = "Co mo�esz mi powiedzie� o tym obozie?";
};


func int Info_Tpl_8_DasLager_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Co mo�esz mi powiedzie� o tym obozie?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Chocia� jeste� tu nowy, mo�esz bezpiecznie porusza� si� niemal po ca�ym obozie. Wyj�tkiem jest jedynie �wi�tynia �ni�cego.
	AI_Output(other,self,"Info_Tpl_8_DasLager_08_02");	//Dlatego staraj si� nie chadza� tam, gdzie ci nie wolno, oraz nie przeszkadzaj naszym mistrzom w medytacji.
};


instance Info_Tpl_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_8_DieLage_Condition;
	information = Info_Tpl_8_DieLage_Info;
	permanent = 1;
	description = "Jak si� masz?";
};


func int Info_Tpl_8_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Jak si� masz?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Ostrzegam ci�! Oka� nieco wi�cej szacunku. Rozmawiasz z jednym z obro�c�w �wi�tych prorok�w.
};

func void B_AssignAmbientInfos_Tpl_8(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc = Hlp_GetInstanceID(slf);
};

