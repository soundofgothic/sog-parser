
instance DIA_Addon_TAL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_13_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_13_Hi_Condition;
	information = DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Po�re ci� jaka� bestia albo sko�czysz w brzuchu jakiego� bydl�cia.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//To bagno b�dzie naszym grobem...
};


instance DIA_Addon_TAL_BDT_13_Tal(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_13_Tal_Condition;
	information = DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent = TRUE;
	description = "Co wiesz o tej dolinie?";
};


func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co wiesz o tej dolinie?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Pe�no w niej starych rzeczy. Kruk kaza� nam wszystko zbiera�.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Nie mam poj�cia, po co mu to, ale nikt przy zdrowych zmys�ach nie b�dzie nadstawia� karku za par� kamyk�w...
};


instance DIA_Addon_TAL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_13_News_Condition;
	information = DIA_Addon_TAL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co nowego?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//Poprztykali�my si� z piratami.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Dostarczali nam wi�ni�w, ale nie dostali za to z�amanego miedziaka. Nic dziwnego, �e s� w�ciekli.
	if(BDT_13_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Ale co mog� zrobi�? Zaatakowa� ob�z?
		BDT_13_einmal = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Tal.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
};

