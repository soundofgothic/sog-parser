
instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return C_Beklauen(20,10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "Czy to twoje owce?";
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Czy to twoje owce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Jedyna, kt�ra do mnie nale�y, reaguje na imi� Lucy. To moja �ona...
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Owce s� w�asno�ci� stra�y. Przyprowadzaj� do mnie wszystkie biedulki, kt�re zabior� farmerom.
};


instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Ch�opie, ten �wir z m�otkiem mnie dobija.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O kim ty m�wisz?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Nie s�yszysz tego walenia? A jak my�lisz, kto w porcie przez ca�y dzie� t�ucze m�otkiem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//O tym wariacie, Fellanie. Codziennie zabiera ze sob� m�otek do szopy.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "Mog� si� zaj�� Fellanem...";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mog� si� zaj�� Fellanem...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Chcesz mi pom�c? A jaki masz w tym interes?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//Ty mi to powiedz.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Ach, o to chodzi! Dobra - je�li przestanie wali� tym m�otkiem, to zap�ac� ci 25 sztuk z�ota.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale musz� ci co� powiedzie� - nie zdo�asz go przekona�. To �wir. Dotrze do niego tylko wtedy, jak mu zdrowo przy�o�ysz!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"Alwin chce, abym zmusi� Fellana do przerwania prac na dachu. Zab�jstwo nie jest dobr� metod�.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"Zobacz�, co da si� zrobi�...",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"Je�li go pobij�, b�d� mia� k�opoty ze stra��...",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Zobacz�, co da si� zrobi�...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Zastan�w si�. Pami�taj, p�ac� 25 z�otych monet.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Je�li go pobij�, b�d� mia� k�opoty ze stra��...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tutaj w porcie nikt nie zwraca specjalnej uwagi na walki...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale je�li kogo� tu okradniesz, albo zaczniesz co� kombinowa� z owcami, to wpadniesz w k�opoty.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "Fellan ju� nie b�dzie wali� m�otkiem.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan ju� nie b�dzie wali� m�otkiem.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//S�yszysz? Koniec z tym ha�asem! W ko�cu. My�la�em, �e ten kole� nigdy nie zrezygnuje.
	if(Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Zrobi�e� mi wielk� przys�ug�. Wiesz co, dam ci 30 sztuk z�ota.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "A co z owcami?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A co z owcami?
	if((MIS_AttackFellan != LOG_SUCCESS) && (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Fellan ci�gle ha�asuje i to je doprowadza do szale�stwa. Kt�rego� dnia ca�kiem ze�wiruj�.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Owce jedz� i robi� si� coraz grubsze. Ca�kiem jak moja �ona. HA HA HA.
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Chyba b�d� musia� jedn� z nich zaszlachtowa�. Na ostatni� wieczerz�!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Po co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Dla najemnika, kt�ry zamordowa� paladyna. Oczywi�cie strac� go za to.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Musz� tylko zdecydowa�, kt�re stworzonko pow�druje do rze�ni.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy ma wielkie szcz�cie, �e jeszcze �yje.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//My�la�em, �e Lucy jest twoj� �on�.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Racja, ale jedn� owc� te� nazwa�em Lucy. T�, kt�ra mia�a by� ostatnim posi�kiem Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale wszystko si� jako� u�o�y�o. Lucy b�dzie zadowolona.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Po pewnym czasie obserwowanie, jak owce jedz�, staje si� do�� nudne.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Musz� si� z nimi po�egna�. Lord Hagen postanowi�, �e wszystkie owce p�jd� na po�ywienie dla armii.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//C�, przynajmniej b�d� mia� wi�cej czasu dla �ony.
	};
};

