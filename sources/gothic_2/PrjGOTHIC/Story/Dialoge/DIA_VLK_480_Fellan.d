
instance DIA_Fellan_EXIT(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 999;
	condition = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_PICKPOCKET(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 900;
	condition = DIA_Fellan_PICKPOCKET_Condition;
	information = DIA_Fellan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Fellan_PICKPOCKET_Condition()
{
	return C_Beklauen(40,40);
};

func void DIA_Fellan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,Dialog_Back,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};


instance DIA_Fellan_News(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = DIA_Fellan_News_Condition;
	information = DIA_Fellan_News_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Fellan_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_News_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//No dobrze, pokona�e� mnie. Brawo, bohaterze.
		if((MIS_AttackFellan == LOG_Running) && (FellanGeschlagen == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Przestaniesz wali� tym m�otkiem, czy mam ci jeszcze raz spu�ci� lanie?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Nie, prosz�, nie bij mnie. Ale je�li cokolwiek si� zawali, to b�dzie to twoja wina!
			FellanGeschlagen = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//Co z tob�! Chcesz znowu oberwa�?
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//O co ci w�a�ciwie chodzi? Chcesz si� bi�? Chcesz rozmawia�? Mo�e chcesz si� wreszcie na co� zdecydowa�?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Fellan_HALLO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 2;
	condition = DIA_Fellan_HALLO_Condition;
	information = DIA_Fellan_HALLO_Info;
	permanent = FALSE;
	description = "Co tam przybijasz?";
};


func int DIA_Fellan_HALLO_Condition()
{
	if(FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fellan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Co tam przybijasz?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Od wielu dni pr�buj� naprawia� uszkodzenia dachu.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Krokwie dos�ownie rozpadaj� si� po ostatnich deszczach. Wkr�tce to wszystko zawali mi si� na g�ow�!
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_Stop(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 3;
	condition = DIA_Fellan_Stop_Condition;
	information = DIA_Fellan_Stop_Info;
	permanent = FALSE;
	description = "Mo�esz na moment przesta� przybija�?";
};


func int DIA_Fellan_Stop_Condition()
{
	if(MIS_AttackFellan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fellan_Stop_Info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Mo�esz na moment przesta� przybija�?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Nie, musz�, MUSZ� to sko�czy�.
	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop,"Przesta� przybija� albo po�ami� ci wszystkie ko�ci.",DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop,"Dam ci 10 sztuk z�ota, je�li cho� na chwil� przestaniesz wali� tym m�otkiem.",DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop,"Po prostu przesta� t�uc tym m�otkiem, zrozumiano?",DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Przesta� przybija� albo po�ami� ci wszystkie ko�ci.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Zapomnij o tym. Chyba �e twoja g�owa r�wnie� potrzebuje niewielkiej naprawy moim m�otkiem.
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Dam ci 10 sztuk z�ota, je�li cho� na chwil� przestaniesz wali� tym m�otkiem.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//O, ho... To bardzo hojnie z twojej strony. Ale je�li chodzi o twoje z�oto, to mo�esz je sobie...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//...no, wiesz, co mo�esz z nim zrobi�.
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Po prostu przesta� t�uc tym m�otkiem, zrozumiano?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Po prostu przesta� mnie wkurza�, zrozumiano?
};


instance DIA_Fellan_klar(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 5;
	condition = DIA_Fellan_klar_Condition;
	information = DIA_Fellan_klar_Info;
	permanent = TRUE;
	description = "Hej - wszystko w porz�dku?";
};


func int DIA_Fellan_klar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fellan_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Fellan_klar_Info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Hej - wszystko w porz�dku?
	if(FellanGeschlagen == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Taaa, musz� to tylko zreperowa� na czas.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Stan dachu ci�gle si� pogarsza. Jak tak dalej p�jdzie, to nast�pnym razem b�d� brodzi� w wodzie po kolana. I to wszystko przez ciebie!
	};
	AI_StopProcessInfos(self);
};

