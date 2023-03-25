
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = None_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Co tu porabiasz?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && (Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Co porabiasz?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Czekam w nadziei, ¿e ju¿ nied³ugo zawinie do portu jakiœ statek, na który mo¿na bêdzie siê zaci¹gn¹æ.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Od tej bezczynnoœci cz³owiek zaczyna wariowaæ.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//S³ysza³em, ¿e szukasz za³ogi na statek, czy to prawda?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//I co z tego?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Wpisz mnie na listê!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"W portowej knajpie pozna³em Maria, by³ego marynarza. Chce dostaæ siê na statek.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Dlaczego mia³bym ciê ze sob¹ zabraæ?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Dlaczego mia³bym ciê ze sob¹ zabraæ?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Po prostu... Potrzebujesz mnie.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jestem... By³em porucznikiem marynarki królewskiej.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//S³u¿y³em jako marynarz na 'Królu Rhobarze' i Dumie Myrtany'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//W bitwie o Wschodni Archipelag w³asnorêcznie wys³a³em z tuzin orków z powrotem do œwiata Beliara.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Niestety, by³o nas zbyt ma³o, po zatoniêciu okrêtu flagowego zostaliœmy zmuszeniu do odwrotu.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "Co tu w³aœciwie robisz?";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Co tu w³aœciwie robisz?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flota zosta³a rozgromiona, kufry puste.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Po odejœciu ze s³u¿by wyl¹dowa³em w tej dziurze. Staram siê gdzieœ zaczepiæ.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Co w³aœciwie potrafisz?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co w³aœciwie potrafisz?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jestem mistrzem aborda¿u i walki w zwarciu. Jeœli trzeba, poradzê sobie tak¿e z obs³ug¹ dzia³a pok³adowego.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Za³o¿ê siê, ¿e w czasie naszej podró¿y móg³bym ciê nauczyæ tego i owego.
	B_LogEntry(Topic_Crew,"Mario wydaje siê byæ prawdziwym weteranem marynarki wojennej. Mo¿e nauczy mnie paru rzeczy.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "O co wiêc mnie prosisz?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//O co wiêc mnie prosisz?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//A o có¿ mogê prosiæ? Chcê siê st¹d po prostu wydostaæ.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Pomó¿ mi st¹d uciec, jeœli weŸmiesz mnie ze sob¹, nie po¿a³ujesz.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Podró¿ mo¿e byæ niebezpieczna.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Podró¿ mo¿e byæ niebezpieczna.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Przywyk³em do niebezpieczeñstw. Na morzu ka¿dy dzieñ to walka o przetrwanie.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Ka¿da burza, ka¿dy sztorm mo¿e przynieœæ kres twemu ¿yciu. Nie mówi¹c ju¿ o morskich potworach, zdolnych po³kn¹æ statek w ca³oœci.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//O orkowych galerach nawet nie wspominam. Zaufaj mi, trudno mnie przestraszyæ. Tchórzliwy marynarz to martwy marynarz.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "Do niczego mi siê nie przydasz.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Do niczego mi siê nie przydasz.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Nie znajdziesz tu lepszego marynarza ode mnie.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Na pierwszy rzut oka wygl¹da na to, ¿e nie masz zielonego pojêcia o nawigacji.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Zastanów siê wiêc powa¿nie, nim komuœ zaufasz.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Przyda³byœ mi siê.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Przyda³byœ mi siê.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Œwietnie, do zobaczenia na statku.
	B_GivePlayerXP(XP_Crewmember_Success);
	Mario_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Chyba jednak mi siê nie przydasz!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Jednak nie mogê skorzystaæ z twojej pomocy!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak sobie ¿yczysz. Wiesz, gdzie mnie znaleŸæ.
	Mario_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "Chyba jednak bêdê ciê potrzebowa³!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if(((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//No dobrze, mo¿e mi siê przydasz.
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Œwietnie! Do zobaczenia na statku!
		Mario_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		AI_StopProcessInfos(self);
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Nie mo¿esz mnie tak traktowaæ!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = None_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return C_Beklauen(71,220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

