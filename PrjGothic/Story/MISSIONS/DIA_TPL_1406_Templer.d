
instance DIA_KalomsGuard_Exit(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 999;
	condition = DIA_KalomsGuard_Exit_Condition;
	information = DIA_KalomsGuard_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KalomsGuard_PERM(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = DIA_KalomsGuard_PERM_Condition;
	information = DIA_KalomsGuard_PERM_Info;
	permanent = 1;
	description = "Chyba nie b�dziesz mia� nic przeciwko, je�li tam wejd�?";
};


func int DIA_KalomsGuard_PERM_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_PERM_Info()
{
	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00");	//Chyba nie b�dziesz mia� nic przeciwko, je�li tam wejd�?
	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01");	//Okazuj mojemu mistrzowi nale�yty szacunek, albo nie po�yjesz d�ugo!
	AI_StopProcessInfos(self);
};

