
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
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Czekam w nadziei, �e ju� nied�ugo zawinie do portu jaki� statek, na kt�ry mo�na b�dzie si� zaci�gn��.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Od tej bezczynno�ci cz�owiek zaczyna wariowa�.
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
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//S�ysza�em, �e szukasz za�ogi na statek, czy to prawda?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//I co z tego?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Wpisz mnie na list�!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"W portowej knajpie pozna�em Maria, by�ego marynarza. Chce dosta� si� na statek.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Dlaczego mia�bym ci� ze sob� zabra�?";
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
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Dlaczego mia�bym ci� ze sob� zabra�?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Po prostu... Potrzebujesz mnie.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Jestem... By�em porucznikiem marynarki kr�lewskiej.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//S�u�y�em jako marynarz na 'Kr�lu Rhobarze' i Dumie Myrtany'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//W bitwie o Wschodni Archipelag w�asnor�cznie wys�a�em z tuzin ork�w z powrotem do �wiata Beliara.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Niestety, by�o nas zbyt ma�o, po zatoni�ciu okr�tu flagowego zostali�my zmuszeniu do odwrotu.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "Co tu w�a�ciwie robisz?";
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
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Co tu w�a�ciwie robisz?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Flota zosta�a rozgromiona, kufry puste.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Po odej�ciu ze s�u�by wyl�dowa�em w tej dziurze. Staram si� gdzie� zaczepi�.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Co w�a�ciwie potrafisz?";
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
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Co w�a�ciwie potrafisz?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Jestem mistrzem aborda�u i walki w zwarciu. Je�li trzeba, poradz� sobie tak�e z obs�ug� dzia�a pok�adowego.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Za�o�� si�, �e w czasie naszej podr�y m�g�bym ci� nauczy� tego i owego.
	B_LogEntry(Topic_Crew,"Mario wydaje si� by� prawdziwym weteranem marynarki wojennej. Mo�e nauczy mnie paru rzeczy.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "O co wi�c mnie prosisz?";
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
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//O co wi�c mnie prosisz?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//A o c� mog� prosi�? Chc� si� st�d po prostu wydosta�.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Pom� mi st�d uciec, je�li we�miesz mnie ze sob�, nie po�a�ujesz.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Podr� mo�e by� niebezpieczna.";
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
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Podr� mo�e by� niebezpieczna.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Przywyk�em do niebezpiecze�stw. Na morzu ka�dy dzie� to walka o przetrwanie.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Ka�da burza, ka�dy sztorm mo�e przynie�� kres twemu �yciu. Nie m�wi�c ju� o morskich potworach, zdolnych po�kn�� statek w ca�o�ci.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//O orkowych galerach nawet nie wspominam. Zaufaj mi, trudno mnie przestraszy�. Tch�rzliwy marynarz to martwy marynarz.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "Do niczego mi si� nie przydasz.";
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
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Do niczego mi si� nie przydasz.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Nie znajdziesz tu lepszego marynarza ode mnie.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Na pierwszy rzut oka wygl�da na to, �e nie masz zielonego poj�cia o nawigacji.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Zastan�w si� wi�c powa�nie, nim komu� zaufasz.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Przyda�by� mi si�.";
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
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Przyda�by� mi si�.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//�wietnie, do zobaczenia na statku.
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
	description = "Chyba jednak mi si� nie przydasz!";
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
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Jednak nie mog� skorzysta� z twojej pomocy!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Jak sobie �yczysz. Wiesz, gdzie mnie znale��.
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
	description = "Chyba jednak b�d� ci� potrzebowa�!";
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
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//No dobrze, mo�e mi si� przydasz.
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//�wietnie! Do zobaczenia na statku!
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
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Nie mo�esz mnie tak traktowa�!
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

