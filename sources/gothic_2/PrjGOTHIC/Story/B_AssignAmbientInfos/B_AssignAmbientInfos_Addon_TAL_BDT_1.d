
instance DIA_Addon_TAL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_1_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_1_Hi_Condition;
	information = DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Poczekam, a� poprosz� o nowego, a wtedy b�dzie moja kolej.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Z tych wszystkich ludzi na zewn�trz tylko Franko wchodzi do �rodka.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Teraz, gdy Franko nie �yje, powinienem mie� wi�ksze szanse.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o obozowisku?";
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mo�esz mi powiedzie� o obozowisku?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Uwa�aj, z kim zadzierasz! Je�eli zaczniesz b�jk� bez powodu, wszyscy zwr�c� si� przeciwko tobie!
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Wi�kszo�� z nich nie chce straci� swojego z�ota - dlatego chroni� si� nawzajem.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = "Co wiesz o Kruku?";
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co wiesz o Kruku?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//To go��, kt�ry jako pierwszy przyby� tu ze swoimi ch�opcami.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//To przyw�dca obozu. Lepiej z nim nie zadzieraj.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Kiedy� przyj�li pi�ciu nowych, bo wy�adowa� gniew na swoich ludziach.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

