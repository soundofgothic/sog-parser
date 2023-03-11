
instance DIA_Shrat_Exit(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Shrat_WhyHere(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	permanent = 0;
	description = "Co tu robisz?";
};


func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//Czy pozwoli�em ci si� do mnie odezwa�?!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//Tylko �artuj�! Te cholerne �wiry zaczynaj� mnie ju� denerwowa�, dlatego tu jestem!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//"Nie odzywaj si� do mnie!" - "M�dl si� o �ask� �ni�cego!" - "Twoje zadanie jest szczeg�lnie wa�ne!"
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//Przy tych ludziach mo�na w mig zwariowa�. Nic dziwnego, �e mieszkaj� tam sami wariaci.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//Jestem Shrat, Nowicjusz pierwszego stopnia. I b�d� nim ju� do ko�ca �ycia!
};


instance DIA_Shrat_JoinPSI(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	permanent = 0;
	description = "Chcia�bym do��czy� do Bractwa. Mo�esz mi pom�c?";
};


func int DIA_Shrat_JoinPSI_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

func void DIA_Shrat_JoinPSI_Info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//Chcia�bym do��czy� do Bractwa. Mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//Chcesz tu zamieszka�? A ja zastanawiam si� w�a�nie jak st�d uciec!
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//Mogliby�my przemierzy� ca�� koloni�, odci��y� kilku frajer�w z ich got�wki, zebra� troch� rudy - co ty na to?
};


instance DIA_Shrat_ComeWithMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	permanent = 1;
	description = "Jasne! Trzymajmy si� razem! Chod� ze mn�!";
};


func int DIA_Shrat_ComeWithMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//Jasne! Trzymajmy si� razem! Chod� ze mn�!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//To w�a�nie chcia�em us�ysze�! Chod�my!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Shrat_LeaveMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	permanent = 1;
	description = "Tutaj nasze drogi si� rozchodz�. Dalej p�jd� sam.";
};


func int DIA_Shrat_LeaveMe_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void DIA_Shrat_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//Tutaj nasze drogi si� rozchodz�. Dalej p�jd� sam.
	AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//Dobra. Ja wracam do mojej kryj�wki na bagnach. Uwa�aj na siebie!
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

