
instance DIA_Addon_Cronos_ADW_EXIT(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 999;
	condition = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_ADWHello(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_ADWHello_Condition;
	information = DIA_Addon_Cronos_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Cieszê siê, ¿e ciê widzê. Obawialiœmy siê najgorszego.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//Co siê dzieje?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Te tereny s¹ bardzo niebezpieczne.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//S¹ tu zwierzêta, których nikt z nas nigdy przedtem nie widzia³.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//W pobli¿u jest ogromne bagno, które mo¿e istnieæ ju¿ od setek lat.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nie ma dnia, ¿ebyœmy nie zostali zaatakowani przez bestie z bagna.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Radzê ci zachowaæ ostro¿noœæ, jeœli zamierzasz rozejrzeæ siê po okolicy.
};


instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "Jakieœ wieœci na temat kamiennych stra¿ników?";
};


func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Jakieœ wieœci na temat kamiennych stra¿ników?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Uda³o nam siê kilku zniszczyæ.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stoj¹, jakby byli s³upami soli.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Ale pozory myl¹! Gdy tylko siê zbli¿ysz, rusz¹ do ataku!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Nie ma w¹tpliwoœci, ¿e Ÿród³o ich mocy musi znajdowaæ siê gdzieœ w okolicy.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Pohandlujmy.";
};


func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};


var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_1");
};

