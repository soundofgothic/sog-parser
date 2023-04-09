
instance DIA_SLD_751_Soeldner_INTRO(C_Info)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_751_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};


func int DIA_SLD_751_Soeldner_INTRO_CONDITION()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_INTRO_INFO()
{
	AI_Output(self,other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01");	//Ach, go��! Nie pr�buj nam tutaj sprawia� �adnych k�opot�w, bo oberwiesz!
};


instance DIA_SLD_751_Soeldner_EXIT_1(C_Info)
{
	nr = 999;
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_751_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
	description = "Lepiej ju� sobie p�jd�.";
};


func int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01");	//Lepiej ju� sobie p�jd�.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");	//Mam nadziej�, �e si� rozumiemy.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_751_Soeldner_EXIT_2(C_Info)
{
	nr = 999;
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_751_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
	description = "Musz� ju� i��.";
};


func int DIA_SLD_751_Soeldner_EXIT_2_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_751_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_EXIT_2_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");	//No to id�!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_751_Soeldner_UMSEHEN(C_Info)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_751_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
	description = "Chc� si� tylko troch� rozejrze�.";
};


func int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01");	//Chc� si� tylko troch� rozejrze�.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");	//Tylko uwa�aj, �eby� nie nadepn�� komu� na odcisk.
};


instance DIA_SLD_751_Soeldner_INMINE(C_Info)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_751_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
	description = "Chc� si� dosta� do kopalni.";
};


func int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01");	//Chc� si� dosta� do kopalni.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");	//Nie wr�� ci wielkich szans powodzenia, ale pogadaj z Okylem.
};

