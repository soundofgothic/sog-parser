
instance DIA_Sld_702_EXIT(C_Info)
{
	npc = SLD_702_Soeldner;
	nr = 999;
	condition = DIA_Sld_702_EXIT_Condition;
	information = DIA_Sld_702_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

func void DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sld_702_First(C_Info)
{
	npc = SLD_702_Soeldner;
	nr = 1;
	condition = DIA_Sld_702_First_Condition;
	information = DIA_Sld_702_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Sld_702_First_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Sld_702_First_Info()
{
	AI_Output(self,other,"DIA_Sld_702_First_04_00");	//Wiesz dok�d leziesz?
	AI_Output(other,self,"DIA_Sld_702_First_15_01");	//Nie, dok�d?
	AI_Output(self,other,"DIA_Sld_702_First_04_02");	//To droga do siedziby naszego przyw�dcy - Lee.
};


instance DIA_Sld_702_PERM(C_Info)
{
	npc = SLD_702_Soeldner;
	nr = 1;
	condition = DIA_Sld_702_PERM_Condition;
	information = DIA_Sld_702_PERM_Info;
	permanent = 1;
	description = "Co musz� zrobi�, �eby� pozwoli� mi zobaczy� si� z Lee?";
};


func int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

func void DIA_Sld_702_PERM_Info()
{
	AI_Output(other,self,"DIA_Sld_702_PERM_15_00");	//Co musz� zrobi�, �eby� pozwoli� mi zobaczy� si� z Lee?
	AI_Output(self,other,"DIA_Sld_702_PERM_04_01");	//Nic!
	AI_Output(self,other,"DIA_Sld_702_PERM_04_02");	//Tu nie Stary Ob�z, a Lee to nie Gomez!
	AI_Output(self,other,"DIA_Sld_702_PERM_04_03");	//On nie musi chowa� si� za plecami ca�ej armii siepaczy. Sam potrafi o siebie zadba�.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_04");	//MY jeste�my tu tylko na wypadek, gdyby nas potrzebowa�.
};

