
instance DIA_Addon_RoastPirate_EXIT(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 999;
	condition = DIA_Addon_RoastPirate_EXIT_Condition;
	information = DIA_Addon_RoastPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int PIR_1364_Grog;

instance DIA_Addon_RoastPirate_GimmeGrog(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 1;
	condition = DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information = DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) == TRUE) && (Npc_WasInState(self,ZS_Roast_Scavenger) == TRUE) && (PIR_1364_Grog == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_Info()
{
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//Ech, w gardle mi zasch³o od tego ¿aru.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Ej, ty! Masz dla mnie trochê grogu?
	Log_CreateTopic(TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RoastGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_RoastGrog,"Pirat przy ognisku pilnie potrzebuje grogu.");
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Nie, nie mam.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Masz, poci¹gnij sobie.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Nie, nie mam.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Diabli nadali! Umrê tu z pragnienia.
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Masz, poci¹gnij sobie.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//Dziêki, ch³opie.
	B_UseItem(self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry(TOPIC_Addon_RoastGrog,"Grog uratowa³ go chyba przed œmierci¹ z pragnienia.");
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_RoastPirate_SeichtesWasser(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 2;
	condition = DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information = DIA_Addon_RoastPirate_SeichtesWasser_Info;
	description = "Jak leci?";
};


func int DIA_Addon_RoastPirate_SeichtesWasser_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_SeichtesWasser_Info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//Muszê us³ugiwaæ tej ¿ar³ocznej za³odze.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//Dlatego stojê dzieñ i noc przy ro¿nie, piek¹c wilki.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//Wola³bym rzuciæ to w diab³y i po³aziæ trochê po pla¿y w poszukiwaniu czegoœ, co morze wyrzuci³o na brzeg.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Tydzieñ temu na rafach rozbi³ siê statek kupiecki.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//I ca³y jego ³adunek fale wyrzuci³y na brzeg.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//Mam nadziejê, ¿e nied³ugo bêdê móg³ siê st¹d ruszyæ.
};


instance DIA_Addon_RoastPirate_Francis(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 3;
	condition = DIA_Addon_RoastPirate_Francis_Condition;
	information = DIA_Addon_RoastPirate_Francis_Info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
};


func int DIA_Addon_RoastPirate_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_RoastPirate_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? Rz¹dzi siê, jakby by³ tu kapitanem. Na szczêœcie to siê skoñczy, gdy tylko Greg wróci.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Wtedy schowa siê jak krab pustelnik do skorupy.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//Wydaje mi siê, ¿e on nas nieŸle kantuje. Czêœæ naszej forsy l¹duje u niego w kieszeni.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//Jakby coœ, to ja tego nie powiedzia³em. I dopóki nie znajdzie siê jakiœ dowód, lepiej zatrzymaj tê wiadomoœæ dla siebie, jasne?
};


instance DIA_Addon_RoastPirate_PERM(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 99;
	condition = DIA_Addon_RoastPirate_PERM_Condition;
	information = DIA_Addon_RoastPirate_PERM_Info;
	permanent = TRUE;
	description = "A w przeciwnym razie?";
};


func int DIA_Addon_RoastPirate_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_PERM_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Matt_Job_15_00");	//A w przeciwnym razie?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if((randy == 0) && !Npc_IsDead(Francis))
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//Na miejscu Grega pos³a³bym Francisa na bagna.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//Kiedy Greg do nas wróci³, przesta³em siê obawiaæ napadu bandytów.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//Jasne, przy kapitanie nie bêdzie mo¿na siê migaæ od roboty, ale przynajmniej dostaniemy za ni¹ konkretne pieni¹dze.
		};
	}
	else if((randy == 0) && !Npc_IsDead(Francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis du¿o gada i niczego nie robi. Od czasu, gdy zosta³ tu szefem, wszystko siê sypie.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Niech bandyci nas zaatakuj¹. Czeka ich przykra niespodzianka.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Miejmy nadziejê, ¿e Greg szybko wróci. Nie mogê siê doczekaæ ponownego wyjœcia w morze.
	};
};


instance DIA_Addon_RoastPirate_Anheuern(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 11;
	condition = DIA_Addon_RoastPirate_Anheuern_Condition;
	information = DIA_Addon_RoastPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Powinieneœ mi pomóc.";
};


func int DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//Powinieneœ mi pomóc.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//To rozkaz Grega.
	B_Say(self,other,"$ABS_GOOD");
};


instance DIA_Addon_RoastPirate_ComeOn(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 12;
	condition = DIA_Addon_RoastPirate_ComeOn_Condition;
	information = DIA_Addon_RoastPirate_ComeOn_Info;
	permanent = TRUE;
	description = "ChodŸ ze mn¹.";
};


func int DIA_Addon_RoastPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_RoastPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//ChodŸ ze mn¹.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_RoastPirate_GoHome(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 13;
	condition = DIA_Addon_RoastPirate_GoHome_Condition;
	information = DIA_Addon_RoastPirate_GoHome_Info;
	permanent = TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};


func int DIA_Addon_RoastPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	B_Say(self,other,"$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_RoastPirate_TooFar(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 14;
	condition = DIA_Addon_RoastPirate_TooFar_Condition;
	information = DIA_Addon_RoastPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

