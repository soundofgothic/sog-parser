
instance DIA_Addon_Juan_EXIT(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 999;
	condition = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Juan_PICKPOCKET(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 900;
	condition = DIA_Addon_Juan_PICKPOCKET_Condition;
	information = DIA_Addon_Juan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Juan_PICKPOCKET_Condition()
{
	return C_Beklauen(65,73);
};

func void DIA_Addon_Juan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,Dialog_Back,DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};


instance DIA_Addon_Juan_HI(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent = FALSE;
	description = "Co s�ycha�?";
};


func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Czego chcesz? Masz mi co� wa�nego do powiedzenia? Je�li nie, to zabieraj si� st�d.
	if(!Npc_IsDead(Freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//W przeciwnym razie m�j kolega ci do�o�y. No to chcesz czego�?
		B_StartOtherRoutine(Freund,"STAND");
	};
};


instance DIA_Addon_Juan_Losung(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Losung_Info;
	permanent = FALSE;
	description = "Podobno masz wiele ciekawych rzeczy....";
};


func int DIA_Addon_Juan_Losung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_HI) && ((Tom_Tells == TRUE) || (MIS_Huno_Stahl == LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Losung_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Podobno masz wiele ciekawych rzeczy....
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//Naprawd�? Esteban �artuje sobie ze mnie? Odwali�em ca�� robot� i siedz� w tej brudnej dziurze...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//A on po prostu przysy�a kogo� po te rzeczy? Kto ja jestem? Magazynier?
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//No i co? To nie m�j problem.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//To B�DZIE tw�j problem. Chcesz odebra� towar - �wietnie, mo�esz go ode mnie kupi�.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//We� z�oto od Estebana, Kruka, albo kogo tam chcesz. Nie obchodzi mnie to. Jak kto� chce mie� towar, musi za niego zap�aci�.
};


instance DIA_Addon_Juan_AufsMaul(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_Juan_AufsMaul_Info;
	permanent = FALSE;
	description = "Nie przychodz� od Estebana!";
};


func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Nie przychodz� od Estebana!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Och? W takim razie... Poczekaj sekundk�, masz na ramieniu jakiego� robaka...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Juan_Trade(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 99;
	condition = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Juan_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Trade_Info()
{
	B_Say(other,self,"$TRADE_3");
};

