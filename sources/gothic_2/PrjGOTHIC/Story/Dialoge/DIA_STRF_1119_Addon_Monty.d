
instance DIA_Addon_Monty_EXIT(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 999;
	condition = DIA_Addon_Monty_EXIT_Condition;
	information = DIA_Addon_Monty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Monty_einmal;

instance DIA_Addon_Monty_Hi(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 2;
	condition = DIA_Addon_Monty_Hi_Condition;
	information = DIA_Addon_Monty_Hi_Info;
	permanent = FALSE;
	description = "Co s�ycha�?";
};


func int DIA_Addon_Monty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Monty_Hi_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_Monty_Hi_08_01");	//�yj� i tylko to si� liczy.
	if(Monty_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Monty_Hi_08_02");	//Je�li kiedy� b�dziesz chcia� pogada�, jestem do twojej dyspozycji.
		Monty_einmal = TRUE;
	};
};


instance DIA_Addon_Monty_Hacken(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 2;
	condition = DIA_Addon_Monty_Hacken_Condition;
	information = DIA_Addon_Monty_Hacken_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Monty_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hacken_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_00");	//Najwa�niejszy jest k�t, pod jakim zadajesz uderzenie.
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_01");	//Nie za p�asko i nie za ostro. Tak naj�atwiej pozyska� kruszec i nie po�ama� kilofa.
	B_Upgrade_Hero_HackChance(5);
};

