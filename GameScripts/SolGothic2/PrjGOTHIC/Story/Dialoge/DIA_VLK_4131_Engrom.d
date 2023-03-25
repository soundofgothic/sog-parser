
instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HALLO(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HALLO_Info;
	description = "Co s�ycha�?";
};


func int DIA_Engrom_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Fatalnie!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Mmmh!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//Co jeszcze mog� powiedzie�. Ca�ymi dniami tylko w g�r� i w d� tej cholernej rzeki.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Orkowie po lewej, bandyci po prawej... I ci�gle tylko to mi�so topielc�w. Trudno to wytrzyma� na d�u�sz� met�.
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = "Zastanawia�e� si� kiedy� nad opuszczeniem tego miejsca?";
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//Zastanawia�e� si� kiedy� nad opuszczeniem tego miejsca?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Tak, pewnie. Nie ma problemu.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Najpierw przedr� si� przez hordy ork�w, powiem 'dzie� dobry' potworom kr���cym po ca�ej okolicy, a potem spacerkiem przejd� sobie przez prze��cz!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//To by by�a niez�a sztuczka!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Ale ja jako� si� tu przedosta�em.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Czy chcesz mi powiedzie�, �e w�a�nie przekroczy�e� prze��cz?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Jak wida� - tak!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Mia�e� szcz�cie. Je�li o mnie chodzi, to dop�ki w okolicy troch� si� nie uspokoi, nie zamierzam si� w og�le st�d rusza�.
};


instance DIA_Engrom_Jagd(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = "Jak idzie polowanie?";
};


func int DIA_Engrom_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Polowanie jest moj� jedyn� pociech�. Przyda�by si� od czasu do czasu jaki� inny cel ni� te przekl�te topielce.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP4_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP4_EXIT_Condition;
	information = DIA_Engrom_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = "Wszystko w porz�dku?";
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = "Op�ta�o ci� z�o.";
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Op�ta�o ci� z�o.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Pozw�l, �e ci pomog�.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//Nie dotykaj mnie!
	B_NpcClearObsessionByDMT(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,ZS_Flee,0,"");
};


instance DIA_Engrom_KAP5_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP5_EXIT_Condition;
	information = DIA_Engrom_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP6_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP6_EXIT_Condition;
	information = DIA_Engrom_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_PICKPOCKET(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 900;
	condition = DIA_Engrom_PICKPOCKET_Condition;
	information = DIA_Engrom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Engrom_PICKPOCKET_Condition()
{
	return C_Beklauen(10,5);
};

func void DIA_Engrom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,Dialog_Back,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

