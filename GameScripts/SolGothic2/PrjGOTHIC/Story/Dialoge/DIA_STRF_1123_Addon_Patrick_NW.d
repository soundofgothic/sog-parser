
instance DIA_Addon_Patrick_NW_EXIT(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 999;
	condition = DIA_Addon_Patrick_NW_EXIT_Condition;
	information = DIA_Addon_Patrick_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 900;
	condition = DIA_Addon_Patrick_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Patrick_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Patrick_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(35,50);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Patrick_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Patrick_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};


instance DIA_Addon_Patrick_NW_Hi(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 2;
	condition = DIA_Addon_Patrick_NW_Hi_Condition;
	information = DIA_Addon_Patrick_NW_Hi_Info;
	permanent = FALSE;
	description = "I jak? Wszystko w porz¹dku?";
};


func int DIA_Addon_Patrick_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_00");	//I jak? Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_01");	//Doskonale. Magowie Wody pomogli nam wydostaæ siê z tej przeklêtej doliny.
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_02");	//Jakie macie plany?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_03");	//Bêdê dalej walczy³ u boku Lee. Pewnego dnia opuœcimy tê wyspê.
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_04");	//A póŸniej?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_05");	//Zobaczy siê. Jeœli wojna wci¹¿ trwa, pójdê walczyæ z orkami. Ale kto wie, co siê jeszcze wydarzy...
};

