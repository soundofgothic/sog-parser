
instance Tpl_1401_GorNaKosh_Exit(C_Info)
{
	npc = TPL_1401_GorNaKosh;
	nr = 999;
	condition = Tpl_1401_GorNaKosh_Exit_Condition;
	information = Tpl_1401_GorNaKosh_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Tpl_1401_GorNaKosh_Exit_Condition()
{
	return 1;
};

func void Tpl_1401_GorNaKosh_Exit_Info()
{
	AI_Output(self,other,"Tpl_1401_GorNaKosh_Exit_Info_13_02");	//Niech �ni�cy zbudzi si� ku naszemu zbawieniu!
	AI_StopProcessInfos(self);
};


instance Tpl_1401_GorNaKosh_SUGGEST(C_Info)
{
	npc = TPL_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_SUGGEST_Condition;
	information = Tpl_1401_GorNaKosh_SUGGEST_Info;
	important = 0;
	permanent = 0;
	description = "Wiem gdzie znajduje si� gniazdo pe�zaczy.";
};


func int Tpl_1401_GorNaKosh_SUGGEST_Condition()
{
	if(Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN) && !Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW))
	{
		return TRUE;
	};
};

func void Tpl_1401_GorNaKosh_SUGGEST_Info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01");	//Wiem, gdzie znajduje si� gniazdo pe�zaczy. Musz� tam p�j��, �eby zdoby� co� dla Cor Kaloma.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02");	//Zatem przyda ci si� moja pomoc. P�jd� z tob�.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03");	//Dobrze. Spotkamy si� przy wielkim przej�ciu.
	Npc_ExchangeRoutine(self,"GATE");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	B_GiveXP(XP_HireGorNaKosh);
	B_LogEntry(CH2_MCEggs,"Przekona�em Gor Na Kosha, by do��czy� do oddzia�u przy bramie Asghana.");
	AI_StopProcessInfos(self);
};


instance Tpl_1401_GorNaKosh_INFO(C_Info)
{
	npc = TPL_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_INFO_Condition;
	information = Tpl_1401_GorNaKosh_INFO_Info;
	important = 0;
	permanent = 1;
	description = "Co tu robisz?";
};


func int Tpl_1401_GorNaKosh_INFO_Condition()
{
	if(!Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};
};

func void Tpl_1401_GorNaKosh_INFO_Info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_01");	//Co tu robisz?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_02");	//Poluj� na pe�zacze.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_03");	//Mo�esz mi opowiedzie� o sposobach polowania na pe�zacze?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_04");	//Przy �owach na pe�zacze obowi�zuje tylko jedna zasada: gdy jakiego� zobaczysz, rzu� si� na niego czym pr�dzej i spr�buj go zabi� pierwszym ciosem.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_05");	//Walcz bez strachu i zabijaj bez lito�ci.
	AI_StopProcessInfos(self);
};


instance Tpl_1401_GorNaKosh_CRAWLER(C_Info)
{
	npc = TPL_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_CRAWLER_Condition;
	information = Tpl_1401_GorNaKosh_CRAWLER_Info;
	important = 0;
	permanent = 1;
	description = "Mo�esz mi opowiedzie� co� jeszcze o tych pe�zaczach?";
};


func int Tpl_1401_GorNaKosh_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1401_GorNaKosh_INFO))
	{
		return 1;
	};
};

func void Tpl_1401_GorNaKosh_CRAWLER_Info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01");	//Mo�esz mi opowiedzie� co� jeszcze o tych pe�zaczach?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02");	//Te bestie dzia�aj� instynktownie. Pr�buj� zabi� wszystko co nie jest pe�zaczem.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03");	//Wykorzystaj t� wiedz� w walce z tymi potworami.
};


instance Tpl_1401_GorNaKosh_VICTORY(C_Info)
{
	npc = TPL_1401_GorNaKosh;
	condition = Tpl_1401_GorNaKosh_VICTORY_Condition;
	information = Tpl_1401_GorNaKosh_VICTORY_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em gniazdo pe�zaczy!";
};


func int Tpl_1401_GorNaKosh_VICTORY_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) > 3)
	{
		return TRUE;
	};
};

func void Tpl_1401_GorNaKosh_VICTORY_Info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01");	//Znalaz�em gniazdo pe�zaczy!
	AI_Output(self,other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02");	//Wspaniale! Wr�� do obozu i wype�nij rozkaz do ko�ca. Cor Kalom na pewno si� niecierpliwi!
	B_LogEntry(CH2_MCEggs,"Mam zanie�� jaja pe�zaczy do laboratorium Cor Kaloma.");
};

