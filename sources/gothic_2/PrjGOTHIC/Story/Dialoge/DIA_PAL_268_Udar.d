
instance DIA_Udar_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_EXIT_Condition;
	information = DIA_Udar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_EXIT_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Hello(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = DIA_Udar_Hello_Condition;
	information = DIA_Udar_Hello_Info;
	important = TRUE;
};


func int DIA_Udar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_Hello_Info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//Mia³eœ cholerne szczêœcie, kiedy wszed³eœ. Prawie ciê zastrzeli³em.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//W takim razie powinienem siê cieszyæ, ¿e masz taki bystry wzrok.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//Oszczêdzaj oddech. Porozmawiaj z Sengrathem, jeœli czegoœ chcesz.
	AI_StopProcessInfos(self);
};


instance DIA_Udar_YouAreBest(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_YouAreBest_Condition;
	information = DIA_Udar_YouAreBest_Info;
	permanent = FALSE;
	description = "S³ysza³em, ¿e jesteœ NAJLEPSZYM kusznikiem w królestwie.";
};


func int DIA_Udar_YouAreBest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_Udar))
	{
		return 1;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//S³ysza³em, ¿e jesteœ NAJLEPSZYM kusznikiem w królestwie.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//Skoro tak mówi¹, to musi byæ prawda. Czego chcesz?
};


instance DIA_Udar_TeachMe(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_TeachMe_Condition;
	information = DIA_Udar_TeachME_Info;
	permanent = FALSE;
	description = "Naucz mnie, jak strzelaæ z kuszy.";
};


func int DIA_Udar_TeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest) && (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Naucz mnie, jak strzelaæ z kuszy.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Zje¿d¿aj! Dooko³a zamku biega doœæ celów. Poæwicz sobie na nich.
};


instance DIA_Udar_ImGood(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_ImGood_Condition;
	information = DIA_Udar_ImGood_Info;
	permanent = FALSE;
	description = "Ja jestem najlepszy...";
};


func int DIA_Udar_ImGood_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};

func void DIA_Udar_ImGood_Info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//Ja jestem najlepszy...
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//Masz racjê!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//No có¿, skoro chcesz siê uczyæ, to ci pomogê.
	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"Udar mo¿e mnie nauczyæ, jak pos³ugiwaæ siê kusz¹.");
};


instance DIA_Udar_Teach(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_Teach_Condition;
	information = DIA_Udar_Teach_Info;
	permanent = TRUE;
	description = "Chcê siê od ciebie uczyæ.";
};


func int DIA_Udar_Teach_Condition()
{
	if(Udar_TeachPlayer == TRUE)
	{
		return 1;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Chcê siê od ciebie uczyæ.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Dobra, strzelaj.
	Info_ClearChoices(DIA_Udar_Teach);
	Info_AddChoice(DIA_Udar_Teach,Dialog_Back,DIA_Udar_Teach_Back);
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};

func void DIA_Udar_Teach_Back()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void B_Udar_TeachNoMore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Znasz ju¿ podstawy. Nie mamy czasu na wiêcej.
};

func void B_Udar_TeachNoMore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Aby sprawniej w³adaæ broni¹, musisz znaleŸæ odpowiedniego nauczyciela.
};

func void DIA_Udar_Teach_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
};

func void DIA_Udar_Teach_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};


instance DIA_Udar_Perm(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Perm_Condition;
	information = DIA_Udar_Perm_Info;
	permanent = FALSE;
	description = "Jak siê maj¹ sprawy w zamku?";
};


func int DIA_Udar_Perm_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Udar_Perm_Info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//Jak maj¹ siê sprawy w zamku?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//Paru ch³opaków æwiczy, ale generalnie rzecz bior¹c, wszyscy czekamy, a¿ coœ siê stanie.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//Ta niepewnoœæ nas dobija. To strategia tych przeklêtych orków. Poczekaj¹, a¿ bêdziemy mieli nerwy w strzêpach.
};


instance DIA_Udar_Ring(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Ring_Condition;
	information = DIA_Udar_Ring_Info;
	permanent = FALSE;
	description = "Proszê, przynoszê ci pierœcieñ Tengrona.";
};


func int DIA_Udar_Ring_Condition()
{
	if(Npc_HasItems(other,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//Proszê, przynoszê ci pierœcieñ Tengrona. Powinien ciê ochroniæ. Tengron powiedzia³, ¿e przyjdzie po niego, kiedy tylko wróci.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//Co? Wiesz, co to za pierœcieñ? Dosta³ go w nagrodê za odwagê w bitwie.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//Mówisz, ¿e chce go z powrotem? Jeœli taka jest wola Innosa, to tak siê stanie. Jeœli taka jest wola Innosa...
	B_GiveInvItems(other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};


instance DIA_Udar_KAP4_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP4_EXIT_Condition;
	information = DIA_Udar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Kap4WiederDa(C_Info)
{
	npc = PAL_268_Udar;
	nr = 40;
	condition = DIA_Udar_Kap4WiederDa_Condition;
	information = DIA_Udar_Kap4WiederDa_Info;
	important = TRUE;
};


func int DIA_Udar_Kap4WiederDa_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//Dobrze, ¿e przyszed³eœ. Mamy tu istne piek³o.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//Co siê sta³o?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//£owcy pusz¹ siê w zamku i przechwalaj¹, ¿e potrafi¹ za³atwiæ problem ze smokiem.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//Powiem ci jednak, ¿e nie wygl¹daj¹ na takich, co by sobie poradzili choæby ze starym, schorowanym zêbaczem.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//Coraz wiêcej z nas zaczyna siê powa¿nie obawiaæ, czy uda nam siê wyjœæ z tego ca³o.
};


instance DIA_Udar_Sengrath(C_Info)
{
	npc = PAL_268_Udar;
	nr = 41;
	condition = DIA_Udar_Sengrath_Condition;
	information = DIA_Udar_Sengrath_Info;
	description = "Czy nie jest was tutaj dwóch na stra¿y?";
};


func int DIA_Udar_Sengrath_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Kap4WiederDa) && (Sengrath_Missing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Sengrath_Info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//Czy nie jest was tutaj dwóch na stra¿y?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//Ju¿ nie. Sengrath sta³ tutaj, na blankach, gdy nagle zasn¹³.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//Gdy to siê sta³o, jego kusza spad³a na dó³.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//Widzieliœmy, jak jeden z orków j¹ z³apa³ i znikn¹³ w ciemnoœciach.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Wtedy Sengrath obudzi³ siê i pobieg³ w noc, w stronê orkowskiej palisady. Od tamtej pory go nie widziano.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Chroñ nas Innosie!
	Log_CreateTopic(TOPIC_Sengrath_Missing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing,LOG_Running);
	B_LogEntry(TOPIC_Sengrath_Missing,"Udar, stra¿nik na zamku, têskni za Sengrathem. Ostatnio widzia³ go póŸn¹ noc¹, kiedy ten bieg³ w stronê orkowych umocnieñ, aby odzyskaæ sw¹ kuszê.");
};


instance DIA_Udar_SENGRATHGEFUNDEN(C_Info)
{
	npc = PAL_268_Udar;
	nr = 42;
	condition = DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information = DIA_Udar_SENGRATHGEFUNDEN_Info;
	description = "Znalaz³em Sengratha.";
};


func int DIA_Udar_SENGRATHGEFUNDEN_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Sengrath) && Npc_HasItems(other,ItRw_SengrathsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//Znalaz³em Sengratha.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//Naprawdê? Gdzie on jest?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//Nie ¿yje. Oto jego kusza. Mia³ j¹ przy sobie.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//Musia³ odzyskaæ swoj¹ kuszê, ale wygl¹da na to, ¿e orkowie jednak go zabili.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Przeklêty g³upiec. Wiedzia³em, ¿e tak bêdzie. Wszyscy zginiemy.
	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};


instance DIA_Udar_BADFEELING(C_Info)
{
	npc = PAL_268_Udar;
	nr = 50;
	condition = DIA_Udar_BADFEELING_Condition;
	information = DIA_Udar_BADFEELING_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Udar_BADFEELING_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Udar_SENGRATHGEFUNDEN) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_BADFEELING_Info()
{
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Jeszcze jeden taki atak i bêdzie po nas.
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//Orkowie s¹ bardzo zaniepokojeni. Coœ ich nieŸle przestraszy³o. Czujê to.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//Mam co do tego naprawdê z³e przeczucia.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_Udar_KAP5_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP5_EXIT_Condition;
	information = DIA_Udar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_KAP6_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP6_EXIT_Condition;
	information = DIA_Udar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_PICKPOCKET(C_Info)
{
	npc = PAL_268_Udar;
	nr = 900;
	condition = DIA_Udar_PICKPOCKET_Condition;
	information = DIA_Udar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Udar_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Udar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
	Info_AddChoice(DIA_Udar_PICKPOCKET,Dialog_Back,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Udar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

