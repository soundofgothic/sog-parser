
instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 1;
	condition = DIA_Torlof_Hallo_Condition;
	information = DIA_Torlof_Hallo_Info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

func void DIA_Torlof_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01");	//Nazywam si� Torlof.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02");	//Bra�em udzia� w buncie za�ogi na pok�adzie kr�lewskiego okr�tu.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03");	//To chyba nie by� najlepszy pomys�. Wi�ksza cz�� za�ogi by�a po stronie kapitana.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04");	//W ten spos�b wyl�dowa�em tutaj.
};


instance DIA_Torlof_Mitmachen(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 2;
	condition = DIA_Torlof_Mitmachen_Condition;
	information = DIA_Torlof_Mitmachen_Info;
	permanent = 1;
	description = "Chcia�bym do was do��czy�.";
};


func int DIA_Torlof_Mitmachen_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) || (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void DIA_Torlof_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00");	//Chcia�bym do was do��czy�.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01");	//Lee przyjmuje tylko najlepszych ludzi, mo�esz mi wierzy�.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02");	//I dop�ki nie b�dziesz jednym z nich radz� ci dobrze �y� z Laresem i jego zgraj�.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03");	//Je�li chcesz dobr� rad�, ch�opcze: spr�buj zwin�� co� ze Starego Obozu albo Starej Kopalni.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04");	//Kiedy ch�opcy uznaj�, �e nie przepadasz za Gomezem, przestan� ci sprawia� k�opoty.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05");	//A jak mam to zrobi�?
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06");	//Najpierw musisz zyska� ich zaufanie, a potem b�dziesz m�g� ich zrobi� w konia!
};

