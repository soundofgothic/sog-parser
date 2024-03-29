
instance DIA_PAL_269_EXIT(C_Info)
{
	npc = PAL_269_Ritter;
	nr = 999;
	condition = DIA_PAL_269_EXIT_Condition;
	information = DIA_PAL_269_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_269_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_269_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ritter_HERO(C_Info)
{
	npc = PAL_269_Ritter;
	condition = DIA_PAL_269_HERO_Condition;
	information = DIA_PAL_269_HERO_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_PAL_269_HERO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};


var int DIA_Ritter_HERO_NoPerm;

func void DIA_PAL_269_HERO_Info()
{
	AI_Output(self,other,"DIA_Ritter_HERO_04_00");	//Twoje pojawienie si� tutaj jest dla nas wszystkich znakiem. Twoja obecno�� tchn�a w nas now� odwag�.
	if(DIA_Ritter_HERO_NoPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_HERO_04_01");	//Wiemy, �e nasi kompani w mie�cie nie zapomnieli o nas. Oko Innosa czuwa nad nami.
		AI_Output(self,other,"DIA_Ritter_HERO_04_02");	//Je�li orkowie i smoki zaatakuj�, odwa�nie stawimy im czo�a, cokolwiek nas czeka - zwyci�stwo czy �mier�.
		DIA_Ritter_HERO_NoPerm = TRUE;
	};
};

