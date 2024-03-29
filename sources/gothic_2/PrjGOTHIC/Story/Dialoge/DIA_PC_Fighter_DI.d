
instance DIA_Gorn_DI_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 999;
	condition = DIA_Gorn_DI_KAP5_EXIT_Condition;
	information = DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gorn_DI_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorn_DI_Hallo(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_Hallo_Condition;
	information = DIA_Gorn_DI_Hallo_Info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int DIA_Gorn_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_15_00");	//Wszystko w porz�dku?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_01");	//Jak na razie. Wiesz, �e mam ochot� na dobr� rozr�b�!
	}
	else
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_02");	//Gdyby� spotka� wi�cej tych ork�w, przy�lij ich koniecznie do mnie. Dopiero si� rozgrzewam.
	};
};


instance DIA_Gorn_DI_Teach(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 10;
	condition = DIA_Gorn_DI_Teach_Condition;
	information = DIA_Gorn_DI_Teach_Info;
	permanent = TRUE;
	description = "Chc� troch� potrenowa�.";
};


func int DIA_Gorn_DI_Teach_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Chc� troch� potrenowa�.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//Fakt. Przyda ci si�.
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//W Kolonii by�e� w du�o lepszej formie.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Spr�buj trzyma� or� troch� wy�ej. Tak� gard� nie sparujesz nawet laski niewidomego.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Gorn_DI_Teach);
};


instance DIA_Gorn_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_UndeadDragonDead_Condition;
	information = DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Zosta�e� na statku?";
};


func int DIA_Gorn_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Gorn_DI_UndeadDragonDead_OneTime;

func void DIA_Gorn_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_00");	//Zosta�e� na statku?
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_01");	//Jasne. Pomy�l, co by by�o, gdyby� go nie zasta� po powrocie!
	if(DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_02");	//Co b�dzie dalej?
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_03");	//Pewnie nic. Zamierzam wr�ci� do domu.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_04");	//Do domu? Czyli dok�d? Nie wiedzia�em, �e masz co� takiego jak dom.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_05");	//Mam lepsz� propozycj�: poszukajmy jakie� tawerny i ur�nijmy si� do nieprzytomno�ci.
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_06");	//Hmmm. Mo�e...
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_07");	//No, ch�opie, wyluzuj! Ju� po wszystkim!
		};
		DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Biff_DI_plunder))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_08");	//Kto� musi da� zna� Biffowi albo zgnije na tej wyspie.
		if(Npc_IsDead(Biff_DI) == FALSE)
		{
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_09");	//Spokojnie. B�dzie na czas.
		};
	};
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_10");	//Nie mamy tu ju� nic do roboty. Ka� kapitanowi podnosi� kotwic�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Fighter_DI_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 900;
	condition = DIA_Fighter_DI_PICKPOCKET_Condition;
	information = DIA_Fighter_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Fighter_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(10,45);
};

func void DIA_Fighter_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,Dialog_Back,DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

