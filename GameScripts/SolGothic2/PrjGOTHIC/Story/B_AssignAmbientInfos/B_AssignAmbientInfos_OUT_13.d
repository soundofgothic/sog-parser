
instance DIA_OUT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_13_EXIT_Condition;
	information = DIA_OUT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_13_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OUT_13_STANDARD_Condition;
	information = DIA_OUT_13_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OUT_13_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_13_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_00");	//Do niedawna udawa�o nam si� odpiera� orcze hordy. Ostatnio jednak jest ich coraz wi�cej.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_01");	//Stra� r�wnie� nie chce nam pom�c. Przychodz� tylko z miasta zabiera� to, co my zbierzemy i wyhodujemy.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_13_02");	//Onar upad� chyba na g�ow�, �eby wypowiada� pos�usze�stwo miastu, podczas gdy stacjonuj� tam paladyni.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_13(var C_Npc slf)
{
	dia_out_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_13_standard.npc = Hlp_GetInstanceID(slf);
};

