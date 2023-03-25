
instance DIA_Addon_BenchPirate_EXIT(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_BenchPirate_EXIT_Condition;
	information = DIA_Addon_BenchPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BenchPirate_Hello(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_BenchPirate_Hello_Condition;
	information = DIA_Addon_BenchPirate_Hello_Info;
	permanent = TRUE;
	description = "Co siê dzieje?";
};


func int DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_Hello_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//Co siê dzieje?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Greg wróci³. W sam¹ porê.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Francis powinien zorganizowaæ trochê drewna na palisadê. Nawet on da sobie z tym radê.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Jeœli chodzi o mnie, to bandyci mog¹ sobie przychodziæ. Z kapitanem u naszego boku nic nam nie grozi.
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Francis, szef obozu, jest zwyk³ym b³aznem. Dlatego nikt nie bierze go na powa¿nie.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Greg ufa Francisowi, bo ten jest zbyt g³upi, ¿eby kogokolwiek oszukaæ. Ale ¿eby zaraz mianowaæ go swoj¹ praw¹ rêk¹...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//Jeœli Greg szybko nie wróci i nie zabierze mnie na kolejny rejs, dostanê choroby l¹dowej.
	};
};


instance DIA_Addon_BenchPirate_Anheuern(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_BenchPirate_Anheuern_Condition;
	information = DIA_Addon_BenchPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Powinieneœ mi pomóc.";
};


func int DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//Powinieneœ mi pomóc.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//To rozkaz Grega?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//Jasne.
};


instance DIA_Addon_BenchPirate_ComeOn(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_BenchPirate_ComeOn_Condition;
	information = DIA_Addon_BenchPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Kanion czeka.";
};


func int DIA_Addon_BenchPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BenchPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//Kanion czeka.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//Doskonale! Tak, wracam tam...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//Tak jest, kapitanie!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_BenchPirate_GoHome(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_BenchPirate_GoHome_Condition;
	information = DIA_Addon_BenchPirate_GoHome_Info;
	permanent = TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};


func int DIA_Addon_BenchPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//Bêdê czekaæ w obozie, kapitanie!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BenchPirate_TooFar(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_BenchPirate_TooFar_Condition;
	information = DIA_Addon_BenchPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BenchPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//Za bardzo oddaliliœmy siê od obozu.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//Nie podoba mi siê to.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//Wracam do obozu!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//Biorê ch³opaków i wracamy do obozu!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

