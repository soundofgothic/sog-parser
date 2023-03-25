
instance DIA_Bennet_DI_EXIT(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 999;
	condition = DIA_Bennet_DI_EXIT_Condition;
	information = DIA_Bennet_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_Hello(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 10;
	condition = DIA_Bennet_DI_Hello_Condition;
	information = DIA_Bennet_DI_Hello_Info;
	permanent = TRUE;
	description = "Jak ci siê powodzi?";
};


func int DIA_Bennet_DI_Hello_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Hello_15_00");	//Jak ci siê powodzi?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_01");	//KuŸnia na statku jest trochê przerdzewia³a. To przez s³on¹ wodê. Ciê¿ko tu bêdzie zrobiæ coœ porz¹dnego. Ale poza tym...
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_02");	//Tak, zak³adaj¹c, ¿e orkowie nie wróc¹.
	};
};


instance DIA_Bennet_DI_TRADE(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_TRADE_Condition;
	information = DIA_Bennet_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jak¹ broñ mo¿esz mi sprzedaæ?";
};


func int DIA_Bennet_DI_TRADE_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_TRADE_15_00");	//Jak¹ broñ mo¿esz mi sprzedaæ?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Bennet_DI_TRADE_06_01");	//Tylko najlepsz¹. Przecie¿ wiesz.
};


instance DIA_Bennet_DI_Smith(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_Smith_Condition;
	information = DIA_Bennet_DI_Smith_Info;
	permanent = TRUE;
	description = "Nauczysz mnie swojego rzemios³a?";
};


func int DIA_Bennet_DI_Smith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Smith_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Smith_15_00");	//Nauczysz mnie swojego rzemios³a?
	AI_Output(self,other,"DIA_Bennet_DI_Smith_06_01");	//Zale¿y, co chcesz zrobiæ.
	Info_ClearChoices(DIA_Bennet_DI_Smith);
	Info_AddChoice(DIA_Bennet_DI_Smith,Dialog_Back,DIA_Bennet_DI_Smith_BACK);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString("Nauka kowalstwa",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_DI_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_DI_Smith_1hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_DI_Smith_2hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_DI_Smith_1hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_DI_Smith_2hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_DI_Smith_1hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_DI_Smith_2hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_DI_Smith_1hSpecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_DI_Smith_2hSpecial4);
		};
	};
};

func void DIA_Bennet_DI_Smith_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_Smith);
};

func void DIA_Bennet_DI_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void DIA_Bennet_DI_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_DI_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_DI_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_DI_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_DI_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_DI_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_DI_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_DI_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_Bennet_TeachSTR(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 150;
	condition = DIA_Bennet_TeachSTR_Condition;
	information = DIA_Bennet_TeachSTR_Info;
	permanent = TRUE;
	description = "Chcê byæ silniejszy.";
};


func int DIA_Bennet_TeachSTR_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSTR_15_00");	//Chcê byæ silniejszy.
	AI_Output(self,other,"DIA_Bennet_TeachSTR_06_01");	//Silna rêka przydaje siê w takich czasach.
	Info_ClearChoices(DIA_Bennet_TeachSTR);
	Info_AddChoice(DIA_Bennet_TeachSTR,Dialog_Back,DIA_Bennet_TeachSTR_Back);
	Info_AddChoice(DIA_Bennet_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
	Info_AddChoice(DIA_Bennet_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};

func void DIA_Bennet_TeachSTR_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachSTR);
};

func void DIA_Bennet_TeachSTR_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
};

func void DIA_Bennet_TeachSTR_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};


instance DIA_Bennet_DI_DragonEgg(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 99;
	condition = DIA_Bennet_DI_DragonEgg_Condition;
	information = DIA_Bennet_DI_DragonEgg_Info;
	description = "Mam smocze jajo.";
};


func int DIA_Bennet_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_00");	//Mam smocze jajo.
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_01");	//No i co?
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_02");	//Nooo... Myœla³em...
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_03");	//Wiem, co sobie myœla³eœ. Zapomnij o tym i zatrzymaj je. Nie chcê go.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bennet_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_UndeadDragonDead_Condition;
	information = DIA_Bennet_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Zrobiliœmy wszystko, co by³o trzeba.";
};


func int DIA_Bennet_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_UndeadDragonDead_15_00");	//Zrobiliœmy wszystko, co by³o trzeba.
	AI_Output(self,other,"DIA_Bennet_DI_UndeadDragonDead_06_01");	//Cieszê siê. Mia³em ju¿ doœæ tej starej kuŸni. Chcê znowu stan¹æ na pewnym gruncie.
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 900;
	condition = DIA_Bennet_DI_PICKPOCKET_Condition;
	information = DIA_Bennet_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bennet_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(35,65);
};

func void DIA_Bennet_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,Dialog_Back,DIA_Bennet_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_DI_PICKPOCKET_DoIt);
};

func void DIA_Bennet_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

func void DIA_Bennet_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

