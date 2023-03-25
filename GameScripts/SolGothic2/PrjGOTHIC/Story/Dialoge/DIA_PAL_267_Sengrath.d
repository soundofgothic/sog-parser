
instance DIA_Sengrath_EXIT(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 999;
	condition = DIA_Sengrath_EXIT_Condition;
	information = DIA_Sengrath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sengrath_Hello(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Hello_Condition;
	information = DIA_Sengrath_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Hello_Info()
{
	AI_Output(self,other,"DIA_Sengrath_Hello_03_00");	//Wiedzia³em, wiedzia³em, ¿e komuœ siê uda!
	AI_Output(self,other,"DIA_Sengrath_Hello_03_01");	//Przybywasz zza prze³êczy? W takim razie naszemu pos³añcowi uda³o siê przejœæ?
	AI_Output(other,self,"DIA_Sengrath_Hello_15_02");	//Nie, wasz pos³aniec poleg³. Przybywam tu z rozkazu Lorda Hagena.
	AI_Output(self,other,"DIA_Sengrath_Hello_03_03");	//Przeklêci orkowie...
	AI_Output(self,other,"DIA_Sengrath_Hello_03_04");	//Kapitan Garond na pewno zechce z tob¹ porozmawiaæ. Znajdziesz go w wielkim budynku, chronionym przez dwóch stra¿ników.
};


instance DIA_Sengrath_Equipment(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Equipment_Condition;
	information = DIA_Sengrath_Equipment_Info;
	permanent = FALSE;
	description = "Czy mogê uzupe³niæ tu gdzieœ zapasy?";
};


func int DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Equipment_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_00");	//Czy gdzieœ tu mo¿na uzupe³niæ zapasy?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_01");	//Wydawaniem broni zajmuje siê Tandor. Pozosta³e sprawy to dzia³ka ochmistrza Engora.
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_02");	//A magiczne przedmioty?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_03");	//Mamy trochê magicznych zwojów. Jeœli bêdziesz chcia³ kilka z nich, zg³oœ siê do mnie.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Sengrath sprzedaje w zamku magiczne zwoje.");
};


instance DIA_Sengrath_Perm(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Perm_Condition;
	information = DIA_Sengrath_Perm_Info;
	permanent = FALSE;
	description = "Kto mo¿e mnie czegoœ tutaj nauczyæ?";
};


func int DIA_Sengrath_Perm_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Perm_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Perm_15_00");	//Kto móg³by mnie tu czegoœ nauczyæ?
	if((other.guild == GIL_KDF) && (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_01");	//Pogadaj z Miltenem - jest tu jedynym magiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_02");	//Pomów z Kerolothem. To on trenuje ch³opców w walce mieczem, mo¿e i ciebie czegoœ nauczy.
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"Keroloth udziela na zamku lekcji walki mieczem.");
	};
};


instance DIA_Sengrath_Scrolls(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 9;
	condition = DIA_Sengrath_Scrolls_Condition;
	information = DIA_Sengrath_Scrolls_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi, jakie zwoje oferujesz.";
};


func int DIA_Sengrath_Scrolls_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sengrath_Equipment))
	{
		return TRUE;
	};
};

func void DIA_Sengrath_Scrolls_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Sengrath_Scrolls_15_00");	//Poka¿ mi, jakie zwoje oferujesz.
};


instance DIA_Sengrath_PICKPOCKET(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 900;
	condition = DIA_Sengrath_PICKPOCKET_Condition;
	information = DIA_Sengrath_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Sengrath_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Sengrath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET,Dialog_Back,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

